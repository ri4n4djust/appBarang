<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pobbm extends Model
{
    use HasFactory;
    protected $table = 'tblpobbm';
    protected $fillable = [
        'no_po', 'tgl_po', 'r_supplier', 'subTotal', 'disc', 'discPercent', 'tax','total','note', 'term', 'jthTempo'
    ];
}
