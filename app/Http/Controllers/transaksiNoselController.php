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
                $count = DB::table('tbltransaksi_nosel')->where('kd_trans', 'like', $kdtr . '%')->count();
                $n = 1 + $count;
                $last_m = null ;
                $detop = $request[0];
                $kdtrans = $kdtr.$n;
                $regu = $request[0][0]['r_regu'];

                $date = date('h:i:s');
                $tgl = $detop[0]['tgl_transaksi'];
                $tgl_header = $tgl.' '.$date ;
                // echo $tgl ;
                
                $pph22 = 10 ; //$detop[0]['pph22'];
                $total_j = 0;
                // $total_qty = 0;
                // $total_beli = 0;
                TransaksiNosel::where('kd_trans', $kdtrans)->delete();
                for ($i = 0; $i < count($detop); $i++) {

                        $kdBarang = $detop[$i]['kodeBrg'];
                        $id_nosel = $detop[$i]['r_nosel'];
                        $hrg = $detop[$i]['last_price'];
                        $costLiter = $detop[$i]['cost_ltr'];
                        $tera = $detop[$i]['tera'];
                        // $hrg = $detop[$i]['hrgJual'];
                        $oldStokPer = DB::table('tblpersediaan')->select('stokPersediaan')->where('kdPersediaan', $kdBarang)->first();
                        // $oldStokBbm = DB::table('tblbbm')->select('stokBbm')->where('code_bbm', $kdBarang)->first();
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
                                // 'stokBbm' => $oldStokBbm->stokBbm - $costLiter,
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
                            'tera'   => $tera,
                            'total'    => $detop[$i]['total'],
                            'total_hpp'    => $detop[$i]['totalhpp'],
                            'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                            'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                        ];

                        $total_j += $detop[$i]['total'];

                        //==========insert tera
                        if($tera != 0 ){
                            $notrans = $kdtrans;
                            $r_nosel = $detop[$i]['r_nosel'];
                            $r_bbm = $detop[$i]['kd_bbm'];
                            $nama_bbm = 'BBM';
                            $jumlah_tera = $tera ;
                            insert_tera($notrans,$r_nosel,$r_bbm,$nama_bbm,$tgl,$jumlah_tera);
                        }
                        //===========end insert tera


                    
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
                            'tgl_trans'     => $tgl, // date("Y-m-d", strtotime($det_kupon[$i]['tglKupon'])),
                            'r_kdPelanggan'     => $kdpel,
                            'total'   => $nilai,
                            'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                            'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                        ];
                        $total_k += $nilai ;
                        $t = $total_k += $nilai ;
                        //===========jurnal
                        $acc_id_d = '21200'; // $request[0]['subtotal']; // acc id yg di kredit
                        $acc_id_k = '11110';
                        $acc_laba = '32300';
                        $memo = 'Aplusan-kupon';
                        $jurnal = 'JK';
                        insert_gl($kdtrans,$tgl,$nilai,$memo,$jurnal);
                        $rgl = DB::table('general_ledger')->get()->last()->notrans;
                        $ac = [
                            [
                                'rgl' => $rgl,
                                'acc_id' => $acc_id_d,
                                'debet' => $nilai,
                                'kredit' => 0,
                                'trans_detail' => 'Aplusan-kupon',
                                'void_flag' => 0,
                            ],
                            [
                                'rgl' => $rgl,
                                'acc_id' => $acc_id_k,
                                'debet' => 0,
                                'kredit' => $nilai,
                                'trans_detail' => 'Aplusan-kupon',
                                'void_flag' => 0,
                            ],
                            
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
                            'tglBiaya'     => $tgl, //date("Y-m-d", strtotime($det_biaya[$i]['tglBiaya'])),
                            'keterangan_biaya'     => $det_biaya[$i]['ketBiaya'],
                            'jumlah'   => $nilai,
                            'accid' => $det_biaya[$i]['acc'],
                            'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                            'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                        ];

                        $tot_b += $nilai;
                        $t = $tot_b += $nilai;
                        //===========jurnal biaya
                        // $accid = $detpro[$i]['accid']; // acc id yg di debet
                        $acc_id_d = $det_biaya[$i]['acc']; // $request[0]['subtotal']; // acc id yg di kredit
                        $acc_id_k = '11110'; // $det_biaya[$i]['acc'];
                        $acc_laba = '32300';
                        $memo = 'Aplusan-biaya';
                        $jurnal = 'JK';
                        insert_gl($kdtrans,$tgl,$nilai,$memo,$jurnal);
                        $rgl = DB::table('general_ledger')->get()->last()->notrans;
                        $ac = [
                            [
                                'rgl' => $rgl,
                                'acc_id' => $acc_id_d,
                                'debet' => 0,
                                'kredit' => $nilai,
                                'trans_detail' => 'Aplusan-Biaya',
                                'void_flag' => 0,
                            ],
                            [
                                'rgl' => $rgl,
                                'acc_id' => $acc_id_k,
                                'debet' => 0,
                                'kredit' => $nilai,
                                'trans_detail' => 'Aplusan-Biaya',
                                'void_flag' => 0,
                            ],
                            [
                                'rgl' => $rgl,
                                'acc_id' => $acc_laba,
                                'debet' => $nilai,
                                'kredit' => 0,
                                'trans_detail' => 'Aplusan-Biaya',
                                'void_flag' => 0,
                            ]
                            
                        ];
                        
                        insert_gl_detail($ac);
                        //===========end jurnal
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
                        //===========jurnal link aja
                        // $accid = $detpro[$i]['accid']; // acc id yg di debet
                        // $acc_id_d = $det_biaya[$i]['acc']; // $request[0]['subtotal']; // acc id yg di kredit
                        // $acc_id_k = '11110'; // $det_biaya[$i]['acc'];
                        // $memo = 'Aplusan-biaya';
                        // $jurnal = 'JK';
                        // insert_gl($kdtrans,$tgl,$t,$memo,$jurnal);
                        // $rgl = DB::table('general_ledger')->get()->last()->notrans;
                        // $ac = [
                        //     [
                        //         'rgl' => $rgl,
                        //         'acc_id' => $acc_id_d,
                        //         'debet' => $nilai,
                        //         'kredit' => 0,
                        //         'trans_detail' => 'Aplusan-biaya',
                        //         'void_flag' => 0,
                        //     ],
                        //     [
                        //         'rgl' => $rgl,
                        //         'acc_id' => $acc_id_k,
                        //         'debet' => 0,
                        //         'kredit' => $nilai,
                        //         'trans_detail' => 'Aplusan-biaya',
                        //         'void_flag' => 0,
                        //     ],
                            
                        // ];
                        
                        // insert_gl_detail($ac);
                        //===========end jurnal
                    }
                    Linkaja::insert($detli);
                }

                

                $detpro = $request[4];
                $to_bati = 0;
                for ($i = 0; $i < count($detpro); $i++) {
                    $total_harga = $detpro[$i]['total_harga'];
                    $total_liter = $detpro[$i]['total_liter'];
                    // $total_hpp = $detpro[$i]['total_hpp'];
                    $kdb = $detpro[$i]['kdBbm'];

                    //========cek harga per liter sesuai stok
                    $id_fifo = DB::table('tblstok_fifo')->select('*')->where('kd_barang','=',$kdb)->where('stok', '!=', '0')->min('id');
                    $stok_fifo = DB::table('tblstok_fifo')->select('*')->where('id', $id_fifo)->first();
                    $harga_fifo = DB::table('tblstok_fifo')->select('harga')->where('id', $id_fifo)->first();
                    // print_r( $stok_fifo );
                    $total_hpp = 0;
                    // $sisa = 5; // $total_liter;
                    // do {
                        // $idn_fifo = DB::table('tblstok_fifo')->select('*')->where('kd_barang','=',$kdb)->where('stok', '!=', '0')->min('id');
                        // $stokn_fifo = DB::table('tblstok_fifo')->select('stok')->where('id', $id_fifo)->first();
                        // $hargan_fifo = DB::table('tblstok_fifo')->select('harga')->where('id', $id_fifo)->first();
                        // DB::table('tblstok_fifo')->where('id', '=', $id_fifo )->update([
                        //     'stok' => $stok_fifo->stok - $total_liter,
                        // ]);
                        // $total_hpp = $sisa * $harga_fifo->harga ;

                        // echo "<p>ini adalah perulangan ke-$ulangi</p>";
                        // $sisa-1;
                        // if($sisa < $stokn_fifo){
                        //     DB::table('tblstok_fifo')->where('id', '=', $id_fifo )->update([
                        //         'stok' => $stokn_fifo->stok - $sisa,
                        //     ]);
                        //     $total_hpp = $sisa * $hargan_fifo->harga ;
                        //     $sisa - $stokn_fifo->stok ;
                        // }else{
                        //     $max_stok = $sisa;
                        //     DB::table('tblstok_fifo')->where('id', '=', $id_fifo )->update([
                        //         'stok' => $stokn_fifo - $max_stok,
                        //     ]);
                            // echo $sisa ;

                        //     $sisa - $max_stok;
                        //     $t_hpp = $sisa * $hargan_fifo ;
                        //     $total_hpp += $t_hpp ;
                        // };
                    // } while ($sisa > 0);
                    // foreach($stok_fifo as $key => $sf){
                        // echo $stok_fifo->stok;
                    // for($i=0;$i < 3;$i++){
                        $array = json_decode(json_encode($stok_fifo), true);
                        if($total_liter < $array['stok']){
                            
                            DB::table('tblstok_fifo')->where('id', '=', $id_fifo )->update([
                                'stok' => $array['stok'] - $total_liter,
                            ]);
                            $total_hpp = $total_liter * $array['harga'] ;
                            echo "yang kurang dari stok harga";
                        }else{
                            $max_stok = $array['stok'];
                            $id_fifo = DB::table('tblstok_fifo')->select('*')->where('kd_barang','=',$kdb)->where('stok', '!=', '0')->min('id');
                            $stok_fifo = DB::table('tblstok_fifo')->select('*')->where('id', $id_fifo)->first();
                            $harga_fifo = DB::table('tblstok_fifo')->select('harga')->where('id', $id_fifo)->first();
                            $array = json_decode(json_encode($stok_fifo), true);
                            
                            DB::table('tblstok_fifo')->where('id', '=', $id_fifo )->update([
                                'stok' => $array['stok'] - $max_stok,
                            ]);
                            echo $max_stok ;

                            $sisa = $total_liter - $max_stok;
                            $t_hpp = $total_liter * $array['harga'] ;
                            $total_hpp += $t_hpp ;
                        };
                    // };
                    // };
                    // if()
                    //==============

                    
                    
                    
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
                    $acc_id_d = '11110'; // Kas
                    $acc = '32300'; // laba ditahan
                    $acc_pph = '23100'; // acc hutang pph
                    $memo = 'Aplusan';
                    $jurnal = 'JK';
                    //===jumlah pph22
                    $bati = $total_harga - $total_hpp ;
                    $pph22_dibayar = $bati * $pph22 / 100 ;
                    //====endjumalh pph
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
                        ],
                        [
                            'rgl' => $rgl,
                            'acc_id' => $acc,
                            'debet' => 0,
                            'kredit' => $total_harga - $total_hpp,
                            'trans_detail' => 'Aplusan-Laba',
                            'void_flag' => 0,
                        ],
                        // pph22
                        [
                            'rgl' => $rgl,
                            'acc_id' => $acc_id_k,
                            'debet' => 0,
                            'kredit' => $pph22_dibayar,
                            'trans_detail' => 'Aplusan-pph22',
                            'void_flag' => 0,
                        ],
                        [
                            'rgl' => $rgl,
                            'acc_id' => $acc_pph,
                            'debet' => $pph22_dibayar,
                            'kredit' => 0,
                            'trans_detail' => 'Aplusan-pph22',
                            'void_flag' => 0,
                        ]
                        //===end pph22
                    ];
                    
                    insert_gl_detail($ac);
                    //===========end jurnal

                    //=========hitung bati
                    $to_bati =+ $bati ;
                    //====end hitung bati
                    
                };
                DB::table('tblprofit')->insert($detpr);

                
                // $cost = $total_k + $tot_b + $total_l;
                $arrkupon = $request[1];
                $arrbiaya = $request[2];
                $arrlink = $request[3];

                if(!empty($arrkupon)){ $kpn = array_sum(array_column($arrkupon, 'nilai')); }else{ $kpn = 0; };
                if(!empty($arrbiaya)){ $by = array_sum(array_column($arrbiaya, 'nilai')); }else{ $by = 0; };
                if(!empty($arrlink)){ $lk = array_sum(array_column($arrlink, 'jumlahLink')); }else{ $lk = 0; };
                
                $cost = $kpn + $by + $lk;

                //======jurnal pph22 setelah bati bersih
                $acc_kas = '11110'; // Kas
                $acc_pph = '23100'; // acc hutang pph
                $acc_laba = '32300'; // laba ditahan
                $memo = 'Aplusan';
                $jurnal = 'JK';
                // $bati_bersih = $to_bati - $by;
                $pph22_b = $by * $pph22 / 100 ;
                insert_gl($kdtrans,$tgl,$pph22_b,$memo,$jurnal);
                $rgl = DB::table('general_ledger')->get()->last()->notrans;
                $ac = [
                    [
                        'rgl' => $rgl,
                        'acc_id' => $acc_pph,
                        'debet' => 0,
                        'kredit' => $pph22_b,
                        'trans_detail' => 'Aplusan-pph22Net',
                        'void_flag' => 0,
                    ],
                    [
                        'rgl' => $rgl,
                        'acc_id' => $acc_kas,
                        'debet' => $pph22_b,
                        'kredit' => 0,
                        'trans_detail' => 'Aplusan-LabaNet',
                        'void_flag' => 0,
                    ],
                    //===end pph22
                ];
                
                insert_gl_detail($ac);
                // //=====end jurnal pph22


                DB::table('tblheader_aplusan')->upsert([
                    'kd_trans'  => $kdtrans,
                    'r_regu'    => $regu,
                    'tgl_trans' => $tgl_header,
                    'total_jual'    => $total_j,
                    'total_kupon'   => $kpn,
                    'total_biaya'   => $by,
                    'total_link'    => $lk,
                    'total_cash'    => $total_j - $cost,
                    'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                    'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                ],
                [
                    'r_regu'    => $regu,
                    'tgl_trans' => $tgl_header,
                    'total_jual'    => $total_j,
                    'total_kupon'   => $kpn,
                    'total_biaya'   => $by,
                    'total_link'    => $lk,
                    'total_cash'    => $total_j - $cost,
                    'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                    'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
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

    public function getcostbbm(Request $request){
        $startDate = date("Y-m-d", strtotime($request->input('startDate')));
        $endDate = date("Y-m-d", strtotime($request->input('endDate')));

        $detail = DB::select("SELECT SUM(a.cost_ltr) total_liter,SUM(a.total) total_jual, a.r_bbm, b.nama_bbm FROM tbltransaksi_nosel a JOIN tblbbm b ON a.r_bbm = b.id WHERE a.tgl_transaksi BETWEEN '$startDate' AND '$endDate' GROUP BY a.r_bbm,b.nama_bbm;");
        return response([
            'success' => true,
            'message' => 'data cost bbm',
            'data' => $detail
        ], 200);
    }

    public function deleteAplusan(Request $request){
        $id = $request->input('id');
       
        $old = DB::table('tbltransaksi_nosel')
                ->join('tblbbm', 'tblbbm.id', 'tbltransaksi_nosel.r_bbm')
                ->where('tbltransaksi_nosel.kd_trans', $id)
                ->get();
        // echo $old ;
        for($i = 0; $i < count($old); $i++){
            $code_bbm = $old[$i]->code_bbm;
            $r_nosel = $old[$i]->r_nosel;
            $cost = $old[$i]->cost_ltr;

            $meter_akhir = $old[$i]->awal_meter;

            $oldstok = DB::table('tblpersediaan')->where('kdPersediaan', $code_bbm)->first();
            DB::table('tblpersediaan')->where('kdPersediaan', $code_bbm)
            ->update([
                'stokPersediaan' => $oldstok->stokPersediaan + $cost,

            ]);

            $old_nosel = DB::table('tblnosel_detail')->where('id_nosel', $r_nosel)->first();
            DB::table('tblnosel_detail')->where('id_nosel', $r_nosel)
            ->update([
                'meter_awal' => $meter_akhir,

            ]);
        };
        //========jurnal
         $del = DB::table('general_ledger')->where('order_no', $id)->get();
        for($i = 0; $i < count($del); $i++){
            $rgl = $del[$i]->notrans;
            // echo $rgl ;
            DB::table('gl_detail')->where('rgl', $rgl)->delete();
        };
        //========endjurnal
        DB::table('tblheader_aplusan')->where('kd_trans', $id)->delete();
        DB::table('general_ledger')->where('order_no', $id)->delete();
        DB::table('tblheader_aplusan')->where('kd_trans', $id)->delete();
        DB::table('tbltera_detail')->where('r_notrans', $id)->delete();
        DB::table('tblbiaya')->where('kd_trans', $id)->delete();

        $old_kupon = DB::table('tblkupon')->where('kd_trans', $id)->get();
        for($i = 0;$i < count($old_kupon); $i++){
            $total = $old_kupon[$i]->total;
            $pelanggan = $old_kupon[$i]->r_kdPelanggan;
            $olddepo = DB::table('tblpelanggan')->where('kdPelanggan', $pelanggan)->first();
            $nilai_old = $olddepo->deposit;
            DB::table('tblpelanggan')->where('kdPelanggan', $pelanggan)
            ->update([
                'deposit' => $nilai_old + $nilai_old,

            ]);

        }
        DB::table('tblkupon')->where('kd_trans', $id)->delete();
        DB::table('tbltransaksi_nosel')->where('kd_trans', $id)->delete();

        DB::table('tblprofit')->where('kd_trans', $id)->delete();

        return response([
            'success' => true,
            'message' => 'List data yg akan di hapus',
            'data' => $old
        ], 200);
        // DB::table('tbltransaksi_nosel')->where('kd_trans', $id)->delete();
    }
}
