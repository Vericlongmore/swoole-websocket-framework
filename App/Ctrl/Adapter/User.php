<?php

namespace Ctrl\Adapter;
use Ctrl\Base;

class User extends Base
{
	protected function _initialize() {
    }

    //上线
    public function online()
    {
        $data = array(
            'fd' => $this->fd,
            'task' => 'User',
            'method' => 'online',
            'data' => $this->params,
        );
        $this->task($data);
    }
 
    //下线
    public function offline()
    {
        $data = array(
            'fd' => $this->fd,
            'task' => 'User',
            'method' => 'offline',
            'data' => $this->params,
        );
        $this->task($data);
    }
}