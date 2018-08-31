<?php

namespace Task\Adapter;

use Task\Base;
use Swoole\Core\Functions;
use Model\Redis\Adapter\User as dUser;
use Model\Redis\Adapter\Prompt as dPrompt;

class Prompt extends Base{
    #设置小红点
    public function set(){
        echo "task Prompt set\n";
        if (isset($this->params['userIds']) && isset($this->params['type'])){
            $userIds = array_unique($this->params['userIds']);

            $dUser = new dUser();
            $dPrompt = new dPrompt();
            foreach ($userIds as $playerId){
                $dPrompt->set($playerId,$this->params['type']);
                $fd = $dUser->getUserFdById($playerId);
                if ($fd){
                    $data = array(
                        'prot'=>$this->prot['promptSet'],
                        'data' => array('type'=>$this->params['type']),
                    );
                    Functions::send($this->server, $fd, $data);
                }else{
                    echo "fd error player id:".$playerId."\n";
                }
            }
        }
        return;
    }

    #清除小红点
    public function clear(){

    }
}