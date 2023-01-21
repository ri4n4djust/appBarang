<?php

use App\Http\Controllers\AppController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/{any}', [AppController::class, 'index'])->where('any', '.*');

Route::get('/auth/login', [AppController::class, 'index'])->name('login');

Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::get('/profile', function(Request $request) {
        return auth()->user();
    });
   
    // Route::get('/persediaan', [App\Http\Controllers\barangController::class, 'indexPersediaan']);
        
    // API route for logout user
    
});
