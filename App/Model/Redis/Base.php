<?php
namespace Model\Redis;
use Swoole\DB\Redis as dRedis;

class Base{
    public $model;
    public $db;
    function __construct()
    {
       $this->model = dRedis::getDb($this->db);
    }
}