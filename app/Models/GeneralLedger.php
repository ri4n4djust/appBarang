<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GeneralLedger extends Model
{
    use HasFactory;

    protected $table = 'tblgeneral_ledger';
    protected $fillable = [
        'idGl', 'r_rekening', 'tglGl', 'debet', 'kredit', 'harga'
    ];

    public function getKdGL(){
        $count = self::count();
        return $count+1;
    }
}
