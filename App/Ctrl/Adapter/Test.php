<?php

namespace Ctrl\Adapter;
use Ctrl\Base;

class Test extends Base{
    function doAction(){
        echo "Test controller======== Test ======== 11111111111111";
        $data = array(
            'fd' => $this->fd,
            'task' => 'Test',
            'method' => 'doAction',
            'data' => $this->params,
        );
        $this->task($data);
    }
    
    function runAction(){
        echo "Test controller======== Test ======== 11111111111111";
        $data = array(
            'fd' => $this->fd,
            'task' => 'Test',
            'method' => 'testAction',
            'data' => $this->params,
        );
        $this->task($data);
    }
}