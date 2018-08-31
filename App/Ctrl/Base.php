<?php

namespace Ctrl;

use Swoole\Core\Parser;


class Base
{
    protected $fd;
	protected $server;
    protected $params = array();
    
    public function __construct(Parser $parser){
        $this->server = $parser->getServer();
        $this->params = $parser->getParams();
        $this->fd = $parser->getFd();
        $this->_initialize();
    }

    protected function _initialize(){

    }

    public function task($data){
        $this->server->task(\json_encode($data));
    }
    
}