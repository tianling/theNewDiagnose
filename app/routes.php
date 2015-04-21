<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

Route::get('/','TrainController@index');

Route::get('diaSet','DiaController@index');

Route::post('diaGet','DiaController@diaGet');

Route::get('show','LogController@showLog');

Route::post('vectorGet','DiaController@ajax_get_vector');

Route::match(array('GET','POST'),'officeSet','LogController@officeSet');

Route::get('xmlMake','DiaController@vectorXml');

Route::post('login','AdminController@login');

Route::get('learn','TrainController@learn');

Route::post('predict','TrainController@predict');

Route::get('register','HomeController@register');