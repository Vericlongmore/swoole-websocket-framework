<?php
//use Swoole\Entrance;
return array(
    1 => array( //1html
        'debug_mode' => true,
        'app_path' => 'App',
        'websocket_config' => array(
            'instanceid'=>20,
            'host' => '0.0.0.0', //socket 监听ip
            'port' => 8900, //socket 监听端口
            'work_mode' => 3, //1-base, 2-thread, 3-proccess
            // swoole server config
            'daemonize' => 1, //是否开启守护进程
            'reactor_num' =>4,
            'worker_num' => 4,
            'task_worker_num' => 4,
            'dispatch_mode' => 5,
            'max_request' => 10000,
            'task_max_request'=>10000,
            'task_ipc_mode' => 2,
            'backlog' => 512,
            'heartbeat_check_interval' => 30,
            'heartbeat_idle_time' => 240,
            'open_cpu_affinity' => 1,
            'cpu_affinity_ignore' => array(0, 1),
            'log_file'=>'/Log/swoole.log',
        ),
    ),
    2 => array( //2魔方
        'debug_mode' => true,
        'app_path' => 'App',
        'websocket_config' => array(
            'instanceid'=>21,
            'host' => '0.0.0.0', //socket 监听ip
            'port' => 8902, //socket 监听端口
            'work_mode' => 3, //1-base, 2-thread, 3-proccess
            // swoole server config
            'daemonize' => 1, //是否开启守护进程
            'reactor_num' =>4,
            'worker_num' => 4,
            'task_worker_num' => 4,
            'dispatch_mode' => 5,
            'max_request' => 10000,
            'task_max_request'=>10000,
            'task_ipc_mode' => 2,
            'backlog' => 512,
            'heartbeat_check_interval' => 30,
            'heartbeat_idle_time' => 240,
            'open_cpu_affinity' => 1,
            'cpu_affinity_ignore' => array(0, 1),
            'log_file'=>'/Log/swooleMf.log',
        ),
    ),
);
