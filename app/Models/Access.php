<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;

class Access extends Authenticatable
{
    protected $fillable = [
        'file_id',
        'file_name',
        'full_name',
        'email',
        'type',
        'user_id'
    ];

    public $timestamps = false;
}
