<?php
/*
**Author:tianling
**createTime:15-1-12 下午10:06
*/

class DiagnoseLog extends Eloquent{

    protected $table = 'diagnose_log';

//    public $timestamps = false;

    protected $primaryKey = 'id';


    public function diagMatch(){
        return $this->hasMany('DiagMatch','l_id','id');
    }
}