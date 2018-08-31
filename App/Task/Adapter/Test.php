<?php

namespace Task\Adapter;
use Swoole\Core\Functions;
use Task\Base;
use Model\Mysql\Adapter\PlayerInfo as dPlayerInfo;
use Model\Redis\Adapter\Room as dRoom;

class Test extends Base
{
    function doAction(){
        echo "Test task======== Test ======== 11111111111111";
        $_data = array(
            'prot'=>5007,
            'data' => 1111,
        );
        $playerInfo = (new dPlayerInfo())->getPlayerInfo();
        echo "playerInfo=====:".json_encode($playerInfo)."\n";

        $roomInfo = (new dRoom())->getRoomInfo();
        echo "redis hash_delay_room=====:".json_encode($roomInfo)."\n";

        echo "send levelUp data=".json_encode($_data)." fd=$this->fd\n";
        Functions::send($this->server, $this->fd, $_data);
    }
    
    function testAction(){
        echo "Test testAction======== Test ======== 3333333333333";
        $_data = array(
            'prot'=>$this->prot['test2'],
            'data' => 1111,
        );
        $fdList = $this->server->connections;
        echo "send test=".json_encode($_data);
        Functions::send($this->server, $fdList, $_data);
    }
}