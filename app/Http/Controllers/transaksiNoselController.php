<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Barang;
use App\Models\Bbm;
use App\Models\NoselDetail;
use App\Models\TransaksiNosel;
use Illuminate\Support\Facades\DB;

class transaksiNoselController extends Controller
{
    //
    public function simpantrx(Request $request){
        try{
            $exception = DB::transaction(function() use ($request){ 
                $id_nosel = $request->input('r_nosel');
                $post = TransaksiNosel::create([
                    'r_bbm'     => $request->input('r_bbm'),
                    'r_nosel'     => $request->input('r_nosel'),
                    'tgl_transaksi'   => $request->input('tgl_transaksi'),
                    'cost_ltr'    => $request->input('cost_ltr'),
                    'last_price'     => $request->input('last_price'),
                    'last_meter'   => $request->input('last_meter'),
                    'total'    => $request->input('total'),
                ]);
                // $mtr_awal = DB::select("select meter_akhir from tblnosel_detail where id_nosel='$id_nosel' ");
                $mtr_awal = DB::table('tblnosel_detail')->select('meter_akhir')->where('id_nosel', $id_nosel)->first();
                $update = NoselDetail::where('id_nosel', $id_nosel)->update([
                    'meter_awal'   => $mtr_awal->meter_akhir,
                    'meter_akhir'   => $request->input('last_meter'),
                    'harga'   => $request->input('last_price'),
                ]);
                DB::commit();
            });
            if(is_null($exception)) {
                return response()->json([
                    'success' => true,
                    'message' => 'Post Berhasil Diupdate!',
                    // 'data' => $nosel
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

    public function indexTransNosel(Request $request){
        $where = '';
        $filter = $request->input('idnosel');
        $filter2 = $request->input('r_bbm');
        if(!empty($filter)){
            $where = "where r_nosel='$filter' and r_bbm='$filter2' ";
        };
        
        // $bbm = Bbm::get();
        //$posts = Barang::latest()->get();
        $nosel = DB::select("Select * from tbltransaksi_nosel $where ");
        $count = Barang::count();
        return response([
            'success' => true,
            'message' => 'List transaksi nosel',
            'data' => $nosel
        ], 200);

    }
}
