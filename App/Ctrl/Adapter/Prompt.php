<?php

namespace Ctrl\Adapter;
use Ctrl\Base;

class Prompt extends Base{
    function set(){
        $data = array(
            'fd' => $this->fd,
            'task' => 'Prompt',
            'method' => 'set',
            'data' => $this->params,
        );
        $this->task($data);
    }

    function clear(){
        $data = array(
            'fd' => $this->fd,
            'task' => 'Prompt',
            'method' => 'clear',
            'data' => $this->params,
        );
        $this->task($data);
    }
}