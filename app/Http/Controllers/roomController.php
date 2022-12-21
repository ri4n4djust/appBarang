<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Room;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Storage;
use Image;

class roomController extends Controller
{
    //
    public function index()
    {
        $posts = Room::latest()->get();
        return response([
            'success' => true,
            'message' => 'List Semua Room',
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
                
                $post = Room::create([
                    'roomCode'     => $request->input('roomCode'),
                    'roomName'     => $request->input('roomName'),
                    'rRoomRate'   => $request->input('rRoomRate'),
                    'roomDesc'   => $request->input('roomDesc'),
                    'roomPic'   => $request->input('roomPic'),
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

            $post = Room::whereId($request->input('id'))->update([
                'roomName'     => $request->input('roomName'),
                'rRoomRate'   => $request->input('rRoomRate'),
                'roomDesc'   => $request->input('roomDesc'),
                'roomPic'   => $request->input('roomPic'),
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
        $post = Room::findOrFail($id);
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
