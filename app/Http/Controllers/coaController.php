<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;

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

	public function get_coa(Request $request){
		$lvl1 = get_level1(1);
		$lvl2 = get_level2(2);
		$lvl3 = get_level3(3);
		$lvl4 = get_level4(4);
		$data['level1'] = $lvl1;
		$data['level2'] = $lvl2;
		$data['level3'] = $lvl3;
		$data['level4'] = $lvl4;

		// echo json_encode($data);
		return response()->json([
            'success' => true,
            'message' => 'List COA',
            'data' => $data
        ], 200);
	}

	public function get_acc_data(Request $request){
		Schema::dropIfExists('gl');
		Schema::dropIfExists('gl_lr');
		Schema::dropIfExists('coa');
		$dealer_ref = '01020';
		$lokasi = $request->input('lokasi');
		$accid = $request->input('accid');
		$whr = "and a.location_id = '$lokasi'";
			$filter = "'$accid'";
			Schema::create('gl', function (Blueprint $table) {
				$table->increments('id');
				$table->string('acc_id', 18)->nullable(false)->default('0');
				$table->decimal('amount', 13,2)->nullable(false)->default('0');
				// Table only lasts as long as the connection persists.
				// $table->temporary();
				// The lookup column, with an index.
				// $table->string('lookup')->index();
				// The Property ID we're looking for.
				// $table->string('pid');
			});
			Schema::create('gl_lr', function (Blueprint $table) {
				$table->increments('id');
				$table->string('acc_id', 18)->nullable(false)->default('0');
				$table->decimal('amount', 13,2)->nullable(false)->default('0');
				// $table->temporary();
			});
			Schema::create('coa', function (Blueprint $table) {
				$table->increments('id');
				$table->string('idparent1', 11);
				$table->string('parent1', 50);
				$table->string('parent1level', 1);
				$table->string('parent1type', 1);
				$table->string('idparent2', 11);
				$table->string('parent2', 50);
				$table->string('parent2level', 1);
				$table->string('parent2type', 1);
				$table->string('idparent3', 11);
				$table->string('parent3', 50);
				$table->string('parent3level', 1);
				$table->string('parent3type', 1);
				$table->string('acc_id', 11);
				$table->string('name', 50);
				$table->string('atype', 1);
				// $table->temporary();
			});

			// DB::statement("CREATE TEMPORARY TABLE GL ("."acc_id nchar(18) NOT NULL ".",amount decimal(13,2) NOT NULL DEFAULT 0);");

			// DB::statement("CREATE TEMPORARY TABLE GL_LR ("."acc_id nchar(18) NOT NULL ".",amount decimal(13,2) NOT NULL DEFAULT 0);");
			
			// DB::statement("CREATE TEMPORARY TABLE coa (idparent1 int(11),parent1 varchar(50), parent1level int(1), parent1type char(1),idparent2 int(11),parent2 varchar(50),parent2level  int(1),parent2type char(1),idparent3 int(11),parent3 varchar(50),parent3level  int(1),parent3type char(1),acc_id int(11),name varchar(50),atype char(1));");

			$date_lr = '2022-01-01';
			$timezone = time() + (60*60*+8); 
			$cur_tgl = gmdate('Y-m-d', $timezone);			

			DB::statement( DB::raw("SET @harta = 0;"));
			DB::statement( DB::raw("SET @hutang = 0;"));
			DB::statement( DB::raw("SET @modal = 0;"));
			DB::statement( DB::raw("SET @modal_disetor = 0;"));
			DB::statement( DB::raw("SET @unbalance = 0;"));
			DB::statement( DB::raw("SET @income = 0;"));
			DB::statement( DB::raw("SET @expense = 0;"));
			
			DB::statement(DB::raw("INSERT into gl SELECT acc_id,SUM(debet)-SUM(kredit) as balance from general_ledger a left join gl_detail b on a.notrans = b.rgl where rlocation = '$dealer_ref' and date(tgl) between '2022-01-01' and '$cur_tgl' group by acc_id;"));
			DB::statement(DB::raw("INSERT into gl values('38100','0'),('38999','0')"));
			DB::statement(DB::raw("INSERT into gl_lr SELECT acc_id,SUM(debet)-SUM(kredit) as balance from general_ledger a left join gl_detail b on a.notrans = b.rgl where rlocation = '$dealer_ref' and date(tgl) between '2022-01-01' and '$cur_tgl' group by acc_id;"));
			DB::statement(DB::raw("INSERT into gl_lr values('38100','0'),('38999','0')"));
			DB::statement( DB::raw("set @harta = (SELECT SUM(amount) from gl where acc_id like '1%');"));
			// $data1 = $this->db->query("SELECT SUM(amount) from GL where acc_id like '4%' or acc_id like '7%'")->result_array();
			// print_r($data1);
			// $data1 = $this->db->query("SELECT coalesce(SUM(amount),0) from GL where acc_id like '5%' or acc_id like '6%' or acc_id like '8%'")->result_array();
			// print_r($data1);
			DB::statement( DB::raw("set @hutang = (SELECT SUM(amount) from gl where acc_id like '2%');"));
			DB::statement( DB::raw("set @modal = (SELECT sum(amount) as amount from gl where acc_id in ('31100','31200','31300'));"));
			DB::statement( DB::raw("set @modalDisetor = (SELECT SUM(amount) from gl where acc_id like '3%' and acc_id not in ('31100','31200','31300'));"));
			DB::statement( DB::raw("set @unbalance = (SELECT SUM(debet)-SUM(kredit) from general_ledger a left join gl_detail b on a.id = b.rgl where CAST(tgl as date) between '$date_lr' and '$cur_tgl');"));
			DB::statement(DB::raw("UPDATE GL set amount = @unbalance where acc_id = '38999';"));
			DB::statement( DB::raw("SET @income = (SELECT coalesce(SUM(amount),0) from gl_lr where acc_id like '4%' or acc_id like '7%');"));
			DB::statement( DB::raw("SET @expense = (SELECT coalesce(SUM(amount),0) from gl_lr where acc_id like '5%' or acc_id like '6%' or acc_id like '8%');"));
			DB::statement(DB::raw("UPDATE GL set amount = -1*((-1*@income)-@expense) where acc_id = '38100';"));
			// $data = $this->db->query("select * from GL where acc_id = '38100'")->result_array();
			// print_r($data);
			DB::statement(DB::raw("INSERT into coa select b.acc_id as idparent1,b.name as parent1,b.alevel as parent1level,b.atype as parent1type,a.acc_id as idparent2,a.name as parent2,a.alevel as parent2level,a.atype as parent2type,a.acc_id as idparent3,a.name as parent3,a.alevel as parent3level,a.atype as parent3type,a.acc_id,a.name,a.atype from level2 a inner join level1 b on a.Parent = b.acc_id where a.atype = 'D'; "));
			DB::statement(DB::raw("INSERT into coa select c.acc_id as idparent1,c.name as parent1,c.alevel as parent1level,c.atype as parent1type,b.acc_id as idparent2,b.name as parent2,b.alevel as parent2level,b.atype as parent2type,a.acc_id as idparent3,a.name as parent3,a.alevel as parent3level,a.atype as parent3type,a.acc_id,a.name,a.atype from level3 a inner join level2 b on a.parent = b.acc_id inner join level1 c on b.parent = c.acc_id where a.atype = 'D'; "));			
			DB::statement(DB::raw("INSERT into coa select d.acc_id as idparent1,d.name as parent1,d.alevel as parent1level,d.atype as parent1type,c.acc_id as idparent2,c.name as parent2,c.alevel as parent2level,c.atype as parent2type,b.acc_id as idparent3,b.name as parent3,b.alevel as parent3level,b.atype as parent3type,a.acc_id,a.name,a.atype from level4 a inner join level3 b on a.parent = b.acc_id inner join level2 c on b.parent = c.acc_id inner join level1 d on c.parent = d.acc_id where a.atype = 'D';"));

			// $action_btn = "concat('<button class=''btn btn-success btn-xs'' href=''#'' accid=''',a.acc_id,'''><span class=''fa fa-pencil''></span></button>') as aksi,concat('<button class=''btn btn-success btn-xs'' href=''#'' accid=''',idparent1,''' disabled><span class=''fa fa-pencil''></span></button>') as aksi1,concat('<button class=''btn btn-success btn-xs'' href=''#'' accid=''',idparent2,'''><span class=''fa fa-pencil''></span></button>') as aksi2,concat('<button class=''btn btn-success btn-xs'' href=''#'' accid=''',idparent3,'''><span class=''fa fa-pencil''></span></button>') as aksi3";
			$myquery = DB::select("SELECT idparent1,parent1,parent1level,parent1type,idparent2,parent2,parent2level,parent2type,idparent3,parent3,parent3level,parent3type,a.acc_id,a.name,coalesce(b.amount,0) as amount,a.atype from coa a left join GL b on a.acc_id = b.acc_id where left(a.acc_id,1) in ($filter) order by a.acc_id;");

			$tes = "";
			if (Schema::hasTable('GL_LR'))
			{
				// Do something if exists
				$tes = "tesssss";

			}
			// return $myquery;
			echo json_encode($tes);
	}
}
