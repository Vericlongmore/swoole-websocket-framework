<?php
namespace Model\Redis\Adapter;
use Model\Redis\Base;

class Room extends Base{
    public $db = 'game';

    function getRoomInfo(){
        return $this->model->hGetAll('hash_delay_room');
    }
}