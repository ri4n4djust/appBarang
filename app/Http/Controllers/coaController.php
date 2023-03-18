<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;

class coaController extends Controller
{
    //
	public function create_acc(Request $request){
		try{
            $exception = DB::transaction(function() use ($request){
				$level = $request->input('level');
				$table = 'level'.$level;
				$old_id = $request->input('oldid');

				$accid = $request->input('accid');
				$det = DB::table($table)->where('acc_id', $accid)->first();
				if($old_id == ''){					
					$id = $det->id;
					$accid = $request->input('accid');
					$alevel = $det->alevel;
					$parent = $request->input('parent');
					$name = $request->input('name');
					$jurnal = 'JK';
					$amount = $request->input('amount');
					$jtype = $det->jtype;
					$atype = $det->atype;
					$trigered = '0';
					$active = '1';
					$date_create = \Carbon\Carbon::now()->toDateTimeString();
				}else{
					$id = strtotime("now");
					$accid = $request->input('accid');
					$alevel = $det->alevel;
					$parent = $request->input('parent');
					$name = $request->input('name');
					$jurnal = 'JK';
					$amount = $request->input('amount');
					$jtype = $det->jtype;
					$atype = $det->atype;
					$trigered = '0';
					$active = '1';
					$date_create = \Carbon\Carbon::now()->toDateTimeString();
				}

				

				DB::table($table)->upsert([
					'id' => $id,
					'acc_id' => $accid,
					'alevel' => $alevel,
					'atype' => $atype,
					'parent' => $parent,
					'name' => $name,
					'jurnal' => $jurnal,
					'amount' => $amount,
					'jtype' => $jtype,
					'trigered' => $trigered,
					'active' => $active,
					'date_create' => $date_create
				],
				[
					'acc_id' => $accid,
					'alevel' => $alevel,
					'atype' => $atype,
					'parent' => $parent,
					'name' => $name,
					'jurnal' => $jurnal,
					'amount' => $amount,
					'jtype' => $jtype,
					'trigered' => $trigered,
					'active' => $active,
					'date_create' => $date_create
				]);
			DB::commit();
		});
			if(is_null($exception)) {
				return response()->json([
					'success' => true,
					'message' => 'Berhasil update Akun',
					// 'data' => $data
				], 200);
			} else {
				DB::rollback();
				return response()->json([
					'success' => false,
					'message' => 'Post Gagal Diupdate!',
				], 500);
			}
		} catch (\Exception $e) {
			DB::rollback();
			// something went wrong
			return response()->json([
				'success' => false,
				'message' => 'exception'.$e,
			], 400);
		}
	}
    public function get_acc_list(Request $request){
		$level = $request->input('level');
		$group = $request->input('group');
		$accid = $request->input('accid');
		$acc_list = get_data_acc_list($level,$group,$accid);
		$data['acc_list'] = $acc_list;

		echo json_encode($data);
	}

