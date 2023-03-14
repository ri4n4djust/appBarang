<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Barang;
use App\Models\Bbm;
use App\Models\NoselDetail;
use App\Models\TransaksiNosel;
use App\Models\Kupon;
use App\Models\Biaya;
use App\Models\Linkaja;
use Illuminate\Support\Facades\DB;

class transaksiNoselController extends Controller
{
    //
    // public function simpantrx(Request $request){
    //     try{
    //         $exception = DB::transaction(function() use ($request){ 
    //             $id_nosel = $request->input('r_nosel');
    //             $kdBbm = $request->input('kd_bbm');
    //             $kdBrg = $request->input('kodeBrg');
    //             $kdtr = $request->input('kd_trans');
    //             $count = DB::table('tbltransaksi_nosel')
    //                     ->where('kd_trans', 'like', $kdtr . '%')
    //                     ->count();
    //             $n = 1 + $count;
    //             $post = TransaksiNosel::create([
    //                 'r_bbm'     =>  $kdBbm,
    //                 'r_nosel'     => $request->input('r_nosel'),
    //                 'kd_trans'     => $kdtr.$n,
    //                 'r_regu'     => $request->input('r_regu'),
    //                 'tgl_transaksi'   => $request->input('tgl_transaksi'),
    //                 'cost_ltr'    => $request->input('cost_ltr'),
    //                 'last_price'     => $request->input('last_price'),
    //                 'awal_meter'   => $request->input('awal_meter'),
    //                 'last_meter'   => $request->input('last_meter'),
    //                 'total'    => $request->input('total'),
    //             ]);
    //             $costLiter = $request->input('cost_ltr');
                
    //             $hrg = $request->input('last_price');
    //             // $mtr_awal = DB::select("select meter_akhir from tblnosel_detail where id_nosel='$id_nosel' ");
    //             $mtr_awal = DB::table('tblnosel_detail')->select('meter_akhir')->where('id_nosel', $id_nosel)->first();
    //             $update = NoselDetail::where('id_nosel', $id_nosel)->update([
    //                 'meter_awal'   => $mtr_awal->meter_akhir,
    //                 'meter_akhir'   => $request->input('last_meter'),
    //                 'harga'   => $request->input('last_price'),
    //             ]);
    //             $oldStok = DB::table('tblpersediaan')->select('stokPersediaan')->where('kdPersediaan', $kdBrg)->first();
    //             DB::table('tblpersediaan')->where('kdPersediaan', $kdBrg)->update([
    //                 'stokPersediaan' => $oldStok->stokPersediaan - $costLiter,
    //                 'salePrice' => $hrg,
    //             ]);
    //             DB::commit();
    //         });
    //         if(is_null($exception)) {
    //             $r_bbm = $request->input('kd_bbm');
    //             $r_nosel = $request->input('r_nosel');
    //             $detail = DB::select("Select * from tbltransaksi_nosel where r_bbm=' $r_bbm' and r_nosel='$r_nosel' ");
    //             return response()->json([
    //                 'success' => true,
    //                 'message' => 'Post Berhasil di insert!',
    //                 'data' => $detail
    //             ], 200);
    //         } else {
    //             DB::rollback();
    //             return response()->json([
    //                 'success' => false,
    //                 'message' => 'Post Gagal Diupdate!',
    //             ], 500);
    //         }
    //     } catch (\Exception $e) {
    //         //DB::rollback();
    //         // something went wrong
    //         return response()->json([
    //          'success' => false,
    //          'message' => 'exception'.$e,
    //      ], 400);
    //     }
    // }

