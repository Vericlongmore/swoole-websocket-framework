<?php
return array(
    'redis'=>array(
        'game'=>array(
            'db' => 14,
            'pconnect' => true,
            'host' => '127.0.0.1',
            'port' => 7480,
            'auth' => '',
        ),
    ),

    'mysql'=> array(
        'game' => array(
            'db' => 'test_ffm2_game',
            'pconnect' => true,
            'host' => '127.0.0.1',
            'port' => '7788',
            'user' => '',
            'password' => '',
        ),
        'source1' => array(
            'db' => 'test_dfw2_source',
            'pconnect' => true,
            'host' => '127.0.0.1',
            'port' => '7788',
            'user' => '',
            'password' => '',
        ),
    ),
);
