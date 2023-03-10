<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Pelanggan;
use App\Models\Barang;
use App\Models\Persediaan;
use App\Models\Pembelian;
use App\Models\Penjualan;
use App\Models\Supplier;
use App\Models\Opnum;
use App\Models\Kupon;
use App\Models\KuponPenjualan;
use App\Models\Pobbm;
use App\Models\BbmDatang;
use Illuminate\Support\Facades\DB;

class nomorController extends Controller
{
    //
    public function kodePenjualan()
    {
       
        $count = Penjualan::all();
        if($count->isEmpty()){
            $tahun = date('Y');
            
            $post = 'INV'.$tahun.'00'.'1';
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'kdPenjualan'    => $post,
                // 'panjang' => $newid
            ], 200);
        }else{
            $no = 0 ;
            $count = Penjualan::all()->last();
            $terakhir = substr($count->noPenjualan, 7);
            $kodeBaru = $terakhir + 1  ;

            $tahun = date('Y');
            $post = 'INV'.$tahun.'00'.$kodeBaru;
            

            if (Penjualan::where('noPenjualan', $post)->exists()) {
                $kodeBarulagi = $kodeBaru + 1 ;
                $post = 'INV'.$tahun.'00'.$kodeBarulagi;
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kdPenjualan'    => $post,
                    // 'panjang' => $newid
                ], 200);
            } else {
                return response()->json([
                    'success' => true,
                    'message' => 'Post Tidak Ditemukan!',
                    'kdPenjualan'    => $post,
                    // 'panjang' => $newid
                ], 200);
            }
        }
    }
    public function kodeBarang()
    {
        $count = Persediaan::all();
        if($count->isEmpty()){
            $tahun = date('Y');
            $post = 'BRG'.'000'.'1';
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'kdBarang'    => $post
            ], 200);
        }else{
            $no = 0 ;
            $count = Persediaan::all()->last();
            //$kodeBaru = $count->kdBarang  ;
            $terakhir = substr($count->kdPersediaan, 6,  20);
            $kodeBaru = $terakhir + 1  ;

            // $tahun = date('Y');
            $post = 'BRG'.'000'.$kodeBaru;

            if (Persediaan::where('kdPersediaan', $post)->exists()) {
                // exists
                $kodeBarulagi = $kodeBaru + 1 ;
                $post = 'BRG'.'000'.$kodeBarulagi;
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'ada' => 'gggada',
                    'kdBarang'    => $post
                ], 200);
            } else {
                return response()->json([
                    'success' => true,
                    'ada' => 'tidak ada',
                    'message' => 'Detail Post!',
                    'kdBarang'    => $post
                ], 200);
            }
        }
    }
    

    public function kodePembelian()
    {
        $count = Pembelian::all();
        if($count->isEmpty()){
            $tahun = date('Y');
            $post = 'PB'.$tahun.'-'.'1';
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'kdPembelian'    => $post
            ], 200);
        }else{

            $no = 0 ;
            $count = Pembelian::all()->last();
            $terakhir = substr($count->noNota, 7,  20);
            $kodeBaru = $terakhir + 1  ;

            $tahun = date('Y');
            $post = 'PB'.$tahun.'-'.$kodeBaru;

            if (Pembelian::where('noNota', $post)->exists()) {
                $kodeBarulagi = $kodeBaru + 1 ;
                $post = 'PB'.$tahun.'-'.$kodeBarulagi;
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kdPembelian'    => $post
                ], 200);
            } else {
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kdPembelian'    => $post
                ], 200);
            }
        }
    }

    public function kodeSupplier()
    {
        $count = Supplier::all();
        if($count->isEmpty()){
            $tahun = date('Y');
            $post = 'SP000'.'1';
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'kdSupplier'    => $post
            ], 200);
        }else{
            $no = 0 ;
            $count = Supplier::all()->last();
            $terakhir = substr($count->kdSupplier, 3,  20);
            $kodeBaru = $terakhir + 1  ;

            // $tahun = date('Y');
            $post = 'SP'.$kodeBaru;

            if (Supplier::where('kdSupplier', $post)->exists()) {
                $kodeBarulagi = $kodeBaru + 1 ;
                $post = 'SP'.$kodeBarulagi;
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kdSupplier'    => $post
                ], 200);
            } else {
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kdSupplier'    => $post
                ], 200);
            }
        }
    }

    public function kodePelanggan()
    {
        $count = Pelanggan::all();
        if($count->isEmpty()){
            $tahun = date('Y');
            $post = 'PL0'.$tahun.'0'.'1';
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'kdPelanggan'    => $post
            ], 200);
        }else{
            $no = 0 ;
            // $count = Pelanggan::all()->last();
            // $terakhir = substr($count->kdPelanggan, -1);
            $terakhir = Pelanggan::max('id');
            $kodeBaru = $terakhir + 1  ;

            $tahun = date('Y');
            $post = 'PL0'.$tahun.'0'.$kodeBaru;

            if (Pelanggan::where('kdPelanggan', $post)->exists()) {
                $kodeBarulagi = $kodeBaru + 1 ;
                $post = 'PL0'.$tahun.'0'.$kodeBarulagi;
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kdPelanggan'    => $post
                ], 200);
            } else {
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kdPelanggan'    => $post
                ], 200);
            }
        }
    }


    public function kodeKategori()
    {
        $count = Kategori::all();
        if($count->isEmpty()){
            $tahun = date('Y');
            $post = 'KT-'.$tahun.'-'.'1';
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'kodeKtg'    => $post
            ], 200);
        }else{
            $no = 0 ;
            $count = Kategori::all()->last();
            $terakhir = substr($count->kodeKtg, 8,  20);
            $kodeBaru = $terakhir + 1  ;

            $tahun = date('Y');
            $post = 'KT-'.$tahun.'-'.$kodeBaru;

            if (Kategori::where('kodeKtg', $post)->exists()) {
                $kodeBarulagi = $kodeBaru + 1 ;
                $post = 'KT-'.$tahun.'-'.$kodeBarulagi;
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kodeKtg'    => $post
                ], 200);
            } else {
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kodeKtg'    => $post
                ], 200);
            }
        }
    }

    public function kodeStokOpname()
    {
        $count = Opnum::all();
        if($count->isEmpty()){
            $tahun = date('mY');
            $post = 'OP'.$tahun.'1';
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'kdOpnum'    => $post
            ], 200);
        }else{

            $no = 0 ;
            $count = Opnum::all()->last();
            $terakhir = substr($count->kdOpnum, 8,  20);
            $kodeBaru = $terakhir + 1  ;

            $tahun = date('mY');
            $post = 'OP'.$tahun.''.$kodeBaru;

            if (Opnum::where('kdOpnum', $post)->exists()) {
                $count = Opnum::all()->last();
                $terakhir = substr($count->kdOpnum, 8,  20);
                $kodeBarulagi = $kodeBaru + 1 ;
                $post = 'OP'.$tahun.$kodeBarulagi;
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kdOpnum'    => $post
                ], 200);
            } else {
                $tahun = date('mY');
                //$post = 'OP-'.$tahun.'-'.'1';
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kdOpnum'    => $post
                ], 200);
            }
        }
    }

    public function kodeKupon()
    {
        $count = KuponPenjualan::all();
        if($count->isEmpty()){
            $tahun = date('mY');
            $post = 'KP'.$tahun.'1';
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'kdKupon'    => $post
            ], 200);
        }else{

            $no = 0 ;
            $count = KuponPenjualan::all()->last();
            $terakhir = substr($count->noPenjualanKupon, 8,  20);
            $kodeBaru = $terakhir + 1  ;

            $tahun = date('mY');
            $post = 'KP'.$tahun.''.$kodeBaru;

            if (KuponPenjualan::where('noPenjualanKupon', $post)->exists()) {
                $count = KuponPenjualan::all()->last();
                $terakhir = substr($count->noPenjualanKupon, 8,  20);
                $kodeBarulagi = $kodeBaru + 1 ;
                $post = 'KP'.$tahun.$kodeBarulagi;
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kdKupon'    => $post
                ], 200);
            } else {
                $tahun = date('mY');
                //$post = 'OP-'.$tahun.'-'.'1';
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kdKupon'    => $post
                ], 200);
            }
        }
    }

    public function kodePoBbm()
    {
        $count = Pobbm::all();
        if($count->isEmpty()){
            $tahun = date('mY');
            $post = 'PO'.$tahun.'1';
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'kdPobbm'    => $post
            ], 200);
        }else{

            $no = 0 ;
            $count = Pobbm::all()->last();
            $terakhir = substr($count->no_po, 8,  20);
            $kodeBaru = $terakhir + 1  ;

            $tahun = date('mY');
            $post = 'PO'.$tahun.''.$kodeBaru;

            if (Pobbm::where('no_po', $post)->exists()) {
                $count = Pobbm::all()->last();
                $terakhir = substr($count->no_po, 8,  20);
                $kodeBarulagi = $kodeBaru + 1 ;
                $post = 'PO'.$tahun.$kodeBarulagi;
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kdPobbm'    => $post
                ], 200);
            } else {
                $tahun = date('mY');
                //$post = 'OP-'.$tahun.'-'.'1';
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kdPobbm'    => $post
                ], 200);
            }
        }
    }


    public function kodeBbmdatang()
    {
        $count = BbmDatang::all();
        if($count->isEmpty()){
            $tahun = date('mY');
            $post = 'BR'.$tahun.'1';
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'kdBbmdatang'    => $post
            ], 200);
        }else{

            $no = 0 ;
            $count = BbmDatang::all()->last();
            $terakhir = substr($count->kd_terima, 8,  20);
            $kodeBaru = $terakhir + 1  ;

            $tahun = date('mY');
            $post = 'BR'.$tahun.''.$kodeBaru;

            if (BbmDatang::where('kd_terima', $post)->exists()) {
                $count = BbmDatang::all()->last();
                $terakhir = substr($count->kd_terima, 8,  20);
                $kodeBarulagi = $kodeBaru + 1 ;
                $post = 'BR'.$tahun.$kodeBarulagi;
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kdBbmdatang'    => $post
                ], 200);
            } else {
                $tahun = date('mY');
                //$post = 'OP-'.$tahun.'-'.'1';
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kdBbmdatang'    => $post
                ], 200);
            }
        }
    }


    public function kodeUsername()
    {
        $count = User::all();
        if($count->isEmpty()){
            $tahun = date('Y');
            $post = 'US-'.$tahun.'-'.'1';
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'username'    => $post
            ], 200);
        }else{
            $no = 0 ;
            $count = User::all()->last();
            $terakhir = substr($count->username, 8,  20);
            $kodeBaru = $terakhir + 1  ;

            $tahun = date('Y');
            $post = 'US-'.$tahun.'-'.$kodeBaru;

            if (User::where('username', $post)->exists()) {
                $kodeBarulagi = $kodeBaru + 1 ;
                $post = 'US-'.$tahun.'-'.$kodeBarulagi;
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'username'    => $post
                ], 200);
            } else {
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'username'    => $post
                ], 202);
            }
        }
    }
}
