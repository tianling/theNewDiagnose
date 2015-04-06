<?php
/*
**Author:tianling
**createTime:15/4/6 下午10:25
*/
use Illuminate\Auth\UserTrait;
use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableTrait;
use Illuminate\Auth\Reminders\RemindableInterface;

class Admin extends Eloquent implements UserInterface, RemindableInterface{

    use UserTrait, RemindableTrait;

    protected $table = 'admin';

    protected $primaryKey = 'admin_id';

    public $timestamps = false;
}