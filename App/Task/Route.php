<?php
namespace Task;

class Route
{
    public static function execute($server, $data)
    {
        $data = json_decode($data, true);
        $taskClass = "Task\\Adapter\\". $data['task'];
        try{
            $taskObj = new $taskClass($server, $data['fd'], $data['data']);
        }catch (\Exception $e){
            echo "task no existed ", $e->getMessage();
        }
        try{
            $method = $data['method'];
            return $taskObj->$method();
        }catch (\Exception $e){
            echo "task method no existed ", $e->getMessage();
        }
    }
}