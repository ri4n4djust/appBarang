<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OpnumDetail extends Model
{
    use HasFactory;
    protected $table = 'tblopnum_detail';
    protected $fillable = [
        'r_opnum', 'r_kdPersediaan', 'nmPersediaan', 'selisihOpnum', 'nilaiOpnum', 'keteranganOpnum'
    ];
}
