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
                    'r_supplier'     => $request[0]['kdSupplier'],
                    'subTotal'     => $request[0]['subtotal'],
                    'tglPembelian'   => $tglNota,
                    'disc'     => $request[0]['disc'],
                    'discPercent'     => $request[0]['disc'],
                    'tax'     => $request[0]['tax'],
                    'pph'     => 0,
                    'total'     => $request[0]['total'],
                    'note'     => $request[0]['notes'],
                    'term'     => $request[0]['term'],
                    'jthTempo'     => $request[0]['jthTempo'],
                    'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                    'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                ]);
                $detpem = $request[1];
                for ($i = 0; $i < count($detpem); $i++) {

                    $kdBarang = $detpem[$i]['kdBarang'];
                    $qty = $detpem[$i]['qty'];
                    $brg = DB::table('tblpersediaan')->where('kdPersediaan', $kdBarang)->first();
                    $oldStok = $brg->stokPersediaan;
                    DB::table('tblpersediaan')->where('kdPersediaan', $kdBarang)->update([
                        'stokPersediaan' => $oldStok + $qty,
                        'lastPrice' => $detpem[$i]['hrgPokok'],
                    ]);
                    DB::table('tblbarang')->where('kdBarang', $kdBarang)->update([
                        // 'stkBarang' => $oldStok + $qty,
                        'hrgPokok' => $detpem[$i]['hrgPokok'],
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

                    

                    //========insert kartu stok
                    $total_beli = $detpem[$i]['total'];
                    $stok_awal = $oldStok ; // DB::table('tblpersediaan')->select('stokPersediaan')->where('kdPersediaan', $kdBarang)->first()->stokPersediaan;
                    $stok_akhir = $oldStok + $qty ;
                    insert_kartustok_beli($noNota,$kdBarang,$tglNota,$stok_awal,$qty,$total_beli,$stok_akhir);
                    //====================end kartu stok

                    //===========jurnal
                    $acc_id_d = $detpem[$i]['accid_persediaan']; // acc id yg di debet
                    $acc_id_k = '11110'; // $request[0]['subtotal']; // acc id yg di kredit
                    $memo = 'Pembelian-Barang';
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
                            'trans_detail' => 'Pembelian-Barang',
                            'void_flag' => 0,
                        ], 
                        [
                            'rgl' => $rgl,
                            'acc_id' => $acc_id_k,
                            'debet' => 0,
                            'kredit' => $subtotal,
                            'trans_detail' => 'Pembelian-Barang',
                            'void_flag' => 0,
                        ]
                    ];
                    
                    insert_gl_detail($ac);
                    //===========end jurnal
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

    public function simpanBarangDatang(Request $request){

        try{
            $exception = DB::transaction(function() use ($request){ 
                $editid = $request->input('editid');
                // array key 0 = Header
                // array kkey 1 = Detail
                $tgl_terima = $request[0]['tgl_terima'];
                $no_gr = $request[0]['no_br'];
                $no_po = $request[0]['no_po'];
                $no_so = $request[0]['no_so'];
                $post = DB::table('tblterimabbm')->insert([
                    'kd_terima'     => $request[0]['no_br'],
                    'no_po'     => $request[0]['no_po'],
                    'no_so'     => $request[0]['no_so'],
                    'tgl_terima'   => $tgl_terima,
                    'kd_supplier'     => $request[0]['kdSupplier'],
                    'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                    'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                ]);
                $detgr = $request[1];
                for ($i = 0; $i < count($detgr); $i++) {

                        // $no_po = $request[$i]['no_po'];
                        $kdBarang = $detgr[$i]['kdbbm'];
                        $qty = $detgr[$i]['qty_order'];
                        $qty_datang = $detgr[$i]['qty_datang'];
                        $brg = DB::table('tblpersediaan')->where('kdPersediaan', $kdBarang)->first();
                        $oldStok = $brg->stokPersediaan;
                        DB::table('tblpersediaan')->where('kdPersediaan', $kdBarang)->update([
                            'stokPersediaan' => $oldStok + $qty_datang,
                            // 'lastPrice' => $detgr[$i]['hrgPokok'],
                        ]);
                        DB::table('tblbarang')->where('kdBarang', $kdBarang)->update([
                            // 'stkBarang' => $oldStok + $qty_datang,
                            'hrgPokok' => $detgr[$i]['hrgPokok'],
                        ]);

                        $pom = DB::table('tblpobbm_detail')
                        ->where('r_noPo', $no_po)
                        ->where('kdBarang', $kdBarang)
                        ->first();
                        $oldRecieve = $pom->qty_recieve;

                        DB::table('tblpobbm_detail')
                        ->where('r_noPo', $no_po)
                        ->where('kdBarang', $kdBarang)
                        ->update([
                            'qty_recieve' => $oldRecieve + $qty_datang,
                            // 'hrgPokok' => $detgr[$i]['hrgPokok'],
                        ]);

                        $detail[] = [
                            'r_kdterima' => $no_gr,
                            'r_nopo' => $no_po,
                            'r_noso'     => $request[0]['no_so'],
                            'tgl_terima' => $tgl_terima,
                            'kd_barang' => $kdBarang,
                            'qty_terima' => $qty_datang,
                            'created_at' => $tgl_terima,
                            'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                        ];
                        //===========insert fifo
                        $harga = $detgr[$i]['hrgPokok'];
                        $total = $qty_datang * $harga ;
                        $keterangan = $request[0]['no_po'];
                        insert_fifo($tgl_terima,$kdBarang,$keterangan,$qty_datang,$harga,$total);
                        //============end insert fifo

                        //===========jurnal
                        $acc_id_d =  $detgr[$i]['accid_persediaan']; // acc id yg di debet
                        $acc_id_k = '11401'; // $request[0]['subtotal']; // acc id yg di kredit
                        $memo = 'BBM-Datang';
                        $jurnal = 'JK';
                        $subtotal = $detgr[$i]['nilai_datang'];
                        insert_gl($no_gr,$tgl_terima,$subtotal,$memo,$jurnal);
                        $rgl = DB::table('general_ledger')->get()->last()->notrans;
                        $ac = [
                            [
                                'rgl' => $rgl,
                                'acc_id' => $acc_id_d,
                                'debet' => $subtotal,
                                'kredit' => 0,
                                'trans_detail' => 'BBM-Datang',
                                'void_flag' => 0,
                            ], 
                            [
                                'rgl' => $rgl,
                                'acc_id' => $acc_id_k,
                                'debet' => 0,
                                'kredit' => $subtotal,
                                'trans_detail' => 'BBM-Datang',
                                'void_flag' => 0,
                            ]
                        ];
                        
                        insert_gl_detail($ac);
                        //===========end jurnal
                    }
                DB::table('tblterimabbm_detail')->insert($detail);

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

    public function simpanPobbm(Request $request){

        try{
            $exception = DB::transaction(function() use ($request){ 
                $editid = $request->input('editid');
                // array key 0 = Header
                // array kkey 1 = Detail
                $tglNota = $request[0]['tgl_so'];
                $noNota = $request[0]['no_po'];
                $subtotal = $request[0]['subtotal'];
                $pph_bbm = $request[0]['pph'];
                $pph_ps4 = 10; //=====pph pasal 4 ayat 2
                
                $post = DB::table('tblpobbm')->insert([
                    'no_po'     => $request[0]['no_po'],
                    'no_so'     => $request[0]['no_so'],
                    'r_supplier'     => $request[0]['kdSupplier'],
                    'subTotal'     => $subtotal,
                    'tgl_po'   => $tglNota,
                    'disc'     => $request[0]['disc'],
                    'discPercent'     => $request[0]['disc'],
                    'tax'     => $request[0]['tax'],
                    'pph'     => $request[0]['pph'],
                    'total'     => $request[0]['total'],
                    'note'     => $request[0]['notes'],
                    'term'     => $request[0]['term'],
                    'jthTempo'     => $request[0]['jthTempo'],
                    'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                    'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                ]);
                $detpo = $request[1];
                for ($i = 0; $i < count($detpo); $i++) {

                    $kdBarang = $detpo[$i]['kdBarang'];
                    $qty = $detpo[$i]['quantity'];
                    $brg = DB::table('tblpersediaan')->where('kdPersediaan', $kdBarang)->first();
                    $oldStok = $brg->stokPersediaan;
                    DB::table('tblpersediaan')->where('kdPersediaan', $kdBarang)->update([
                        // 'stokPersediaan' => $oldStok + $qty,
                        'lastPrice' => $detpo[$i]['rate'],
                    ]);
                    DB::table('tblbarang')->where('kdBarang', $kdBarang)->update([
                        // 'stkBarang' => $oldStok + $qty,
                        'hrgPokok' => $detpo[$i]['rate'],
                    ]);

                    DB::table('tblbbm')->where('code_bbm', $kdBarang)->update([
                        // 'stkBarang' => $oldStok + $qty,
                        'last_price' => $detpo[$i]['rate'],
                    ]);

                    $detail[] = [
                        'r_noPo' => $noNota,
                        'kdBarang' => $kdBarang,
                        'nmBarang' => $detpo[$i]['nmBarang'],
                        'hrgBeli' => $detpo[$i]['rate'],
                        'qty' => $qty,
                        'qty_recieve' => 0,
                        'pph' => $detpo[$i]['pph_bbm'],
                        'total' => $detpo[$i]['total'],
                        'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                        'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                    ];

                    //===========jurnal
                    $acc_id_d = '11401'; // $detpo[$i]['accid_persediaan']; // acc id yg di debet
                    $acc_id_k = '11110'; // $request[0]['subtotal']; // acc id yg di kredit
                    $memo = 'PO-BBM';
                    $jurnal = 'JK';
                    $subtotal = $detpo[$i]['amount'];
                    insert_gl($noNota,$tglNota,$subtotal,$memo,$jurnal);
                    $rgl = DB::table('general_ledger')->get()->last()->notrans;
                    $ac = [
                        [
                            'rgl' => $rgl,
                            'acc_id' => $acc_id_d,
                            'debet' => $subtotal,
                            'kredit' => 0,
                            'trans_detail' => 'PO-BBM',
                            'void_flag' => 0,
                        ], 
                        [
                            'rgl' => $rgl,
                            'acc_id' => $acc_id_k,
                            'debet' => 0,
                            'kredit' => $subtotal,
                            'trans_detail' => 'PO-BBM',
                            'void_flag' => 0,
                        ]
                    ];
                    
                    insert_gl_detail($ac);
                    //===========end jurnal
                }
                DB::table('tblpobbm_detail')->insert($detail);

                 //===========jurnal ppph bbm
                 $accid_pphbbm = '62100'; // $detpo[$i]['accid_persediaan']; // acc id yg di debet
                 $accid_kas = '11110'; // $request[0]['subtotal']; // acc id yg di kredit
                 $acc_laba = '32300'; //=====acc laba
                 $acc_ps4 = '23100'; //===================pph pasal 4
                 $memo = 'PPH-PO-BBM';
                 $jurnal = 'JK';
                //  $subtotal = $pph_bbm;
                $pphps4_dibayar = $pph_bbm * $pph_ps4 / 100 ;
                 insert_gl($noNota,$tglNota,$pph_bbm,$memo,$jurnal);
                 $rgl = DB::table('general_ledger')->get()->last()->notrans;
                 $ac = [
                     [
                         'rgl' => $rgl,
                         'acc_id' => $accid_pphbbm,
                         'debet' => 0,
                         'kredit' => $pph_bbm,
                         'trans_detail' => 'PPH-PO-BBM',
                         'void_flag' => 0,
                     ], 
                     [
                         'rgl' => $rgl,
                         'acc_id' => $accid_kas,
                         'debet' => 0,
                         'kredit' => $pph_bbm,
                         'trans_detail' => 'PPH-PO-BBM',
                         'void_flag' => 0,
                     ],
                     [
                        'rgl' => $rgl,
                        'acc_id' => $acc_laba,
                        'debet' => $pph_bbm,
                        'kredit' => 0,
                        'trans_detail' => 'PPH-PO-BBM',
                        'void_flag' => 0,
                     ],
                     //=======pph ps4 dibayar
                     [
                        'rgl' => $rgl,
                        'acc_id' => $accid_kas,
                        'debet' => $pphps4_dibayar,
                        'kredit' => 0,
                        'trans_detail' => 'Trans-biaya',
                        'void_flag' => 0,
                     ],
                     [
                        'rgl' => $rgl,
                        'acc_id' => $acc_ps4,
                        'debet' => 0,
                        'kredit' => $pphps4_dibayar,
                        'trans_detail' => 'PPH-PO-BBM',
                        'void_flag' => 0,
                    ]
                    //======end pph ps4 dibayar
                 ];
                 
                 insert_gl_detail($ac);
                 //===========end jurnal
                
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

    public function listPobbm(Request $request){
        $startDate = date("Y-m-d", strtotime($request->input('startDate')));
        $endDate = date("Y-m-d", strtotime($request->input('endDate')));
        $cari = $request->input('cari');
        if($cari == 'all'){
            $where = '';
        }else{
            $where = 'where src.qty_recieve < src.qty_grpo';
        };
        $list = DB::select("SELECT src.no_po,src.no_so no_so,src.subTotal,src.total,src.pph,rtrim(b.nmSupplier) supplier_name,b.kdSupplier,src.podate,src.qty_grpo,src.qty_recieve 
                            from (SELECT a.no_po,a.no_so,a.r_supplier,a.subTotal,a.total,a.pph,cast(a.tgl_po as date) podate,sum(b.qty) qty_grpo,sum(qty_recieve) qty_recieve 
                            FROM tblpobbm a left join tblpobbm_detail b on a.no_po = b.r_noPo where cast(a.tgl_po as date) between '2023-01-01' and '$endDate' group by a.r_supplier,a.no_po,a.no_so,a.tgl_po,a.total,a.pph,a.subTotal) src
                            left join tblsupplier b on src.r_supplier = b.kdSupplier $where order by no_po asc;");
        
        return response()->json([
            'success' => true,
            'message' => 'Laporan PO BBM',
            'data' => $list
        ], 200);
    }

    public function detailPobbm(Request $request){
        // $startDate = date("Y-m-d", strtotime($request->input('startDate')));
        // $endDate = date("Y-m-d", strtotime($request->input('endDate')));
        $no_po = $request->input('no_po');
        // $detailpo = DB::table('tblpobbm_detail')
        //         ->join('tblbbm', 'tblbbm.code_bbm', 'tblpobbm_detail.kdBarang')
        //         ->where('tblpobbm_detail.r_noPo', $no_po)
        //         ->select('tblpobbm_detail.*', 'tblbbm.accid_persediaan');
        $detailpo = DB::select("SELECT a.*,b.accid_persediaan FROM `tblpobbm_detail` a LEFT JOIN tblbbm b ON a.kdBarang = b.code_bbm WHERE a.r_noPo='$no_po';");
        // $list = DB::select("SELECT b.*,c.nmSupplier,(a.qty - a.qty_recieve) kurang from tblpobbm_detail a, tblpobbm b, tblsupplier c WHERE a.r_noPo = b.no_po and a.qty != a.qty_recieve AND b.r_supplier = c.kdSupplier ;");
        
        return response()->json([
            'success' => true,
            'message' => 'Detail PO BBM',
            'data' => $detailpo
        ], 200);
    }

    public function deletePembelian(Request $request){
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
                $det_p = DB::table('tblpembelian_detail')->where('r_noNota', $kd)->get();
                for($i=0;$i< count($det_p);$i++){
                    $kdbarang = $det_p[$i]->kdBarang;
                    $qty_beli = $det_p[$i]->qty;

                    $det_lama = DB::table('tblbarang')->where('kdBarang', $kdbarang)->first();
                    $stk_lama = $det_lama->stkBarang;
                    DB::table('tblbarang')->where('kdBarang', $kdbarang)->update([
                        'stkBarang' => $stk_lama - $qty_beli,
                    ]);

                    $det_lama_p = DB::table('tblpersediaan')->where('kdPersediaan', $kdbarang)->first();
                    $stk_lama_p = $det_lama_p->stokPersediaan;
                    DB::table('tblpersediaan')->where('kdPersediaan', $kdbarang)->update([
                        'stokPersediaan' => $stk_lama_p - $qty_beli,
                    ]);
                
                };

                DB::table('tblpembelian')->where('noNota', $kd)->delete();
                DB::table('tblpembelian_detail')->where('r_noNota', $kd)->delete();
                DB::table('tblkartu_stok')->where('r_notrans', $kd)->delete();
                DB::commit();
            });
            if(is_null($exception)) {
                return response()->json([
                    'success' => true,
                    'message' => 'Pembelian Berhasil di Hapus',
                    // 'data' => $detail
                ], 200);
            } else {
                DB::rollback();
                return response()->json([
                    'success' => false,
                    'message' => 'Pembelian Gagal Dihapus',
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

    public function linkAccount(){
        $listakun = DB::select('SELECT * FROM link_acc'); 
        return response()->json([
            'success' => true,
            'message' => 'List Link acc',
            'data' => $listakun
        ], 200);
    }
}
