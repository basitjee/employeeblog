<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Blogpost extends Model
{
    //
    protected $table = "blogposts";

    protected $fillable = ['user_id', 'title', 'content'];

    public static function getUserPosts($user_id) {
        $posts = Blogpost::where('user_id', $user_id)->orderBy('created_at', 'desc')->get();

        $comments = Blogcomment::get();

        $user = User::where('id', $user_id)->first();

        return response()->json(['posts'=>$posts,'comments'=>$comments, 'user'=> $user]);


    }
    public static function getAllPosts() {
        $posts = Blogpost::orderBy('created_at', 'desc')->get();

        $comments = Blogcomment::get();

        $users = User::get();

        return response()->json(['posts'=>$posts,'comments'=>$comments, 'users'=> $users]);


    }
}
