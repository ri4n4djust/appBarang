<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\PembelianDetail;
use App\Models\Persediaan;

class pembelianController extends Controller
{
    //
    public function simpanPembelian(Request $request){

        try{
            $exception = DB::transaction(function() use ($request){ 
                $editid = $request->input('editid');
                // array key 0 = Header
                // array kkey 1 = Detail
                $tglNota = $request[0]['tglNota'];
                $noNota = $request[0]['noNota'];
                $post = DB::table('tblpembelian')->insert([
                    'noNota'     => $request[0]['noNota'],
                    'r_supplier'     => $request[0]['kdSupplier'],
                    'subTotal'     => $request[0]['subtotal'],
                    'tglPembelian'   => $tglNota,
                    'disc'     => $request[0]['disc'],
                    'discPercent'     => $request[0]['disc'],
                    'tax'     => $request[0]['tax'],
                    'total'     => $request[0]['total'],
                    'note'     => $request[0]['notes'],
                    'term'     => $request[0]['term'],
                    'jthTempo'     => $request[0]['jthTempo'],
                    'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                    'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                ]);
                $detpem = $request[1];
                for ($i = 0; $i < count($detpem); $i++) {

                        $kdBarang = $detpem[$i]['kdBarang'];
                        $qty = $detpem[$i]['qty'];
                        $brg = DB::table('tblpersediaan')->where('kdPersediaan', $kdBarang)->first();
                        $oldStok = $brg->stokPersediaan;
                        DB::table('tblpersediaan')->where('kdPersediaan', $kdBarang)->update([
                            'stokPersediaan' => $oldStok + $qty,
                            'lastPrice' => $detpem[$i]['hrgPokok'],
                        ]);
                        DB::table('tblbarang')->where('kdBarang', $kdBarang)->update([
                            'stkBarang' => $oldStok + $qty,
                            'hrgPokok' => $detpem[$i]['hrgPokok'],
                        ]);

                        $detail[] = [
                            'r_noNota' => $noNota,
                            'kdBarang' => $kdBarang,
                            'nmBarang' => $detpem[$i]['nmBarang'],
                            'hrgBeli' => $detpem[$i]['hrgPokok'],
                            'qty' => $qty,
                            'total' => $detpem[$i]['total'],
                            'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                            'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                        ];
                    }
                PembelianDetail::insert($detail);

                DB::commit();
            });
            if(is_null($exception)) {
                return response()->json([
                    'success' => true,
                    'message' => 'Post Berhasil di insert!',
                    // 'data' => $detail
                ], 200);
            } else {
                DB::rollback();
                return response()->json([
                    'success' => false,
                    'message' => 'Post Gagal Diupdate!',
                ], 500);
            }
        } catch (\Exception $e) {
            //DB::rollback();
            // something went wrong
            return response()->json([
             'success' => false,
             'message' => 'exception'.$e,
         ], 400);
        }

    }

