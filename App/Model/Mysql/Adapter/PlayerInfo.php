<?php
namespace Model\Mysql\Adapter;
use Model\Mysql\Base;

class PlayerInfo extends Base{
    public $db = 'game';

    function getPlayerInfo(){
        $res = $this->model->get("tbl_player_info",'*');
        return $res;
    }
}