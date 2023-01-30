<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Linkaja extends Model
{
    use HasFactory;
    protected $table = 'tbllinkaja';
    protected $fillable = [
        'kd_trans', 'r_bbm','nm_bbm', 'tgl_link', 'jumlah_link', 'r_regu'
    ];
}
