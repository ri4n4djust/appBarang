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

    public function listKupon(Request $request){
        $startDate = date("Y-m-d", strtotime($request->input('startDate')));
        $endDate = date("Y-m-d", strtotime($request->input('endDate')));
        // $lap = DB::table('tblpenjualankupon')
        //         ->join('tblpelanggan', 'tblpenjualankupon.r_pelanggan', 'tblpelanggan.kdPelanggan')
        //         ->whereBetween('tblpenjualankupon.tglPenjualanKupon', [$startDate, $endDate])
        //         ->select('tblpenjualankupon.*', 'tblpelanggan.nmPelanggan')
        //         ->get();
        $lap = DB::select('SELECT noPenjualanKupon,tglPenjualanKupon,COALESCE(SUM(totalPenjualanKupon),0) total,created_at,updated_at FROM tblpenjualankupon GROUP BY noPenjualanKupon,tglPenjualanKupon,created_at,updated_at;');
        return response()->json([
            'success' => true,
            'message' => 'Laporan Penjualan Kupon',
            'data' => $lap
        ], 200);
    }

    public function aplusan(Request $request){
        $startDate = date("Y-m-d", strtotime($request->input('startDate')));
        $kd_trans = $request->input('kd_trans');
        // $endDate = date("Y-m-d", strtotime($request->input('endDate')));
        $lap = DB::table('tbltransaksi_nosel')
                ->join('tblbbm', 'tblbbm.id', 'tbltransaksi_nosel.r_bbm')
                ->join('tblnosel_detail', 'tblnosel_detail.id_nosel', 'tbltransaksi_nosel.r_nosel')
                ->select('tbltransaksi_nosel.*', 'tblbbm.nama_bbm','tblbbm.code_bbm', 'tblnosel_detail.nama_nosel')
                ->where('tbltransaksi_nosel.tgl_transaksi', [$startDate])
                ->where('tbltransaksi_nosel.kd_trans', $kd_trans)
                ->get();
        $kupon = DB::table('tblkupon')
                ->join('tblpelanggan', 'tblpelanggan.kdPelanggan', 'tblkupon.r_kdPelanggan' )
                ->select('tblkupon.*', 'tblpelanggan.nmPelanggan')
                ->where('tblkupon.tgl_trans', [$startDate])
                ->where('tblkupon.kd_trans', $kd_trans)
                ->get();
        $biaya = DB::table('tblbiaya')
                ->where('tglBiaya', [$startDate])
                ->where('tblbiaya.kd_trans', $kd_trans)
                ->get();
        $link = DB::table('tbllinkaja')
                ->where('tgl_link', [$startDate])
                ->where('tbllinkaja.kd_trans', $kd_trans)
                ->get();
        return response()->json([
            'success' => true,
            'message' => 'Laporan Aplusan BBM',
            'data' => [$lap, $kupon, $biaya, $link]
        ], 200);

    }

    public function daftarAplusan(Request $request){
        // $list = DB::select("SELECT a.id,a.kd_trans,a.tgl_transaksi,src.total,srckupon.total_kupon,srcbiaya.total_biaya,srclink.total_link 
        // FROM (SELECT COALESCE(sum(total),0) total FROM tbltransaksi_nosel GROUP BY kd_trans) src, 
        // (SELECT COALESCE(sum(total),0) total_kupon FROM tblkupon WHERE kd_trans='20230130A') srckupon,
        // (SELECT COALESCE(sum(jumlah),0) total_biaya FROM tblbiaya WHERE kd_trans='20230130A') srcbiaya,
        // (SELECT COALESCE(sum(jumlah_link),0) total_link FROM tbllinkaja WHERE kd_trans='20230130A') srclink, 
        // tbltransaksi_nosel a GROUP BY kd_trans;")->get()
        $startDate = date("Y-m-d", strtotime($request->input('startDate')));
        $endDate = date("Y-m-d", strtotime($request->input('endDate')));
        $list = DB::table('tblheader_aplusan')
                ->whereBetween('tgl_trans', [$startDate, $endDate])
                ->orderBy("id_aplusan", "desc")
                ->get();
        
        return response()->json([
            'success' => true,
            'message' => 'List Aplusan Aplusan',
            'data' => $list
        ], 200);
    }

    public function daftarBiaya(Request $request){
        $startDate = date("Y-m-d", strtotime($request->input('startDate')));
        $endDate = date("Y-m-d", strtotime($request->input('endDate')));
        $list = DB::table('tblbiaya')
                ->whereBetween('tglBiaya', [$startDate, $endDate])
                ->orderBy("kd_trans", "desc")
                ->get();
        
        return response()->json([
            'success' => true,
            'message' => 'List Biaya',
            'data' => $list
        ], 200);
    }

    public function daftarGJ(Request $request){
        $startDate = date("Y-m-d", strtotime($request->input('startDate')));
        $endDate = date("Y-m-d", strtotime($request->input('endDate')));
        $list = DB::table('general_ledger')
                ->join('gl_detail', 'general_ledger.notrans', 'gl_detail.rgl')
                ->join('coa', 'gl_detail.acc_id', 'coa.acc_id')
                ->whereBetween('general_ledger.tgl', [$startDate, $endDate])
                ->where('general_ledger.jurnal', 'GJ')
                ->select('general_ledger.*', 'gl_detail.*', 'coa.name')
                ->orderBy("general_ledger.notrans", "desc")
                ->get();
        
        return response()->json([
            'success' => true,
            'message' => 'List Jurnal Umum',
            'data' => $list
        ], 200);
    }
    

    public function daftarBbmDatang(Request $request){
        $startDate = date("Y-m-d", strtotime($request->input('startDate')));
        $endDate = date("Y-m-d", strtotime($request->input('endDate')));

        $list = DB::table('tblterimabbm_detail')
                ->join('tblbbm', 'tblbbm.code_bbm', 'tblterimabbm_detail.kd_barang')
                ->whereBetween('tblterimabbm_detail.tgl_terima', [$startDate, $endDate])
                ->orderBy("tblterimabbm_detail.r_kdterima", "desc")
                ->get();
        
        return response()->json([
            'success' => true,
            'message' => 'List Terima',
            'data' => $list
        ], 200);
    }



    public function deletePobbm(Request $request){
        try{
            $exception = DB::transaction(function() use ($request){
                $kd = $request->input('id');
                $cek_data = DB::table('tblterimabbm')->where('no_po', $kd)->first();
                if(empty($cek_data)){
                    //====hapus jurnal
                    $gl = DB::table('general_ledger')->where('order_no', $kd)->get();
                    for($i=0;$i< count($gl);$i++){
                        DB::table('general_ledger')->where('notrans', $gl[$i]->notrans)->delete();
                        DB::table('gl_detail')->where('rgl', $gl[$i]->notrans)->delete();
                    };
                    //=====end jurnal
                    DB::table('tblpobbm')->where('no_po', $kd)->delete();
                    DB::table('tblpobbm_detail')->where('r_noPo', $kd)->delete();
                }else{
                    return response()->json([
                        'success' => false,
                        'message' => 'tidak bole di Hapus',
                        // 'data' => $detail
                    ], 200);
                }
                DB::commit();
            });
            if(is_null($exception)) {
                return response()->json([
                    'success' => true,
                    'message' => 'Po Berhasil di Hapus',
                    // 'data' => $detail
                ], 200);
            } else {
                DB::rollback();
                return response()->json([
                    'success' => false,
                    'message' => 'po bbm Gagal Dihapus',
                ], 500);
            }
        } catch (\Exception $e) {
            DB::rollback();
            // something went wrong
            return response()->json([
             'success' => false,
             'message' => 'exception'.$e,
         ], 400);
        }
    }

    public function deleteBbmDatang(Request $request){
        try{
            $exception = DB::transaction(function() use ($request){
                $kd = $request->input('id');
                //====hapus jurnal
                $gl = DB::table('general_ledger')->where('order_no', $kd)->get();
                for($i=0;$i< count($gl);$i++){
                    DB::table('general_ledger')->where('notrans', $gl[$i]->notrans)->delete();
                    DB::table('gl_detail')->where('rgl', $gl[$i]->notrans)->delete();
                };
                //=====end jurnal
                $get_tr = DB::table('tblterimabbm_detail')->where('r_kdterima', $kd)->get();
                for($i=0;$i< count($get_tr);$i++){
                    $kodebarang = $get_tr[$i]->kd_barang ;
                    $kodepo = $get_tr[$i]->r_nopo;
                    // echo $kodepo.$kodebarang ;
                    $detterima = DB::table('tblterimabbm_detail')
                                ->where('r_nopo', '=' ,$kodepo)
                                ->where('kd_barang', '=' ,$kodebarang)
                                ->first();
                    $qtyterima = $detterima->qty_terima;
                    // echo $qtyterima ;
                    $detpo = DB::table('tblpobbm_detail')
                                ->where('r_noPo', '=' ,$kodepo)
                                ->where('kdBarang', '=' ,$kodebarang)
                                ->first();
                    $qtypo = $detpo->qty_recieve;
                    DB::table('tblpobbm_detail')
                    ->where('r_noPo', '=' ,$get_tr[$i]->r_nopo)
                    ->where('kdBarang', '=' ,$get_tr[$i]->kd_barang)
                    ->update([
                        'qty_recieve' => $qtypo - $qtyterima
                    ]);
                    DB::table('tblpobbm_detail')
                    ->where('r_noPo', '=' ,$get_tr[$i]->r_nopo)
                    ->where('kdBarang', '=' ,$get_tr[$i]->kd_barang)
                    ->update([
                        'qty_recieve' => $qtypo - $qtyterima
                    ]);
                    $brg = DB::table('tblpersediaan')->where('kdPersediaan', $kodebarang)->first();
                    $oldStok = $brg->stokPersediaan;
                    DB::table('tblpersediaan')->where('kdPersediaan', $kodebarang)->update([
                        'stokPersediaan' => $oldStok - $qtyterima,
                        // 'lastPrice' => $detgr[$i]['hrgPokok'],
                    ]);

                };
                DB::table('tblterimabbm')->where('kd_terima', $kd)->delete();
                DB::table('tblterimabbm_detail')->where('r_kdterima', $kd)->delete();
                DB::commit();
            });
            if(is_null($exception)) {
                return response()->json([
                    'success' => true,
                    'message' => 'BBM Datang Berhasil di Hapus',
                    // 'data' => $detail
                ], 200);
            } else {
                DB::rollback();
                return response()->json([
                    'success' => false,
                    'message' => 'BBM Datang Gagal Dihapus',
                ], 500);
            }
        } catch (\Exception $e) {
            DB::rollback();
            // something went wrong
            return response()->json([
             'success' => false,
             'message' => 'exception'.$e,
         ], 400);
        }
    }

    

    public function detailPobbm(Request $request){
        try{
            $exception = DB::transaction(function() use ($request){
                $kd = $request->input('id');
                //====hapus jurnal
                $gl = DB::table('general_ledger')->where('order_no', $kd)->get();
                for($i=0;$i< count($gl);$i++){
                    DB::table('general_ledger')->where('notrans', $gl[$i]->notrans)->delete();
                    DB::table('gl_detail')->where('rgl', $gl[$i]->notrans)->delete();
                };
                //=====end jurnal
                $header = DB::table('tblpobbm')->where('no_po', $kd)->get();
                $detail = DB::table('tblpobbm_detail')->where('r_noPo', $kd)->get();
                // DB::table('tblpobbm')->where('no_po', $kd)->delete();
                // DB::table('tblpobbm_detail')->where('r_noPo', $kd)->delete();
                DB::commit();
            });
            if(is_null($exception)) {
                return response()->json([
                    'success' => true,
                    'message' => 'Detail PO',
                    'data' => [$header, $detail, $gl]
                ], 200);
            } else {
                DB::rollback();
                return response()->json([
                    'success' => false,
                    'message' => 'Gagal Load Po',
                ], 500);
            }
        } catch (\Exception $e) {
            DB::rollback();
            // something went wrong
            return response()->json([
             'success' => false,
             'message' => 'exception'.$e,
         ], 400);
        }
    }

    public function deleteBiaya(Request $request){
        try{
            $exception = DB::transaction(function() use ($request){
                $kd = $request->input('id');
                $gl = DB::table('general_ledger')->where('order_no', $kd)->get();
                for($i=0;$i< count($gl);$i++){
                    DB::table('general_ledger')->where('notrans', $gl[$i]->notrans)->delete();
                    DB::table('gl_detail')->where('rgl', $gl[$i]->notrans)->delete();
                };
                DB::table('tblbiaya')->where('kd_trans', $kd)->delete();
                DB::commit();
            });
            if(is_null($exception)) {
                return response()->json([
                    'success' => true,
                    'message' => 'Biaya Berhasil di Hapus',
                    // 'data' => $detail
                ], 200);
            } else {
                DB::rollback();
                return response()->json([
                    'success' => false,
                    'message' => 'Biaya Gagal Dihapus',
                ], 500);
            }
        } catch (\Exception $e) {
            DB::rollback();
            // something went wrong
            return response()->json([
             'success' => false,
             'message' => 'exception'.$e,
         ], 400);
        }
    }

    public function laporanPenyusutan(Request $request){
        $startDate = date("Y-m-d", strtotime($request->input('startDate')));
        $endDate = date("Y-m-d", strtotime($request->input('endDate')));
        $list = DB::table('tblinventaris_penyusutan_detail')
                ->join('tblinventaris', 'tblinventaris.kode_inventaris', 'tblinventaris_penyusutan_detail.rkode_inventaris')
                ->whereBetween('tblinventaris_penyusutan_detail.tgl_penyusutan', [$startDate, $endDate])
                ->orderBy("tblinventaris_penyusutan_detail.id_penyusutan_detail", "desc")
                ->get();
        
        return response()->json([
            'success' => true,
            'message' => 'List Penyusutan',
            'data' => $list
        ], 200);

    }

    public function listKartustok(Request $request){
        $startDate = date("Y-m-d", strtotime($request->input('startDate')));
        $endDate = date("Y-m-d", strtotime($request->input('endDate')));
        $kodebarang = $request->input('kdBarang');
        $list = DB::table('tblkartu_stok')
                // ->join('tblinventaris', 'tblinventaris.kode_inventaris', 'tblinventaris_penyusutan_detail.rkode_inventaris')
                ->whereBetween('tgl', [$startDate, $endDate])
                ->where('kd_barang', $kodebarang)
                ->orderBy("id", "ASC")
                ->get();
        
        return response()->json([
            'success' => true,
            'message' => 'List Kartu Stok',
            'data' => $list
        ], 200);

    }

    

    public function deletePenyusutan(Request $request){
        try{
            $exception = DB::transaction(function() use ($request){
                $kd = $request->input('id');
                $gl = DB::table('general_ledger')->where('order_no', $kd)->get();
                for($i=0;$i< count($gl);$i++){
                    DB::table('general_ledger')->where('notrans', $gl[$i]->notrans)->delete();
                    DB::table('gl_detail')->where('rgl', $gl[$i]->notrans)->delete();
                };
                DB::table('tblinventaris_penyusutan')->where('penyusutan_sysno', $kd)->delete();
                DB::table('tblinventaris_penyusutan_detail')->where('rsysno_penyusutan', $kd)->delete();
                DB::commit();
            });
            if(is_null($exception)) {
                return response()->json([
                    'success' => true,
                    'message' => 'Penyustan Berhasil di Hapus',
                    // 'data' => $detail
                ], 200);
            } else {
                DB::rollback();
                return response()->json([
                    'success' => false,
                    'message' => 'Penyusutan Gagal Dihapus',
                ], 500);
            }
        } catch (\Exception $e) {
            DB::rollback();
            // something went wrong
            return response()->json([
             'success' => false,
             'message' => 'exception'.$e,
         ], 400);
        }
    }

    public function deletePenjualan(Request $request){
        try{
            $exception = DB::transaction(function() use ($request){
                $kd = $request->input('id');
                //========jurnal
                $gl = DB::table('general_ledger')->where('order_no', $kd)->get();
                for($i=0;$i< count($gl);$i++){
                    DB::table('general_ledger')->where('notrans', $gl[$i]->notrans)->delete();
                    DB::table('gl_detail')->where('rgl', $gl[$i]->notrans)->delete();
                };
                //========end jurnal
                DB::table('tblpenjualan')->where('noPenjualan', $kd)->delete();
                $dtl = DB::table('tblpenjualan_detail')->where('r_noPenjualan', $kd)->get();
                for($i=0;$i< count($dtl);$i++){
                    $oldStok = DB::table('tblpersediaan')->where('kdPersediaan', $dtl[$i]->r_kdBarang)->first();
                    DB::table('tblpersediaan')->where('kdPersediaan', $dtl[$i]->r_kdBarang)->update([
                        'stokPersediaan' => $oldStok->stokPersediaan + $dtl[$i]->qty,
                    ]);
                };
                DB::table('tblpenjualan_detail')->where('r_noPenjualan', $kd)->delete();
                DB::table('tblkartu_stok')->where('r_notrans', $kd)->delete();
                DB::commit();
            });
            if(is_null($exception)) {
                return response()->json([
                    'success' => true,
                    'message' => 'Penjualan Berhasil di Hapus',
                    // 'data' => $detail
                ], 200);
            } else {
                DB::rollback();
                return response()->json([
                    'success' => false,
                    'message' => 'Penjualan Gagal Dihapus',
                ], 500);
            }
        } catch (\Exception $e) {
            DB::rollback();
            // something went wrong
            return response()->json([
             'success' => false,
             'message' => 'exception'.$e,
         ], 400);
        }
    }

    public function deleteOpnum(Request $request){
        try{
            $exception = DB::transaction(function() use ($request){
                $kd = $request->input('id');
                $gl = DB::table('general_ledger')->where('order_no', $kd)->get();
                for($i=0;$i< count($gl);$i++){
                    DB::table('general_ledger')->where('notrans', $gl[$i]->notrans)->delete();
                    DB::table('gl_detail')->where('rgl', $gl[$i]->notrans)->delete();
                };
                DB::table('tblopnum')->where('kdOpnum', $kd)->delete();
                $dtl = DB::table('tblopnum_detail')->where('r_opnum', $kd)->get();
                for($i=0;$i< count($dtl);$i++){
                    $oldStok = DB::table('tblpersediaan')->where('kdPersediaan', $dtl[$i]->r_kdPersediaan)->first();
                    DB::table('tblpersediaan')->where('kdPersediaan', $dtl[$i]->r_kdPersediaan)->update([
                        'stokPersediaan' => $oldStok->stokPersediaan + $dtl[$i]->selisihOpnum,
                    ]);
                };
                DB::table('tblopnum_detail')->where('r_opnum', $kd)->delete();
                DB::commit();
            });
            if(is_null($exception)) {
                return response()->json([
                    'success' => true,
                    'message' => 'Penjualan Berhasil di Hapus',
                    // 'data' => $detail
                ], 200);
            } else {
                DB::rollback();
                return response()->json([
                    'success' => false,
                    'message' => 'Penjualan Gagal Dihapus',
                ], 500);
            }
        } catch (\Exception $e) {
            DB::rollback();
            // something went wrong
            return response()->json([
             'success' => false,
             'message' => 'exception'.$e,
         ], 400);
        }
    }

    public function deletePenjualanKupon(Request $request){
        try{
            $exception = DB::transaction(function() use ($request){
                $kd = $request->input('id');
                //========jurnal
                $gl = DB::table('general_ledger')->where('order_no', $kd)->get();
                for($i=0;$i< count($gl);$i++){
                    DB::table('general_ledger')->where('notrans', $gl[$i]->notrans)->delete();
                    DB::table('gl_detail')->where('rgl', $gl[$i]->notrans)->delete();
                };
                //=========endjurnal
                DB::table('tblpenjualankupon')->where('noPenjualanKupon', $kd)->delete();
                // $dtl = DB::table('tblopnum_detail')->where('r_opnum', $kd)->get();
                // for($i=0;$i< count($dtl);$i++){
                //     $oldStok = DB::table('tblpersediaan')->where('kdPersediaan', $dtl[$i]->r_kdPersediaan)->first();
                //     DB::table('tblpersediaan')->where('kdPersediaan', $dtl[$i]->r_kdPersediaan)->update([
                //         'stokPersediaan' => $oldStok->stokPersediaan + $dtl[$i]->selisihOpnum,
                //     ]);
                // };
                // DB::table('tblopnum_detail')->where('r_opnum', $kd)->delete();
                DB::commit();
            });
            if(is_null($exception)) {
                return response()->json([
                    'success' => true,
                    'message' => 'Penjualan Berhasil di Hapus',
                    // 'data' => $detail
                ], 200);
            } else {
                DB::rollback();
                return response()->json([
                    'success' => false,
                    'message' => 'Penjualan Gagal Dihapus',
                ], 500);
            }
        } catch (\Exception $e) {
            DB::rollback();
            // something went wrong
            return response()->json([
             'success' => false,
             'message' => 'exception'.$e,
         ], 400);
        }
    }

    public function bukubesar(Request $request){
        $startDate = date("Y-m-d", strtotime($request->input('startDate')));
        $endDate = date("Y-m-d", strtotime($request->input('endDate')));
        // $list = DB::table('general_ledger')
        //         ->join('gl_detail', 'gl_detail.rgl', 'general_ledger.notrans')
        //         ->whereBetween('general_ledger.tgl', [$startDate, $endDate])
        //         ->orderBy("general_ledger.id", "desc")
        //         ->get();
        $list = DB::table('general_ledger')
                ->join('gl_detail', 'general_ledger.notrans', 'gl_detail.rgl')
                ->join('coa', 'gl_detail.acc_id', 'coa.acc_id')
                ->whereBetween('general_ledger.tgl', [$startDate, $endDate])
                // ->where('general_ledger.jurnal', 'GJ')
                ->select('general_ledger.*', 'gl_detail.*', 'coa.name')
                ->orderBy("general_ledger.notrans", "desc")
                ->get();
        
        return response()->json([
            'success' => true,
            'message' => 'buku besar',
            'data' => $list
        ], 200);

    }
}
