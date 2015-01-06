<?php
/*
**Author:tianling
**createTime:15-1-2 上午1:43
*/

class DiaController extends BaseController{

    public function index(){
        return View::make("site.show");
    }


    public function diaGet(){
        $sentence = Input::get('sentence');

        $so = scws_new();
        $so->set_charset('utf-8');
        $so->set_dict(storage_path().'/path/dict.utf8.xdb');
        $so->set_ignore(true);

        // 这里没有调用 set_dict 和 set_rule 系统会自动试调用 ini 中指定路径下的词典和规则文件
        $so->send_text($sentence);


        $dataArray = array();

        while ($temp = $so->get_result())
        {
            foreach($temp as $value){
                $dataArray[] = $value['word'];
            }

        }

        $stopfile = fopen(storage_path().'/stopWords/stop1.txt','r') or die('unable to open file!');


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
}