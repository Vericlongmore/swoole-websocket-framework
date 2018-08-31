<?php
namespace Swoole\DB;
use Swoole\Core\medoo;
use Swoole\Core\Config;

class Mysql{
    public static $db;

    static function connect(){
        $mysqlConfig = Config::get('mysql','DB/DB'.PLATFORM);
        if ($mysqlConfig){
            foreach ($mysqlConfig as $key => $config){
                self::connectDb($key,$config);
            }
        }
    }

    static function connectDb($dbName,$config){
        $dbConfig = [
            // 必须配置项
            'database_type' => 'mysql',
            'database_name' => $config['db'],
            'server' => $config['host'],
            'username' => $config['user'],
            'password' => $config['password'],
            'charset' => 'utf8',
            // 可选参数
            'port' => $config['port'],
            // 可选，定义表的前缀
            //'prefix' => 'PREFIX_',
            'option' => [\PDO::ATTR_PERSISTENT => $config['pconnect'],\PDO::ATTR_CASE => \PDO::CASE_NATURAL,\PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,\PDO::MYSQL_ATTR_USE_BUFFERED_QUERY=>true]
        ];
        self::$db[$dbName] = new medoo($dbConfig);
    }

    static function getDb($db){
        $config = Config::get('mysql','DB/DB'.PLATFORM);
        if (isset(self::$db[$db])) {
            $mysql = self::$db[$db];
            try {
                $resPing = $mysql->query("select 1")->fetch();
                if ($resPing) {
                    return self::$db[$db];
                }
            } catch (Exception $e) {
                self::connectDb($db,$config[$db]);
            }
        }
        //重新连接
        if ($config && isset($config[$db])){
            self::connectDb($db,$config[$db]);
            return self::$db[$db];
        }
        return null;
    }

    /*
     * 判断是否需要重连
     */
    static function ping(){
        $mysqlConfig = Config::get('mysql','DB/DB'.PLATFORM);
        if (self::$db) {
            foreach (self::$db as $key => $mysql) {
                try {
                    $resPing = $mysql->query("select 1")->fetch();
                    if ($resPing) {
                        //echo "time:".time()." mysql:".json_encode($resPing)."\n";
                    } else {
                        //重新连接
                        self::connectDb($key,$mysqlConfig[$key]);
                        echo "time:" . time() . " mysql reconnect\n";
                    }
                } catch (Exception $e) {
                    //重新连接
                    self::connectDb($key,$mysqlConfig[$key]);
                    echo "time:" . time() . " mysql reconnect\n";
                }
            }
        }
    }

    static function close(){
        if (self::$db) {
            foreach (self::$db as $key => $mysql) {
                self::$db[$key] = null;
            }
        }
    }
}
