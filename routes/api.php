<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\loginController;
use App\Http\Controllers\barangController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//RESET DB
Route::get('/resetdb', [App\Http\Controllers\barangController::class, 'resetdb']);
//============================
Route::post('/login', [loginController::class, 'login']);
Route::post('/register', [App\Http\Controllers\loginController::class, 'register']);
Route::post('/logout', [App\Http\Controllers\loginController::class, 'logout']);

//=====BARANG============
Route::get('/barang', [App\Http\Controllers\barangController::class, 'index']);
Route::post('/store/barang', [App\Http\Controllers\barangController::class, 'simpanBarang']);
Route::post('/store/opnum', [App\Http\Controllers\barangController::class, 'simpanOpnum']);
Route::post('/update/barang', [App\Http\Controllers\barangController::class, 'update']);
Route::delete('/hapus/barang/{id}', [App\Http\Controllers\barangController::class, 'destroy']);

//=====KATEGORI============
Route::get('/kategori', [App\Http\Controllers\barangController::class, 'indexKategori']);

//=====PERSEDIAAN============
Route::get('/persediaan', [App\Http\Controllers\barangController::class, 'indexPersediaan']);
Route::post('/update/persediaan', [App\Http\Controllers\barangController::class, 'update']);
Route::delete('/hapus/persediaan/{id}', [App\Http\Controllers\barangController::class, 'destroy']);

//======PELANGGAN==============
Route::get('/pelanggan', [App\Http\Controllers\pelangganController::class, 'index']);
Route::post('/tambah/pelanggan', [App\Http\Controllers\pelangganController::class, 'store']);
Route::post('/update/pelanggan', [App\Http\Controllers\pelangganController::class, 'update']);
Route::delete('/hapus/pelanggan/{id}', [App\Http\Controllers\pelangganController::class, 'destroy']);

//======SUPPLIER==============
Route::get('/supplier', [App\Http\Controllers\supplierController::class, 'index']);
Route::post('/tambah/supplier', [App\Http\Controllers\supplierController::class, 'store']);
Route::post('/update/supplier', [App\Http\Controllers\supplierController::class, 'update']);
Route::delete('/hapus/supplier/{id}', [App\Http\Controllers\supplierController::class, 'destroy']);

//======LAPORAN==============
Route::post('/laporan-bbm', [App\Http\Controllers\laporanController::class, 'laporanBbm']);
Route::post('/aplusan', [App\Http\Controllers\laporanController::class, 'aplusan']);
Route::post('/list-aplusan', [App\Http\Controllers\laporanController::class, 'daftarAplusan']);
Route::post('/list-biaya', [App\Http\Controllers\laporanController::class, 'daftarBiaya']);
Route::post('/list-jurnalumum', [App\Http\Controllers\laporanController::class, 'daftarGJ']);
Route::post('/laporan-barang', [App\Http\Controllers\laporanController::class, 'laporanBrg']);
Route::post('/laporan-opnum', [App\Http\Controllers\laporanController::class, 'laporanOpnum']);
Route::post('/laporan-penyusutan', [App\Http\Controllers\laporanController::class, 'laporanPenyusutan']);
Route::post('/listpenjualan-kupon', [App\Http\Controllers\laporanController::class, 'listKupon']);
Route::post('/pembelian-barang', [App\Http\Controllers\laporanController::class, 'pembelianBrg']);
Route::post('/list-bbmdatang', [App\Http\Controllers\laporanController::class, 'daftarBbmDatang']);
Route::post('/list-penyusutan', [App\Http\Controllers\laporanController::class, 'laporanPenyusutan']);
Route::post('/buku-besar', [App\Http\Controllers\laporanController::class, 'bukubesar']);
// Route::post('/update/room', [App\Http\Controllers\roomController::class, 'update']);
// Route::delete('/hapus/room/{id}', [App\Http\Controllers\roomController::class, 'destroy']);

//====================inventaris
Route::get('/inventaris', [App\Http\Controllers\inventarisController::class, 'indexInventaris']);
Route::post('/store/inventaris', [App\Http\Controllers\inventarisController::class, 'tambahInventaris']);
Route::post('/pembelian/inventaris', [App\Http\Controllers\inventarisController::class, 'beliInventaris']);
Route::post('/hapus/inventaris', [App\Http\Controllers\inventarisController::class, 'hapusInventaris']);
Route::post('/penyusutan/inventaris', [App\Http\Controllers\inventarisController::class, 'penyusutanInventaris']);
Route::post('/laporan/pembelian-inventaris', [App\Http\Controllers\inventarisController::class, 'daftarPembelianInventaris']);

//=================hapus
Route::post('/delete/biaya', [App\Http\Controllers\laporanController::class, 'deleteBiaya']);
Route::post('/delete/penyusutan', [App\Http\Controllers\laporanController::class, 'deletePenyusutan']);
Route::post('/delete/pobbm', [App\Http\Controllers\laporanController::class, 'deletePobbm']);
Route::post('/delete/penjualan', [App\Http\Controllers\laporanController::class, 'deletePenjualan']);
Route::post('/delete/opnum', [App\Http\Controllers\laporanController::class, 'deleteOpnum']);
Route::post('/delete/bbmdatang', [App\Http\Controllers\laporanController::class, 'deleteBbmDatang']);
Route::post('/delete/pengadaan', [App\Http\Controllers\inventarisController::class, 'deletePengadaan']);

