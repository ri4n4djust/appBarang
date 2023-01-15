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
Route::post('/login', [loginController::class, 'login']);
Route::post('/register', [App\Http\Controllers\loginController::class, 'register']);
Route::post('/logout', [App\Http\Controllers\loginController::class, 'logout']);



//======PELANGGAN==============
Route::get('/pelanggan', [App\Http\Controllers\pelangganController::class, 'index']);
Route::post('/tambah/pelanggan', [App\Http\Controllers\pelangganController::class, 'store']);
Route::post('/update/pelanggan', [App\Http\Controllers\pelangganController::class, 'update']);
Route::delete('/hapus/pelanggan/{id}', [App\Http\Controllers\pelangganController::class, 'destroy']);

//======ROOM==============
Route::get('/room', [App\Http\Controllers\roomController::class, 'index']);
Route::post('/tambah/room', [App\Http\Controllers\roomController::class, 'store']);
Route::post('/update/room', [App\Http\Controllers\roomController::class, 'update']);
Route::delete('/hapus/room/{id}', [App\Http\Controllers\roomController::class, 'destroy']);

//==========PENOMORAN=============
Route::get('/kdbarang', [App\Http\Controllers\nomorController::class, 'kodeBarang']);
Route::get('/kdpelanggan', [App\Http\Controllers\nomorController::class, 'kodePelanggan']);

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });
Route::get('/bbm', [App\Http\Controllers\barangController::class, 'indexBbm']);
Route::post('/nosel', [App\Http\Controllers\barangController::class, 'indexNosel']);

Route::post('/store/transnosel', [App\Http\Controllers\transaksiNoselController::class, 'simpantrx']);
Route::post('/transnosel', [App\Http\Controllers\transaksiNoselController::class, 'indexTransNosel']);

Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::get('/profile', function(Request $request) {
        return auth()->user();
    });

    //=====BARANG============
    Route::get('/barang', [App\Http\Controllers\barangController::class, 'index']);
    Route::post('/update/barang', [App\Http\Controllers\barangController::class, 'update']);
    Route::delete('/hapus/barang/{id}', [App\Http\Controllers\barangController::class, 'destroy']);
        
    // API route for logout user
    
});
