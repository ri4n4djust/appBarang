<?php
use Illuminate\Support\Facades\DB;

if(!function_exists('get_data_acc_list')){
    function get_data_acc_list($level,$group,$accid){
        if($level == '1'){
            if($accid != '0'){
                $sql = "SELECT acc_id,name FROM level1 where atype = 'H' and acc_id = '$accid';";
            }else{
                $sql = "SELECT acc_id,name FROM level1 where atype = 'H' and acc_id like '".$group."%';";
            }	
        }else{
            $sql = "SELECT acc_id,name FROM level2 where atype = 'H' and acc_id like '".$group."%' union SELECT acc_id,name FROM level3 where atype = 'H' and acc_id like '".$group."%';";
        }			
        $query = DB::select($sql); // $this->db->query($sql)->result_array();
        return $query;		
    }
}
