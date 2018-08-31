<?php

namespace Task;
use Swoole\Core\Config;

abstract class Base
{
    protected $fd;
    protected $server;
    protected $params = array();
    protected $prot;

    public function __construct($server, $fd, $params){
        $this->fd = $fd;
        $this->server = $server;
        $this->params = $params;

        $this->prot = config::get('prot','Protocol');
    }
}