<?php
/*
**Author:tianling
**createTime:15/4/6 下午10:23
*/

class AdminController extends BaseController{

    public function login(){
        $name = Input::get('name');
        $password = Input::get('password');

        $password = Hash::make($password);

        $admin = Admin::where('admin_name','=',$name)->first();
//
//        var_dump($admin->admin_name);
//        die;
//        var_dump($admin->admin_name);
//        die;

        Session::put('key', 'value');

        Auth::login($admin);

        echo Auth::user()->admin_id;
    }
}