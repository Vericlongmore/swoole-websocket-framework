<?php
namespace Model\Redis\Adapter;
use Model\Redis\Base;

class Prompt extends Base{
    public $db = 'game';
    static $redisName = "hash_user_prompt";

    /*
     * 设置小红点
     */
    function set($playerId,$type){
        $data = $this->get($playerId);
        $data[$type] = 1;
        $string = json_encode($data);
        $this->model->hset(self::$redisName,$playerId,$string);
        return;
    }

    /*
     * 获取小红点
     */
    function get($playerId){
        $data = $this->model->hget(self::$redisName,$playerId);
        if ($data){
            $data = json_decode($data,true);
            return $data;
        }
        return array();
    }

    /*
     * 清除小红点
     */
    function clear($playerId,$type){
        $data = $this->get($playerId);
        if (isset($data[$type])){
            unset($data[$type]);
        }
        if (empty($data)){
            $this->model->hdel(self::$redisName,$playerId);
        }
        else{
            $string = json_encode($data);
            $this->model->hset(self::$redisName,$playerId,$string);
        }
        return;
    }
}