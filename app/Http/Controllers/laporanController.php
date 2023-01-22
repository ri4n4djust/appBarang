<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class laporanController extends Controller
{
    //
    public function laporanBbm(){
        $lap = DB::table('tbltransaksi_nosel')
                ->join('tblbbm', 'tblbbm.id', 'tbltransaksi_nosel.r_bbm')
                ->select('tbltransaksi_nosel.*', 'tblbbm.nama_bbm')
                ->get();
        return response()->json([
            'success' => true,
            'message' => 'Laporan Penjualan BBM',
            'data' => $lap
        ], 200);
    }
}
