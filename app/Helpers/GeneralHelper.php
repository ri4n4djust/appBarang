<?php
use Illuminate\Support\Facades\DB;

if(!function_exists('autonumber')){
    function autonumber($barang,$primary,$prefix){
        $q=DB::table($barang)->where('kd_trans', 'like', 'BY%')->select(DB::raw('MAX(RIGHT('.$primary.',6)) as kd_max'));
        $tahun = date('ym');
        $prx = $prefix.$tahun;
        // print_r($q->get());
        if($q->count()>0){
            foreach($q->get() as $k){
                $tmp = ((int)$k->kd_max)+1;
                $kd = $prx.sprintf("%s", $tmp);
            }
        }else{
            $kd = $prx."000001";
        }

        return $kd;
    }
    
}


?>