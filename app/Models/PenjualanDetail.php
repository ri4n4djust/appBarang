<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PenjualanDetail extends Model
{
    use HasFactory;
    protected $table = 'tblpenjualan_detail';
    protected $fillable = [
        'r_noPenjualan', 'r_kdBarang', 'r_nmBarang', 'hrgJual', 'qty', 'satuanJual','totalHpp' ,'totalJual'
    ];
}
