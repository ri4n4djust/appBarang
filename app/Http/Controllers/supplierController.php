<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Supplier;

class supplierController extends Controller
{
    //
    public function index(){
        $supplier = Supplier::get();
        //$posts = Barang::latest()->get();
        return response([
            'success' => true,
            'message' => 'List Semua supplier',
            'data' => $supplier
        ], 200);

    }
}
