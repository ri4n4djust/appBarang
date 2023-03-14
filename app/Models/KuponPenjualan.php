<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KuponPenjualan extends Model
{
    use HasFactory;
    protected $table = 'tblpenjualankupon';
    protected $fillable = [
        'kd_trans', 'r_kdPelanggan','nmPelanggan', 'tgl_trans', 'total'
    ];
}