    public function simpanBarangDatang(Request $request){

        try{
            $exception = DB::transaction(function() use ($request){ 
                $editid = $request->input('editid');
                // array key 0 = Header
                // array kkey 1 = Detail
                $tgl_terima = $request[0]['tgl_terima'];
                $no_gr = $request[0]['no_br'];
                $no_po = $request[0]['no_po'];
                $no_so = $request[0]['no_so'];
                $post = DB::table('tblterimabbm')->insert([
                    'kd_terima'     => $request[0]['no_br'],
                    'no_po'     => $request[0]['no_po'],
                    'tgl_terima'   => $tgl_terima,
                    'kd_supplier'     => $request[0]['kdSupplier'],
                    'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                    'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                ]);
                $detgr = $request[1];
                for ($i = 0; $i < count($detgr); $i++) {

                        // $no_po = $request[$i]['no_po'];
                        $kdBarang = $detgr[$i]['kdbbm'];
                        $qty = $detgr[$i]['qty_order'];
                        $qty_datang = $detgr[$i]['qty_datang'];
                        $brg = DB::table('tblpersediaan')->where('kdPersediaan', $kdBarang)->first();
                        $oldStok = $brg->stokPersediaan;
                        DB::table('tblpersediaan')->where('kdPersediaan', $kdBarang)->update([
                            'stokPersediaan' => $oldStok + $qty_datang,
                            // 'lastPrice' => $detgr[$i]['hrgPokok'],
                        ]);
                        DB::table('tblbarang')->where('kdBarang', $kdBarang)->update([
                            'stkBarang' => $oldStok + $qty_datang,
                            // 'hrgPokok' => $detgr[$i]['hrgPokok'],
                        ]);

                        $pom = DB::table('tblpobbm_detail')
                        ->where('r_noPo', $no_po)
                        ->where('kdBarang', $kdBarang)
                        ->first();
                        $oldRecieve = $pom->qty_recieve;

                        DB::table('tblpobbm_detail')
                        ->where('r_noPo', $no_po)
                        ->where('kdBarang', $kdBarang)
                        ->update([
                            'qty_recieve' => $oldRecieve + $qty_datang,
                            // 'hrgPokok' => $detgr[$i]['hrgPokok'],
                        ]);

                        $detail[] = [
                            'r_kdterima' => $no_gr,
                            'r_nopo' => $no_po,
                            'tgl_terima' => $tgl_terima,
                            'kd_barang' => $kdBarang,
                            'qty_terima' => $qty_datang,
                            'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                            'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                        ];
                    }
                DB::table('tblterimabbm_detail')->insert($detail);

                DB::commit();
            });
            if(is_null($exception)) {
                return response()->json([
                    'success' => true,
                    'message' => 'Post Berhasil di insert!',
                    // 'data' => $detail
                ], 200);
            } else {
                DB::rollback();
                return response()->json([
                    'success' => false,
                    'message' => 'Post Gagal Diupdate!',
                ], 500);
            }
        } catch (\Exception $e) {
            //DB::rollback();
            // something went wrong
            return response()->json([
             'success' => false,
             'message' => 'exception'.$e,
         ], 400);
        }

    }

    public function simpanPobbm(Request $request){

        try{
            $exception = DB::transaction(function() use ($request){ 
                $editid = $request->input('editid');
                // array key 0 = Header
                // array kkey 1 = Detail
                $tglNota = $request[0]['tgl_so'];
                $noNota = $request[0]['no_po'];
                $post = DB::table('tblpobbm')->insert([
                    'no_po'     => $request[0]['no_po'],
                    'no_so'     => $request[0]['no_so'],
                    'r_supplier'     => $request[0]['kdSupplier'],
                    'subTotal'     => $request[0]['subtotal'],
                    'tgl_po'   => $tglNota,
                    'disc'     => $request[0]['disc'],
                    'discPercent'     => $request[0]['disc'],
                    'tax'     => $request[0]['tax'],
                    'total'     => $request[0]['total'],
                    'note'     => $request[0]['notes'],
                    'term'     => $request[0]['term'],
                    'jthTempo'     => $request[0]['jthTempo'],
                    'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                    'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                ]);
                $detpo = $request[1];
                for ($i = 0; $i < count($detpo); $i++) {

                        $kdBarang = $detpo[$i]['kdBarang'];
                        $qty = $detpo[$i]['quantity'];
                        $brg = DB::table('tblpersediaan')->where('kdPersediaan', $kdBarang)->first();
                        $oldStok = $brg->stokPersediaan;
                        DB::table('tblpersediaan')->where('kdPersediaan', $kdBarang)->update([
                            // 'stokPersediaan' => $oldStok + $qty,
                            'lastPrice' => $detpo[$i]['rate'],
                        ]);
                        DB::table('tblbarang')->where('kdBarang', $kdBarang)->update([
                            // 'stkBarang' => $oldStok + $qty,
                            'hrgPokok' => $detpo[$i]['rate'],
                        ]);

                        DB::table('tblbbm')->where('code_bbm', $kdBarang)->update([
                            // 'stkBarang' => $oldStok + $qty,
                            'last_price' => $detpo[$i]['rate'],
                        ]);

                        $detail[] = [
                            'r_noPo' => $noNota,
                            'kdBarang' => $kdBarang,
                            'nmBarang' => $detpo[$i]['nmBarang'],
                            'hrgBeli' => $detpo[$i]['rate'],
                            'qty' => $qty,
                            'qty_recieve' => 0,
                            'total' => $detpo[$i]['amount'],
                            'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                            'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                        ];
                    }
                DB::table('tblpobbm_detail')->insert($detail);

                DB::commit();
            });
            if(is_null($exception)) {
                return response()->json([
                    'success' => true,
                    'message' => 'Post Berhasil di insert!',
                    // 'data' => $detail
                ], 200);
            } else {
                DB::rollback();
                return response()->json([
                    'success' => false,
                    'message' => 'Post Gagal Diupdate!',
                ], 500);
            }
        } catch (\Exception $e) {
            //DB::rollback();
            // something went wrong
            return response()->json([
             'success' => false,
             'message' => 'exception'.$e,
         ], 400);
        }

    }

