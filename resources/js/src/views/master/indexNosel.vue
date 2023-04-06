<template>
    <div class="layout-px-spacing dash_2">
        <teleport to="#breadcrumb">
            <ul class="navbar-nav flex-row">
                <li>
                    <div class="page-header">
                        <nav class="breadcrumb-one" aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item active" aria-current="page"><span>Widgets</span></li>
                            </ol>
                        </nav>
                    </div>
                </li>
            </ul>
        </teleport>

        <div class="row layout-top-spacing">
            
            <div class="col-md-12 layout-spacing">
                <div class="widget widget-statistics">
                    <div class="widget-heading">
                        <h5>Statistics</h5>
                        
                    </div>
                    <div class="widget-content">
                        <div class="row">
                            <div class="col">
                                <div class="w-detail">
                                    <p class="w-title">{{ nama_bbm  }}</p>
                                    <!-- <p class="w-stats">Harga  {{ Number(last_price).toLocaleString()}}</p> -->
                                    <button class="btn btn-primary mb-2 me-1" data-bs-toggle="modal" data-bs-target="#exampleModalCenter">KUPON</button>
                                    <button class="btn btn-primary mb-2 me-1" data-bs-toggle="modal" data-bs-target="#modalBiaya">BIAYA</button>
                                    <button class="btn btn-primary mb-2 me-1" data-bs-toggle="modal" data-bs-target="#modalLinkAja">LINK AJA</button>
                                    <button class="btn btn-primary mb-2 me-1" @click="simpan_all">SIMPAN</button>
                                    <button class="btn btn-secondary btn-danger mb-2 me-1" @click="router.go(-1)">Kembali</button>
                                    <!-- <router-link :to="{ name: 'bbm'}" class="btn btn-secondary btn-danger mb-2 me-1">Kembali</router-link> -->
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="w-detail">
                                    <p class="w-title">Regu </p>
                                    <select class="form-select form-select-sm" v-model="regu" >
                                        <option value="all" selected>All</option>
                                        <option :value="ls.reguPegawai" v-for="ls in nosels.regu" :key="ls.id_nosel">{{ ls.reguPegawai }}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="w-detail">
                                    <p class="w-title">Tanggal</p>
                                    <flat-pickr v-model="date1" 
                                    :config="{dateFormat: 'Y-m-d'}" 
                                    class="form-control flatpickr active form-control-sm"></flat-pickr>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>

            <div class="col-md-12 layout-spacing">
                <div class="widget widget-statistics">

                    <div class="widget-content">
                        <div class="row">
                            <div class="col-3">
                                <div class="w-detail">
                                   
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th colspan="2">Kupon </th>
                                                </tr>
                                            </thead>
                                            <tbody role="rowgroup">
                                                <tr v-for="k in nosels.kupon" :key="k.kdp" >
                                                    <td aria-colindex="1" role="cell">{{ k.kdp }}</td>
                                                    <td aria-colindex="2" role="cell">{{ Number(k.nilaiKupon).toLocaleString() }}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                            <div class="col-3">
                                <div class="w-detail">
                                    
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th colspan="2">Biaya</th>
                                                </tr>
                                            </thead>
                                            <tbody role="rowgroup">
                                                <tr v-for="b in nosels.biaya" :key="b.ketBiaya" >
                                                    <td aria-colindex="1" role="cell">{{ b.ketBiaya }}</td>
                                                    <td aria-colindex="2" role="cell">{{ Number(b.nilaiBiaya).toLocaleString() }}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                            <div class="col-3">
                                <div class="w-detail">
                                    
                                    <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th colspan="2">Link Aja</th>
                                        </tr>
                                    </thead>
                                    <tbody role="rowgroup">
                                        <tr v-for="k in nosels.link" :key="k.kdp" >
                                            <td aria-colindex="1" role="cell">{{ k.kdbm }}</td>
                                            <td aria-colindex="2" role="cell">{{ Number(k.nilaiLink).toLocaleString() }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>

            <!-- <div class="col-md-4 layout-spacing" v-for="list, index in nosels.nosel" :key="list.id_nosel">
                <div class="widget widget-card-two">
                    <div class="widget-heading">
                        <div class="media">
                            <div class="media-aside align-self-start">
                                <div class="w-img">
                                    <img src="@/assets/images/nosel.jpg" alt="img-fluid" />
                                </div>
                            </div>
                            <div class="media-body">
                                <h6> {{ list.nama_nosel }}</h6>
                                <p class="meta-date-time"></p>
                                <a href="javascript:;" class="btn btn-secondary">{{ Number(list.meter_akhir).toLocaleString() }}</a>
                                <a href="javascript:;" class="btn btn-secondary">{{ Number(list.harga).toLocaleString() }}</a>
                            </div>
                        </div>
                    </div>
                    <div class="widget-content">
                        <div class="widget widget-transaction">
                            <div class="widget-content">
                                <div class="transactions-list">
                                    <div>
                                        <div class="t-name">
                                            <h4>{{ Math.abs(meter_now[index] - list.meter_akhir) }}</h4>
                                            <p>Liter</p>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="t-name">
                                            <h4>{{ Number(Math.abs((meter_now[index] - list.meter_akhir) * list.harga)).toLocaleString() }}</h4>
                                            <p>Nilai Penjualan</p>
                                        </div>
                                    </div>
                                </div>

                                
                            </div>
                        </div>
                        <h3><input type="text" class="form-control" v-model="meter_now[index]" ></h3>
                        <button type="button" class="btn btn-success mb-2 me-1" @click="saveTransBbm(id_nosel=list.id_nosel,
                                                                                                    code_bbm=list.r_bbm,
                                                                                                    kodeBrg = list.r_code_bbm,
                                                                                                    oldmeter=list.meter_akhir,
                                                                                                    newmeter=meter_now[index],
                                                                                                    hrg=list.harga,
                                                                                                    costltr=meter_now[index] - list.meter_akhir,
                                                                                                    jual=(meter_now[index] - list.meter_akhir) * list.harga
                                                                                                     )">Simpan</button>
                    </div>
                    <div class="widget-content">
                        <div class="widget-content table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th><div class="td-content">Regu</div></th>
                                        <th><div class="td-content">Liter</div></th>
                                        <th><div class="td-content">Total</div></th>
                                        <th><div class="td-content">Aksi</div></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="lis in nosels.trs" :key="lis.id_nosel">
                                            <td><div v-if="list.id_nosel === lis.r_nosel" class="td-content text-primary">{{ lis.r_regu }}</div></td>
                                            <td><div v-if="list.id_nosel === lis.r_nosel" class="td-content">{{ lis.cost_ltr }}</div></td>
                                            <td><div v-if="list.id_nosel === lis.r_nosel" class="td-content">{{ Number(lis.total).toLocaleString() }}</div></td>
                                            <td>
                                                <div v-if="list.id_nosel === lis.r_nosel" class="icon-content-container" >
                                                    <div class="icon-container"><i class="far fa-edit"></i><span class="icon-name"></span></div>
                                                </div>
                                            </td>
                                        
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div> -->

            <Kupon/>
            <Biaya/>
            <LinkAja/>

            <vue-final-modal v-model="isOpen">
            <!-- <div class="modal fade" id="modal_demo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
                <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Update meter Nosel</h5>
                            <button type="button" data-dismiss="modal" data-bs-dismiss="modal" aria-label="Close" class="btn-close"></button>
                        </div>
                        <div class="modal-body">
                            <h4 class="modal-heading mb-4 mt-2">Update meter</h4>
                            <!-- <form> -->
                                <div class="row mb-4">
                                    <div class="col-sm-4">
                                        <label for="inputState">Tgl</label>
                                        <flat-pickr v-model="input_perubahan.tglPerubahan" 
                                        :config="{dateFormat: 'd-m-Y', static: true}" 
                                        class="form-control form-control-sm flatpickr active" placeholder="Due Date">
                                        </flat-pickr>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col-sm">
                                        <label for="inputState">Harga Terbaru</label>
                                        <input v-model="input_perubahan.meter_baru" class="form-control form-control-sm" placeholder="Nilai" @keypress="onlyNumber" />
                                    </div>
                                    <div class="col-sm-4">
                                        <label for="inputState">Simpan</label><br>
                                        <a class="btn btn-primary" @click="Simpan_meter">Simpan</a>
                                    </div>
                                </div>
                                
                            <!-- </form> -->

                            

                        </div>
                        <div class="modal-footer">
                            <!-- <button type="button" class="btn" data-dismiss="modal" data-bs-dismiss="modal"><i class="flaticon-cancel-12"></i> Discard</button> -->
                            <!-- <button type="button" class="btn btn-primary" @click="Simpan">Save</button> -->
                        </div>
                    </div>
                </div>
            <!-- </div> -->
        </vue-final-modal>

        </div>

        <div class="table-responsive">
            <table role="table" aria-busy="false" aria-colcount="5" class="table table-hover table-bordered" >
                <thead role="rowgroup">
                    <tr role="row">
                        <th role="columnheader" scope="col" aria-colindex="1"><div>Nozel</div></th>
                        <th role="columnheader" scope="col" aria-colindex="2"><div>Meter Awal</div></th>
                        <th role="columnheader" scope="col" aria-colindex="3"><div>Meter Akhir</div></th>
                        <th role="columnheader" scope="col" aria-colindex="4"><div>Volume</div></th>
                        <th role="columnheader" scope="col" aria-colindex="5"><div>Harga</div></th>
                        <th role="columnheader" scope="col" aria-colindex="4"><div>Total</div></th>
                    </tr>
                </thead>
                <tbody role="rowgroup">
                    <tr role="row" v-for="list, index in nosels.nosel" :key="list.id_nosel">
                        <td> {{ list.nama_nosel }} 
                            <a href="javascript:void(0);" data-bs-toggle="tooltip" title="Edit" @click="openModal(list)">
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="24"
                                    height="24"
                                    viewBox="0 0 24 24"
                                    fill="none"
                                    stroke="currentColor"
                                    stroke-width="2"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    class="feather feather-edit-2"
                                >
                                    <path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path>
                                </svg>
                            </a>
                        </td>
                        <td>{{ Number(list.meter_akhir).toLocaleString() }}</td>
                        <td >
                            <div :style="{ 'width': inpt + 'px' }">
                                <input type="text" class="form-control form-control-sm col-sm-4" v-model="meter_now[index]" >
                            </div>
                        </td>
                        <td v-if="meter_now[index] != ''">{{ Math.abs(meter_now[index] - list.meter_akhir) }}</td>
                        <td v-else>0</td>
                        <td >{{ Number(list.harga).toLocaleString() }}</td>
                        <td v-if="meter_now[index] != ''">{{ Number((meter_now[index] - list.meter_akhir) * list.harga).toLocaleString() }}</td>
                        <td v-else>0</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>
