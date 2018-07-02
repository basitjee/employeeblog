<?php

namespace App\Http\Controllers;

use App\Blogpost;
use Illuminate\Http\Request;

class BlogpostController extends Controller
{
    //
    public function newPost()
    {
        $post_data=request('post');

        $post = new Blogpost();

        $post->fill(['user_id' => $post_data['user_id'], 'title' => $post_data['post_title'], 'content' => $post_data['post_content']]);

        if($post->save())
            return 1;
        else
            return -1;

    }

    public function getUserPosts() {
        $user_id = request('user_id');

        $posts = Blogpost::getUserPosts($user_id);


        return $posts;
    }

    public function getUserPostCount(){
        $user_id = request('user_id');

        $count = Blogpost::where('user_id', $user_id)->count();

        return $count;
    }

    public function getAllPosts() {
        return Blogpost::getAllPosts();
    }
}
