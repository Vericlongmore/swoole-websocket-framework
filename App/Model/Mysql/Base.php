<?php
namespace Model\Mysql;
use Swoole\DB\Mysql as dMysql;

class Base{
    public $model;
    public $db;
    function __construct()
    {
       $this->model = dMysql::getDb($this->db);
    }
}