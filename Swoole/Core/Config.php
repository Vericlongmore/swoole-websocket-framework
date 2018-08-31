<?php
namespace Swoole\Core;

class Config
{

    static public $conf = array();

    static public function get($name, $file)
    {
        if (isset(self::$conf[$file])) {
            return self::$conf[$file][$name];
        } else {
            $path = ROOT_PATH . '/Config/' . $file . '.php';
            echo $path;
            if (is_file($path)) {
                $conf = include $path;
                if (isset($conf[$name])) {
                    self::$conf[$file] = $conf;
                    return $conf[$name];
                } else {
                    throw new \Exception('没有这个配置项' . $name);
                }
            } else {

                throw new \Exception('找不到配置文件' . $path);
            }
        }

    }
}