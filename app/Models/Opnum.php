<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Opnum extends Model
{
    use HasFactory;
    protected $table = 'tblopnum';
    protected $fillable = [
        'kdOpnum', 'tglOpnum', 'totalOpnum', 'userOpnum'
    ];
}
