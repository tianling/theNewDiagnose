<?php
/*
**Author:tianling
**createTime:15/3/27 下午9:39
*/

class DiagMatch extends Eloquent{

    protected $table = 'diagnose_log_match';

    protected $primaryKey = 'id';

    public function diagnoseLog(){
        return $this->belongsTo('DiagnoseLog','id','l_id');
    }

    public function symptom(){
        return $this->belongsTo('Symptom','m_id','symptom_id');
    }
}