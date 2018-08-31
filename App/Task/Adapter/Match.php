<?php

namespace Task\Adapter;
use Swoole\Core\Functions;
use Task\Base;
use Model\Redis\Adapter\User as dUser;

class Match extends Base
{
    function score(){
        echo  "task Match score\n";
        if($this->params && is_array($this->params)){
            $dUser = new dUser();
            foreach ($this->params as $roomId => $value){
                if (isset($value['user_id'])){
                    foreach ($value['user_id'] as $playerId){
                        $matches = $value['match_id'];
                        $fd = $dUser->getUserFdById($playerId);
                        if ($fd){
                            $data = array(
                                'prot'=>$this->prot['matchScoreInfo'],
                                'data' => $matches,
                            );
                            Functions::send($this->server, $fd, $data);
                        }else{
                            echo "fd error player id:".$playerId."\n";
                        }
                    }
                }
            }
            return True;
        }else{
            echo "Match score param error\n";
            return false;
        }
    }

    /*
     * 滚球数据
     */
    function matching(){
        echo  "task Match matching\n";
        if($this->params && is_array($this->params)){
            $fdList = $this->server->connections;
            if (isset($this->params['event_id'])){
                if ($this->params['event_id'] == 0){
                    $data = array(
                        'prot'=>$this->prot['matchingTime'],
                        'data' => $this->params,
                    );
                }else{
                    $data = array(
                        'prot'=>$this->prot['matchingEvent'],
                        'data' => $this->params,
                    );
                }
                Functions::send($this->server, $fdList, $data);
                return True;
            }
        }
        return False;
    }

    /*
     * 房间奖池信息
     */

    function roomTotalBonus(){
        echo  "task Match roomTotalBonus\n";
        if($this->params && is_array($this->params)) {
            $fdList = $this->server->connections;
            $data = array(
                'prot'=>$this->prot['roomTotalBonus'],
                'data' => $this->params,
            );
            Functions::send($this->server, $fdList, $data);
            return True;
        }
        return False;
    }

    /*
     * 滚球房间推送
     */
    function roomSettlement(){
        echo  "task Match roomSettlement\n";
        if($this->params && is_array($this->params)){
            $dUser = new dUser();
            foreach ($this->params as $value){
                if (isset($value['player_id'])){
                    $playerId = $value['player_id'];
                    $fd = $dUser->getUserFdById($playerId);
                    if ($fd){
                        $data = array(
                            'prot'=>$this->prot['roomSettlement'],
                            'data' => $value,
                        );
                        Functions::send($this->server, $fd, $data);
                        echo "roomSettlement fd success player id:".$playerId." fd:".$fd."\n";
                    }else{
                        echo "roomSettlement fd error player id:".$playerId."\n";
                    }
                }
            }
            return True;
        }
        return False;
    }

    /*
     * 滚球房间创建推送
     */
    function roomCreate(){
        echo  "task Match roomCreate\n";
        $fdList = $this->server->connections;
        $data = array(
            'prot'=>$this->prot['roomCreate'],
            'data' => $this->params,
        );
        Functions::send($this->server, $fdList, $data);
        return True;
    }

    /*
     * 关闭房间通知
     */
    function closeMatchListInsertId(){
        echo  "task Match closeMatchListInsertId\n";
        $fdList = $this->server->connections;
        $data = array(
            'prot'=>$this->prot['closeMatchListInsertId'],
            'data' => $this->params,
        );
        Functions::send($this->server, $fdList, $data);
        return True;
    }

    /*
     * 赛前推送
     */
    function matchBeforeSend(){
        echo  "task Match before send\n";
        if($this->params && is_array($this->params)){
            $fdList = $this->server->connections;
            $data = array(
                'prot'=>$this->prot['matchBeforeSend'],
                'data' => $this->params,
            );
            Functions::send($this->server, $fdList, $data);
            return True;
        }
        return False;
    }
}