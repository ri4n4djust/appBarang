<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Barang;
use App\Models\Bbm;
use App\Models\Persediaan;
use App\Models\Opnum;
use App\Models\OpnumDetail;
use Illuminate\Support\Facades\DB;

class barangController extends Controller
{
    //
    public function index()
    {
        $posts = Barang::join('tblkategori', 'tblbarang.ktgBarang', '=', 'tblkategori.kodeKtg')
                ->join('tblpersediaan', 'tblbarang.kdBarang', 'tblpersediaan.kdPersediaan')
                ->get(['tblbarang.*', 'tblkategori.namaKtg', 'tblpersediaan.stokPersediaan']);
        //$posts = Barang::latest()->get();
        $count = Barang::count();
        return response([
            'success' => true,
            'message' => 'List Semua Barang',
            'data' => $posts
        ], 200);
    }

    public function indexPersediaan()
    {
        $posts = Persediaan::join('tblkategori', 'tblpersediaan.ktgPersediaan', '=', 'tblkategori.kodeKtg')
                ->join('tblbarang', 'tblbarang.kdBarang', 'tblpersediaan.kdPersediaan')
                ->get(['tblpersediaan.*', 'tblbarang.accid','tblbarang.accid_persediaan','tblbarang.accid_biaya','tblkategori.namaKtg']);
        //$posts = Barang::latest()->get();
        $count = Barang::count();
        return response([
            'success' => true,
            'message' => 'List Semua Persediaan',
            'data' => $posts
        ], 200);
    }

    public function indexBbm(){
        $bbm = Bbm::join('tblpersediaan', 'tblpersediaan.kdPersediaan', 'tblbbm.code_bbm')
                    ->select('tblbbm.*', 'tblpersediaan.*')
                    ->get();
        //$posts = Barang::latest()->get();
        $count = Barang::count();
        return response([
            'success' => true,
            'message' => 'List Semua bbm',
            'data' => $bbm
        ], 200);

    }

    public function indexNosel(Request $request){
        $where = '';
        $filter = $request->input('key1');
        if(!empty($filter)){
            $where = "and a.r_bbm='$filter' ";
        };
        
        // $bbm = Bbm::get();
        //$posts = Barang::latest()->get();
        $nosel = DB::select("Select a.*,b.last_price from tblnosel_detail a inner join tblbbm b where a.r_bbm=b.id $where ");
        $count = Barang::count();
        return response([
            'success' => true,
            'message' => 'List Semua Nosel',
            'data' => $nosel
        ], 200);

    }

    public function indexKategori(){
        $kat = DB::table('tblkategori')->get();
        return response([
            'success' => true,
            'message' => 'List Semua Kategori',
            'data' => $kat
        ], 200);
    }

