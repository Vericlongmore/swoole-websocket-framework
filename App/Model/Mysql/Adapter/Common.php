<?php
namespace Model\Mysql\Adapter;
use Model\Mysql\Base;

class Common extends Base{
    public $db = 'source1';
    function getCommonInfo(){
        $where =array("type"=>1);
      //  echo "++++++++++++++".$this->model->debug()->get("dtb_config_common",'*',$where)."===============\n";
        $res = $this->model->get("dtb_config_common",'*',$where);
        if($res)
        {
           return $res['value'];
        }
        return 0;
    }
    
  
}