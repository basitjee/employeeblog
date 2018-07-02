<?php

namespace App\Http\Controllers;

use App\Blogpost;
use Illuminate\Http\Request;
use App\User;
use function MongoDB\BSON\toJSON;

class DashboardController extends Controller
{
    //
    public function login()
    {
        $username = request('username');

        if(User::where('username', $username)->exists()) {
            return User::where('username', $username)->get();

        }
        else
            return -1;
    }

    public function checkUsername()
    {
        $username = request('username');

        if(User::where('username', $username)->exists()) {
            return 1;
        }
        else
            return 0;
    }

    public function newUser()
    {
        $user_data=request('user');

        $post = new User();

        $post->fill(['name' => $user_data['name'], 'email' => $user_data['email'], 'username' => $user_data['username']]);

        if($post->save())
            return 1;
        else
            return -1;

    }

}
