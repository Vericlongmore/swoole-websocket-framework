<?php
ini_set('date.timezone','Asia/Shanghai');
use Swoole\Entrance;
define('ROOT_PATH', __DIR__);
define('DS', DIRECTORY_SEPARATOR);
define('APP_PATH', ROOT_PATH . DS . 'App');
require ROOT_PATH . DS . 'Swoole' . DS . 'Entrance.php';

$socket_mode = 'Websocket';
define('SOCKET_MODE', $socket_mode);

if(count($argv) != 2){
    showTip();
    exit();
}
define('PLATFORM', $argv[1]);
try {
    Entrance::run($argv);
}catch (RedisException $e){
    print "main try catch error:".$e->getMessage();
}

function showTip(){
    echo "please start swoole with argv:\n  socket      @start swoole socket server\n  websocket   @start swoole web socket server\n";
}
echo 12;