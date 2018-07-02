<?php

namespace App\Http\Controllers;

use App\Blogcomment;
use Illuminate\Http\Request;

class BlogcommentController extends Controller
{
    //
    public function newComment()
    {
        $commentData=request('comment');

        $comment = new Blogcomment();

        $comment->fill(['blogpost_id' => $commentData['blogpost_id'], 'name' => $commentData['name'], 'email' => $commentData['email'], 'content' => $commentData['content']]);

        if($comment->save())
            return 1;
        else
            return -1;

    }
}