    public function update(Request $request)
    {        
        try{
            $exception = DB::transaction(function() use ($request){ 
                $post = Barang::whereId($request->input('id'))->update([
                    // 'kdBarang'     => $request->input('kdBarang'),
                    'nmBarang'     => $request->input('nmBarang'),
                    'hrgPokok'   => $request->input('hrgPokok'),
                    'hrgJual'   => $request->input('hrgJual'),
                    // 'stkBarang'   => '0',
                    // 'deskripsi'   => $request->input('deskripsi'),
                    // 'ktgBarang' => $request->input('ktgBarang'),
                    // 'satuanBarang' => $request->input('satuanBarang'),
                    'merek' => $request->input('merek'),
                    // 'qtyMin' => $request->input('qtyMin'),
                    // 'qtyMax' => $request->input('qtyMax'),
                    // 'stsBarang' => $request->input('stsBarang'),
                ]);
                DB::commit();
            });
            if(is_null($exception)) {
                return response()->json([
                    'success' => true,
                    'message' => 'Post Berhasil Diupdate!',
                ], 200);
            } else {
                DB::rollback();
                return response()->json([
                    'success' => false,
                    'message' => 'Post Gagal Diupdate!',
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
    public function destroy($id)
    {
        $post = Barang::findOrFail($id);
        // $kodebarang = $post->kdBarang;
        
        $post->delete();

        if ($post) {
            return response()->json([
                'success' => true,
                'message' => 'Post Berhasil Dihapus!',
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Post Gagal Dihapus!',
            ], 500);
        }
    }

    public function simpanOpnum(Request $request){
        try{
            $exception = DB::transaction(function() use ($request){ 
                $kdOpnum = $request[0]['kdOpnum'];
                $userOpnum = $request[0]['userOpnum'];
                $totalOpnum = $request[0]['totalOpnum'];
                $tglOpnum = date("Y-m-d", strtotime($request[0]['tglOpnum']));
                $post = Opnum::upsert([
                        'kdOpnum'     => $kdOpnum,
                        'tglOpnum'     => $tglOpnum,
                        'totalOpnum'     => $totalOpnum,
                        'userOpnum'   => $userOpnum,
                        'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                        'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                    ],
                    [
                        'tglOpnum'     => $tglOpnum,
                        'totalOpnum'     => $totalOpnum,
                        'userOpnum'   => $userOpnum,
                        'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                        'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                    ]
                );

                OpnumDetail::where('r_opnum', $kdOpnum)->delete();
                $detop = $request[1];
                for ($i = 0; $i < count($detop); $i++) {

                        $kdBarang = $detop[$i]['kdBarang'];
                        $nmBarang = $detop[$i]['nmBarang'];
                        $qty = $detop[$i]['qty'];
                        $selisih = $detop[$i]['selisih'];
                        $total = $detop[$i]['total'];
                        // $hrg = $detop[$i]['hrgJual'];

                        // $bbm = DB::table('tblbbm')->where('code_bbm', $kdBarang)->first();
                        if($qty != ''){
                            // if(Persediaan::where('kdPersediaan', $kdBarang )->exists()){
                                DB::table('tblpersediaan')->where('kdPersediaan', $kdBarang)->update([
                                    'stokPersediaan' => $qty,
                                ]);
                            // }else{
                                // DB::table('tblbarang')->where('kdBarang', $kdBarang)->update([
                                    // 'stkBarang' => $qty,
                                    // 'hrgJual' => $hrg,
                                // ]);
                            // }
                        }
                        // $oldStok = $brg->stokPersediaan;
                        // DB::table('tblpersediaan')->where('kdPersediaan', $kdBarang)->update([
                        //     'stokPersediaan' => $qty,
                        //     // 'salePrice' => $hrg,
                        // ]);
                        

                        $detail = [
                            [
                                'r_opnum' => $kdOpnum,
                                'r_kdPersediaan' => $kdBarang,
                                'nmPersediaan' => $nmBarang,
                                'selisihOpnum' => $selisih,
                                'nilaiOpnum' => $detop[$i]['total'],
                                'keteranganOpnum' => $detop[$i]['keterangan'],
                                'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                                'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                            ]
                        ];

                        $total_harga = $detop[$i]['total'];
                        //===========jurnal
                        $acc_id_k = $detop[$i]['accid_persediaan']; // acc id yg di debet
                        $acc_id_d = $detop[$i]['accid_biaya']; // acc id yg di debet
                        // $accid = $detpro[$i]['accid']; // acc id yg di debet
                        // $accid_kas = '11110'; // $request[0]['subtotal']; // acc id yg di kredit
                        $acc_laba = '32300';

                        $memo = 'Opnum';
                        $jurnal = 'JK';
                        insert_gl($kdOpnum,$tglOpnum,$total_harga,$memo,$jurnal);
                        $rgl = DB::table('general_ledger')->get()->last()->notrans;
                        $ac = [
                            [
                                'rgl' => $rgl,
                                'acc_id' => $acc_id_d,
                                'debet' => $total_harga,
                                'kredit' => 0,
                                'trans_detail' => 'Opnum',
                                'void_flag' => 0,
                            ],
                            [
                                'rgl' => $rgl,
                                'acc_id' => $acc_id_k,
                                'debet' => 0,
                                'kredit' => $total_harga,
                                'trans_detail' => 'Opnum',
                                'void_flag' => 0,
                            ],
                            // [
                            //     'rgl' => $rgl,
                            //     'acc_id' => $accid_kas,
                            //     'debet' => 0,
                            //     'kredit' => $total_harga,
                            //     'trans_detail' => 'Opnum',
                            //     'void_flag' => 0,
                            // ],
                            [
                                'rgl' => $rgl,
                                'acc_id' => $acc_laba,
                                'debet' => $total_harga,
                                'kredit' => 0,
                                'trans_detail' => 'Opnum',
                                'void_flag' => 0,
                            ]
                        ];
                        
                        insert_gl_detail($ac);
                        //===========end jurnal
                        OpnumDetail::insert($detail);
                    }
                    


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
            DB::rollback();
            // something went wrong
            return response()->json([
             'success' => false,
             'message' => 'exception'.$e,
         ], 400);
        }

    }

    public function simpanBarang(Request $request){
        try{
            $exception = DB::transaction(function() use ($request){ 
                $kdBarang = $request->input('kdB');
                $nmBarang = $request->input('nmB');
                $satuan = $request->input('satuanB');
                $kategori = $request->input('kdktg');
                $hrgBeli = $request->input('hrgBeli');
                $hrgJual = $request->input('hrgJual');
                $merek = $request->input('merek');
                $qtymin = $request->input('qtyMin');
                $qtymax = $request->input('qtyMax');

                // $tglOpnum = date("Y-m-d", strtotime($request[0]['tglOpnum']));
                $post = Barang::upsert([
                        'kdBarang'     => $kdBarang,
                        'nmBarang'     => $nmBarang,
                        'hrgPokok'     => $hrgBeli,
                        'hrgJual'       => $hrgJual,
                        'ktgBarang'   => $kategori,
                        'stkBarang'   => '0',
                        'stsBarang'   => '0',
                        'satuanBarang'     => $satuan,
                        'merek'     => $merek,
                        'qtyMin'       => $qtymin,
                        'qtyMax'   => $qtymax,
                        'deskripsi'     => 'des',
                        'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                        'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                    ],
                    [
                        'nmBarang'     => $nmBarang,
                        'hrgPokok'     => $hrgBeli,
                        'hrgJual'       => $hrgJual,
                        'ktgBarang'   => $kategori,
                        'satuanBarang'     => $satuan,
                        'merek'     => $merek,
                        'qtyMin'       => $qtymin,
                        'qtyMax'   => $qtymax,
                        'deskripsi'     => 'des',
                        'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                    ]
                );

                
            DB::commit();
            });
            if(is_null($exception)) {
                return response()->json([
                    'success' => true,
                    'message' => 'Barang Berhasil di insert!',
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
            DB::rollback();
            // something went wrong
            return response()->json([
             'success' => false,
             'message' => 'exception'.$e,
         ], 400);
        }

    }

    public function updateHrgBbm(Request $request){
        try{
            $exception = DB::transaction(function() use ($request){ 
                $kdBarang = $request->input('code_bbm');
                Bbm::where('code_bbm', $kdBarang)->update([
                    'last_price' => $request->input('harga_pokok_baru'),
                    'sale_price' => $request->input('harga_baru'),
                    'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                ]);
                DB::table('tblnosel_detail')->where('r_code_bbm', $kdBarang)->update([
                    'harga' => $request->input('harga_baru'),
                ]);
                DB::table('tblpersediaan')->where('kdPersediaan', $kdBarang)->update([
                    'salePrice' => $request->input('harga_baru'),
                    'lastPrice' => $request->input('harga_pokok_baru'),
                ]);
                DB::table('tblperubahan_hargabbm')->insert([
                    'code_bbm'   => $request->input('code_bbm'),
                    'harga_pokok_lama'   => $request->input('harga_pokok_lama'),
                    'harga_pokok_baru' => $request->input('harga_pokok_baru'),
                    'harga_lama'   => $request->input('harga_lama'),
                    'harga_baru' => $request->input('harga_baru'),
                    'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                    'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                ]);
                DB::commit();
            });
            if(is_null($exception)) {
                return response()->json([
                    'success' => true,
                    'message' => 'Barang Berhasil di insert!',
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
            DB::rollback();
            // something went wrong
            return response()->json([
             'success' => false,
             'message' => 'exception'.$e,
         ], 400);
        }
    }

    public function resetdb(Request $request){
        try{
            $exception = DB::transaction(function() use ($request){
                
                DB::table('tblprofit')->truncate();
                DB::table('tbltransaksi_nosel')->truncate();
                DB::table('tblheader_aplusan')->truncate();
                DB::table('tblbiaya')->truncate();
                DB::table('tblkupon')->truncate();
                DB::table('tbllinkaja')->truncate();
                DB::table('tblopnum_detail')->truncate();
                DB::table('tblopnum')->truncate();
                DB::table('tblpembelian')->truncate();
                DB::table('tblpembelian_detail')->truncate();
                DB::table('tblpenjualan')->truncate();
                DB::table('tblpenjualan_detail')->truncate();
                DB::table('tblperubahan_hargabbm')->truncate();
                DB::table('tblpobbm')->truncate();
                DB::table('tblpobbm_detail')->truncate();
                DB::table('tblterimabbm_detail')->truncate();
                DB::table('tblterimabbm')->truncate();
                DB::table('tblpenjualankupon')->truncate();
                DB::table('general_ledger')->truncate();
                DB::table('gl_detail')->truncate();
                DB::table('tblpelanggan')->update([
                    'deposit' => '0',
                ]);
                DB::table('tblpersediaan')->update([
                    'stokPersediaan' => '0',
                    'lastPrice' => '0',
                    'salePrice' => '0'
                ]);
                DB::table('tblbbm')->update([
                    'stokBbm' => '0',
                    'last_price' => '0',
                    'sale_price' => '0',
                    'last_meter' => '0'
                ]);

                DB::commit();
            });
            if(is_null($exception)) {
                return response()->json([
                    'success' => true,
                    'message' => 'Barang Berhasil di insert!',
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
            DB::rollback();
            // something went wrong
            return response()->json([
             'success' => false,
             'message' => 'exception'.$e,
         ], 400);
        }
    }
}
