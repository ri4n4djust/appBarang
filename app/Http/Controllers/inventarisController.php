<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class inventarisController extends Controller
{
    //
    public function indexInventaris(){
        $inv = DB::table('tblinventaris')->get();
        return response()->json([
            'success' => true,
            'message' => 'data inventaris',
            'data' => $inv
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

}
