<?php
/*
**Author:tianling
**createTime:15/3/27 下午10:14
*/

class LogController extends BaseController{

    //日志数据展示
    public function showLog(){


        $logs = DiagnoseLog::orderBy('created_at','DESC')->get();

        $logData = array();

        foreach($logs as $key=> $log){
            $str = '';
            $idStr = '';

            foreach($log->diagMatch as $match){

                $str.= $match->symptom->symptom_name.',';
                $idStr.= $match->symptom->symptom_id.',';
            }
            $str = substr($str,0,strlen($str)-1);
            $idStr = substr($idStr,0,strlen($idStr)-1);

            $logData[] = array(
                'id'=>$log->id,
                'content'=>$log->content,
                'words'=>$log->words,
                'target'=>$str,
                'label'=>$idStr,

            );


            if($log->officeData != ''){
                $logData[$key]['office'] = $log->officeData->office_name;
            }else{
                $logData[$key]['office'] = '未指定';
            }


        }


        return View::make("site.showlogs")->with('data',$logData);
    }


    //指定科室页面
    public function officeSet(){

        $id = Input::get('id');
        $office = Input::get('office');



        $log = DiagnoseLog::find($id);

        if($office!=null){
            $log->office = $office;
            $log->save();
            return Redirect::intended('show');
        }

        $office = Office::all();

        $str = '';
        $idStr = '';

        foreach($log->diagMatch as $match){

            $str.= $match->symptom->symptom_name.',';
            $idStr.= $match->symptom->symptom_id.',';
        }
        $str = substr($str,0,strlen($str)-1);
        $idStr = substr($idStr,0,strlen($idStr)-1);

        $logData = array(
            'id'=>$log->id,
            'content'=>$log->content,
            'words'=>$log->words,
            'target'=>$str,
            'label'=>$idStr,
            'office'=>$office

        );


        return View::make("site.officeSet")->with('data',$logData);
    }
}