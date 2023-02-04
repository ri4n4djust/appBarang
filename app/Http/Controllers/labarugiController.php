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

        return response()->json([
            'success' => true,
            'message' => 'List Pendapatan',
            'data' => [$bbm,$non_bbm]
        ], 200);
    }

    public function getHppPenjualan(Request $request){
        $startDate = date("Y-m-d", strtotime($request->input('startDate')));
        $endDate = date("Y-m-d", strtotime($request->input('endDate')));
        $hpp_nonbbm = DB::select("SELECT *,COALESCE(SUM(totalHpp),0) totalHp FROM tblpenjualan_detail WHERE tgl_trans BETWEEN '2023-02-01' AND '2023-02-03' GROUP BY r_kdBarang ORDER BY idDetailPenjualan;");
        return response()->json([
            'success' => true,
            'message' => 'List Hpp Penjualan',
            'data' => $hpp_penjualan
        ], 200);
    }
}
