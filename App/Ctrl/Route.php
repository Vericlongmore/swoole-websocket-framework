<?php
/**
 * author: shenzhe
 * Date: 13-6-17
 * route处理类
 */
namespace Ctrl;
use Swoole\Core\Parser;

class Route
{
    public static function execute(Parser $parser)
    {
        $ctrlClass = "Ctrl\\Adapter\\".$parser->getCtrl();
        try {
            $ctrlObj = new $ctrlClass($parser);
        } catch (\Exception $e){
            echo "ctrl no existed ", $e->getMessage();
        }

        try{
            $method = $parser->getMethod();
            $ctrlObj->$method();
        }catch (\Exception $e){
            echo "ctrl method no existed ", $e->getMessage();
        }
    }
}
