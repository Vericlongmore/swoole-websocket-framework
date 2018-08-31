<?php
namespace Model\Redis\Adapter;
use Model\Redis\Base;

class User extends Base{
    public $db = 'game';
    const KEY_UID_FD_MAP = 'hash_uid_fd_map';
    const KEY_FD_UID_MAP = 'hash_fd_uid_map';

    public function setUserInfoByFd($fd , $user_id){
        echo "setUserInfoByFd user_id:".$user_id."fd:".$fd."\n";
        $this->model->hSet(self::KEY_UID_FD_MAP, $user_id, $fd);
        $this->model->hSet(self::KEY_FD_UID_MAP, $fd, $user_id);
    }

    public function getUserIdByFd($fd){
        echo "getUserIdByFd fd:".$fd."\n";
        return $this->model->hGet(self::KEY_FD_UID_MAP, $fd);
    }

    public function getUserFdById($user_id){
        echo "getUserFdById user_id:".$user_id."\n";
        return $this->model->hGet(self::KEY_UID_FD_MAP, $user_id);
    }

    public function getUserFdByIds($userIds){
        echo "getUserFdByIds user_id:".json_encode($userIds)."\n";
        return $this->model->hmget(self::KEY_UID_FD_MAP, $userIds);
    }

    public function destroyMapByFd($fd){
        $this->model->hDel(self::KEY_FD_UID_MAP,$fd);
    }

    public function destroyMapByUserId($user_id){
        $this->model->hDel(self::KEY_UID_FD_MAP,$user_id);
    }

    public function clear(){
        $this->model->del(self::KEY_UID_FD_MAP);
        $this->model->del(self::KEY_FD_UID_MAP);
    }

}