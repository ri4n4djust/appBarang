<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TransaksiNosel extends Model
{
    use HasFactory;
    protected $table = 'tbltransaksi_nosel';

    protected $fillable = [
        'r_bbm', 'r_nosel', 'r_regu', 'tgl_transaksi', 'cost_ltr', 'last_price', 'last_meter', 'total'
    ];
}
