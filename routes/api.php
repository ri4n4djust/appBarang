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
Route::post('/laporan-barang', [App\Http\Controllers\laporanController::class, 'laporanBrg']);
Route::post('/laporan-opnum', [App\Http\Controllers\laporanController::class, 'laporanOpnum']);

Route::post('/pembelian-barang', [App\Http\Controllers\laporanController::class, 'pembelianBrg']);
// Route::post('/update/room', [App\Http\Controllers\roomController::class, 'update']);
// Route::delete('/hapus/room/{id}', [App\Http\Controllers\roomController::class, 'destroy']);

//==========PENOMORAN=============
Route::get('/kdbarang', [App\Http\Controllers\nomorController::class, 'kodeBarang']);
Route::get('/kdsupplier', [App\Http\Controllers\nomorController::class, 'kodeSupplier']);
Route::get('/kdpembelian', [App\Http\Controllers\nomorController::class, 'kodePembelian']);
Route::get('/kdpenjualan', [App\Http\Controllers\nomorController::class, 'kodePenjualan']);
// Route::get('/kdpelanggan', [App\Http\Controllers\nomorController::class, 'kodePelanggan']);
Route::get('/kdkategori', [App\Http\Controllers\nomorController::class, 'kodeKategori']);
Route::get('/kdopnum', [App\Http\Controllers\nomorController::class, 'kodeStokOpname']);
Route::get('/kdpobbm', [App\Http\Controllers\nomorController::class, 'kodePoBbm']);
Route::get('/kdbbmdatang', [App\Http\Controllers\nomorController::class, 'kodeBbmdatang']);
Route::get('/kdpelanggan', [App\Http\Controllers\nomorController::class, 'kodePelanggan']);

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
Route::post('/getdetail-penjualan', [App\Http\Controllers\penjualanController::class, 'getDetailPenjualan']);


// LabaRugi
Route::post('/labarugi/pendapatan', [App\Http\Controllers\labarugiController::class, 'getPendapatan']);
Route::post('/labarugi/beban-hpp', [App\Http\Controllers\labarugiController::class, 'getHppPenjualan']);

Route::post('/get/acc-data', [App\Http\Controllers\coaController::class, 'get_acc_data']);
//============HELPERS
Route::post('/get/acc-list', [App\Http\Controllers\coaController::class, 'get_acc_list']);
//========================

Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::get('/profile', function(Request $request) {
        return auth()->user();
    });

    
        
    // API route for logout user
    
});
