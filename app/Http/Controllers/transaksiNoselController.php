<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Barang;
use App\Models\Bbm;
use App\Models\NoselDetail;
use App\Models\TransaksiNosel;
use App\Models\Kupon;
use Illuminate\Support\Facades\DB;

class transaksiNoselController extends Controller
{
    //
    public function simpantrx(Request $request){
        try{
            $exception = DB::transaction(function() use ($request){ 
                $id_nosel = $request->input('r_nosel');
                $kdBbm = $request->input('kd_bbm');
                $kdBrg = $request->input('kodeBrg');
                $kdtr = $request->input('kd_trans');
                $count = DB::table('tbltransaksi_nosel')
                        ->where('kd_trans', 'like', $kdtr . '%')
                        ->count();
                $n = 1 + $count;
                $post = TransaksiNosel::create([
                    'r_bbm'     =>  $kdBbm,
                    'r_nosel'     => $request->input('r_nosel'),
                    'kd_trans'     => $kdtr.$n,
                    'r_regu'     => $request->input('r_regu'),
                    'tgl_transaksi'   => $request->input('tgl_transaksi'),
                    'cost_ltr'    => $request->input('cost_ltr'),
                    'last_price'     => $request->input('last_price'),
                    'awal_meter'   => $request->input('awal_meter'),
                    'last_meter'   => $request->input('last_meter'),
                    'total'    => $request->input('total'),
                ]);
                $costLiter = $request->input('cost_ltr');
                
                $hrg = $request->input('last_price');
                // $mtr_awal = DB::select("select meter_akhir from tblnosel_detail where id_nosel='$id_nosel' ");
                $mtr_awal = DB::table('tblnosel_detail')->select('meter_akhir')->where('id_nosel', $id_nosel)->first();
                $update = NoselDetail::where('id_nosel', $id_nosel)->update([
                    'meter_awal'   => $mtr_awal->meter_akhir,
                    'meter_akhir'   => $request->input('last_meter'),
                    'harga'   => $request->input('last_price'),
                ]);
                $oldStok = DB::table('tblpersediaan')->select('stokPersediaan')->where('kdPersediaan', $kdBrg)->first();
                DB::table('tblpersediaan')->where('kdPersediaan', $kdBrg)->update([
                    'stokPersediaan' => $oldStok->stokPersediaan - $costLiter,
                    'salePrice' => $hrg,
                ]);
                DB::commit();
            });
            if(is_null($exception)) {
                $r_bbm = $request->input('kd_bbm');
                $r_nosel = $request->input('r_nosel');
                $detail = DB::select("Select * from tbltransaksi_nosel where r_bbm=' $r_bbm' and r_nosel='$r_nosel' ");
                return response()->json([
                    'success' => true,
                    'message' => 'Post Berhasil di insert!',
                    'data' => $detail
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

    public function saveNoselArray(Request $request){
        try{
            $exception = DB::transaction(function() use ($request){ 

                // TransaksiNosel::where('r_opnum', $kdOpnum)->delete();
                $last_m = null ;
                $detop = $request[0];
                $kdtrans = $request[0][0]['kd_trans'];
                for ($i = 0; $i < count($detop); $i++) {

                        $kdBarang = $detop[$i]['kodeBrg'];
                        $id_nosel = $detop[$i]['r_nosel'];
                        $hrg = $detop[$i]['last_price'];
                        $costLiter = $detop[$i]['cost_ltr'];
                        // $total = $detop[$i]['total'];
                        // $hrg = $detop[$i]['hrgJual'];

                        if(array_key_exists("last_meter",$detop[$i])){
                            $last_m = $detop[$i]['last_meter'] ;

                            $mtr_awal = DB::table('tblnosel_detail')->select('meter_akhir')->where('id_nosel', $id_nosel)->first();
                            $update = NoselDetail::where('id_nosel', $id_nosel)->update([
                                'meter_awal'   => $mtr_awal->meter_akhir,
                                'meter_akhir'   => $detop[$i]['last_meter'],
                                'harga'   => $hrg,
                            ]);
                            $oldStokPer = DB::table('tblpersediaan')->select('stokPersediaan')->where('kdPersediaan', $kdBarang)->first();
                            $oldStokBbm = DB::table('tblbbm')->select('stokBbm')->where('code_bbm', $kdBarang)->first();
                            DB::table('tblpersediaan')->where('kdPersediaan', $kdBarang)->update([
                                'stokPersediaan' => $oldStokPer->stokPersediaan - $costLiter,
                                'salePrice' => $hrg,
                            ]);
                            DB::table('tblbbm')->where('code_bbm', $kdBarang)->update([
                                'stokBbm' => $oldStokBbm->stokBbm - $costLiter,
                                'sale_price' => $hrg,
                            ]);
                        }

                        $detail[] = [
                            'r_bbm'     =>  $detop[$i]['kd_bbm'],
                            'r_nosel'     => $detop[$i]['r_nosel'],
                            'kd_trans'     => $detop[$i]['kd_trans'],
                            'r_regu'     => $detop[$i]['r_regu'],
                            'tgl_transaksi'   => $detop[$i]['tgl_transaksi'],
                            'cost_ltr'    => $detop[$i]['cost_ltr'],
                            'last_price'     => $detop[$i]['last_price'],
                            'awal_meter'   => $detop[$i]['awal_meter'],
                            'last_meter'   => $last_m,
                            'total'    => $detop[$i]['total'],
                            'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                            'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                        ];
                }
                TransaksiNosel::insert($detail);

                // TransaksiNosel::where('r_opnum', $kdOpnum)->delete();
                $det_kupon = $request[1];
                for ($i = 0; $i < count($det_kupon); $i++) {

                    $kdpel = $det_kupon[$i]['kdPelanggan'];
                    $nilai = $det_kupon[$i]['nilai'];
                    $oldDp = DB::table('tblpelanggan')->select('deposit')->where('kdPelanggan', $kdpel)->first();
                    DB::table('tblpelanggan')->where('kdPelanggan', $kdpel)->update([
                        'deposit' => $oldDp->deposit - $nilai,
                    ]);

                    $detkup[] = [
                        'kd_trans'     =>  $kdtrans,
                        'r_regu'     => $det_kupon[$i]['r_regu'],
                        'tgl_trans'     => date("Y-m-d", strtotime($det_kupon[$i]['tglKupon'])),
                        'r_kdPelanggan'     => $kdpel,
                        'total'   => $nilai,
                        'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                        'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                    ];

                }
                Kupon::insert($detkup);

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

    public function indexTransNosel(Request $request){
        $where = '';
        $filter = $request->input('tgl');
        $filter2 = $request->input('r_bbm');
        if(!empty($filter)){
            $where = "where r_bbm='$filter2' and tgl_transaksi='$filter' ";
        };
        
        // $bbm = Bbm::get();
        //$posts = Barang::latest()->get();
        $nosel = DB::select("Select * from tbltransaksi_nosel $where ");

        return response([
            'success' => true,
            'message' => 'List transaksi nosel',
            'data' => $nosel
        ], 200);

    }
    public function indexTransNoselRegu(Request $request){
        // $where = '';
        // $filter = $request->input('tgl');
        // $filter2 = $request->input('r_bbm');
        // if(!empty($filter)){
        //     $where = "where r_bbm='$filter2' and tgl_transaksi='$filter' ";
        // };
        
        // $bbm = Bbm::get();
        //$posts = Barang::latest()->get();
        $regu = DB::select("SELECT reguPegawai FROM tblpegawai group by reguPegawai order by reguPegawai asc;");

        return response([
            'success' => true,
            'message' => 'List transaksi nosel',
            'data' => $regu
        ], 200);

    }
}
