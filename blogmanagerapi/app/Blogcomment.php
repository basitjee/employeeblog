<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Blogcomment extends Model
{
    //
    protected $table = "blogcomments";

    protected $fillable = ['blogpost_id', 'name', 'email', 'content'];
}
