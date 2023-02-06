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

                        $kdBarang = $detpo[$i]['title'];
                        $qty = $detpo[$i]['quantity'];
                        // $brg = DB::table('tblpersediaan')->where('kdPersediaan', $kdBarang)->first();
                        // $oldStok = $brg->stokPersediaan;
                        // DB::table('tblpersediaan')->where('kdPersediaan', $kdBarang)->update([
                        //     'stokPersediaan' => $oldStok + $qty,
                        //     'lastPrice' => $detpem[$i]['hrgPokok'],
                        // ]);
                        // DB::table('tblbarang')->where('kdBarang', $kdBarang)->update([
                        //     'stkBarang' => $oldStok + $qty,
                        //     'hrgPokok' => $detpem[$i]['hrgPokok'],
                        // ]);

                        $detail[] = [
                            'r_noPo' => $noNota,
                            'kdBarang' => $kdBarang,
                            'nmBarang' => $detpo[$i]['title'],
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
        $listpo = DB::table('tblpobbm_detail')
                ->join('tblpobbm', 'tblpobbm_detail.r_noPo', 'tblpobbm.no_po')
                ->join('tblsupplier', 'tblpobbm.r_supplier', 'tblsupplier.kdSupplier')
                ->select('tblpobbm.*', 'tblsupplier.nmSupplier')
                ->where('tblpobbm_detail.qty', '!=', 'tblpobbm_detail.qty_recieve')
                ->whereBetween('tblpobbm.tgl_po', [$startDate, $endDate])
                ->get();
        // $list = DB::select("SELECT b.*,c.nmSupplier,(a.qty - a.qty_recieve) kurang from tblpobbm_detail a, tblpobbm b, tblsupplier c WHERE a.r_noPo = b.no_po and a.qty != a.qty_recieve AND b.r_supplier = c.kdSupplier GROUP BY a.r_noPo;");
        
        return response()->json([
            'success' => true,
            'message' => 'Laporan PO BBM',
            'data' => $listpo
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
