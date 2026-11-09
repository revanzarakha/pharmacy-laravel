<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\database\Eloquent\Factories\HasFactory;

class Product extends Model
{
    use HasFactory;

     protected $guarded = [
        'id',
    ];

    public function category(){
        return $this->belongsTo(Category::class);
    }
}
