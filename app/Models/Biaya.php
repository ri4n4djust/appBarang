<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Biaya extends Model
{
    use HasFactory;
    protected $table = 'tblbiaya';
    protected $fillable = [
        'kd_trans', 'tglBiaya','keterangan_biaya', 'jumlah', 'r_regu'
    ];
}
