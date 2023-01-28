<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pelanggan extends Model
{
    use HasFactory;

    protected $table = 'tblpelanggan';

    protected $fillable = [
        'kdPelanggan', 'nmPelanggan', 'almtPelanggan', 'noHpPelanggan', 'rolePelanggan', 'emailPelanggan', 'path'
    ];
    
}
