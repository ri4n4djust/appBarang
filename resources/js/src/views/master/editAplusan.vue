<template>
    <div class="layout-px-spacing">
        <teleport to="#breadcrumb">
            <ul class="navbar-nav flex-row">
                <li>
                    <div class="page-header">
                        <nav class="breadcrumb-one" aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:;">DataTables</a></li>
                                <li class="breadcrumb-item active" aria-current="page"><span>HTML5 Export</span></li>
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
                        <h5>Edit Aplusan</h5>
                        
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

            

            <Kupon/>
            <Biaya/>
            <LinkAja/>

        </div>

        

        <div class="table-responsive">
            <table class="table table-hover table-bordered">
                <thead>
                    <tr>
                        <th>Nozzel</th>
                        <th>Meter Awal</th>
                        <th>Meter Akhir</th>
                        <th>Volume/Liter</th>
                        <th>Harga</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="item, index in items" :key="item.id">
                        <td>{{ item.nama_nosel }}</td>
                        <td>{{ item.awal_meter }}</td>
                        <td>
                            <!-- {{ item.last_meter }} -->
                            <div :style="{ 'width': inpt + 'px' }">
                                <input type="text" class="form-control form-control-sm col-sm-4" v-model="meter_now[index]" >
                            </div>
                        </td>
                        <td>{{ Math.abs(meter_now[index] - item.awal_meter) }}</td>
                        <td>{{ Number(item.last_price).toLocaleString() }}</td>
                        <td>{{ Number((meter_now[index] - item.awal_meter) * item.last_price).toLocaleString() }}</td>
                    </tr>
                </tbody>
                <!-- <tfoot>
                    <tr>
                        <th colspan="2" class="align-top mx-auto">

                            <div class="table-responsive">
                                <table class="table table-hover table-bordered">
                                    <thead>
                                        <tr>
                                            <th colspan="2">Langganan Kupon</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="pon in kupon" :key="pon.r_kdPelanggan">
                                            <td aria-colindex="1" role="cell">{{ pon.nmPelanggan }}</td>
                                            <td aria-colindex="2" role="cell">{{ Number(pon.total).toLocaleString() }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered">
                                    <thead>
                                        <tr>
                                            <th colspan="2">Link Aja</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="lk in link" :key="lk.id">
                                            <td aria-colindex="1" role="cell">{{ lk.nm_bbm }}</td>
                                            <td aria-colindex="2" role="cell">{{ Number(lk.jumlah_link).toLocaleString() }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                        </th>
                        <th colspan="2" class="align-top mx-auto">
                            <div class="table-responsive">
                            <table class="table table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th colspan="3">Total Penjualan Regu A</th>
                                    </tr>
                                    <tr>
                                        <th>BBM</th>
                                        <th>Volume</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody role="rowgroup">
                                    <tr >
                                        <td aria-colindex="1" role="cell">PERTAMAX</td>
                                        <td aria-colindex="2" role="cell">{{Number(totalLiterPertamax).toLocaleString()}}</td>
                                        <td aria-colindex="2" role="cell">{{Number(totalPertamax).toLocaleString()}}</td>
                                    </tr>
                                    <tr >
                                        <td aria-colindex="1" role="cell">PERTALITE</td>
                                        <td aria-colindex="2" role="cell">{{Number(totalLiterPertalite).toLocaleString()}}</td>
                                        <td aria-colindex="2" role="cell">{{Number(totalPertalite).toLocaleString()}}</td>
                                    </tr>
                                    <tr >
                                        <td aria-colindex="1" role="cell">DEXLITE</td>
                                        <td aria-colindex="2" role="cell">{{Number(totalLiterDexlite).toLocaleString()}}</td>
                                        <td aria-colindex="2" role="cell">{{Number(totalDexlite).toLocaleString()}}</td>
                                    </tr>
                                </tbody>
                            </table>
                            </div>
                        </th>
                        <th colspan="2" class="align-top mx-auto" >
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered">
                                    <thead role="rowgroup">
                                        <tr >
                                            <th aria-colindex="1" role="cell">Total</th>
                                            <th aria-colindex="2" role="cell">{{ Number(totaljual).toLocaleString() }}</th>
                                        </tr>
                                        <tr >
                                            <th >Kupon</th>
                                            <th >{{ Number(totalkupon).toLocaleString() }}</th>
                                        </tr>
                                        <tr >
                                            <th >Biaya</th>
                                            <th >{{ Number(totalbiaya).toLocaleString() }}</th>
                                        </tr>
                                        <tr >
                                            <th >Link Aja</th>
                                            <th >{{ Number(totallink).toLocaleString() }}</th>
                                        </tr>
                                        <tr >
                                            <th >Total Cash</th>
                                            <th >{{ Number(totaljual -totalkupon -totalbiaya - totallink).toLocaleString() }}</th>
                                        </tr>
                                        <tr >
                                            <th >Saldo Plus</th>
                                            <th >0</th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                                
                        </th>
                    </tr>
                </tfoot> -->
            </table>
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
                        <td> {{ list.nama_nosel }}</td>
                        <td>{{ Number(list.meter_akhir).toLocaleString() }}</td>
                        <td >
                            <div :style="{ 'width': inpt + 'px' }">
                                <input type="text" class="form-control form-control-sm col-sm-4" v-model="meter_now[index]" >
                            </div>
                        </td>
                        <td>{{ Math.abs(meter_now[index] - list.meter_akhir) }}</td>
                        <td>{{ Number(list.harga).toLocaleString() }}</td>
                        <td>{{ Number((meter_now[index] - list.meter_akhir) * list.harga).toLocaleString() }}</td>
                    </tr>
                </tbody>
            </table>
        </div>

        
    </div>
</template>

<script setup>
    import { computed, onMounted, ref, onUnmounted } from 'vue';

    //pdf export
    import jsPDF from 'jspdf';
    import 'jspdf-autotable';

    import flatPickr from 'vue-flatpickr-component';
    import 'flatpickr/dist/flatpickr.css';
    import '@/assets/sass/forms/custom-flatpickr.css';

    import '@/assets/sass/scrollspyNav.scss';
    import '@/assets/sass/tables/table-basic.scss';
    import '@/assets/sass/apps/invoice-preview.scss';

    import moment from "moment";

    import Kupon from './kupon.vue';
    import Biaya from './biaya.vue';
    import LinkAja from './linkaja.vue';

    import { useStore } from 'vuex';
    import { useRouter, useRoute } from 'vue-router'

    import { useMeta } from '@/composables/use-meta';

    useMeta({ title: 'Aplusan' });

    const store = useStore();
    const router = useRouter();
    const route = useRoute();

    const totaljual = ref();
    const totalkupon = ref();
    const totalbiaya = ref();
    const totallink = ref();
    const totalPertamax = ref();
    const totalLiterPertamax = ref();
    const totalPertalite = ref();
    const totalLiterPertalite = ref();
    const totalDexlite = ref();
    const totalLiterDexlite = ref();

    const meter_now = ref({});
    const regu = ref(null);

    const items = ref([]);
    const kupon = ref([]);
    const biaya = ref([]);
    const link = ref([]);
    const sorting = ref({
        startDate: moment(props.startDate).format("D-M-YYYY"),
        kd_trans: props.kd_trans,
        regu: props.regu
        // endDate: moment().format("D-M-YYYY")
    });

    const props = defineProps({
        id: String,
        startDate: String,
        kd_trans: String,
        regu: String,
    });
    const date1 = ref(moment(props.startDate).format("YYYY-MM-DD"));

    onMounted(() => {
        bind_data();
        getRegu();
        // total_aplusan();
    });

    onUnmounted(() => {
        // window.onbeforeunload = null
        // alert('kal tutup')
        localStorage.setItem('kupon', '[]')
        store.dispatch('NewKupon')
        localStorage.setItem('biaya', '[]')
        store.dispatch('NewBiaya')
        localStorage.setItem('link', '[]')
        store.dispatch('NewLink')
    })

    const nosels = computed(() => {
        const nosel = store.getters.Saplusan;
        const trs = store.getters.STransNosel;
        const regu = store.getters.STransNoselRegu;

        const kupon = store.getters.Skupon;
        
        const biaya = store.getters.Sbiaya;
        const link = store.getters.Slink;
        return { nosel, trs, regu, kupon, biaya, link }
    });
    
    const simpan_all = () =>{
        const nosel = store.getters.Saplusan[0];
        // console.log(nosel)

        const tgl = moment(date1.value).format("YYYY-MM-DD")
        const tglc = moment(date1.value).format("YYYYMMDD")
        
        var dataArr = nosel
        console.log(dataArr)
        const arr = [];
        let tota = 0;
        for (let i = 0; i < dataArr.length; i++) {
            // console.log({kdBarang : dataArr[i].r_kdBarang, nmBarang : dataArr[i].r_nmBarang,});
            let id_nosel = dataArr[i].id_nosel
            let cost = parseInt(meter_now.value[i]) - parseInt(dataArr[i].meter_akhir);
            let subto = dataArr[i].last_price * cost;
            let last_meter =  meter_now.value[i];
            // let ket = keterangan.value[i]
            // if (!isNaN(subto)){
            //     last_meter = '0';
            // } else{
            //     last_meter =  meter_now.value[i];
            // }
            arr.push ({
                'kd_bbm': dataArr[i].r_bbm,
                'kodeBrg': dataArr[i].code_bbm,
                'nm_bbm': dataArr[i].nama_bbm,
                'kd_trans': dataArr[i].kd_trans,
                'r_nosel': dataArr[i].r_nosel,
                'r_regu': dataArr[i].r_regu,
                'tgl_transaksi': dataArr[i].tgl_transaksi,
                'cost_ltr': dataArr[i].cost_ltr,
                'last_price': dataArr[i].last_price,
                'awal_meter': dataArr[i].awal_meter,
                'last_meter':   meter_now.value[i],
                'total': subto
            })
            tota += parseInt(subto)
            // total.value = tota
                console.log(tota)
        
        }
        // console.log(arr)
        const arr_k = [];
        const arr_kupon = store.getters.Saplusan[1];
        let totak = 0;
        for (let i = 0; i < arr_kupon.length; i++) {
            arr_k.push ({
                'kdPelanggan': arr_kupon[i].r_kdPelanggan,
                'tglKupon': arr_kupon[i].tgl_trans,
                'r_regu': regu.value,
                'nilai': arr_kupon[i].total,
                // 'tgl_transaksi': tgl, 
            })
        }
        // console.log(arr)
        const arr_b = [];
        const arr_biaya = store.getters.Saplusan[2];
        let totab = 0;
        for (let a = 0; a < arr_biaya.length; a++) {
            arr_b.push ({
                'ketBiaya': arr_biaya[a].keterangan_biaya,
                'tglBiaya': arr_biaya[a].tglBiaya,
                'r_regu': regu.value,
                'nilai': arr_biaya[a].jumlah,
                // 'tgl_transaksi': tgl, 
            })
        }

        // console.log(arr)
        const arr_l = [];
        const arr_link = store.getters.Saplusan[3];
        let totall = 0;
        for (let a = 0; a < arr_link.length; a++) {
            arr_l.push ({
                'nm_bbm': arr_link[a].nm_bbm,
                'tgl_link': arr_link[a].tgl_link,
                'r_regu': regu.value,
                'jumlahLink': arr_link[a].jumlah_link,
                // 'tgl_transaksi': tgl, 
            })
        }

        store.dispatch('CreateTransNosel', [arr,arr_k,arr_b,arr_l ])

    }

    
    const bind_data = async () => {
        await store.dispatch('GetAplusan', sorting.value);
        items.value = store.getters.Saplusan[0];
        var dataArr = items.value
        const arr = [];
        let tota = 0;
        for (let i = 0; i < dataArr.length; i++) {
            // console.log({kdBarang : dataArr[i].r_kdBarang, nmBarang : dataArr[i].r_nmBarang,});
            let id_nosel = dataArr[i].id_nosel
            let cost = parseInt(meter_now.value[i]) - parseInt(dataArr[i].awal_meter);
            let subto = dataArr[i].last_price * cost;
            // let last_meter =  awal_meter.value[i];
            // let ket = keterangan.value[i]
            // if (!isNaN(subto)){
            //     last_meter = '0';
            // } else{
            //     last_meter =  meter_now.value[i];
            // }
            arr.push ({
                'kd_bbm': dataArr[i].r_bbm,
                'kodeBrg': dataArr[i].code_bbm,
                'kd_trans': dataArr[i].kd_trans,
                'r_nosel': dataArr[i].id_nosel,
                'r_regu': dataArr[i].r_regu,
                'tgl_transaksi': moment(dataArr[i].tgl_transaksi).format('DD-MM-YYYY'), 
                'cost_ltr': dataArr[i].cost_ltr,
                'last_price': dataArr[i].last_price,
                'awal_meter': dataArr[i].awal_meter,
                'last_meter':   dataArr[i].last_meter,
                'total': subto
            })
            tota += parseInt(subto)
            // total.value = tota
                console.log(tota)
        
        }
        // await store.dispatch('editAplus', arr)

        kupon.value = store.getters.Saplusan[1];
        var kupona = [];
        let kuponArr = kupon.value
        for (let i = 0; i < kuponArr.length; i++) {
            kupona.push ({
                'kdp': kuponArr[i].r_kdPelanggan,
                'tglKupon': moment(kuponArr[i].tgl_trans).format('DD-MM-YYYY'),
                'nilaiKupon': kuponArr[i].total,

            })
        }
        localStorage.setItem('kupon', JSON.stringify(kupona))
        await store.dispatch('NewKupon', kupona)

        biaya.value = store.getters.Saplusan[2];
        var biayab = [];
        let biayaArr = biaya.value
        for (let i = 0; i < biayaArr.length; i++) {
            biayab.push ({
                'ketBiaya': biayaArr[i].keterangan_biaya,
                'tglBiaya': moment(biayaArr[i].tglBiaya).format('DD-MM-YYYY'),
                'nilaiBiaya': biayaArr[i].jumlah,

            })
        }
        localStorage.setItem('biaya', JSON.stringify(biayab))
        await store.dispatch('NewBiaya', biayab)

        link.value = store.getters.Saplusan[3];
        var linkc = [];
        let linkArr = link.value
        for (let i = 0; i < biayaArr.length; i++) {
            linkc.push ({
                'kdbm': linkArr[i].nama_bbm,
                'tglLink': moment(linkArr[i].tgl_link).format('DD-MM-YYYY'),
                'nilaiLink': linkArr[i].jumlah_link,

            })
        }
        localStorage.setItem('link', JSON.stringify(linkc))
        await store.dispatch('NewLink', linkc)
        // let ar = items.value ;
        let sum = 0;
        items.value.forEach(element => {
            sum +=  parseInt(Number(element.total));
            // alert(sum);
        });
        totaljual.value = sum

        let sumk = 0;
        kupon.value.forEach(elem => {
            sumk +=  parseInt(Number(elem.total));
            // alert(sum);
        });
        totalkupon.value = sumk

        let sumb = 0;
        biaya.value.forEach(ele => {
            sumb +=  parseInt(Number(ele.jumlah));
            // alert(sum);
        });
        totalbiaya.value = sumb

        let suml = 0;
        link.value.forEach(ele => {
            suml +=  parseInt(Number(ele.jumlah_link));
            // alert(sum);
        });
        totallink.value = suml
        
        let totalPX = items.value.filter( (item) => item.r_bbm === 1).reduce((accumulator, item) => {
            return accumulator += Number(item.total);
        }, 0);
        let totalLiterPX = items.value.filter( (item) => item.r_bbm === 1).reduce((accumulator, item) => {
            return accumulator += Number(item.cost_ltr);
        }, 0);
        totalPertamax.value = totalPX
        totalLiterPertamax.value = totalLiterPX

        let totalPL = items.value.filter((item) => item.r_bbm === 2).reduce((accumulator, item) => {
            return accumulator += Number(item.total);
        }, 0);
        let totalLiterPL = items.value.filter((item) => item.r_bbm === 2).reduce((accumulator, item) => {
            return accumulator += Number(item.cost_ltr);
        }, 0);
        totalPertalite.value = totalPL
        totalLiterPertalite.value = totalLiterPL

        let totalDX = items.value.filter((item) => item.r_bbm === 3).reduce((accumulator, item) => {
            return accumulator += Number(item.total);
        }, 0);
        let totalLiterDX = items.value.filter((item) => item.r_bbm === 3).reduce((accumulator, item) => {
            return accumulator += Number(item.cost_ltr);
        }, 0);
        totalDexlite.value = totalDX
        totalLiterDexlite.value = totalLiterDX

        // console.log(totalPX)
    }

    const barangs = computed(() => {
        items.value = store.getters.Saplusan;
        // console.log(items)
        // return { items }
    });
    
    // const total_aplusan = async () =>{
    //     await store.dispatch('GetAplusan', sorting.value);
    //     // items.value = store.getters.Saplusan;
    //     let arr = store.getters.Saplusan;
    //     let sum = 0;
    //     arr.forEach(element => {
    //         sum +=  parseInt(element.total);
    //     });
    //     // totaljual.value = sum;
    //     console.log(sum)
    // }
    const getRegu=() => {
        store.dispatch('GetTransNoselRegu')
    }

    const export_table = (type) => {
        let cols = columns.value.filter((d) => d != 'profile' && d != 'action');
        let records = items.value;
        let filename = 'table';

        if (type == 'csv') {
            let coldelimiter = ',';
            let linedelimiter = '\n';
            let result = cols
                .map((d) => {
                    return capitalize(d);
                })
                .join(coldelimiter);
            result += linedelimiter;
            records.map((item) => {
                cols.map((d, index) => {
                    if (index > 0) {
                        result += coldelimiter;
                    }
                    let val = item[d] ? item[d] : '';
                    result += val;
                });
                result += linedelimiter;
            });

            if (result == null) return;
            if (!result.match(/^data:text\/csv/i) && !window.navigator.msSaveOrOpenBlob) {
                var data = 'data:application/csv;charset=utf-8,' + encodeURIComponent(result);
                var link = document.createElement('a');
                link.setAttribute('href', data);
                link.setAttribute('download', filename + '.csv');
                link.click();
            } else {
                var blob = new Blob([result]);
                if (window.navigator.msSaveOrOpenBlob) {
                    window.navigator.msSaveBlob(blob, filename + '.csv');
                }
            }
        } else if (type == 'print') {
            var rowhtml = '<p>' + filename + '</p>';
            rowhtml +=
                '<table style="width: 70%; " cellpadding="0" cellcpacing="0" border="1"><thead><tr style="color: #515365; background: #eff5ff; -webkit-print-color-adjust: exact; print-color-adjust: exact; "> ';
            cols.map((d) => {
                rowhtml += '<th>' + capitalize(d) + '</th>';
            });
            rowhtml += '</tr></thead>';
            rowhtml += '<tbody>';

            records.map((item) => {
                rowhtml += '<tr>';
                cols.map((d) => {
                    let val = item[d] ? item[d] : '';
                    rowhtml += '<td>' + val + '</td>';
                });
                rowhtml += '</tr>';
            });
            rowhtml +=
                '<style>body {font-family:Arial; color:#495057;}p{text-align:center;font-size:18px;font-weight:bold;margin:15px;}table{ border-collapse: collapse; border-spacing: 0; }th,td{font-size:12px;text-align:left;padding: 4px;}th{padding:8px 4px;}tr:nth-child(2n-1){background:#f7f7f7; }</style>';
            rowhtml += '</tbody></table>';
            var winPrint = window.open('', '', 'left=0,top=0,width=1000,height=600,toolbar=0,scrollbars=0,status=0');
            winPrint.document.write('<title>Print</title>' + rowhtml);
            winPrint.document.close();
            winPrint.focus();
            winPrint.print();
            // winPrint.close();
        } else if (type == 'pdf') {
            cols = cols.map((d) => {
                return { header: capitalize(d), dataKey: d };
            });
            const doc = new jsPDF('l', 'pt', cols.length > 10 ? 'a3' : 'a4');
            doc.autoTable({
                headStyles: { fillColor: '#eff5ff', textColor: '#515365' },
                columns: cols,
                body: records,
                styles: { overflow: 'linebreak' },
                pageBreak: 'auto',
                margin: { top: 45 },
                didDrawPage: () => {
                    doc.text('Export Table', cols.length > 10 ? 535 : 365, 30);
                },
            });
            doc.save(filename + '.pdf');
        }
    };

    const excel_columns = () => {
        return {
            Name: 'name',
            Position: 'position',
            Office: 'office',
            Age: 'age',
            'Start Date': 'start_date',
            Salary: 'salary',
        };
    };
    const excel_items = () => {
        return items.value;
    };
    const capitalize = (text) => {
        return text
            .replace('_', ' ')
            .replace('-', ' ')
            .toLowerCase()
            .split(' ')
            .map((s) => s.charAt(0).toUpperCase() + s.substring(1))
            .join(' ');
    };
    const view_row = (item) => {
        
        alert('ID: ' + item.kdBarang + ', Name: ' + item.nmBarang);
    };
    const print = () => {
        window.print();
    };
</script>
