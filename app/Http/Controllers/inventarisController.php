<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class inventarisController extends Controller
{
    //
    public function indexInventaris(){
        $inv = DB::table('tblinventaris')->get();
        $thismonth = date("Y-m");
        // $penyu = DB::table('tblinventaris_penyusutan_detail')->where('tgl_penyusutan', 'like', $thismonth'%')->get();
        $penyu = DB::select("SELECT * FROM `tblinventaris_penyusutan_detail` WHERE tgl_penyusutan LIKE '$thismonth%';");
        // print_r($penyu);

        return response()->json([
            'success' => true,
            'message' => 'data inventaris',
            'data' => [$inv, $penyu]
        ], 200);
    }

    public function daftarPembelianInventaris(Request $request){
        // try{
        //     $exception = DB::transaction(function() use ($request){
                $startDate = date("Y-m-d", strtotime($request->input('startDate')));
                $endDate = date("Y-m-d", strtotime($request->input('endDate')));

                $detail = DB::table('tblinventaris_pengadaan')
                        ->join('tblsupplier', 'tblinventaris_pengadaan.supplier_code', 'tblsupplier.kdSupplier')
                        ->whereBetween('tblinventaris_pengadaan.tgl_spk', [$startDate, $endDate])
                        ->select('tblinventaris_pengadaan.*', 'tblsupplier.nmSupplier')
                        ->get();
                
                        return response()->json([
                            'success' => true,
                            'message' => 'Laporan Pembelian Inventaris',
                            'data' => $detail
                        ], 200);


        //         DB::commit();
        //     });
        //     if(is_null($exception)) {
        //         return response()->json([
        //             'success' => true,
        //             'message' => 'Laporan Pembelian Inventaris',
        //             'data' => $detail
        //         ], 200);
        //     } else {
        //         DB::rollback();
        //         return response()->json([
        //             'success' => false,
        //             'message' => 'Laporan Pembelian Gagal Diupdate!',
        //         ], 500);
        //     }
        // } catch (\Exception $e) {
        //     DB::rollback();
        //     // something went wrong
        //     return response()->json([
        //      'success' => false,
        //      'message' => 'exception'.$e,
        //  ], 400);
        // }
    }

    public function tambahInventaris(Request $request){
        try{
            $exception = DB::transaction(function() use ($request){
                $kode_inventaris = $request->input('kode_inventaris');
                $nama_inventaris = $request->input('nama_inventaris');
                $tahun_pembuatan = $request->input('tahun_pembuatan');
                $tahun_perakitan = $request->input('tahun_perakitan');
                $group_inventaris = $request->input('group_inventaris');
                $accid_akum = $request->input('accid_akum');
                $warna = $request->input('warna');
                $merek = $request->input('merek');
                $umur_ekonomis = $request->input('umur_ekonomis');

                DB::table('tblinventaris')->upsert([
                        'kode_inventaris' => $kode_inventaris,
                        'nama_inventaris' => $nama_inventaris,
                        'tahun_pembuatan' => $tahun_pembuatan,
                        'tahun_perakitan' => $tahun_perakitan,
                        'group_inventaris' => $group_inventaris,
                        'accid_akum' => $accid_akum,
                        'warna' => $warna,
                        'merek' => $merek,
                        'umur_ekonomis' => $umur_ekonomis,
                        'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                        'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                    ],
                    [
                        'nama_inventaris' => $nama_inventaris,
                        'tahun_pembuatan' => $tahun_pembuatan,
                        'tahun_perakitan' => $tahun_perakitan,
                        'group_inventaris' => $group_inventaris,
                        'accid_akum' => $accid_akum,
                        'warna' => $warna,
                        'merek' => $merek,
                        'umur_ekonomis' => $umur_ekonomis,
                        'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                        'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                    ]
                );
                

                DB::commit();
            });
            if(is_null($exception)) {
                return response()->json([
                    'success' => true,
                    'message' => 'Inventaris Berhasil di insert!',
                    // 'data' => $detail
                ], 200);
            } else {
                DB::rollback();
                return response()->json([
                    'success' => false,
                    'message' => 'Inventaris Gagal Diupdate!',
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

    public function beliInventaris(Request $request){
        try{
            $exception = DB::transaction(function() use ($request){
                $editid = $request->input('editid');
                // array key 0 = Header
                // array kkey 1 = Detail
                $tglNota = $request[0]['tglNota'];
                $noNota = $request[0]['noNota'];
                $post = DB::table('tblinventaris_pengadaan')->insert([
                    'pengadaan_sysno'     => $request[0]['noNota'],
                    'pengadaan_docno'     => $request[0]['noNota'],
                    'tgl_spk'   => $tglNota,
                    'total'     => $request[0]['total'],
                    'memo'     => $request[0]['notes'],
                    'supplier_code' => $request[0]['kdSupplier'],
                    'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                    'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                ]);

                $detpem = $request[1];
                for ($i = 0; $i < count($detpem); $i++) {

                    $kdBarang = $detpem[$i]['kdBarang'];
                    $qty = $detpem[$i]['qty'];
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
                    DB::table('tblinventaris')->where('kode_inventaris', $kdBarang)->update([
                        'nilai_inventaris' => $detpem[$i]['total'],
                        'qty_inventaris' => $qty,
                        'kode_pengadaan' => $noNota
                    ]);

                    DB::table('tblinventaris_pengadaan_detail')->upsert([
                        'rsysno_pengadaan' => $noNota,
                        'rkode_inventaris' => $kdBarang,
                        'rkode_pengadaan' => $noNota,
                        'kode_pengadaan_detail' => $noNota.$kdBarang.$i+1,
                        'harga_perolehan' => $detpem[$i]['hrgPokok'],
                        'qty' => $qty,
                        'subtotal' => $detpem[$i]['total'],
                        'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                        'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                    ],
                    [
                        // 'rsysno_pengadaan' => $noNota,
                        'rkode_inventaris' => $kdBarang,
                        'rkode_pengadaan' => $noNota,
                        'kode_pengadaan_detail' => $noNota.$kdBarang.$i+1,
                        'harga_perolehan' => $detpem[$i]['hrgPokok'],
                        'qty' => $qty,
                        'subtotal' => $detpem[$i]['total'],
                        'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                        'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                    ]);

                    //===========jurnal
                    $acc_id_d =  $detpem[$i]['group_inventaris']; // acc id yg di debet
                    $acc_id_k = '11110'; // $request[0]['subtotal']; // acc id yg di kredit
                    $memo = 'Pembelian-Inventaris';
                    $jurnal = 'JK';
                    $subtotal = $detpem[$i]['total'];
                    insert_gl($noNota,$tglNota,$subtotal,$memo,$jurnal);
                    $rgl = DB::table('general_ledger')->get()->last()->notrans;
                    $ac = [
                        [
                            'rgl' => $rgl,
                            'acc_id' => $acc_id_d,
                            'debet' => $subtotal,
                            'kredit' => 0,
                            'trans_detail' => 'Pembelian-Inventaris',
                            'void_flag' => 0,
                        ], 
                        [
                            'rgl' => $rgl,
                            'acc_id' => $acc_id_k,
                            'debet' => 0,
                            'kredit' => $subtotal,
                            'trans_detail' => 'Pembelian-Inventaris',
                            'void_flag' => 0,
                        ]
                    ];
                    
                    insert_gl_detail($ac);
                    //===========end jurnal
                    // DB::table('tblinventari_pengadaan_detail')->upsert($detail);
                }
                // PembelianDetail::insert($detail);
                

                DB::commit();
            });
            if(is_null($exception)) {
                return response()->json([
                    'success' => true,
                    'message' => 'Inventaris Berhasil di insert!',
                    // 'data' => $detail
                ], 200);
            } else {
                DB::rollback();
                return response()->json([
                    'success' => false,
                    'message' => 'Inventaris Gagal Diupdate!',
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

    public function penyusutanInventaris(Request $request){
        try{
            $exception = DB::transaction(function() use ($request){

                $detail = $request[0];
                $noNota = $detail['kode_penyusutan'];
                $tglNota = $detail['tgl_penyusutan'];

                // print_r($detail) ;

                DB::table('tblinventaris_penyusutan')->insert([
                    // [
                        'penyusutan_sysno' => $detail['kode_penyusutan'],
                        'penyusutan_docno' => $detail['kode_penyusutan'],
                        'tgl_penyusutan' => $detail['tgl_penyusutan'],
                        'memo_penyusutan' => 'memo',
                        'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                        'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                    // ],
                    // [
                    //     'penyusutan_docno' => $detail['kode_penyusutan'],
                    //     'tgl_penyusutan' => $detail['tgl_penyusutan'],
                    //     'memo_penyusutan' => 'memo',
                    //     'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                    //     'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                    // ]
                ]);

                DB::table('tblinventaris_penyusutan_detail')->insert([
                    // [
                        'rsysno_penyusutan' => $detail['kode_penyusutan'],
                        'rkode_inventaris' => $detail['kode_inventaris'],
                        'tgl_penyusutan' => $detail['tgl_penyusutan'],
                        'jumlah_penyusutan' => $detail['jumlah_penyusutan'],
                        'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                        'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                    // ],
                    // [
                    //     'rsysno_penyusutan' => $detail['kode_penyusutan'],
                    //     'rkode_inventaris' => $detail['kode_inventaris'],
                    //     'tgl_penyusutan' => $detail['tgl_penyusutan'],
                    //     'jumlah_penyusutan' => $detail['jumlah_penyusutan'],
                    //     'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                    //     'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                    // ]
                ]);
                $subtotal = $detail['jumlah_penyusutan'];
                //===========jurnal
                $pphps4 = 10 ; //$detop[0]['pphps4'];
                $acc_id_d =  $detail['acc_id']; // acc id yg di debet
                $acc_id_akum =  $detail['accid_akum'];
                $acc_id_k = '11110'; // $request[0]['subtotal']; // acc id yg di kredit
                $acc_id_p = '61103';
                $acc_id_l = '32300';
                $memo = 'Penyusutan-Inventaris';
                $jurnal = 'JK';
                $acc_pph = '23100'; // acc hutang pph
                //===jumlah pphps4
                $pphps4_dibayar = $subtotal * $pphps4 / 100 ;
                //====endjumalh pph
                insert_gl($noNota,$tglNota,$subtotal,$memo,$jurnal);
                $rgl = DB::table('general_ledger')->get()->last()->notrans;
                $ac = [
                    [
                        'rgl' => $rgl,
                        'acc_id' => $acc_id_d,
                        'debet' => 0,
                        'kredit' => $subtotal,
                        'trans_detail' => 'Penyusutan-Inventaris',
                        'void_flag' => 0,
                    ],
                    [
                        'rgl' => $rgl,
                        'acc_id' => $acc_id_akum,
                        'debet' => $subtotal,
                        'kredit' => 0,
                        'trans_detail' => 'Penyusutan-Inventaris',
                        'void_flag' => 0,
                    ], 
                    [
                        'rgl' => $rgl,
                        'acc_id' => $acc_id_k,
                        'debet' => 0,
                        'kredit' => $subtotal,
                        'trans_detail' => 'Penyusutan-Inventaris',
                        'void_flag' => 0,
                    ],
                    [
                        'rgl' => $rgl,
                        'acc_id' => $acc_id_p,
                        'debet' => 0,
                        'kredit' => $subtotal,
                        'trans_detail' => 'Penyusutan-Inventaris',
                        'void_flag' => 0,
                    ],
                    [
                        'rgl' => $rgl,
                        'acc_id' => $acc_id_l,
                        'debet' => 0,
                        'kredit' => -1*$subtotal,
                        'trans_detail' => 'Penyusutan-Inventaris',
                        'void_flag' => 0,
                    ],
                    //===========pph ps4
                    [
                        'rgl' => $rgl,
                        'acc_id' => $acc_id_k,
                        'debet' => $pphps4_dibayar,
                        'kredit' => 0,
                        'trans_detail' => 'Trans-biaya',
                        'void_flag' => 0,
                    ],
                    [
                        'rgl' => $rgl,
                        'acc_id' => $acc_pph,
                        'debet' => 0,
                        'kredit' => $pphps4_dibayar,
                        'trans_detail' => 'Trans-biaya',
                        'void_flag' => 0,
                    ]
                    //============end pph ps4
                ];
                
                insert_gl_detail($ac);
             
                DB::commit();
            });
            if(is_null($exception)) {
                return response()->json([
                    'success' => true,
                    'message' => 'Inventaris Berhasil di susutkan!',
                    // 'data' => $detail
                ], 200);
            } else {
                DB::rollback();
                return response()->json([
                    'success' => false,
                    'message' => 'Inventaris Gagal Diupdate!',
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

    public function deletePengadaan(Request $request){
        try{
            $exception = DB::transaction(function() use ($request){
                $kd = $request->input('id');
                //====hapus jurnal
                $gl = DB::table('general_ledger')->where('order_no', $kd)->get();
                for($i=0;$i< count($gl);$i++){
                    DB::table('general_ledger')->where('notrans', $gl[$i]->notrans)->delete();
                    DB::table('gl_detail')->where('rgl', $gl[$i]->notrans)->delete();
                };
                //=====end jurnal
                DB::table('tblinventaris_pengadaan')->where('pengadaan_sysno', $kd)->delete();
                DB::table('tblinventaris_pengadaan_detail')->where('rsysno_pengadaan', $kd)->delete();
                DB::commit();
            });
            if(is_null($exception)) {
                return response()->json([
                    'success' => true,
                    'message' => 'Pengadaan Berhasil di Hapus',
                    // 'data' => $detail
                ], 200);
            } else {
                DB::rollback();
                return response()->json([
                    'success' => false,
                    'message' => 'Pengadaan Gagal Dihapus',
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
