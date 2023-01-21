<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pembelian extends Model
{
    use HasFactory;
    protected $table = 'tblpembelian';
    // protected $fillable = [
    //     'r_nota', 'kdBarang', 'nmBarang', 'hrgBeli', 'qty', 'total'
    // ];
}