    public function listPobbm(Request $request){
        $startDate = date("Y-m-d", strtotime($request->input('startDate')));
        $endDate = date("Y-m-d", strtotime($request->input('endDate')));
        // $listpo = DB::table('tblpobbm')
        //         ->join('tblsupplier', 'tblpobbm.r_supplier', 'tblsupplier.kdSupplier')
        //         ->select('tblpobbm.*', 'tblsupplier.nmSupplier')
        //         ->whereBetween('tblpobbm.tgl_po', [$startDate, $endDate])
        //         ->get();
        $list = DB::select("SELECT src.no_po,src.no_so no_so,rtrim(b.nmSupplier) supplier_name,b.kdSupplier,src.podate,src.qty_grpo,src.qty_recieve 
from (SELECT a.no_po,a.no_so,a.r_supplier,cast(a.tgl_po as date) podate,sum(b.qty) qty_grpo,sum(qty_recieve) qty_recieve 
FROM tblpobbm a left join tblpobbm_detail b on a.no_po = b.r_noPo where cast(a.tgl_po as date) between '2023-01-01' and '$endDate' group by a.r_supplier,a.no_po,a.no_so,a.tgl_po) src
left join tblsupplier b on src.r_supplier = b.kdSupplier  where src.qty_recieve < src.qty_grpo order by no_po asc;");
        
        return response()->json([
            'success' => true,
            'message' => 'Laporan PO BBM',
            'data' => $list
        ], 200);
    }

    public function detailPobbm(Request $request){
        // $startDate = date("Y-m-d", strtotime($request->input('startDate')));
        // $endDate = date("Y-m-d", strtotime($request->input('endDate')));
        $no_po = $request->input('no_po');
        $detailpo = DB::table('tblpobbm_detail')
                ->where('tblpobbm_detail.r_noPo', $no_po)
                ->get();
        // $list = DB::select("SELECT b.*,c.nmSupplier,(a.qty - a.qty_recieve) kurang from tblpobbm_detail a, tblpobbm b, tblsupplier c WHERE a.r_noPo = b.no_po and a.qty != a.qty_recieve AND b.r_supplier = c.kdSupplier ;");
        
        return response()->json([
            'success' => true,
            'message' => 'Detail PO BBM',
            'data' => $detailpo
        ], 200);
    }

    public function linkAccount(){
        $listakun = DB::select('SELECT * FROM link_acc'); 
        return response()->json([
            'success' => true,
            'message' => 'List Link acc',
            'data' => $listakun
        ], 200);
    }
}
