<?php
use Illuminate\Support\Facades\DB;

if(!function_exists('insert_gl')){
    function insert_gl($notrans,$tgl,$total_trans,$memo,$jurnal){

        if(DB::table('general_ledger')->where('id', 1)->exists()){
            $rgl = DB::table('general_ledger')->get()->last()->notrans;
            $nomor = substr($rgl, 6);
            $newno = (int)$nomor + 1;
            $newno = substr("000000".$newno, -6);
        }else{
            $newno = '000001';
        }
        

        $sql = DB::table('general_ledger')->upsert([
                'notrans' => 'GJ'.$newno,
                'order_no' => $notrans,
                'invoice_no' => '0',
                'tgl' => $tgl,
                'total_trans' => $total_trans,
                'memo' => $memo,
                'jurnal' => $jurnal,
                'rlocation' => '01020',
                'r_anggaran' => '99999',
                'tabel_trans' => 'general_ledger',
                'comp_loc' => 'Comp-Loc',
                'us_create' => 'user',
                'us_update' => 'uerr',
            ],
            [
                'order_no' => '0',
                'invoice_no' => '0',
                'tgl' => $tgl,
                'total_trans' => $total_trans,
                'memo' => $memo,
                'jurnal' => $jurnal,
                'rlocation' => '01020',
                'r_anggaran' => '99999',
                'tabel_trans' => 'general_ledger',
                'comp_loc' => 'Comp-Loc',
                'us_create' => 'user',
                'us_update' => 'uerr',
            ]
        );
        	
        // $query = DB::select($sql); // $this->db->query($sql)->result_array();
        return $sql;		
    }
    
}

if(!function_exists('insert_gl_detail')){
    function insert_gl_detail($det_gl){

        // print_r($det_gl);
        for($i = 0; $i < count($det_gl); $i ++){
            $sql = DB::table('gl_detail')->upsert([
                    'rgl' => $det_gl[$i]['rgl'],
                    'acc_id' => $det_gl[$i]['acc_id'],
                    'debet' => $det_gl[$i]['debet'],
                    'kredit' => $det_gl[$i]['kredit'],
                    'trans_detail' => $det_gl[$i]['trans_detail'],
                    'void_flag' => 0,
                    'date_create' => \Carbon\Carbon::now()->toDateTimeString(),
                    'date_udpate' => \Carbon\Carbon::now()->toDateTimeString()
                ],
                [
                    'rgl' => $det_gl[$i]['rgl'],
                    'acc_id' => $det_gl[$i]['acc_id'],
                    'debet' => $det_gl[$i]['debet'],
                    'kredit' => $det_gl[$i]['kredit'],
                    'trans_detail' => $det_gl[$i]['trans_detail'],
                    'void_flag' => 0,
                    'date_create' => \Carbon\Carbon::now()->toDateTimeString(),
                    'date_udpate' => \Carbon\Carbon::now()->toDateTimeString()
                ]
            );
        };
        	
        // $query = DB::select($sql); // $this->db->query($sql)->result_array();
        return $sql;		
    }
    
}

?>