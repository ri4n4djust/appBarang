<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\PenjualanDetail;
use App\Models\GeneralLedger;
use App\Models\KuponPenjualan;
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
                $pph22 = 10 ; //$detop[0]['pph22'];
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
                    //===========jurnal
                    $accid = $detpem[$i]['accid']; // acc id yg di debet
                    $acc_id_d = $detpem[$i]['accid_persediaan']; // acc id yg di debet
                    $acc_hpp = $detpem[$i]['accid_hpp'];
                    $acc_id_k = '11110'; // $request[0]['subtotal']; // acc id yg di kredit
                    $acc = '32300';
                    $acc_pph = '23100'; // acc hutang pph
                    $memo = 'Penjualan-Barang';
                    $jurnal = 'JK';
                    $subtotal = $detpem[$i]['total'];
                    $subtotal_hpp = $detpem[$i]['totalhpp'];
                    //===jumlah pph
                    $bati = $subtotal - $subtotal_hpp ;
                    $pph22_dibayar = $bati * $pph22 / 100 ;
                    //====endjumalh pph
                    insert_gl($noNota,$tglNota,$subtotal,$memo,$jurnal);
                    $rgl = DB::table('general_ledger')->get()->last()->notrans;
                    $ac = [
                        [
                            'rgl' => $rgl,
                            'acc_id' => $accid,
                            'debet' => $subtotal,
                            'kredit' => 0,
                            'trans_detail' => 'Penjualan-Barang',
                            'void_flag' => 0,
                        ], 
                        [
                            'rgl' => $rgl,
                            'acc_id' => $acc_id_k ,
                            'debet' => $subtotal + ($subtotal - $subtotal_hpp),
                            'kredit' => 0,
                            'trans_detail' => 'Penjualan-Barang',
                            'void_flag' => 0,
                        ],
                        [
                            'rgl' => $rgl,
                            'acc_id' => $acc_id_d,
                            'debet' => 0,
                            'kredit' => $subtotal,
                            'trans_detail' => 'Penjualan-Barang',
                            'void_flag' => 0,
                        ],
                        [
                            'rgl' => $rgl,
                            'acc_id' => $acc_hpp,
                            'debet' => $subtotal_hpp,
                            'kredit' => 0,
                            'trans_detail' => 'Penjualan-Barang',
                            'void_flag' => 0,
                        ],
                        [
                            'rgl' => $rgl,
                            'acc_id' => $acc,
                            'debet' => 0,
                            'kredit' => $subtotal - $subtotal_hpp,
                            'trans_detail' => 'Penjualan-Barang',
                            'void_flag' => 0,
                        ],
                        // pph22
                        [
                            'rgl' => $rgl,
                            'acc_id' => $acc_id_k,
                            'debet' => 0,
                            'kredit' => $pph22_dibayar,
                            'trans_detail' => 'Penjualan-pph22',
                            'void_flag' => 0,
                        ],
                        [
                            'rgl' => $rgl,
                            'acc_id' => $acc_pph,
                            'debet' => $pph22_dibayar,
                            'kredit' => 0,
                            'trans_detail' => 'Penjualan-pph22',
                            'void_flag' => 0,
                        ]
                        //===end pph22
                    ];
                    
                    insert_gl_detail($ac);
                    //===========end jurnal
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

    public function simpanPenjualanKupon(Request $request){

        try{
            $exception = DB::transaction(function() use ($request){ 
                $editid = $request->input('editid');
                // array key 0 = Header
                // array kkey 1 = Detail
                $tglNota = $request[0]['tglNota'];
                $noNota = $request[0]['noNota'];
                $total =  $request[0]['subtotal'];
                

                KuponPenjualan::where('noPenjualanKupon', $noNota)->delete();
                $detpem = $request[1];
                for ($i = 0; $i < count($detpem); $i++) {
                    $detail[] = [
                        'noPenjualanKupon' => $noNota,
                        'tglPenjualanKupon' => $tglNota,
                        'r_pelanggan' => $detpem[$i]['kdPelanggan'],
                        'totalPenjualanKupon' => $detpem[$i]['total'],
                        'created_at' => $tglNota,
                        'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                    ];

                    //===========jurnal
                    // $acc_id_k = $detpro[$i]['accid_persediaan']; // acc id yg di debet
                    // $acc_id_dd = $detpro[$i]['accid_hpp']; // acc id yg di debet
                    $accid = '21200'; // $detpro[$i]['accid']; // acc id yg di debet
                    $acc_id_d = '11110'; // $request[0]['subtotal']; // acc id yg di kredit
                    $memo = 'Penjualan-Kupon';
                    $jurnal = 'JK';
                    $t = $detpem[$i]['total'] ;
                    insert_gl($noNota,$tglNota,$t,$memo,$jurnal);
                    $rgl = DB::table('general_ledger')->get()->last()->notrans;
                    $ac = [
                        [
                            'rgl' => $rgl,
                            'acc_id' => $acc_id_d,
                            'debet' => $t,
                            'kredit' => 0,
                            'trans_detail' => 'Penjualan-Kupon',
                            'void_flag' => 0,
                        ],
                        [
                            'rgl' => $rgl,
                            'acc_id' => $accid,
                            'debet' => 0,
                            'kredit' => $t,
                            'trans_detail' => 'Penjualan-Kupon',
                            'void_flag' => 0,
                        ],
                        
                    ];
                    
                    insert_gl_detail($ac);
                    //===========end jurnal
                }
                KuponPenjualan::insert($detail);

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
