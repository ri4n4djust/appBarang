<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class laporanController extends Controller
{
    //
    public function laporanBbm(Request $request){
        $startDate = date("Y-m-d", strtotime($request->input('startDate')));
        $endDate = date("Y-m-d", strtotime($request->input('endDate')));
        $lap = DB::table('tbltransaksi_nosel')
                ->join('tblbbm', 'tblbbm.id', 'tbltransaksi_nosel.r_bbm')
                ->join('tblnosel_detail', 'tblnosel_detail.id_nosel', 'tbltransaksi_nosel.r_nosel')
                ->select('tbltransaksi_nosel.*', 'tblbbm.nama_bbm', 'tblnosel_detail.nama_nosel')
                ->whereBetween('tbltransaksi_nosel.tgl_transaksi', [$startDate, $endDate])
                ->get();
        return response()->json([
            'success' => true,
            'message' => 'Laporan Penjualan BBM',
            'data' => $lap
        ], 200);
    }

    public function laporanBrg(Request $request){
        $startDate = date("Y-m-d", strtotime($request->input('startDate')));
        $endDate = date("Y-m-d", strtotime($request->input('endDate')));
        $lap = DB::table('tblpenjualan')
                ->join('tblpelanggan', 'tblpenjualan.r_pelanggan', 'tblpelanggan.kdPelanggan')
                ->select('tblpenjualan.*', 'tblpelanggan.nmPelanggan')
                ->whereBetween('tblpenjualan.tglPenjualan', [$startDate, $endDate])
                ->get();
        return response()->json([
            'success' => true,
            'message' => 'Laporan Penjualan Barang',
            'data' => $lap
        ], 200);
    }

    public function pembelianBrg(Request $request){
        $startDate = date("Y-m-d", strtotime($request->input('startDate')));
        $endDate = date("Y-m-d", strtotime($request->input('endDate')));
        $lap = DB::table('tblpembelian')
                ->join('tblsupplier', 'tblpembelian.r_supplier', 'tblsupplier.kdSupplier')
                ->select('tblpembelian.*', 'tblsupplier.nmSupplier')
                ->whereBetween('tblpembelian.tglPembelian', [$startDate, $endDate])
                ->get();
        return response()->json([
            'success' => true,
            'message' => 'Laporan pembelian Barang',
            'data' => $lap
        ], 200);
    }

    public function laporanOpnum(Request $request){
        $startDate = date("Y-m-d", strtotime($request->input('startDate')));
        $endDate = date("Y-m-d", strtotime($request->input('endDate')));
        $lap = DB::table('tblopnum')
                // ->join('tblsupplier', 'tblpembelian.r_supplier', 'tblsupplier.kdSupplier')
                // ->select('tblpembelian.*', 'tblsupplier.nmSupplier')
                ->whereBetween('tblopnum.tglOpnum', [$startDate, $endDate])
                ->get();
        return response()->json([
            'success' => true,
            'message' => 'Laporan opnum Barang',
            'data' => $lap
        ], 200);
    }

    public function aplusan(Request $request){
        $startDate = date("Y-m-d", strtotime($request->input('startDate')));
        // $endDate = date("Y-m-d", strtotime($request->input('endDate')));
        $lap = DB::table('tbltransaksi_nosel')
                ->join('tblbbm', 'tblbbm.id', 'tbltransaksi_nosel.r_bbm')
                ->join('tblnosel_detail', 'tblnosel_detail.id_nosel', 'tbltransaksi_nosel.r_nosel')
                ->select('tbltransaksi_nosel.*', 'tblbbm.nama_bbm', 'tblnosel_detail.nama_nosel')
                ->where('tbltransaksi_nosel.tgl_transaksi', [$startDate])
                ->get();
        $kupon = DB::table('tblkupon')
                ->join('tblpelanggan', 'tblpelanggan.kdPelanggan', 'tblkupon.r_kdPelanggan' )
                ->select('tblkupon.*', 'tblpelanggan.nmPelanggan')
                ->where('tblkupon.tgl_trans', [$startDate])
                ->get();
        return response()->json([
            'success' => true,
            'message' => 'Laporan Penjualan BBM',
            'data' => [$lap, $kupon]
        ], 200);

    }
    
}
