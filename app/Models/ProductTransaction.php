<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use illuminate\database\Eloquent\Factories\HasFactory;

class ProductTransaction extends Model
{
    use HasFactory;

     protected $guarded = [
        'id',
    ];

    public function user(){
       return $this->belongsTo(User::class); 
    }

    public function transactionDetails(){
        return $this->hasMany(TransactionDetail::class);
    }
}
