<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class pembelianController extends Controller
{
    //
    public function simpanPembelian(Request $request){

        try{
            $exception = DB::transaction(function() use ($request){ 
                $editid = $request->input('editid');
                // array key 0 = Header
                // array kkey 1 = Detail
                $tglNota = $request[0]['invoice_date'];
                $post = DB::table('tblpembelian')->insert([
                    'noNota'     => $request[0]['invoice_no'],
                    'r_supplier'     => $request[0]['kodeSupplier'],
                    // 'r_regu'     => $request->input('r_regu'),
                    'tglPembelian'   => $tglNota,
                    // 'cost_ltr'    => $request->input('cost_ltr'),
                    // 'last_price'     => $request->input('last_price'),
                    // 'last_meter'   => $request->input('last_meter'),
                    // 'total'    => $request->input('total'),
                ]);




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
