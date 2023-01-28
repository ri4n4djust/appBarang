<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Barang extends Model
{
    use HasFactory;
    protected $table = 'tblbarang';

    protected $fillable = [
        'nmBarang', 'hrgPokok', 'hrgJual', 'stkBarang', 'deskripsi', 'gmbrBarang', 'ktgBarang', 'satuanBarang', 
        'merek', 'qtyMin', 'qtyMax', 'kdBarang', 'stsBarang'
    ];
}
