<?php
/**
 * user: longmore
 *
 * description: check the type of json is right or not.
 */
namespace Swoole\Core;
use Model\Mysql\Adapter\Common as dCommonInfo;
class Functions 
{
	static function send($serv, $fd_list, $data){
	    if(!is_array($fd_list) && !($fd_list instanceof \swoole_connection_iterator)){
	        $fd_list = array($fd_list);
	    }

		echo "fd_list:".json_encode($fd_list)."\n";
	    if(is_array($data)){
	        $data = json_encode($data);
	    }

		foreach ($fd_list as $fd){
			$fd = (int)$fd;
			if ($fd > 0){
				$info = $serv->connection_info($fd);
				echo "info:".json_encode($info)."\n";
				if(!$info){
					echo "connection info error, send data: ".$data."\n";
				}
				else if ($info['socket_type'] == 1 && $info['websocket_status'] == 3){
					$serv->push($fd, $data);
				}elseif ($info['socket_type'] == 1){ //http 请求
					self::http_response($serv,$fd,"success");
					echo "http connect:".$fd."\n";
				}else{
					echo "connection websocket_status error: ".json_encode($info)."\n";
				}
			}
		}
	    return;
	}

	static function http_response($serv,$fd,$respData){
		//响应行
		$response = array(
			'HTTP/1.1 200',
		);
		//响应头
		$headers = array(
			'Server'=>'SwooleServer',
			'Content-Type'=>'text/html;charset=utf8',
			'Content-Length'=>strlen($respData),
		);
		foreach($headers as $key=>$val){
			$response[] = $key.':'.$val;
		}
		//空行
		$response[] = '';
		//响应体
		$response[] = $respData;
		$send_data = join("\r\n",$response);
		$serv->send($fd, $send_data);
	}
	
	//发送应答
	static public function ack_response($serv, $fds, $prot, $unique_id){
		$protConfig = config::get('prot','Protocol');
		$version = config::get('version','Base');
		$server_broken= (new dCommonInfo())->getCommonInfo();
	    $data = array(
	        'prot'=>$protConfig['prot_return'],
	        'data'=>array('prot'=> $prot, 'unique_id'=>$unique_id,'server_broken'=>$server_broken,'version'=>$version,'server_time'=>time(),'fd'=>json_encode($fds)),
	    );
	    Functions::send($serv, $fds, $data);
	}

	//下线
	static public function offLine($socket,$fd,$serv){
		$prot = config::get('prot','Protocol');
		$_data = array(
			'prot' => $prot['offline'],
		);
		$socket->parse($_data, $fd, $serv);
	}
	
	/**
	 * @blog http://www.phpddt.com
	 * @param $string
	 * @param $low 安全别级低
	 */
	static function clean_xss(&$string, $low = False)
	{
	    if (! is_array ( $string ))
	    {
	        $string = trim ( $string );
	        $string = strip_tags ( $string );
	        $string = htmlspecialchars ( $string );
	        if ($low)
	        {
	            return True;
	        }
	        $string = str_replace ( array ('"', "\\", "'", "/", "..", "../", "./", "//" ), '', $string );
	        $no = '/%0[0-8bcef]/';
	        $string = preg_replace ( $no, '', $string );
	        $no = '/%1[0-9a-f]/';
	        $string = preg_replace ( $no, '', $string );
	        $no = '/[\x00-\x08\x0B\x0C\x0E-\x1F\x7F]+/S';
	        $string = preg_replace ( $no, '', $string );
	        return True;
	    }
	    $keys = array_keys ( $string );
	    foreach ( $keys as $key )
	    {
	        clean_xss ( $string [$key] );
	    }
	}
	
	/**
	 * 替换关键词
	 * @param string $msg
	 * @return string
	 */
	static function filter_msg(&$msg){
	    //$block_words = Config::get('block_words');
	    //$msg = strtr($msg, $block_words);
	}

}