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
                //->where('tblBarang.stsBarang', '1')
                ->get(['tblBarang.*', 'tblkategori.namaKtg']);
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
                //->where('tblBarang.stsBarang', '1')
                ->get(['tblpersediaan.*', 'tblkategori.namaKtg']);
        //$posts = Barang::latest()->get();
        $count = Barang::count();
        return response([
            'success' => true,
            'message' => 'List Semua Persediaan',
            'data' => $posts
        ], 200);
    }

    public function indexBbm(){
        $bbm = Bbm::get();
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
            $where = "where r_bbm='$filter' ";
        };
        
        // $bbm = Bbm::get();
        //$posts = Barang::latest()->get();
        $nosel = DB::select("Select * from tblnosel_detail $where ");
        $count = Barang::count();
        return response([
            'success' => true,
            'message' => 'List Semua Nosel',
            'data' => $nosel
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
            //DB::rollback();
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
        $kodebarang = $post->kdBarang;
        
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

                        // $brg = DB::table('tblpersediaan')->where('kdPersediaan', $kdBarang)->first();
                        // $oldStok = $brg->stokPersediaan;
                        DB::table('tblpersediaan')->where('kdPersediaan', $kdBarang)->update([
                            'stokPersediaan' => $qty,
                            // 'salePrice' => $hrg,
                        ]);

                        DB::table('tblbarang')->where('kdBarang', $kdBarang)->update([
                            'stkBarang' => $qty,
                            // 'hrgJual' => $hrg,
                        ]);

                        $detail[] = [
                            'r_opnum' => $kdOpnum,
                            'r_kdPersediaan' => $kdBarang,
                            'nmPersediaan' => $nmBarang,
                            'selisihOpnum' => $selisih,
                            'nilaiOpnum' => $detop[$i]['total'],
                            'keteranganOpnum' => $detop[$i]['keterangan'],
                            'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                            'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
                        ];
                    }
                    OpnumDetail::insert($detail);

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
