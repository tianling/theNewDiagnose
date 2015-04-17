<?php
/*
**Author:tianling
**createTime:15/4/17 下午8:30
*/

class TrainController extends BaseController{

    //python脚本调用测试
    public function learn(){
        $order = 'python deep_learn/xmlGet.py';
        $data = shell_exec($order);

        var_dump($data);
    }


}