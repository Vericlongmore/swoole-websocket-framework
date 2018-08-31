<?php
/**
 * user: Lancelot
 *
 * description: check the type of json is right or not.
 */
namespace Swoole\Core;

class Parser
{
    private $fd;
    private $data;
    private $ctrl;
    private $method;
    private $server;
    private $protInfo;

    public function __construct($_fd, $_serv, $_data){
        $this->fd = $_fd;
        $this->server = $_serv;

        if(!is_array($_data)){
            $this->data = json_decode($_data, true);
        }else{
            $this->data = $_data;
        }

        $this->protInfo = Config::get('protocol', 'Protocol');
    }

    public function ack_response(){
        if(isset($this->data['prot']) && isset($this->data['unique_id'])){
            Functions::ack_response($this->server, array($this->fd), (int)$this->data['prot'], $this->data['unique_id']);
        }
    }

    public function setCtrl(){
        if (isset($this->data['prot'])){
            $prot = (int)$this->data['prot'];
            if(isset($this->protInfo[$prot]) && $this->protInfo[$prot]){
                $this->ctrl = $this->protInfo[$prot]['ctrl'];
                $this->method = $this->protInfo[$prot]['method'];
                return true;
            }
        }
        return false;
    }

    public function checkSign(){
        return true;
        /*if(Config::get('debug_mode') == false){
            //$sign = $this->data['sign'];
            return true;
        }else{
            return true;
        }*/
    }

    public function setFd( $_fd ) {
        $this->fd = $_fd;
    }

    public function getFd(){
        return $this->fd;
    }

    public function setServer( $_server ) {
        $this->server = $_server;
    }

    public function getServer() {
        return $this->server;
    }

    public function getCtrl() {
        return $this->ctrl;
    }

    public function getMethod() {
        return $this->method;
    }

    public function getParams() {
        return isset($this->data['data']) ? $this->data['data'] : array();
    }

    public function getParam($field, $type_func, $necessary=true){
        if(isset($this->data[$field])){
            $value = trim($this->param[$field]);
            if($type_func == 'strval'){
                return $value;
            }else{
                return call_user_func($type_func, $value);
            }
        }else{
            return null;
        }
    }

    public function display( $model ) {
        // TODO parse Protocol
        return $model;
    }

}