<script setup>
    import '@/assets/sass/widgets/widgets.scss';

    import flatPickr from 'vue-flatpickr-component';
    import 'flatpickr/dist/flatpickr.css';
    import '@/assets/sass/forms/custom-flatpickr.css';

    import '@/assets/sass/scrollspyNav.scss';
    import '@/assets/sass/components/custom-sweetalert.scss';

    import '@/assets/sass/scrollspyNav.scss';
    import '@/assets/sass/font-icons/fontawesome/css/regular.css';
    import '@/assets/sass/font-icons/fontawesome/css/fontawesome.css';
    import feather from 'feather-icons';
    import Kupon from './kupon.vue';
    import Biaya from './biaya.vue';
    import LinkAja from './linkaja.vue';

    import moment from "moment";

    import { computed, ref, onMounted } from 'vue';
    import { useStore } from 'vuex';
    import { useRouter, useRoute } from 'vue-router'

    import { useMeta } from '@/composables/use-meta';
    // import index from 'vue3-json-excel';
    useMeta({ title: 'Detail Nozzel' });

    const store = useStore();
    const router = useRouter();
    const route = useRoute();

    const props = defineProps({
        id: String,
        nama_bbm: String,
        last_meter: String,
        last_price: String,
    });
    const date1 = ref(moment().format("YYYY-MM-DD"));
    const meter_now = ref({});
    const regu = ref(null);
    const inpt = ref(250);
    // const listtrans = ref([]);

    const nosel_id = ref();
    const meter_old = ref();
    const pph22 = ref({});
    const input_perubahan = ref({
        tglPerubahan: moment().format('D-M-YYYY'),
        nosel_id: nosel_id,
        meter_lama: meter_old
    })
    const isOpen = ref(false);
    const openModal = (list) => {
        console.log(list)
        nosel_id.value = list.id_nosel;
        meter_old.value = list.meter_akhir;
        isOpen.value = true;
    }

    function Simpan_meter() {
        console.log(input_perubahan.value)
        store.dispatch('UpdateMeterNosel', input_perubahan.value)
        isOpen.value = false;
        getNosel();
    }
    
    
    const nosels = computed(() => {
        const nosel = store.getters.StateNosel;
        const trs = store.getters.STransNosel;
        const regu = store.getters.STransNoselRegu;
        const kupon = store.getters.Skupon;
        const biaya = store.getters.Sbiaya;
        const link = store.getters.Slink;
        return { nosel, trs, regu, kupon, biaya, link }
    });
    
    const simpan_all = () =>{
        const nosel = store.getters.StateNosel;
        // console.log(nosel)

        const tgl = moment(date1.value).format("YYYY-MM-DD")
        const tglc = moment(date1.value).format("YYYYMMDD")
        
        var dataArr = nosel
        const arr = [];
        for (let i = 0; i < dataArr.length; i++) {
            // console.log({kdBarang : dataArr[i].r_kdBarang, nmBarang : dataArr[i].r_nmBarang,});
            let last_meter =  meter_now.value[i];
            if(meter_now.value[i] === ''){
                last_meter = dataArr[i].meter_akhir;
            };
            let id_nosel = dataArr[i].id_nosel
            let cost = last_meter - dataArr[i].meter_akhir  || 0;
            let subto = dataArr[i].harga * cost || 0;
            let subtohpp = dataArr[i].last_price * cost || 0;
            // subto = subto ?? 0 ;
            
            // let ket = keterangan.value[i]
            if (subto === 0){
                last_meter = dataArr[i].meter_akhir;
            } else{
                last_meter =  meter_now.value[i];
            };
            
            arr.push ({
                'kd_bbm': dataArr[i].r_bbm,
                'kodeBrg': dataArr[i].r_code_bbm,
                'kd_trans': tglc+regu.value,
                'r_nosel': id_nosel,
                'r_regu': regu.value,
                'tgl_transaksi': tgl, 
                'cost_ltr': cost, 
                'old_price': dataArr[i].last_price,
                'last_price': dataArr[i].harga,
                'awal_meter': dataArr[i].meter_akhir,
                'last_meter':  last_meter, // meter_now.value[i],
                'total': subto,
                'totalhpp': subtohpp,
                'pph22' : pph22.value
            })
            // tota += parseInt(subto)
            // total.value = tota
                // console.log(subto)
            // if (dataArr[i].r_bbm === 1) {
            //     totalpx += parseInt(subto);
            // }
                
        
        }

        const bbmNow = store.getters.StateBbm;

        const totalPXHpp = arr.filter(i => i.kd_bbm === 1).reduce((a, b) => Number(a) + Number(b.totalhpp), 0);
        const totalPLHpp = arr.filter(i => i.kd_bbm === 2).reduce((a, b) => Number(a) + Number(b.totalhpp), 0);
        const totalDXHpp = arr.filter(i => i.kd_bbm === 3).reduce((a, b) => Number(a) + Number(b.totalhpp), 0);
        const totalPX = arr.filter(i => i.kd_bbm === 1).reduce((a, b) => Number(a) + Number(b.total), 0);
        const totalPL = arr.filter(i => i.kd_bbm === 2).reduce((a, b) => Number(a) + Number(b.total), 0);
        const totalDX = arr.filter(i => i.kd_bbm === 3).reduce((a, b) => Number(a) + Number(b.total), 0);
        const totalPXL = arr.filter(i => i.kd_bbm === 1).reduce((a, b) => Number(a) + Number(b.cost_ltr), 0);
        const totalPLL = arr.filter(i => i.kd_bbm === 2).reduce((a, b) => Number(a) + Number(b.cost_ltr), 0);
        const totalDXL = arr.filter(i => i.kd_bbm === 3).reduce((a, b) => Number(a) + Number(b.cost_ltr), 0);

        const accPersediaanPX = bbmNow.filter(k => k.code_bbm === 'BRG0001');
        const acchppPX = bbmNow.filter(k => k.code_bbm === 'BRG0001');
        const accidPX = bbmNow.filter(k => k.code_bbm === 'BRG0001');
        const accPersediaanPL = bbmNow.filter(k => k.code_bbm === 'BRG0002');
        const acchppPL = bbmNow.filter(k => k.code_bbm === 'BRG0002');
        const accidPL = bbmNow.filter(k => k.code_bbm === 'BRG0002');
        const accPersediaanDX = bbmNow.filter(k => k.code_bbm === 'BRG0003');
        const acchppDX = bbmNow.filter(k => k.code_bbm === 'BRG0003');
        const accidDX = bbmNow.filter(k => k.code_bbm === 'BRG0003');

        const prArr = []
        prArr.push(
            {'kdBbm':'BRG0001',
            'total_hpp':totalPXHpp,
            'total_harga': totalPX,
            'total_liter': totalPXL,
            'accid_persediaan': accPersediaanPX[0].accid_persediaan,
            'accid_hpp': acchppPX[0].accid_hpp,
            'accid': accidPX[0].accid},
            {'kdBbm':'BRG0002',
            'total_hpp':totalPLHpp,
            'total_harga': totalPL,
            'total_liter': totalPLL,
            'accid_persediaan': accPersediaanPL[0].accid_persediaan,
            'accid_hpp': acchppPL[0].accid_hpp,
            'accid': accidPL[0].accid},
            {'kdBbm':'BRG0003',
            'total_hpp':totalDXHpp,
            'total_harga': totalDX,
            'total_liter': totalDXL,
            'accid_persediaan': accPersediaanDX[0].accid_persediaan,
            'accid_hpp': acchppDX[0].accid_hpp,
            'accid': accidDX[0].accid}
        )
        // console.log(accPersediaanPX[0].accid_persediaan)

        const arr_k = [];
        const arr_kupon = store.getters.Skupon;
        let totak = 0;
        for (let i = 0; i < arr_kupon.length; i++) {
            arr_k.push ({
                'kdPelanggan': arr_kupon[i].kdp,
                'tglKupon': arr_kupon[i].tglKupon,
                'r_regu': regu.value,
                'nilai': arr_kupon[i].nilaiKupon,
                // 'tgl_transaksi': tgl, 
            })
        }
        // console.log(arr)
        const arr_b = [];
        const arr_biaya = store.getters.Sbiaya;
        let totab = 0;
        for (let a = 0; a < arr_biaya.length; a++) {
            arr_b.push ({
                'ketBiaya': arr_biaya[a].ketBiaya,
                'tglBiaya': arr_biaya[a].tglBiaya,
                'r_regu': regu.value,
                'nilai': arr_biaya[a].nilaiBiaya,
                'acc': arr_biaya[a].acc, 
            })
        }

        // console.log(arr)
        const arr_l = [];
        const arr_link = store.getters.Slink;
        let totall = 0;
        for (let a = 0; a < arr_link.length; a++) {
            arr_l.push ({
                'nm_bbm': arr_link[a].kdbm,
                'tgl_link': arr_link[a].tglLink,
                'r_regu': regu.value,
                'jumlahLink': arr_link[a].nilaiLink,
                // 'tgl_transaksi': tgl, 
            })
        }

        store.dispatch('CreateTransNosel', [arr,arr_k,arr_b,arr_l,prArr ])
        .then(response => {
                // console.log('result: ', response)
                getNosel();
                getTrans();
                getRegu();
                store.dispatch('NewKupon', [])
                store.dispatch('NewBiaya', [])
                store.dispatch('NewLink', [])
            })
            .catch(error => {
                // console.log('error: ', error)
                return
            })
 
        // setTimeout(() => {
        //     // getlist();
        //     getNosel();
        //     getTrans();
        //     getRegu();
        //     store.dispatch('NewKupon', [])
        //     store.dispatch('NewBiaya', [])
        //     store.dispatch('NewLink', [])
        // }, 2000)

    }


    // function saveTransBbm(id_nosel,code_bbm,kode_brg,oldmeter,newmeter,hrg,costltr,jual){
    //         // const idbbm = props.id;
    //         // const harga = ref(props.last_price);
    //         // const tgl = date1.value.substring(0, 10)
    //         const tgl = moment(date1.value).format("YYYY-MM-DD")
    //         const tglc = moment(date1.value).format("YYYYMMDD")
    //         store.dispatch('CreateTransNosel', {
    //             // 'r_bbm': idbbm,
    //             'kd_bbm': code_bbm,
    //             'kodeBrg': kode_brg,
    //             'kd_trans': code_bbm+id_nosel+tglc,
    //             'r_nosel': id_nosel,
    //             'r_regu': regu.value,
    //             'tgl_transaksi': tgl, 
    //             'cost_ltr': costltr, 
    //             'last_price': hrg, 
    //             'awal_meter': oldmeter,
    //             'last_meter': newmeter, 
    //             'total': jual
    //         })
    //         getNosel();
    //         getTrans();
    // }
    const getNosel=() => {
        const id = props.id;
        store.dispatch('GetNosel', {'key1': id})
    }
    const getTrans=() => {
        const id = props.id;
        const tgl = moment(date1.value).format("YYYY-MM-DD")
        store.dispatch('GetTransNosel', {'r_bbm': id, 'tgl': tgl})
    }
    const getRegu=() => {
        store.dispatch('GetTransNoselRegu')
    }
    const GetPph22=() => {
        store.dispatch('GetPph22');
        pph22.value = store.getters.StatePph22
        console.log('pph dari gov : '+ pph22.value)
    }

    onMounted(() => {
        getNosel();
        getTrans();
        getRegu();
        GetPph22();
        // console.log('pph dari gov : '+ pph22.value)
        
        localStorage.setItem('kupon', '[]');
        localStorage.setItem('biaya', '[]');
        localStorage.setItem('link', '[]');

        // function getTransBbm(){
        //     // const bbmnosel = 
            
        // };

    })

   

</script>