<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use illuminate\database\Eloquent\Factories\HasFactory;

class TransactionDetail extends Model
{
    use HasFactory;

     protected $guarded = [
        'id',
    ];

    public function productTransaction(){
        return $this->belongsTo(ProductTransaction::class);
    }

    public function product(){
        return $this->belongsTo(Product::class);
    }

}
