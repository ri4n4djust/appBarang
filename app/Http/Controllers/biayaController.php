<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class biayaController extends Controller
{
    //
    public function simpanBiaya(Request $request){
        try{
            $exception = DB::transaction(function() use ($request){
                $noNota = $request[0]['noNota'];
                $tglNota = $request[0]['tglNota'];     
                

                $det_biaya = $request[1];
                for ($i = 0; $i < count($det_biaya); $i++) {
                    $nama = $det_biaya[$i]['name'];
                    $memo = $det_biaya[$i]['name'];
                    $biaya = $det_biaya[$i]['biaya'];
                    $acc = $det_biaya[$i]['acc'];

                    DB::table('tblbiaya')->upsert([
                            'kd_trans' => $noNota,
                            'tglBiaya' => $tglNota,
                            'keterangan_biaya' => $memo,
                            'jumlah' => $biaya,
                            'r_regu' => 'Z',
                            'created_at' => $tglNota,
                            'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                        ],
                        [
                            'tglBiaya' => $tglNota,
                            'keterangan_biaya' => $memo,
                            'jumlah' => $biaya,
                            'r_regu' => 'Z',
                            'created_at' => $tglNota,
                            'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                        ]
                    );
                    //===========jurnal biaya
                    // $accid = $detpro[$i]['accid']; // acc id yg di debet
                    $acc_id_d = $det_biaya[$i]['acc']; // $request[0]['subtotal']; // acc id yg di kredit
                    $acc_id_k = '11110'; // $det_biaya[$i]['acc'];
                    // $memo = 'Trans-biaya';
                    $jurnal = 'JK';
                    insert_gl($noNota,$tglNota,$biaya,$memo,$jurnal);
                    $rgl = DB::table('general_ledger')->get()->last()->notrans;
                    $ac = [
                        [
                            'rgl' => $rgl,
                            'acc_id' => $acc_id_d,
                            'debet' => $biaya,
                            'kredit' => 0,
                            'trans_detail' => 'Trans-biaya',
                            'void_flag' => 0,
                        ],
                        [
                            'rgl' => $rgl,
                            'acc_id' => $acc_id_k,
                            'debet' => 0,
                            'kredit' => $biaya,
                            'trans_detail' => 'Trans-biaya',
                            'void_flag' => 0,
                        ],
                        
                    ];
                    
                    insert_gl_detail($ac);
                    //===========end jurnal
                }
                DB::commit();
            });
            if(is_null($exception)) {
                return response()->json([
                    'success' => true,
                    'message' => 'Biaya Berhasil di insert!',
                    // 'data' => $detail
                ], 200);
            } else {
                DB::rollback();
                return response()->json([
                    'success' => false,
                    'message' => 'Biaya Gagal Diupdate!',
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
}
