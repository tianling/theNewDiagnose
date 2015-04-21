<?php
/*
**Author:tianling
**createTime:15/4/2 上午12:12
*/

class Office extends Eloquent{
    protected $table = 'office';

    protected $primaryKey = 'office_id';

    public $timestamps = false;
}