<?php
use Illuminate\Support\Facades\DB;

if(!function_exists('insert_gl')){
    function insert_gl($level,$group,$accid){


        if($level == '1'){
            if($accid != '0'){
                $sql = DB::raw("SELECT acc_id,name FROM level1 where atype = 'H' and acc_id = '$accid';");
            }else{
                $sql = DB::raw("SELECT acc_id,name FROM level1 where atype = 'H' and acc_id like '".$group."%';");
            }	
        }else{
            $sql = DB::raw("SELECT acc_id,name FROM level2 where atype = 'H' and acc_id like '".$group."%' union SELECT acc_id,name FROM level3 where atype = 'H' and acc_id like '".$group."%';");
        }			
        $query = DB::select($sql); // $this->db->query($sql)->result_array();
        return $query;		
    }
    
}

?>