    public function saveNoselArray(Request $request){
        try{
            $exception = DB::transaction(function() use ($request){ 
                
                $kdtr = $request[0][0]['kd_trans'];
                $count = DB::table('tbltransaksi_nosel')
                        ->where('kd_trans', 'like', $kdtr . '%')
                        ->count();
                $n = 1 + $count;
                $last_m = null ;
                $detop = $request[0];
                $kdtrans = $kdtr.$n;
                $regu = $request[0][0]['r_regu'];
                $tgl = $detop[0]['tgl_transaksi'];
                $total_j = 0;
                // $total_qty = 0;
                // $total_beli = 0;
                TransaksiNosel::where('kd_trans', $kdtrans)->delete();
                for ($i = 0; $i < count($detop); $i++) {

                        $kdBarang = $detop[$i]['kodeBrg'];
                        $id_nosel = $detop[$i]['r_nosel'];
                        $hrg = $detop[$i]['last_price'];
                        $costLiter = $detop[$i]['cost_ltr'];
                        // $total = $detop[$i]['total'];
                        // $hrg = $detop[$i]['hrgJual'];
                        $oldStokPer = DB::table('tblpersediaan')->select('stokPersediaan')->where('kdPersediaan', $kdBarang)->first();
                        $oldStokBbm = DB::table('tblbbm')->select('stokBbm')->where('code_bbm', $kdBarang)->first();
                        $mtr_awal = DB::table('tblnosel_detail')->select('meter_akhir')->where('id_nosel', $id_nosel)->first();


                        if(array_key_exists("last_meter",$detop[$i])){
                            $last_m = $detop[$i]['last_meter'] ;

                            
                            $update = NoselDetail::where('id_nosel', $id_nosel)->update([
                                'meter_awal'   => $mtr_awal->meter_akhir,
                                'meter_akhir'   => $detop[$i]['last_meter'],
                                'harga'   => $hrg,
                            ]);
                            
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
                            'kd_trans'     => $kdtrans,
                            'r_regu'     => $detop[$i]['r_regu'],
                            'tgl_transaksi'   => $detop[$i]['tgl_transaksi'],
                            'cost_ltr'    => $detop[$i]['cost_ltr'],
                            'last_price'     => $detop[$i]['last_price'],
                            'awal_meter'   => $detop[$i]['awal_meter'],
                            'last_meter'   => $last_m,
                            'total'    => $detop[$i]['total'],
                            'total_hpp'    => $detop[$i]['totalhpp'],
                            'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                            'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                        ];

                        $total_j += $detop[$i]['total'];
                    
                };
                TransaksiNosel::insert($detail);

                $total_k = 0;
                Kupon::where('kd_trans', $kdtrans)->delete();
                $det_kupon = $request[1];
                if(!empty($det_kupon)){
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
                        $total_k += $nilai ;
                        $t = $total_k += $nilai ;
                        //===========jurnal
                        $acc_id_k = '11601'; // $detpro[$i]['accid_persediaan']; // acc id yg di debet
                        // $acc_id_dd = $detpro[$i]['accid_hpp']; // acc id yg di debet
                        // $accid = $detpro[$i]['accid']; // acc id yg di debet
                        $acc_id_d = '21200'; // $request[0]['subtotal']; // acc id yg di kredit
                        $memo = 'Aplusan';
                        $jurnal = 'JK';
                        insert_gl($kdtrans,$tgl,$t,$memo,$jurnal);
                        $rgl = DB::table('general_ledger')->get()->last()->notrans;
                        $ac = [
                            [
                                'rgl' => $rgl,
                                'acc_id' => $acc_id_d,
                                'debet' => -1*$t,
                                'kredit' => 0,
                                'trans_detail' => 'Aplusan-kupon',
                                'void_flag' => 0,
                            ],
                            [
                                'rgl' => $rgl,
                                'acc_id' => $acc_id_k,
                                'debet' => 0,
                                'kredit' => -1*$t,
                                'trans_detail' => 'Aplusan-kupon',
                                'void_flag' => 0,
                            ]
                        ];
                        
                        insert_gl_detail($ac);
                        //===========end jurnal
                    }
                    Kupon::insert($detkup);
                }


                $tot_b = 0;
                Biaya::where('kd_trans', $kdtrans)->delete();
                $det_biaya = $request[2];
                if(!empty($det_biaya)){
                    for ($i = 0; $i < count($det_biaya); $i++) {

                        $nilai = $det_biaya[$i]['nilai'];

                        $detbi[] = [
                            'kd_trans'     =>  $kdtrans,
                            'r_regu'     => $det_biaya[$i]['r_regu'],
                            'tglBiaya'     => date("Y-m-d", strtotime($det_biaya[$i]['tglBiaya'])),
                            'keterangan_biaya'     => $det_biaya[$i]['ketBiaya'],
                            'jumlah'   => $nilai,
                            'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                            'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                        ];

                        $tot_b += $nilai;
                    }
                    Biaya::insert($detbi);
                }

                $total_l = 0;
                Linkaja::where('kd_trans', $kdtrans)->delete();
                $det_link = $request[3];
                if(!empty($det_link)){
                    for ($i = 0; $i < count($det_link); $i++) {

                        $nilai = $det_link[$i]['jumlahLink'];

                        $detli[] = [
                            'kd_trans'     =>  $kdtrans,
                            'r_regu'     => $det_link[$i]['r_regu'],
                            'tgl_link'     => date("Y-m-d", strtotime($det_link[$i]['tgl_link'])),
                            'r_bbm'     => 'tes',
                            'nm_bbm'     => $det_link[$i]['nm_bbm'],
                            'jumlah_link'   => $nilai,
                            'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                            'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                        ];
                        $total_l += $nilai;
                    }
                    Linkaja::insert($detli);
                }

                $cost = $total_k + $tot_b + $total_l;
                DB::table('tblheader_aplusan')->upsert([
                    'kd_trans'  => $kdtrans,
                    'r_regu'    => $regu,
                    'tgl_trans' => $tgl,
                    'total_jual'    => $total_j,
                    'total_kupon'   => $total_k,
                    'total_biaya'   => $tot_b,
                    'total_link'    => $total_l,
                    'total_cash'    => $total_j - $cost,
                    'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                    'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                ],
                [
                    'r_regu'    => $regu,
                    'tgl_trans' => $tgl,
                    'total_jual'    => $total_j,
                    'total_kupon'   => $total_k,
                    'total_biaya'   => $tot_b,
                    'total_link'    => $total_l,
                    'total_cash'    => $total_j - $cost,
                    'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                    'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                ]);

                $detpro = $request[4];
                for ($i = 0; $i < count($detpro); $i++) {
                    $total_hpp = $detpro[$i]['total_hpp'];
                    $total_harga = $detpro[$i]['total_harga'];
                    $total_liter = $detpro[$i]['total_liter'];
                    
                    $detpr[] = [
                        'tgl_profit' => $tgl,
                        'kd_trans'  => $kdtrans,
                        'kdBarang'  => $detpro[$i]['kdBbm'],
                        'hpp_beli'  => $total_hpp,
                        'qty_laku'  =>$total_liter,
                        'total_laku'    => $total_harga,
                        'margin_laku'   => $total_harga - $total_hpp,
                        'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                        'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                    ];

                    //===========jurnal
                    $acc_id_k = $detpro[$i]['accid_persediaan']; // acc id yg di debet
                    $acc_id_dd = $detpro[$i]['accid_hpp']; // acc id yg di debet
                    $accid = $detpro[$i]['accid']; // acc id yg di debet
                    $acc_id_d = '11110'; // $request[0]['subtotal']; // acc id yg di kredit
                    $memo = 'Aplusan';
                    $jurnal = 'JK';
                    insert_gl($kdtrans,$tgl,$total_harga,$memo,$jurnal);
                    $rgl = DB::table('general_ledger')->get()->last()->notrans;
                    $ac = [
                        [
                            'rgl' => $rgl,
                            'acc_id' => $acc_id_d,
                            'debet' => $total_harga,
                            'kredit' => 0,
                            'trans_detail' => 'Aplusan',
                            'void_flag' => 0,
                        ],
                        [
                            'rgl' => $rgl,
                            'acc_id' => $acc_id_dd,
                            'debet' => $total_hpp,
                            'kredit' => 0,
                            'trans_detail' => 'Aplusan',
                            'void_flag' => 0,
                        ],
                        [
                            'rgl' => $rgl,
                            'acc_id' => $accid,
                            'debet' => $total_harga,
                            'kredit' => 0,
                            'trans_detail' => 'Aplusan',
                            'void_flag' => 0,
                        ],
                        [
                            'rgl' => $rgl,
                            'acc_id' => $acc_id_k,
                            'debet' => 0,
                            'kredit' => $total_hpp,
                            'trans_detail' => 'Aplusan',
                            'void_flag' => 0,
                        ]
                    ];
                    
                    insert_gl_detail($ac);
                    //===========end jurnal
                    
                };
                DB::table('tblprofit')->insert($detpr);

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

    public function updateMeter(Request $request){
        $id = $request->input('nosel_id');
        $meter_baru = $request->input('meter_baru');
        DB::table('tblnosel_detail')->where('id_nosel', $id)->update([
            'meter_akhir' => $meter_baru
        ]);
        return response([
            'success' => true,
            'message' => 'berhasil',
            // 'data' => $regu
        ], 200);
    }

    public function deleteAplusan(Request $request){
        $id = $request->input('id');
        DB::table('tblheader_aplusan')->where('kd_trans', $id)->delete();
        DB::table('tblprofit')->where('kd_trans', $id)->delete();
        $old = DB::table('tbltransaksi_nosel')->where('kd_trans', $id)->get();

        return response([
            'success' => true,
            'message' => 'List data yg akan di hapus',
            'data' => $old
        ], 200);
        DB::table('tbltransaksi_nosel')->where('kd_trans', $id)->delete();
    }
}
