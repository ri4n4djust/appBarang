<?php
use Illuminate\Support\Facades\DB;

if(!function_exists('autonumber')){
    function autonumber($barang,$primary,$prefix){
        $q=DB::table($barang)->where("$primary", 'like', 'BY%')->select(DB::raw('MAX(RIGHT('.$primary.',6)) as kd_max'));
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

if(!function_exists('insert_tera')){
    function insert_tera($notrans,$r_nosel,$r_bbm,$nama_bbm,$tgl,$jumlah_tera){

        if(DB::table('tbltera_detail')->exists()){
            $rgla = DB::table('tbltera_detail')->get()->last()->no_tera;
            $nomor = substr($rgla, 2);
            $newno = (int)$nomor + 1;
            $newno = substr("000000".$newno, -6);
        }else{
            $newno = '000001';
        }


        $sql = DB::table('tbltera_detail')->insert([
                'no_tera' => 'TR'.$newno,
                'r_notrans' => $notrans,
                'r_nosel' => $r_nosel,
                'r_bbm' => $r_bbm,
                'nama_bbm' => $nama_bbm,
                'tgl_tera' => $tgl,
                'jumlah_tera' => $jumlah_tera,
                'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
            ],
            [
                'r_notrans' => $notrans,
                'r_nosel' => '0',
                'r_bbm' => $r_bbm,
                'nama_bbm' => $nama_bbm,
                'tgl_tera' => $tgl,
                'jumlah_tera' => $jumlah_tera,
                'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
            ]
        );
        	
        // $query = DB::select($sql); // $this->db->query($sql)->result_array();
        return $sql;		
    }
    
}


?>