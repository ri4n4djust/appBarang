<?php
use Illuminate\Support\Facades\DB;

if(!function_exists('get_data_acc_list')){
    function get_data_acc_list($level,$group,$accid){
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
if(!function_exists('get_level1')){
    function get_level1($level){
        // if($level == '1'){
        //     if($accid != '0'){
        //         $sql = DB::raw("SELECT acc_id,name FROM level1 where atype = 'H' and acc_id = '$accid';");
        //     }else{
        //         $sql = DB::raw("SELECT acc_id,name FROM level1 where atype = 'H' and acc_id like '".$group."%';");
        //     }	
        // }else{
        //     $sql = DB::raw("SELECT acc_id,name FROM level2 where atype = 'H' and acc_id like '".$group."%' union SELECT acc_id,name FROM level3 where atype = 'H' and acc_id like '".$group."%';");
        // }			
        $query = DB::select("SELECT * FROM level1"); // $this->db->query($sql)->result_array();
        return $query;		
    }
}
if(!function_exists('get_level2')){
    function get_level2($level){
        // if($level == '1'){
        //     if($accid != '0'){
        //         $sql = DB::raw("SELECT acc_id,name FROM level1 where atype = 'H' and acc_id = '$accid';");
        //     }else{
        //         $sql = DB::raw("SELECT acc_id,name FROM level1 where atype = 'H' and acc_id like '".$group."%';");
        //     }	
        // }else{
        //     $sql = DB::raw("SELECT acc_id,name FROM level2 where atype = 'H' and acc_id like '".$group."%' union SELECT acc_id,name FROM level3 where atype = 'H' and acc_id like '".$group."%';");
        // }			
        $query = DB::select("SELECT * FROM level2"); // $this->db->query($sql)->result_array();
        return $query;		
    }
}
if(!function_exists('get_level3')){
    function get_level3($level){
        // if($level == '1'){
        //     if($accid != '0'){
        //         $sql = DB::raw("SELECT acc_id,name FROM level1 where atype = 'H' and acc_id = '$accid';");
        //     }else{
        //         $sql = DB::raw("SELECT acc_id,name FROM level1 where atype = 'H' and acc_id like '".$group."%';");
        //     }	
        // }else{
        //     $sql = DB::raw("SELECT acc_id,name FROM level2 where atype = 'H' and acc_id like '".$group."%' union SELECT acc_id,name FROM level3 where atype = 'H' and acc_id like '".$group."%';");
        // }			
        $query = DB::select("SELECT * FROM level3"); // $this->db->query($sql)->result_array();
        return $query;		
    }
}
if(!function_exists('get_level4')){
    function get_level4($level){
        // if($level == '1'){
        //     if($accid != '0'){
        //         $sql = DB::raw("SELECT acc_id,name FROM level1 where atype = 'H' and acc_id = '$accid';");
        //     }else{
        //         $sql = DB::raw("SELECT acc_id,name FROM level1 where atype = 'H' and acc_id like '".$group."%';");
        //     }	
        // }else{
        //     $sql = DB::raw("SELECT acc_id,name FROM level2 where atype = 'H' and acc_id like '".$group."%' union SELECT acc_id,name FROM level3 where atype = 'H' and acc_id like '".$group."%';");
        // }			
        $query = DB::select("SELECT * FROM level4"); // $this->db->query($sql)->result_array();
        return $query;		
    }
}

?>