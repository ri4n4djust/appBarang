<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class labarugiController extends Controller
{
    //
    public function getPendapatan(Request $request){
        $startDate = date("Y-m-d", strtotime($request->input('startDate')));
        $endDate = date("Y-m-d", strtotime($request->input('endDate')));
        $bbm = DB::select("SELECT SUM(total) total, r_bbm FROM `tbltransaksi_nosel` WHERE tgl_transaksi BETWEEN '$startDate ' AND '$endDate' GROUP BY r_bbm;");
        $non_bbm = DB::select("SELECT COALESCE(SUM(totalJual),0) total, r_kdBarang FROM `tblpenjualan_detail` WHERE tgl_trans BETWEEN '$startDate ' AND '$endDate' GROUP BY r_kdBarang;");
        $oli = DB::select("SELECT COALESCE(SUM(totalJual),0) total, kategori_jual, COALESCE(SUM(totalHpp),0) totalHpp FROM `tblpenjualan_detail` WHERE tgl_trans BETWEEN '$startDate ' AND '$endDate' GROUP BY kategori_jual;");

        return response()->json([
            'success' => true,
            'message' => 'List Pendapatan',
            'data' => [$bbm,$non_bbm,$oli]
        ], 200);
    }

    public function getHppPenjualan(Request $request){
        $startDate = date("Y-m-d", strtotime($request->input('startDate')));
        $endDate = date("Y-m-d", strtotime($request->input('endDate')));
        $hpp_bbm = DB::select("SELECT SUM(total_hpp) total, r_bbm FROM `tbltransaksi_nosel` WHERE tgl_transaksi BETWEEN '$startDate ' AND '$endDate' GROUP BY r_bbm;");
        $hpp_nonbbm = DB::select("SELECT COALESCE(SUM(totalHpp),0) totalHp,r_kdBarang FROM tblpenjualan_detail WHERE tgl_trans BETWEEN '$startDate' AND '$endDate' GROUP BY r_kdBarang ;");
        return response()->json([
            'success' => true,
            'message' => 'List Hpp Penjualan',
            'data' => [$hpp_bbm,$hpp_nonbbm]
        ], 200);
    }
}
