<?php
/*
**Author:tianling
**createTime:15/3/27 下午10:14
*/

class LogController extends BaseController{

    public function showLog(){

        $logs = DiagnoseLog::orderBy('created_at','DESC')->get();

        $logData = array();

        foreach($logs as $log){
            $str = '';
            $idStr = '';

            foreach($log->diagMatch as $match){

                $str.= $match->symptom->symptom_name.',';
                $idStr.= $match->symptom->symptom_id.',';
            }
            $str = substr($str,0,strlen($str)-1);
            $idStr = substr($idStr,0,strlen($idStr)-1);

            $logData[] = array(
                'content'=>$log->content,
                'words'=>$log->words,
                'target'=>$str,
                'label'=>$idStr

            );
        }


        return View::make("site.showlogs")->with('data',$logData);
    }
}