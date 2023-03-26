<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pengadaan extends Model
{
    use HasFactory;
    protected $table = 'tblinventaris_pengadaan';
    protected $fillable = [
        'pengadaan_sysno', 'pengadaan_docno'
    ];
}