//==================detail
Route::post('/detail/pobbm', [App\Http\Controllers\laporanController::class, 'detailPobbm']);

//==========PENOMORAN=============
Route::get('/kdbarang', [App\Http\Controllers\nomorController::class, 'kodeBarang']);
Route::get('/kdsupplier', [App\Http\Controllers\nomorController::class, 'kodeSupplier']);
Route::get('/kdpembelian', [App\Http\Controllers\nomorController::class, 'kodePembelian']);
Route::get('/kdinventaris', [App\Http\Controllers\nomorController::class, 'kodeInventaris']);
Route::get('/kdpengadaan', [App\Http\Controllers\nomorController::class, 'kodePengadaan']);
Route::get('/kdpenyusutan', [App\Http\Controllers\nomorController::class, 'kodePenyusutan']);
Route::get('/kdpenjualan', [App\Http\Controllers\nomorController::class, 'kodePenjualan']);
Route::get('/kdkupon', [App\Http\Controllers\nomorController::class, 'kodeKupon']);
Route::get('/kdkategori', [App\Http\Controllers\nomorController::class, 'kodeKategori']);
Route::get('/kdopnum', [App\Http\Controllers\nomorController::class, 'kodeStokOpname']);
Route::get('/kdpobbm', [App\Http\Controllers\nomorController::class, 'kodePoBbm']);
Route::get('/kdbiaya', [App\Http\Controllers\nomorController::class, 'kodeBiaya']);
Route::get('/kdbbmdatang', [App\Http\Controllers\nomorController::class, 'kodeBbmdatang']);
Route::get('/kdpelanggan', [App\Http\Controllers\nomorController::class, 'kodePelanggan']);
Route::get('/kdjurnal-umum', [App\Http\Controllers\nomorController::class, 'kodeJurnal']);

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });
Route::get('/bbm', [App\Http\Controllers\barangController::class, 'indexBbm']);
Route::post('/nosel', [App\Http\Controllers\barangController::class, 'indexNosel']);
Route::post('/update/harga-bbm', [App\Http\Controllers\barangController::class, 'updateHrgBbm']);


// Route::post('/store/transnosel', [App\Http\Controllers\transaksiNoselController::class, 'simpantrx']);
Route::post('/store/transnosel', [App\Http\Controllers\transaksiNoselController::class, 'saveNoselArray']);
Route::post('/update/nosel-meter', [App\Http\Controllers\transaksiNoselController::class, 'updateMeter']);
Route::post('/hapus/aplusan/', [App\Http\Controllers\transaksiNoselController::class, 'deleteAplusan']);
Route::post('/transnosel', [App\Http\Controllers\transaksiNoselController::class, 'indexTransNosel']);
Route::post('/transnoselregu', [App\Http\Controllers\transaksiNoselController::class, 'indexTransNoselRegu']);

// Pembelian
Route::post('/store/pembelian', [App\Http\Controllers\pembelianController::class, 'simpanPembelian']);
Route::post('/store/po-bbm', [App\Http\Controllers\pembelianController::class, 'simpanPobbm']);
Route::post('/store/barang-datang', [App\Http\Controllers\pembelianController::class, 'simpanBarangDatang']);
Route::post('/list/po-bbm', [App\Http\Controllers\pembelianController::class, 'listPobbm']);
Route::post('/detail/po-bbm', [App\Http\Controllers\pembelianController::class, 'detailPobbm']);
Route::get('/linkacc', [App\Http\Controllers\pembelianController::class, 'linkAccount']);

// Penjualan
Route::post('/store/penjualan', [App\Http\Controllers\penjualanController::class, 'simpanPenjualan']);
Route::post('/store/penjualan-kupon', [App\Http\Controllers\penjualanController::class, 'simpanPenjualanKupon']);
Route::post('/getdetail-penjualan', [App\Http\Controllers\penjualanController::class, 'getDetailPenjualan']);

//============biaya
Route::post('/store/biaya', [App\Http\Controllers\biayaController::class, 'simpanBiaya']);
Route::post('/store/jurnal-umum', [App\Http\Controllers\jurnalController::class, 'simpanJurnal']);

//============ COA
Route::post('/labarugi/pendapatan', [App\Http\Controllers\labarugiController::class, 'getPendapatan']);
Route::post('/labarugi/beban-hpp', [App\Http\Controllers\labarugiController::class, 'getHppPenjualan']);
//========
Route::post('/get/acc-data', [App\Http\Controllers\coaController::class, 'get_acc_data']);
Route::post('/get/coa', [App\Http\Controllers\coaController::class, 'get_coa']);
Route::post('/store/coa-acc', [App\Http\Controllers\coaController::class, 'create_acc']);
//============HELPERS
Route::post('/get/acc-list', [App\Http\Controllers\coaController::class, 'get_acc_list']);
//========================

Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::get('/profile', function(Request $request) {
        return auth()->user();
    });

    
        
    // API route for logout user
    
});
