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

    $stopfile = fopen('./stopWrods/stop1.txt','r') or die('unable to open file!');

    //$stop = fread($stopfile,filesize('./stopWrods/stop1.txt'));
    while(!feof($stopfile)) {
        $stop = fgets($stopfile);
        $stop = str_replace("\n","",$stop);
        $stop = str_replace("\r","",$stop);
        $stop = str_replace("\r\n","",$stop);
        $stopArray[] = $stop;

    }

    fclose($stopfile);

    foreach($dataArray as $key=>$value){

        foreach($stopArray as $stop){

            if($value == $stop){

                unset($dataArray[$key]);
            }
        }
    }

    var_dump($dataArray);


    $so->close();
}


?>