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
                    'r_supplier'     => $request[0]['kodeSupplier'],
                    'subTotal'     => $request[0]['subtotal'],
                    'tglPembelian'   => $tglNota,
                    'disc'     => $request[0]['kodeSupplier'],
                    'discPercent'     => $request[0]['kodeSupplier'],
                    'tax'     => $request[0]['kodeSupplier'],
                    'total'     => $request[0]['kodeSupplier'],
                    'note'     => $request[0]['kodeSupplier'],
                    'term'     => $request[0]['kodeSupplier'],
                    'jthTempo'     => $tglNota,
                ]);
                $detpem = $request[1];
                for ($i = 0; $i < count($detpem); $i++) {

                    $kdBarang = $detpem[$i]['kdBarang'];
                    $qty = $detpem[$i]['qty'];
                    $brg = DB::table('tblpersediaan')->where('kdPersediaan', $kdBarang)->first();
                    $oldStok = $brg->stokPersediaan;
                    DB::table('tblpersediaan')->where('kdPersediaan', $kdBarang)->update([
                        'stokPersediaan' => $oldStok + $qty,
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
}
