<?php
namespace Swoole\DB;
use Swoole\Core\Config;
use Swoole\Core\Redis as cRedis;

class Redis{
    public static $db;
    public static $RedisConfig;

    static function connect(){
        self::$RedisConfig = Config::get('redis','DB/DB'.PLATFORM);
        if (self::$RedisConfig){
            foreach (self::$RedisConfig as $key => $config){
                self::$db[$key] = new cRedis($config);
            }
        }
    }

    static function getDb($db){
        if (isset(self::$db[$db])) {
            try {
                $redis = self::$db[$db];
                $resPing = $redis->ping();
                if ($resPing) {
                    //echo "time:" . time() . " redis:" . json_encode($resPing) . "\n";
                } else {
                    //重新连接
                    self::$db[$db] = new cRedis(self::$RedisConfig[$db]);
                    echo "time:" . time() . " redis reconnect\n";
                }
            }catch (Exception $e){
                //重新连接
                self::$db[$db] = new cRedis(self::$RedisConfig[$db]);
                echo "time:" . time() . " redis reconnect\n";
            }
        }else{
            self::$db[$db] = new cRedis(self::$RedisConfig[$db]);
        }
        return self::$db[$db]->getRedis();
    }

    /*
     *
     */
    static function ping(){
        if(self::$db){
            foreach (self::$db as $key => $redis){
                try {
                    $resPing = $redis->ping();
                    if ($resPing) {
                        //echo "time:" . time() . " redis:" . json_encode($resPing) . "\n";
                    } else {
                        //重新连接
                        self::$db[$key] = new cRedis(self::$RedisConfig[$key]);
                        echo "time:" . time() . " redis reconnect\n";
                    }
                }catch (Exception $e){
                    //重新连接
                    self::$db[$key] = new cRedis(self::$RedisConfig[$key]);
                    echo "time:" . time() . " redis reconnect\n";
                }
            }
        }
    }

    static function close(){
        if(self::$db) {
            foreach (self::$db as $key => $redis) {
                $redis->close();
            }
        }
    }
}