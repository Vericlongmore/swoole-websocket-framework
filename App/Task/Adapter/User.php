<?php

namespace Task\Adapter;

use Task\Base;
use Swoole\Core\Functions;
use Model\Redis\Adapter\Swoole;
use Model\Redis\Adapter\User as dUser;
use Model\Redis\Adapter\Prompt as dPrompt;

class User extends Base
{   
    public function online(){
        if (isset($this->params['user_id'])){
            $user_id = (int)$this->params['user_id'];
            $data = array(
                'prot'=>$this->prot['online_success'],
                'data' => array('msg'=>'success'),
            );
            $dUser = new dUser();
            $fd = $dUser->getUserFdById($user_id);
            if ($fd){
                $dUser->destroyMapByFd($fd);
            }

            $dUser->setUserInfoByFd($this->fd, $user_id);
            Functions::send($this->server, $this->fd, $data);

            #发送小红点
            $dPrompt = new dPrompt();
            $list = $dPrompt->get($user_id);
            print "dPrompt list:".json_encode($list);
            if ($list && is_array($list)){
                foreach ($list as $key => $value){
                    $data = array(
                        'prot'=>$this->prot['promptSet'],
                        'data' => array('type'=>$key),
                    );
                    Functions::send($this->server, $this->fd, $data);
                }
            }
        }else{
            echo "user_id error";
        }
        return;
    }
    
    public function offline(){
        $dUser = new dUser();
        $userId = $dUser->getUserIdByFd($this->fd);
        $dUser->destroyMapByFd($this->fd);
        $fd = $dUser->getUserFdById($userId);
        if ((int)$fd == (int)$this->fd){
            $dUser->destroyMapByUserId($userId);
        }

        echo "User offline:".json_encode($this->params)." FD:".$this->fd." time:".date('Y-m-d H:i:s')."\n";
        return;
    }
}