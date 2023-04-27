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

if(!function_exists('insert_fifo')){
    function insert_fifo($tgl,$kdBarang,$keterangan,$stok,$harga,$total){

        // if(DB::table('tbltera_detail')->exists()){
        //     $rgla = DB::table('tbltera_detail')->get()->last()->no_tera;
        //     $nomor = substr($rgla, 2);
        //     $newno = (int)$nomor + 1;
        //     $newno = substr("000000".$newno, -6);
        // }else{
        //     $newno = '000001';
        // }


        $sql = DB::table('tblstok_fifo')->insert([
                'tgl' => $tgl,
                'kd_barang' => $kdBarang,
                'keterangan' => $keterangan,
                'stok' => $stok,
                'harga' => $harga,
                'total' => $total,
                'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
            ]
           
        );
        	
        // $query = DB::select($sql); // $this->db->query($sql)->result_array();
        return $sql;		
    }
    
}

if(!function_exists('insert_kartustok_jual')){
    function insert_kartustok_jual($notrans,$kdBarang,$tgl,$stok_awal,$qty_jual,$total_jual,$stok_akhir){

        // if(DB::table('tblkartu_stok')->exists()){
        //     $rgla = DB::table('tblkartu_stok')->get()->last()->no_tera;
        //     $nomor = substr($rgla, 2);
        //     $newno = (int)$nomor + 1;
        //     $newno = substr("000000".$newno, -6);
        // }else{
        //     $newno = '000001';
        // }


        $sql = DB::table('tblkartu_stok')->insert([
                'r_notrans' => $notrans,
                'kd_barang' => $kdBarang,
                'tgl' => $tgl,
                'stok_awal' => $stok_awal,
                'unit_beli' => 0,
                'total_beli' => 0,
                'unit_jual' => $qty_jual,
                'total_jual' => $total_jual,
                'stok_akhir' => $stok_akhir,
                'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
            ]
        );
        	
        // $query = DB::select($sql); // $this->db->query($sql)->result_array();
        return $sql;		
    }
    
}

if(!function_exists('insert_kartustok_beli')){
    function insert_kartustok_beli($notrans,$kdBarang,$tgl,$stok_awal,$qty_beli,$total_beli,$stok_akhir){

        $sql = DB::table('tblkartu_stok')->insert([
                'r_notrans' => $notrans,
                'kd_barang' => $kdBarang,
                'tgl' => $tgl,
                'stok_awal' => $stok_awal,
                'unit_beli' => $qty_beli,
                'total_beli' => $total_beli,
                'unit_jual' => 0,
                'total_jual' => 0,
                'stok_akhir' => $stok_akhir,
                'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
            ]
        );
        	
        return $sql;		
    }
    
}

if(!function_exists('insert_kartustok_jual')){
    function insert_kartustok_jual($notrans,$kdBarang,$tgl,$stok_awal,$qty_jual,$total_jual,$stok_akhir){

        $sql = DB::table('tblkartu_stok')->insert([
                'r_notrans' => $notrans,
                'kd_barang' => $kdBarang,
                'tgl' => $tgl,
                'stok_awal' => $stok_awal,
                'unit_beli' => 0,
                'total_beli' => 0,
                'unit_jual' => $qty_jual,
                'total_jual' => $total_jual,
                'stok_akhir' => $stok_akhir,
                'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
            ]
        );
        	
        return $sql;		
    }
    
}

if(!function_exists('insert_trans_stok')){
    function insert_trans_stok($notrans,$r_fifo,$stok_trans,$harga_trans){

        if(DB::table('tbltransaksi_stok')->exists()){
            $rgla = DB::table('tbltransaksi_stok')->get()->last()->kd_transStok;
            $nomor = substr($rgla, 2);
            $newno = (int)$nomor + 1;
            $newno = substr("000000".$newno, -6);
        }else{
            $newno = '000001';
        }

        $sql = DB::table('tbltransaksi_stok')->insert([
                'kd_transStok' => 'TS'.$newno,
                'r_trans' => $notrans,
                'r_fifo' => $r_fifo,
                'stok_trans' => $stok_trans,
                'harga_trans' => $harga_trans,
                'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
            ],
            [
                'r_trans' => $notrans,
                'r_fifo' => $r_fifo,
                'stok_trans' => $stok_trans,
                'harga_trans' => $harga_trans,
                'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                'updated_at' => \Carbon\Carbon::now()->toDateTimeString()
            ]
        );
        	
        // $query = DB::select($sql); // $this->db->query($sql)->result_array();
        return $sql;		
    }
    
}


?>