	public function get_coa(Request $request){
		$ac = $request->input('acc');
		if($ac == ''){
			$where = '';
		}else{
			$where = "where acc_id like '$ac%'";
		}
		$data = DB::select("SELECT * FROM (SELECT acc_id,name FROM `level2` where atype = 'D' union SELECT acc_id,name FROM `level3` where atype = 'D' union SELECT acc_id,name FROM `level4` where atype = 'D') acc $where order by acc_id;");
		// $lvl1 = get_level1(1); 
		// $lvl2 = get_level2(2);
		// $lvl3 = get_level3(3);
		// $lvl4 = get_level4(4);
		// $data['level1'] = $lvl1;
		// $data['level2'] = $lvl2;
		// $data['level3'] = $lvl3;
		// $data['level4'] = $lvl4;

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

			$income = DB::table('gl')->select(DB::raw('SUM(amount) as income'))->where('acc_id', 'like', '4%')->orWhere('acc_id', 'like', '7%')->first()->income;
			$income1 = DB::statement("set @income = '$income' ;");
			$expense = DB::table('gl')->select(DB::raw('SUM(amount) as expense'))->where('acc_id', 'like', '5%')->orWhere('acc_id', 'like', '6%')->orWhere('acc_id', 'like', '8%')->first()->expense;
			$expense1 = DB::statement("set @expense = '$expense' ;");

			DB::table('gl')->where('acc_id', '38100')->update([ 'amount' => -1*((-1*$income)-$expense)]);


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
			$data = DB::select("SELECT idparent1,parent1,parent1level,parent1type,idparent2,parent2,parent2level,parent2type,idparent3,parent3,parent3level,parent3type,a.acc_id,a.name,coalesce(b.amount,0) as amount,a.atype from coa a left join GL b on a.acc_id = b.acc_id where left(a.acc_id,1) in ($filter) order by a.acc_id;");
			// $myquery = DB::table('coa as a')
			// 			->join('GL as b', 'a.acc_id', 'b.acc_id')
			// 			->select('a.idparent1','a.parent1','a.parent1level','a.parent1type','a.idparent2','a.parent2','a.parent2level','a.parent2type','a.idparent3','a.parent3','a.parent3level','a.parent3type','a.acc_id','a.name',DB::raw('coalesce(b.amount,0) as amount'),'a.atype')
			// 			->whereIn(DB::raw('LEFT(a.acc_id, 1)'), array($filter))
			// 			->orderBy('a.acc_id')
			// 			->get();
			// print_r($data);


			$groups = array();
			foreach ($data as $item) {
			    $key = $item->idparent1;
			    if (!array_key_exists($key, $groups)) {
			        $groups[$key] = array(
			            'acc_id' => $item->idparent1,
			            'name' => $item->parent1,
			            'amount' => $item->amount,
			            'level' => '1',
			            'tipe' => $item->parent1type.substr($item->idparent1, 0,1),
						'parent1' => '0',
			        );
			    } else {
					// print_r( $item->amount);
			      $groups[$key]['amount'] = $groups[$key]['amount'] + $item->amount;   
				//   print_r($groups[$key]['amount'].'break');   
			    }

			    $key = $item->idparent2;
			    if (!array_key_exists($key, $groups)) {
			        $groups[$key] = array(
			            'acc_id' => $item->idparent2,
			            'name' => $item->parent2,
			            'amount' => $item->amount,
			            'level' => '2',
			            'tipe' => $item->parent2type.substr($item->idparent2, 0,2),
						'parent2' => $item->idparent1
			        );
			    } else {
			    //   if((double)$groups[$key]['amount'] == 0){
			        $groups[$key]['amount'] = $groups[$key]['amount'] + $item->amount;     
			    //   }  
			    }

			    $key = $item->idparent3;
			    if (!array_key_exists($key, $groups)) {
			        $groups[$key] = array(
			            'acc_id' => $item->idparent3,
			            'name' => $item->parent3,
			            'amount' => $item->amount,
			            'level' => '3',
			            'tipe' => $item->parent3type.substr($item->idparent3, 0,3),
						'parent3' => $item->idparent2
			        );
			    } else {
					// print_r($groups[$key]['amount']);
			    //   if((double)$groups[$key]['amount'] == 0){
			           $groups[$key]['amount'] = $groups[$key]['amount'] + $item->amount;     
			        // }  
			    }

			    $key3 = $item->acc_id;
			    if (!array_key_exists($key3, $groups)) {
			        $groups[$key3] = array(
			            'acc_id' => $item->acc_id,
			            'name' => $item->name,
			            'amount' => $item->amount,
			            'level' => '4',
			            'tipe' => $item->atype.substr($item->acc_id, 0,4),
						'parent4' => $item->idparent3
			        );
			    } else {
			      // $str .= $key.' '.$nrw.'=>'.$nrow."<br>";
			        if((double)$groups[$key3]['amount'] == 0){
			          $groups[$key3]['amount'] = $groups[$key3]['amount'] + $item->amount;     
			        }  
			    }
			    // $nrw += 1;
			}

			$head_level1 = '';
			$name_level1 = '';
			$amount_Level1 = 0;
			$head_idlevel1 = '';

			$head_level2 = '';
			$name_level2 = '';
			$amount_Level2 = 0;
			$head_idlevel2 = '';

			$head_level3 = '';
			$name_level3 = '';
			$amount_Level3 = 0;
			$head_idlevel3 = '';

			

			$acc = array();
			$i = 0;

			$tot_income = 0;
			$tot_hpp = 0;
			$tot_byyop = 0;
			$tot_pendlain = 0;
			$tot_byylain = 0;
			// echo "<div style='overflow:auto'>";
			// print_r($groups);

			foreach($groups as $value){
			  $h_tipe = substr($value['tipe'], 0,1);
			  switch ($value['level']) {
			    case '1':
					if($h_tipe == 'H'){
						if($head_level1 == ''){
						$head_level1 = $value['tipe'];
						$name_level1 = "Jumlah Total ".$value['name'];
						$amount_Level1 = $value['amount'];
						$head_idlevel1 = substr($value['acc_id'], 0,1).'9998';
						switch ($head_level1) {
						  case 'H4':
							$tot_income = $value['amount'];
							break;
						  case 'H5':
							$tot_hpp = $value['amount'];
							break;
						  case 'H6':
							$tot_byyop = $value['amount'];
							break;     
						  case 'H7':
							$tot_pendlain = $value['amount'];
							break;          
						  default:
							$tot_byylain = $value['amount'];
							break;
						}
						$acc[$i] = array(
						  'acc_id' => $head_idlevel1,
						  'name' => $name_level1,
						  'amount' => $amount_Level1,
						  'level' => '1',
						  'tipe' => $value['tipe'],
						  'jenis'=> 'Total',
						);        
					  }else{
						if($head_level1 != $value['tipe']){
						  $head_level1 = $value['tipe'];
						  $name_level1 = "Jumlah Total ".$value['name'];
						  $amount_Level1 = $value['amount'];
						  $head_idlevel1 = substr($value['acc_id'], 0,1).'9998';
						  switch ($head_level1) {
							case 'H4':
							  $tot_income = $value['amount'];
							  break;
							case 'H5':
							  $tot_hpp = $value['amount'];
							  break;
							case 'H6':
							  $tot_byyop = $value['amount'];
							  break;
							case 'H7':
							  $tot_pendlain = $value['amount'];
							  break;             
							default:
							  $tot_byylain = $value['amount'];
							  break;
						  }
						  $acc[$i] = array(
							'acc_id' => $head_idlevel1,
							'name' => $name_level1,
							'amount' => $amount_Level1,
							'level' => '1',
							'tipe' => $value['tipe'],
							'jenis'=> 'Total',
						  );
						}
					  }
			   
					  if($head_level1 == 'H5'){
						$i+=1;        
						$acc[$i] = array(
						  'acc_id' => '59999',
						  'name' => 'Aset Bersih Sebelum Biaya',
						  'amount' => (double)$tot_income-(double)$tot_hpp,
						  'level' => '0',
						  'tipe' => 'H',
						  'jenis'=> 'Total',
						);
					  }elseif($head_level1 == 'H6'){
						$i+=1;        
						$acc[$i] = array(
						  'acc_id' => '69999',
						  'name' => 'Asset Bersih Operasional',
						  'amount' => ((double)$tot_income-(double)$tot_hpp)-(double)$tot_byyop,
						  'level' => '0',
						  'tipe' => 'H',
						  'jenis'=> 'Total',
						);
					  }elseif($head_level1 == 'H7'){
						$i+=1;        
						$acc[$i] = array(
						  'acc_id' => '79999',
						  'name' => 'Aset Bersih Setelah Penerimaan Lain',
						  'amount' => (double)$tot_income-(double)$tot_hpp-(double)$tot_byyop+(double)$tot_pendlain,
						  'level' => '0',
						  'tipe' => 'H',
						  'jenis'=> 'Total',
						);
					  }else{
						$hasil = $tot_hpp; //((double)$tot_income-(double)$tot_hpp)-(double)$tot_byyop ;
						// if ($head_level1 != '') {
						  $i+=1;        
						  $acc[$i] = array(
							'acc_id' => '89999',
							'name' => 'Asset Bersih Setelah Biaya Lain',
							'amount' => $hasil, //(((double)$tot_income-(double)$tot_hpp)-(double)$tot_byyop),
							'level' => '0',
							'tipe' => 'H',
							'jenis'=> 'Total',
						  );
						// }          
					  }
			  
					  $i+=1;        
					  $acc[$i] = array(
						'acc_id' => $value['acc_id'],
						'name' => $value['name'],
						'amount' => $value['amount'],
						'level' => $value['level'],
						'tipe' => $value['tipe'],
						'jenis'=> 'Header',
					  );
					}else{ //--------- tipe bukan header
					  $acc[$i] = array(
						'acc_id' => $value['acc_id'],
						'name' => $value['name'],
						'amount' => $value['amount'],
						'level' => $value['level'],
						'tipe' => $value['tipe'],
						'jenis'=> 'Detail',
					  );
					}
			  

			      
			      break;

			      // ------------------------ end of level1
			    
			    case '2':
			      if($h_tipe == 'H'){
			        if($head_level2 == ''){
			          $head_level2 = $value['tipe'];
			          $name_level2 = "Total".$value['name'];
			          $amount_Level2 = $value['amount'];
			          $head_idlevel2 = substr($value['acc_id'], 0,2).'999';
					  $parent2 = $value['parent2'];
			          $acc[$i] = array(
			            'acc_id' => $head_idlevel2,
			            'name' => $name_level2,
			            'amount' => $amount_Level2,
			            'level' => '2',
			            'tipe' => $value['tipe'],
			            'jenis'=> 'Total',
						'parent' => $parent2,
			          );        
			        }else{
			          if($head_level2 != $value['tipe']){
			            $head_level2 = $value['tipe'];
			            $name_level2 = "Total".$value['name'];
			            $amount_Level2 = $value['amount'];
			            $head_idlevel2 = substr($value['acc_id'], 0,2).'999';
						$parent2 = $value['parent2'];
			            $acc[$i] = array(
			              'acc_id' => $head_idlevel2,
			              'name' => $name_level2,
			              'amount' => $amount_Level2,
			              'level' => '2',
			              'tipe' => $value['tipe'],
			              'jenis'=> 'Total',
						  'parent' => $parent2,
			            );
			          }
			        }
			        $i+=1;
			        $acc[$i] = array(
			          'acc_id' => $value['acc_id'],
			          'name' => $value['name'],
			          'amount' => $value['amount'],
			          'level' => $value['level'],
			          'tipe' => $value['tipe'],
			          'jenis'=> 'Header',
					  'parent' => $parent2
			        );
			      }else{
			        $acc[$i] = array(
			          'acc_id' => $value['acc_id'],
			          'name' => $value['name'],
			          'amount' => $value['amount'],
			          'level' => $value['level'],
			          'tipe' => $value['tipe'],
			          'jenis'=> 'Detail',
					  'parent' => $value['parent2'],
			        );
			      }     
			      
			      
			      break;

			      // ------------------------ end of level2

			    case '3':
			      if($h_tipe == 'H'){
			        if($head_level3 == ''){
			          $head_level3 = $value['tipe'];
			          $name_level3 = "T.".$value['name'];
			          $amount_Level3 = $value['amount'];
			          $head_idlevel3 = substr($value['acc_id'], 0,3).'99';
					  $parent3 = $value['parent3'];
			          $acc[$i] = array(
			            'acc_id' => $head_idlevel3,
			            'name' => $name_level3,
			            'amount' => $amount_Level3,
			            'level' => '3',
			            'tipe' => $value['tipe'],
			            'jenis'=> 'Total',
						'parent' => $parent3
			          );        
			        }else{
			          if($head_level3 != $value['tipe']){
			            $head_level3 = $value['tipe'];
			            $name_level3 = "T.".$value['name'];
			            $amount_Level3 = $value['amount'];
			            $head_idlevel3 = substr($value['acc_id'], 0,3).'99';
						$parent3 = $value['parent3'];
			            $acc[$i] = array(
			              'acc_id' => $head_idlevel3,
			              'name' => $name_level3,
			              'amount' => $amount_Level3,
			              'level' => '3',
			              'tipe' => $value['tipe'],
			              'jenis'=> 'Total',
						  'parent' => $parent3
			            );
			          }
			        }
			        $i+=1;
			        $acc[$i] = array(
			          'acc_id' => $value['acc_id'],
			          'name' => $value['name'],
			          'amount' => $value['amount'],
			          'level' => $value['level'],
			          'tipe' => $value['tipe'],
			          'jenis'=> 'Header',
					  'parent' => $parent3
			        );
			      }else{
			        $acc[$i] = array(
			          'acc_id' => $value['acc_id'],
			          'name' => $value['name'],
			          'amount' => $value['amount'],
			          'level' => $value['level'],
			          'tipe' => $value['tipe'],
			          'jenis'=> 'Detail',
					  'parent' => $value['parent3']
			        );
			      }      
			      
			      
			      break;

			      // ------------------------ end of level3

			    case '4':
			      $i+=1;
			      $acc[$i] = array(
			        'acc_id' => $value['acc_id'],
			        'name' => $value['name'],
			        'amount' => $value['amount'],
			        'level' => $value['level'],
			        'tipe' => $value['tipe'],
			        'jenis'=> 'Detail',
					'parent' => $value['parent4']
			        );
			      break;

			    default:
			      # code...
			      break;
			  }
			  $i+=1;
			}
		  	$keys = array_column($acc, 'acc_id');

		    array_multisort($keys, SORT_ASC, $acc);
			// print_r($acc);
		    // $gl['acc'] = $acc;
			// return response($acc);
			return response([
				'success' => true,
				'message' => 'Data Acc',
				'data' => $acc
			], 200);
	}
}
