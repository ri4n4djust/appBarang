<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Penyusutan extends Model
{
    use HasFactory;
    protected $table = 'tblinventaris_penyusutan';
    protected $fillable = [
        'penyusutan_sysno', 'penyusutan_docno', 'tgl_penyusutan', 'memo_penyusutan'
    ];
}
