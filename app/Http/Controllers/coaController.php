<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class coaController extends Controller
{
    //
    public function get_acc_list(Request $request){
		$level = $request->input('level');
		$group = $request->input('group');
		$accid = $request->input('accid');
		$acc_list = get_data_acc_list($level,$group,$accid);
		$data['acc_list'] = $acc_list;

		echo json_encode($data);
	}
}
