<?php
/**
 * Created by PhpStorm.
 * User: luoxinyu
 * Date: 14-8-21
 * Time: 下午9:23
 */

header("Content-type: text/html; charset=utf-8");

if(!empty($_POST['sentence'])){
    $sentence = $_POST['sentence'];

    $so = scws_new();

    $so->set_dict('./path/dict.utf8.xdb');

    $so->set_rule('./path/rules.utf8.ini ');

    $so->set_ignore(true);
//$so->set_charset('gbk');
// 这里没有调用 set_dict 和 set_rule 系统会自动试调用 ini 中指定路径下的词典和规则文件
    $so->send_text($sentence);
    $dataArray = array();

    while ($temp = $so->get_result())
    {
        foreach($temp as $value){
            $dataArray[] = $value['word'];
        }

    }

    var_dump($dataArray);


    $so->close();
}



?>