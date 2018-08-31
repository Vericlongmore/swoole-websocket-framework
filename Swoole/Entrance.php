<?php

namespace Swoole;

use Swoole\Core\Config;
use Swoole\Server\Factory as SFactory;


class Entrance
{
    private static $appPath='app';
    private static $classPath = array();

    final public static function autoLoader($class)
    {
        if(isset(self::$classPath[$class])) {
            require self::$classPath[$class];
            return;
        }
        $baseClasspath = \str_replace('\\', DS, $class) . '.php';
        //echo "<pre>";
        //print_r($baseClasspath);
        $libs = array(
            APP_PATH,
            ROOT_PATH
        );
        foreach ($libs as $lib) {
            $classpath = $lib . DS . $baseClasspath;
            if (\is_file($classpath)) {
                self::$classPath[$class] = $classpath;
                require "{$classpath}";
                return;
            }
        }
    }


    public static function run($argv) {
        $configPath = ROOT_PATH . DS . 'Config';
        \spl_autoload_register(__CLASS__ . '::autoLoader');
        //Config::load($configPath);
        $server = new WebSocket($argv);

        $server->run();
    }
}

