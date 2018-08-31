<?php
/**
 * swoole类
 */
namespace Swoole;
use Swoole\Core\Config;
use Swoole\Core\Functions;
use Swoole\Core\Parser;
use Swoole\DB\Mysql as dMysql;
use Swoole\DB\Redis as dRedis;
use Model\Redis\Adapter\User as dUser;
use Ctrl\Route as CtrlRoute;
use Task\Route as TaskRoute;

class WebSocket
{
    private $client;
    private $config;
    private $serv;

    const TIMER_HEART_BEAT = 3600000; //每一小时监听一次

    public function __construct($argv)
    {
        echo swoole_version();
        echo "\n";        
        $config = Config::get(PLATFORM,'Config');
        
        $config = $config['websocket_config'];
        $this->config = $config;
        echo "host:".$config['host']."=====port:".$config['port']."\n";
        $this->serv = new \swoole_websocket_server($config['host'], $config['port'], $config['work_mode']);
        $this->instanceid = intval($config['instanceid']);

        $this->serv->set(array(
            'daemonize' => $config['daemonize'], //是否开启守护进程
            'reactor_num' =>$config['reactor_num'],
            'worker_num' => $config['worker_num'],
            'task_worker_num' => $config['task_worker_num'],
            'dispatch_mode' => $config['dispatch_mode'],
            'max_request' => $config['max_request'],
            'task_max_request'=>$config['task_max_request'],
            'task_ipc_mode' => $config['task_ipc_mode'],
            'backlog' => $config['backlog'],
            'heartbeat_check_interval' => $config['heartbeat_check_interval'],
            'heartbeat_idle_time' => $config['heartbeat_idle_time'],
            //'open_cpu_affinity' => $config['open_cpu_affinity'],
            //'cpu_affinity_ignore' =>1,
            'log_file'=>ROOT_PATH . $config['log_file'],
        ));
    }

    public function run()
    {
        $this->serv->on('Start', array($this, 'onStart'));
        $this->serv->on('Open', array($this, 'onOpen'));
        $this->serv->on('Message', array($this, 'onMessage'));
        $handlerArray = array(
            'onManagerStart',
            'onWorkerStart',
            'onWorkerStop',
            'onTask',
            'onFinish',
            'onShutdown',
            'onRequest'
        );
        foreach($handlerArray as $handler) {
            if(method_exists($this, $handler)) {
                $this->serv->on(\str_replace('on', '', $handler), array($this, $handler));
            }
        }
        $this->serv->on('Close', array($this, 'onClose'));

        $this->serv->start();
    }

    public function onOpen(\swoole_websocket_server $serv, \swoole_http_request $request) {
        echo "on handshake success with fd {$request->fd}"," ", date('Y-m-d H:i:s'),"\n";
        //Functions::push($serv, $serv->connections, "new client {$request->fd} enter room");
        //Functions::send($serv, $request->fd, json_encode(array("data"=>array('fd'=>$request->fd),'prot'=>888888)));
    }

    public function onMessage(\swoole_websocket_server $serv, $frame) {
        echo "on message {$frame->fd} ", $frame->data, "  ",date('Y-m-d H:i:s'),"\n";
        $this->parse($frame->data , $frame->fd , $serv );
    }

    public function onRequest(\swoole_http_request $request, \swoole_http_response $response){
        echo "on request {$request->fd} ", (isset($request->get) && isset($request->get['data'])) ? $request->get['data'] : '',"  " , date('Y-m-d H:i:s'), "\n";
        if(isset($request->get) && isset($request->get['data'])){
            $this->parse($request->get['data'] , $request->fd , $this->serv);
            $response->end("success");
        }else{
            $response->end("fail");
        }
    }

    public function onStart(\swoole_server $serv){
        swoole_set_process_name("swoole_websocket {$this->instanceid} master {$serv->master_pid}");
        echo "server start, {$serv->master_pid} swoole version: " . SWOOLE_VERSION . PHP_EOL;
    }

    function onShutdown(\swoole_server $serv){
        echo "server shut down!\n";
    }

    public function onManagerStart(\swoole_server $serv){
        echo "manager start \n";
        swoole_set_process_name("swoole_websocket {$this->instanceid} manager");
    }

    public function onWorkerStart(\swoole_server $serv, $worker_id){
        echo "onWorkerStart \n";
        // 判定是否为Task进程
        if($worker_id >= $serv->setting['worker_num']){
            swoole_set_process_name("swoole_websocket {$this->instanceid} task {$worker_id}");
            //操作数据库
            $this->connectDb();
            $serv->tick(self::TIMER_HEART_BEAT, function (){
                $this->heartBeat();
            });
        }else{
            swoole_set_process_name("swoole_websocket {$this->instanceid} worker {$worker_id}");
        }
    }

    //连接数据库
    public function connectDb(){
        dMysql::connect();
        dRedis::connect();
    }

    //心跳检测数据连接是否正常
    public function heartBeat(){
        dMysql::ping();
        dRedis::ping();
    }

    //关闭数据库
    public function closeDb(){
        dRedis::close();
        dMysql::close();
    }

    public function onWorkerStop(\swoole_server $server, $worker_id){
        echo "onWorkerStop\n";
        if($worker_id >= $server->setting['worker_num']) {
            $this->closeDb();
        }
    }

    public function onClose(\swoole_server $serv, $fd, $from_id)
    {
        #echo "on close fd $fd offline time:".date("Y-m-d H:i:s")."\n";
        $info = $serv->connection_info($fd);
        if($info['websocket_status'] == 0){
            return;
        }
        print_r("websocket onClose fd:".json_encode($fd)."info:".json_encode($info));

        if ($serv->worker_id < $serv->setting['worker_num']){
            Functions::offLine($this,$fd, $serv);
        }else{
            echo "task end $fd \n";
        }
    }

    public function parse($_data, $_fd, $_serv){
        $parser = new Parser($_fd, $_serv, $_data);
        $parser->ack_response(); //发送消息确认
        if($parser->setCtrl() && $parser->checkSign()){
            CtrlRoute::execute($parser);
        }
    }

    public function onTask(\swoole_server $serv, $task_id, $from_id, $_data){
        echo "do task task_id:".$task_id."\n";
        try {
            return TaskRoute::execute($serv, $_data);
        } catch (\Exception $e) {
        }
    }

    public function onFinish(\swoole_server $serv, $task_id, $_data){
        echo "do finish"."\n";
    }
}
