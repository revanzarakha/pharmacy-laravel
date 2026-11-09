<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\database\Eloquent\Factories\HasFactory;

class Category extends Model
{

    use HasFactory;

    protected $guarded = [
        'id',
    ];

}
