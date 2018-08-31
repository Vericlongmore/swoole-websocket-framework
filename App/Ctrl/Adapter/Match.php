<?php

namespace Ctrl\Adapter;
use Ctrl\Base;

class Match extends Base
{
    //比赛信息
    public function score()
    {
        echo  "controller Match score\n";
        $data = array(
            'fd' => $this->fd,
            'task' => 'Match',
            'method' => 'score',
            'data' => $this->params,
        );
        $this->task($data);
    }

    /*滚球数据*/
    public function matching(){
        echo  "controller matching\n";
        $data = array(
            'fd' => $this->fd,
            'task' => 'Match',
            'method' => 'matching',
            'data' => $this->params,
        );
        $this->task($data);
    }

    /*滚球房间结算推送*/
    public function roomSettlement(){
        echo  "controller roomSettlement\n";
        $data = array(
            'fd' => $this->fd,
            'task' => 'Match',
            'method' => 'roomSettlement',
            'data' => $this->params,
        );
        $this->task($data);
    }

    /* 房间奖池数据 */
    public function roomTotalBonus(){
        echo  "controller roomTotalBonus\n";
        $data = array(
            'fd' => $this->fd,
            'task' => 'Match',
            'method' => 'roomTotalBonus',
            'data' => $this->params,
        );
        $this->task($data);
    }

    /*滚球房间创建推送*/
    public function roomCreate(){
        echo  "controller roomCreate\n";
        $data = array(
            'fd' => $this->fd,
            'task' => 'Match',
            'method' => 'roomCreate',
            'data' => $this->params,
        );
        $this->task($data);
    }

    /*关闭比赛房间*/
    public function closeMatchListInsertId(){
        echo  "controller closeMatchListInsertId\n";
        $data = array(
            'fd' => $this->fd,
            'task' => 'Match',
            'method' => 'closeMatchListInsertId',
            'data' => $this->params,
        );
        $this->task($data);
    }

    /*赛前推送*/
    public function matchBeforeSend(){
        echo  "controller before send\n";
        $data = array(
            'fd' => $this->fd,
            'task' => 'Match',
            'method' => 'matchBeforeSend',
            'data' => $this->params,
        );
        $this->task($data);
    }
}