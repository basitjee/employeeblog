<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('/new-post', 'BlogpostController@newPost');

Route::post('/new-comment', 'BlogcommentController@newComment');

Route::post('/getUserPosts', 'BlogpostController@getUserPosts');

Route::post('/getAllPosts', 'BlogpostController@getAllPosts');

Route::post('/getUserPostCount', 'BlogpostController@getUserPostCount');

Route::post('/checkUsername', 'DashboardController@checkUsername');

Route::post('/newUser', 'DashboardController@newUser');

Route::post('/login', 'DashboardController@login');

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
