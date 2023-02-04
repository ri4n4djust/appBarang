<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\PenjualanDetail;
use App\Models\GeneralLedger;
class penjualanController extends Controller
{
    //
    public function simpanPenjualan(Request $request){

        try{
            $exception = DB::transaction(function() use ($request){ 
                $editid = $request->input('editid');
                // array key 0 = Header
                // array kkey 1 = Detail
                $tglNota = $request[0]['tglNota'];
                $noNota = $request[0]['noNota'];
                $total =  $request[0]['subtotal'];
                $diskon = $total * $request[0]['disc'] / 100;
                $type = $request[0]['term'];
                $piutang = 0;
                if($type == '1'){
                    $piutang = $total;
                }
                
                $post = DB::table('tblpenjualan')->upsert([
                    'noPenjualan'     => $request[0]['noNota'],
                    'r_pelanggan'     => $request[0]['kdPelanggan'],
                    'subTotalPenjualan'     => $request[0]['subtotal'],
                    'tglPenjualan'   => $tglNota,
                    'discPenjualan'     => $diskon,
                    'discPercentP'     => $request[0]['disc'],
                    'taxPenjualan'     => $request[0]['tax'],
                    'totalPenjualan'     => $request[0]['total'],
                    'notePenjualan'     => $request[0]['notes'],
                    'termPenjualan'     => $request[0]['term'],
                    'jthTempo'     => $request[0]['jthTempo'],
                    'typeBayar'     => $request[0]['term'],
                    'piutangPenjualan'     => $piutang,
                    'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                    'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                ],
                [ 
                    'r_pelanggan'     => $request[0]['kdPelanggan'],
                    'subTotalPenjualan'     => $request[0]['subtotal'],
                    'tglPenjualan'   => $tglNota,
                    'discPenjualan'     => $diskon,
                    'discPercentP'     => $request[0]['disc'],
                    'taxPenjualan'     => $request[0]['tax'],
                    'totalPenjualan'     => $request[0]['total'],
                    'notePenjualan'     => $request[0]['notes'],
                    'termPenjualan'     => $request[0]['term'],
                    'jthTempo'     => $request[0]['jthTempo'],
                    'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                    'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                ]
            );
                PenjualanDetail::where('r_noPenjualan', $noNota)->delete();
                $detpem = $request[1];
                for ($i = 0; $i < count($detpem); $i++) {

                        $kdBarang = $detpem[$i]['kdBarang'];
                        $qty = $detpem[$i]['qty'];
                        $hrg = $detpem[$i]['hrgJual'];
                        $brg = DB::table('tblpersediaan')->where('kdPersediaan', $kdBarang)->first();
                        $oldStok = $brg->stokPersediaan;
                        DB::table('tblpersediaan')->where('kdPersediaan', $kdBarang)->update([
                            'stokPersediaan' => $oldStok - $qty,
                            'salePrice' => $hrg,
                        ]);
                        DB::table('tblbarang')->where('kdBarang', $kdBarang)->update([
                            'stkBarang' => $oldStok - $qty,
                            'hrgJual' => $hrg,
                        ]);

                        $detail[] = [
                            'r_noPenjualan' => $noNota,
                            'r_kdBarang' => $kdBarang,
                            'tgl_trans' => $tglNota,
                            'r_nmBarang' => $detpem[$i]['nmBarang'],
                            'kategori_jual' => $detpem[$i]['kategori'],
                            'hrgJual' => $detpem[$i]['hrgJual'],
                            'satuanJual' => $detpem[$i]['satuan'],
                            'qty' => $qty,
                            'totalHpp' => $detpem[$i]['totalhpp'],
                            'totalJual' => $detpem[$i]['total'],
                            'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                            'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                        ];
                    }
                PenjualanDetail::insert($detail);

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

    public function getDetailPenjualan(Request $request){
        $noPenjualan = $request->input('kd');

        $data = PenjualanDetail::where('r_noPenjualan', $noPenjualan)->get();
        return response()->json([
            'success' => true,
            'message' => 'Detail Penjualan!',
            'data' => $data
        ], 200);
    }
}
