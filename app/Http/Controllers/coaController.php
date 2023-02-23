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
		$group = $request->input('group');
		$whr = "and a.location_id = '$lokasi'";
			$filter = $group;
			Schema::create('gl', function (Blueprint $table) {
				$table->increments('id');
				$table->string('acc_id', 18)->nullable()->default('0');
				$table->decimal('amount', 15,2)->nullable()->default('0');
				// Table only lasts as long as the connection persists.
				// $table->temporary();
				// The lookup column, with an index.
				// $table->string('lookup')->index();
				// The Property ID we're looking for.
				// $table->string('pid');
			});
			Schema::create('gl_lr', function (Blueprint $table) {
				$table->increments('id');
				$table->string('acc_id', 18)->nullable()->default('0');
				$table->decimal('amount', 15,2)->nullable()->default('0');
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

			$tmpTrx = DB::select("SELECT acc_id,SUM(debet)-SUM(kredit) as balance from general_ledger a left join gl_detail b on a.notrans = b.rgl where rlocation = '$dealer_ref' and date(tgl) between '2022-01-01' and '$cur_tgl' group by acc_id;");
                $dataSet = [];
                foreach ($tmpTrx as $s) {
                    $dataSet[] = [
                        'acc_id'  => $s->acc_id,
                        'amount'    => $s->balance,
                    ];
                }
            DB::table('gl')->insert($dataSet);
			DB::table('gl')->insert([ ['acc_id' => '38100', 'amount' => '0'], ['acc_id' => '38999', 'amount' => '0'] ]);

			$tmpgl = DB::select("SELECT acc_id,SUM(debet)-SUM(kredit) as balance from general_ledger a left join gl_detail b on a.notrans = b.rgl where rlocation = '$dealer_ref' and date(tgl) between '2022-01-01' and '$cur_tgl' group by acc_id;");
                $dataSet = [];
                foreach ($tmpgl as $g) {
                    $dataSet[] = [
                        'acc_id'  => $g->acc_id,
                        'amount'    => $g->balance,
                    ];
                }
            DB::table('gl_lr')->insert($dataSet);
			DB::table('gl_lr')->insert([ ['acc_id' => '38100', 'amount' => '0'], ['acc_id' => '38999', 'amount' => '0'] ]);

			
			// DB::query("INSERT into gl SELECT acc_id,SUM(debet)-SUM(kredit) as balance from general_ledger a left join gl_detail b on a.notrans = b.rgl where rlocation = '$dealer_ref' and date(tgl) between '2022-01-01' and '$cur_tgl' group by acc_id;");
			// DB::query("INSERT into gl values('38100','0'),('38999','0')");
			// DB::query("INSERT into gl_lr SELECT acc_id,SUM(debet)-SUM(kredit) as balance from general_ledger a left join gl_detail b on a.notrans = b.rgl where rlocation = '$dealer_ref' and date(tgl) between '2022-01-01' and '$cur_tgl' group by acc_id;");
			// DB::query("INSERT into gl_lr values('38100','0'),('38999','0')");
			$harta = DB::table('gl')->select(DB::raw('SUM(amount) as harta'))->where('acc_id', 'like', '1%')->first()->harta;
			$harta1 = DB::statement("set @harta = '$harta' ;");

			$hutang = DB::table('gl')->select(DB::raw('SUM(amount) as hutang'))->where('acc_id', 'like', '2%')->first()->hutang;
			$hutang1 = DB::statement("set @hutang = '$hutang' ;");

			$modal = DB::table('gl')->select(DB::raw('SUM(amount) as modal'))->whereIn('acc_id', array('31100','31200','31300'))->first()->modal;
			$modal1 = DB::statement("set @modal = '$modal' ;");

			$modalDisetor = DB::table('gl')->select(DB::raw('SUM(amount) as modaldisetor'))->whereNotIn('acc_id', array('31100','31200','31300'))->first()->modaldisetor;
			$modalDisetor1 = DB::statement("set @modalDisetor = '$modalDisetor' ;");

			$unbalance = DB::table('general_ledger')->select(DB::raw('SUM(debet)-SUM(kredit) as unbalance'))
						->leftJoin('gl_detail', 'general_ledger.id', '=', 'gl_detail.rgl')
						->whereBetween('tgl', [$date_lr, $cur_tgl])
						->first()
						->unbalance;
			$unbalance1 = DB::statement("set @unbalance = '$unbalance' ;");
			DB::table('gl')->where('acc_id', '38999')->update([ 'amount' => $unbalance]);

			// $data1 = $this->db->query("SELECT SUM(amount) from GL where acc_id like '4%' or acc_id like '7%'")->result_array();
			// print_r($data1);
			// $data1 = $this->db->query("SELECT coalesce(SUM(amount),0) from GL where acc_id like '5%' or acc_id like '6%' or acc_id like '8%'")->result_array();
			// print_r($unbalance);
			// DB::statement( DB::raw("set @hutang = (SELECT SUM(amount) from gl where acc_id acc_id '2%');"));
			// DB::statement( DB::raw("set @modal = (SELECT sum(amount) as amount from gl where acc_id in ('31100','31200','31300'));"));
			// DB::statement( DB::raw("set @modalDisetor = (SELECT SUM(amount) from gl where acc_id like '3%' and acc_id not in ('31100','31200','31300'));"));
			// DB::statement( DB::raw("set @unbalance = (SELECT SUM(debet)-SUM(kredit) from general_ledger a left join gl_detail b on a.id = b.rgl where CAST(tgl as date) between '$date_lr' and '$cur_tgl');"));
			$income = DB::table('gl')->select(DB::raw('SUM(amount) as income'))->where('acc_id', 'like', '4%')->orWhere('acc_id', 'like', '7%')->first()->income;
			$income1 = DB::statement("set @income = '$income' ;");
			$expense = DB::table('gl')->select(DB::raw('SUM(amount) as expense'))->where('acc_id', 'like', '5%')->orWhere('acc_id', 'like', '6%')->orWhere('acc_id', 'like', '8%')->first()->expense;
			$expense1 = DB::statement("set @expense = '$expense' ;");

			DB::table('gl')->where('acc_id', '38100')->update([ 'amount' => -1*((-1*$income)-$expense)]);

			// DB::statement(DB::raw("UPDATE GL set amount = @unbalance where acc_id = '38999';"));
			// DB::statement( DB::raw("SET @income = (SELECT coalesce(SUM(amount),0) from gl_lr where acc_id like '4%' or acc_id like '7%');"));
			// DB::statement( DB::raw("SET @expense = (SELECT coalesce(SUM(amount),0) from gl_lr where acc_id like '5%' or acc_id like '6%' or acc_id like '8%');"));
			// DB::statement(DB::raw("UPDATE GL set amount = -1*((-1*@income)-@expense) where acc_id = '38100';"));
			// $data = $this->db->query("select * from GL where acc_id = '38100'")->result_array();
			// print_r($data);
			// $inser1 = DB::raw("INSERT into coa select b.acc_id as idparent1,b.name as parent1,b.alevel as parent1level,b.atype as parent1type,a.acc_id as idparent2,a.name as parent2,a.alevel as parent2level,a.atype as parent2type,a.acc_id as idparent3,a.name as parent3,a.alevel as parent3level,a.atype as parent3type,a.acc_id,a.name,a.atype from level2 a inner join level1 b on a.Parent = b.acc_id where a.atype = 'D'; ");
			// DB::raw("INSERT into coa select c.acc_id as idparent1,c.name as parent1,c.alevel as parent1level,c.atype as parent1type,b.acc_id as idparent2,b.name as parent2,b.alevel as parent2level,b.atype as parent2type,a.acc_id as idparent3,a.name as parent3,a.alevel as parent3level,a.atype as parent3type,a.acc_id,a.name,a.atype from level3 a inner join level2 b on a.parent = b.acc_id inner join level1 c on b.parent = c.acc_id where a.atype = 'D'; ");			
			// DB::raw("INSERT into coa select d.acc_id as idparent1,d.name as parent1,d.alevel as parent1level,d.atype as parent1type,c.acc_id as idparent2,c.name as parent2,c.alevel as parent2level,c.atype as parent2type,b.acc_id as idparent3,b.name as parent3,b.alevel as parent3level,b.atype as parent3type,a.acc_id,a.name,a.atype from level4 a inner join level3 b on a.parent = b.acc_id inner join level2 c on b.parent = c.acc_id inner join level1 d on c.parent = d.acc_id where a.atype = 'D';");

			$coa1 = DB::table('level2 as a')
						->select('b.acc_id as idparent1', 'b.name as parent1', 'b.alevel as parent1level', 'b.atype as parent1type', 'a.acc_id as idparent2', 'a.name as parent2', 'a.alevel as parent2level', 'a.atype as parent2type', 'a.acc_id as idparent3', 'a.name as parent3', 'a.alevel as parent3level', 'a.atype as parent3type', 'a.acc_id', 'a.name', 'a.atype')
						->join('level1 as b', 'a.parent', '=', 'b.acc_id')->get();
                $dataC = [];
                foreach ($coa1 as $c) {
                    $dataC[] = [
                        'idparent1'  => $c->idparent1,
                        'parent1'    => $c->parent1,
						'parent1level'  => $c->parent1level,
                        'parent1type'    => $c->parent1type,
                        'parent2'    => $c->parent2,
						'parent2level'  => $c->parent2level,
                        'parent2type'    => $c->parent2type,
						'idparent2'  => $c->idparent2,
                        'parent3'    => $c->parent3,
						'parent3level'  => $c->parent3level,
                        'parent3type'    => $c->parent3type,
						'idparent3'  => $c->idparent3,
						'acc_id'  => $c->acc_id,
                        'name'    => $c->name,
						'atype'    => $c->atype,
                    ];
                }
            DB::table('coa')->insert($dataC);

			$coa2 = DB::table('level3 as a')
						->select('c.acc_id as idparent1', 'c.name as parent1', 'c.alevel as parent1level', 'c.atype as parent1type', 'b.acc_id as idparent2', 'b.name as parent2', 'b.alevel as parent2level', 'b.atype as parent2type', 'a.acc_id as idparent3', 'a.name as parent3', 'a.alevel as parent3level', 'a.atype as parent3type', 'a.acc_id', 'a.name', 'a.atype')
						->join('level2 as b', 'a.parent', '=', 'b.acc_id')
						->join('level1 as c', 'b.parent', '=', 'c.acc_id')
						->where('a.atype', 'D')
						->get();
                $dataCC = [];
                foreach ($coa2 as $cc) {
                    $dataCC[] = [
                        'idparent1'  => $cc->idparent1,
                        'parent1'    => $cc->parent1,
						'parent1level'  => $cc->parent1level,
                        'parent1type'    => $cc->parent1type,
                        'parent2'    => $cc->parent2,
						'parent2level'  => $cc->parent2level,
                        'parent2type'    => $cc->parent2type,
						'idparent2'  => $cc->idparent2,
                        'parent3'    => $cc->parent3,
						'parent3level'  => $cc->parent3level,
                        'parent3type'    => $cc->parent3type,
						'idparent3'  => $cc->idparent3,
						'acc_id'  => $cc->acc_id,
                        'name'    => $cc->name,
						'atype'    => $cc->atype,
                    ];
                }
            DB::table('coa')->insert($dataCC);

			$coa3 = DB::table('level4 as a')
						->select('d.acc_id as idparent1', 'd.name as parent1', 'd.alevel as parent1level', 'd.atype as parent1type', 'c.acc_id as idparent2', 'c.name as parent2', 'c.alevel as parent2level', 'c.atype as parent2type', 'b.acc_id as idparent3', 'b.name as parent3', 'b.alevel as parent3level', 'b.atype as parent3type', 'a.acc_id', 'a.name', 'a.atype')
						->join('level3 as b', 'a.parent', '=', 'b.acc_id')
						->join('level2 as c', 'b.parent', '=', 'c.acc_id')
						->join('level1 as d', 'c.parent', '=', 'd.acc_id')
						->where('a.atype', 'D')
						->get();
                $dataCCC = [];
                foreach ($coa3 as $ccc) {
                    $dataCCC[] = [
                        'idparent1'  => $ccc->idparent1,
                        'parent1'    => $ccc->parent1,
						'parent1level'  => $ccc->parent1level,
                        'parent1type'    => $ccc->parent1type,
                        'parent2'    => $ccc->parent2,
						'parent2level'  => $ccc->parent2level,
                        'parent2type'    => $ccc->parent2type,
						'idparent2'  => $ccc->idparent2,
                        'parent3'    => $ccc->parent3,
						'parent3level'  => $ccc->parent3level,
                        'parent3type'    => $ccc->parent3type,
						'idparent3'  => $ccc->idparent3,
						'acc_id'  => $ccc->acc_id,
                        'name'    => $ccc->name,
						'atype'    => $ccc->atype,
                    ];
                }
            DB::table('coa')->insert($dataCCC);
			// $action_btn = "concat('<button class=''btn btn-success btn-xs'' href=''#'' accid=''',a.acc_id,'''><span class=''fa fa-pencil''></span></button>') as aksi,concat('<button class=''btn btn-success btn-xs'' href=''#'' accid=''',idparent1,''' disabled><span class=''fa fa-pencil''></span></button>') as aksi1,concat('<button class=''btn btn-success btn-xs'' href=''#'' accid=''',idparent2,'''><span class=''fa fa-pencil''></span></button>') as aksi2,concat('<button class=''btn btn-success btn-xs'' href=''#'' accid=''',idparent3,'''><span class=''fa fa-pencil''></span></button>') as aksi3";
			$myquery = DB::select("SELECT idparent1,parent1,parent1level,parent1type,idparent2,parent2,parent2level,parent2type,idparent3,parent3,parent3level,parent3type,a.acc_id,a.name,coalesce(b.amount,0) as amount,a.atype from coa a left join GL b on a.acc_id = b.acc_id where left(a.acc_id,1) in ($filter) order by a.acc_id;");
			// $myquery = DB::table('coa as a')
			// 			->join('GL as b', 'a.acc_id', 'b.acc_id')
			// 			->select('a.idparent1','a.parent1','a.parent1level','a.parent1type','a.idparent2','a.parent2','a.parent2level','a.parent2type','a.idparent3','a.parent3','a.parent3level','a.parent3type','a.acc_id','a.name',DB::raw('coalesce(b.amount,0) as amount'),'a.atype')
			// 			->whereIn(DB::raw('LEFT(a.acc_id, 1)'), array($filter))
			// 			->orderBy('a.acc_id')
			// 			->get();
			// print_r($myquery);
			return response($myquery);
	}
}
