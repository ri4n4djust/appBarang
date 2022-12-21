<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Pelanggan;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Storage;
use Image;

class pelangganController extends Controller
{
    //
    public function index()
    {
        $posts = Pelanggan::latest()->get();
        return response([
            'success' => true,
            'message' => 'List Semua Pelanggan',
            'data' => $posts
        ], 200);
    }

    public function store(Request $request)
    {
        try{
            $exception = DB::transaction(function() use ($request){ 
                
                // $image = $request->get('gambar');
                // $name = $request->input('path');
                // $path = 'image/foto/';
                // if (!file_exists($path)) {
                //     File::makeDirectory($path, 0755, true);
                // }
                // Image::make($request->get('gambar'))->save($path.$name);
                
                $post = Pelanggan::create([
                    'kdPelanggan'     => $request->input('kdPelanggan'),
                    'nmPelanggan'     => $request->input('nmPelanggan'),
                    'almtPelanggan'   => $request->input('almtPelanggan'),
                    'noHpPelanggan'   => $request->input('noHpPelanggan'),
                    'rolePelanggan'   => $request->input('rolePelanggan'),
                    'emailPelanggan'   => $request->input('emailPelanggan'),
                    'path'   => $request->input('path'),
                ]);
                DB::commit();
            });
            if(is_null($exception)) {
                return response()->json([
                    'success' => true,
                    'message' => 'Post Berhasil Disimpan!',
                ], 200);
            } else {
                DB::rollback();
                return response()->json([
                    'success' => false,
                    'message' => 'Post Gagal Disimpan!',
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

    public function update(Request $request)
    {

            $post = Pelanggan::whereId($request->input('id'))->update([
                'nmPelanggan'     => $request->input('nmPelanggan'),
                'almtPelanggan'   => $request->input('almtPelanggan'),
                'noHpPelanggan'   => $request->input('noHpPelanggan'),
            ]);


            if ($post) {
                return response()->json([
                    'success' => true,
                    'message' => 'Post Berhasil Diupdate!',
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Post Gagal Diupdate!',
                ], 500);
            }

        

    }

    public function destroy($id)
    {
        $post = Pelanggan::findOrFail($id);
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
    
}
