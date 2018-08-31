<?php
$prot = array(
    'test' => 1,
    'online' => 1000,
    'offline_ack' => 1001,
    'offline' => 1002,
    'error' => 8000, //错误返回
    'heartbeat' => 8003,//心跳包
    'prot_return' => 8001, //协议返回
    'online_success' => 8002, //登陆成功
    'matchScoreInfo' => 21002,//比赛实时数据
    'promptSet' => 21004,
    'matchingEvent' => 21008, //滚球实时数据(具体事件)
    'matchingTime' => 21010, //滚球实时数据(时间轴)
    'matching' => 21006, //滚球实时数据转发协议
    'roomSettlement' => 21012, //滚球实时数据转发协议
    'roomTotalBonus' => 21014, //房间奖池信息
    'roomCreate'=> 21016, // 房间创建
    'closeMatchListInsertId' => 21020, // 比赛房间关闭通知
    'matchBeforeSend'=> 21018,
    'test2'=> 2,

);

$protocol = array(
    $prot['test'] => array(
        'ctrl'  => 'Test',
        'method' => 'doAction',
    ),
    
    $prot['test2'] => array(
        'ctrl'  => 'Test',
        'method' => 'runAction',
    ),

    $prot['online'] => array(
        'ctrl'  => 'User',
        'method' => 'online',
    ),

    $prot['offline_ack'] => array(
        'ctrl'   => 'User',
        'method' => 'offline_ack',
    ),

    $prot['offline'] => array(
        'ctrl'   => 'User',
        'method' => 'offline',
    ),

    $prot['matchScoreInfo'] => array(
        'ctrl'   => 'Match',
        'method' => 'score',
    ),

    $prot['matching'] => array(
        'ctrl'   => 'Match',
        'method' => 'matching',
    ),

    $prot['promptSet'] => array(
        'ctrl'  => 'Prompt',
        'method' => 'set',
    ),

    $prot['roomSettlement'] => array(
        'ctrl'   => 'Match',
        'method' => 'roomSettlement',
    ),

    $prot['roomTotalBonus'] => array(
        'ctrl'  => 'Match',
        'method' => 'roomTotalBonus',
    ),

    $prot['roomCreate'] => array(
        'ctrl'  => 'Match',
        'method' => 'roomCreate',
    ),

    $prot['closeMatchListInsertId'] => array(
        'ctrl'  => 'Match',
        'method' => 'closeMatchListInsertId',
    ),

    $prot['matchBeforeSend'] => array(
        'ctrl'  => 'Match',
        'method' => 'matchBeforeSend',
    ),
);

return array(
    'prot' => $prot,
    'protocol' => $protocol,
);
