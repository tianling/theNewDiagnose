<?php
/*
**Author:tianling
**createTime:15-1-2 上午1:43
*/

class DiaController extends BaseController{

    public function index(){
        return View::make("site.show");
    }

    public function showLog(){

        return View::make("site.showlogs");
    }



    public function diaGet(){
        $sentence = Input::get('sentence');

        $dataArray  = $this->word_cws($sentence);

        $wordArray = $this->stopWords_clear($dataArray);

        $symlist = $this->symptom_maching($wordArray);

        $log = $this->diagnose_log($sentence,$symlist,$wordArray);

        $vector = $this->word_vector($symlist);

        var_dump($vector);


    }


    /*
     * 基于SCWS分词引擎进行分词
     **/
    private function word_cws($sentence){

        $so = scws_new();
        $so->set_charset('utf-8');
        $so->set_dict(storage_path().'/path/dict1.utf8.xdb');
        $so->set_ignore(true);
//        $so->set_multi(true);

        // 这里没有调用 set_dict 和 set_rule 系统会自动试调用 ini 中指定路径下的词典和规则文件
        $so->send_text($sentence);


        $dataArray = array();

        while ($temp = $so->get_result())
        {
            foreach($temp as $value){
                $dataArray[] = $value['word'];
            }

        }

        $so->close();

        return $dataArray;

    }


    /*
     * 去停用词
     **/
    private function stopWords_clear($dataArray){
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

        return $dataArray;
    }


    /*
     * 症状库匹配
     **/
    private function symptom_maching($dataArray){
        $symptom = new Symptom();

        $sym = array();
        foreach($dataArray as $value){
            $match = $symptom::where('symptom_name','=',$value)->first();

            if(isset($match->symptom_id)){
                $sym[] =  $match->symptom_id;
            }
        }

        return $sym;


    }


    /*
     * 症状信息记录
     **/
    private function diagnose_log($diagnoseData,$matchData,$wordArray){
        //建立新日志并录入初始信息
        $diagnose = new DiagnoseLog();
        $diagnose->content = $diagnoseData;

        //录入处理过后的带匹配词组
        $str = '';
        foreach($wordArray as $word){
            $str .= $word.',';
        }
        $str = substr($str,0,strlen($str)-1);
        $diagnose->words = $str;

        $diagnose->save();

        $log_id = $diagnose->id;

        //录入匹配数据
        foreach($matchData as $match){
            $logmatch = new DiagMatch();
            $logmatch->l_id = $log_id;
            $logmatch->m_id = $match;
            $logmatch->save();
        }



    }


    /*
     * 词向量生成
     **/
    private function word_vector($matchData){

        $vectorArray = $this->word_vector_init();

        foreach($matchData as $matchvalue){
            $vectorArray[$matchvalue - 1] ++;

        }


        return json_encode($vectorArray);

    }


    /*
     * 词向量初始化
     **/
    private function word_vector_init(){

        $vectorArray = array();

        $symCount = Symptom::all()->count();

        for($i = 0;$i<$symCount;$i++){

            $vectorArray[$i] = 0;

        }

        return $vectorArray;
    }

}