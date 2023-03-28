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
        $penyu = DB::table('tblinventaris_penyusutan_detail')->where('tgl_penyusutan', 'like', '$thismonth%')->get();
        return response()->json([
            'success' => true,
            'message' => 'data inventaris',
            'data' => [$inv, $penyu]
        ], 200);
    }

    public function tambahInventaris(Request $request){
        try{
            $exception = DB::transaction(function() use ($request){
                $kode_inventaris = $request->input('kode_inventaris');
                $nama_inventaris = $request->input('nama_inventaris');
                $tahun_pembuatan = $request->input('tahun_pembuatan');
                $tahun_perakitan = $request->input('tahun_perakitan');
                $group_inventaris = $request->input('group_inventaris');
                $warna = $request->input('warna');
                $merek = $request->input('merek');
                $umur_ekonomis = $request->input('umur_ekonomis');

                DB::table('tblinventaris')->upsert([
                        'kode_inventaris' => $kode_inventaris,
                        'nama_inventaris' => $nama_inventaris,
                        'tahun_pembuatan' => $tahun_pembuatan,
                        'tahun_perakitan' => $tahun_perakitan,
                        'group_inventaris' => $group_inventaris,
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

}
