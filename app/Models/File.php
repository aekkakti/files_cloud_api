<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;

class File extends Authenticatable
{
    protected $fillable = [
        'name',
        'url',
        'file_id',
    ];


}
