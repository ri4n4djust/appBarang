<template>
    <div class="layout-px-spacing apps-invoice-add">
        <teleport to="#breadcrumb">
            <ul class="navbar-nav flex-row">
                <li>
                    <div class="page-header">
                        <nav class="breadcrumb-one" aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:;">Apps</a></li>
                                <li class="breadcrumb-item active" aria-current="page"><span>Invoice Add</span></li>
                            </ol>
                        </nav>
                    </div>
                </li>
            </ul>
        </teleport>

        <!-- <div class="row invoice layout-top-spacing layout-spacing">
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="doc-container"> -->
        <div class="underline-content tabs">
            <ul class="nav nav-tabs mb-3" id="lineTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="underline-home-tab" data-bs-toggle="tab" href="#underline-home" role="tab" aria-controls="underline-home" aria-selected="true">
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
                            class="feather feather-home"
                        >
                            <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                            <polyline points="9 22 9 12 15 12 15 22"></polyline>
                        </svg>
                        Transaksi
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="underline-profile-tab" data-bs-toggle="tab" href="#underline-profile" role="tab" aria-controls="underline-profile" aria-selected="false"
                        ><svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24"
                            height="24"
                            viewBox="0 0 24 24"
                            fill="none"
                            stroke="currentColor"
                            stroke-width="2"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            class="feather feather-user"
                        >
                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                            <circle cx="12" cy="7" r="4"></circle>
                        </svg>
                        Daftar
                    </a>
                </li>
            </ul>

            <div class="tab-content" id="lineTabContent-3">
                <div class="tab-pane fade show active" id="underline-home" role="tabpanel" aria-labelledby="underline-home-tab">

                    <div class="row">
                        <div class="col-xl-12">
                            <div class="invoice-content">
                                <div class="invoice-detail-body">
                                    <div class="invoice-detail-title">
                                       
                                        <div class="invoice-title">
                                            Opnum BBM
                                        </div>
                                    </div>

                                    <div class="statbox panel box box-shadow">
                                        <div class="panel-heading">
                                            <div class="row">
                                                <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                                                    <!-- <h4>Hover Table</h4> -->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex flex-wrap justify-content-center justify-content-sm-start px-3 pt-3 pb-0">
                                            <!-- <div class="row"> -->
                                                <div class="col-md-4">
                                                    <div class="input-group mb-4">
                                                        <input type="text" class="form-control form-control-sm" v-model="headopnum.kdOpnum">
                                                        <flatPickr v-model="headopnum.tglOpnum" 
                                                            :config="{dateFormat: 'd-m-Y'}"
                                                            class="form-control form-control-sm">
                                                        </flatPickr>
                                                        <button variant="primary" class="btn m-1 btn-primary" @click="simpanOpnum()">Simpan</button>
                                                        <!-- <button variant="primary" class="btn m-1 btn-primary" @click="export_table('pdf')">PDF</button> -->
                                                    </div>
                                                </div>
                                            <!-- </div> -->
                                        </div>
                                        <div class="panel-body">
                                            <div class="table-responsive">
                                                <table role="table" aria-busy="false" aria-colcount="5" class="table table-hover table-bordered" id="__BVID__415">
                                                    <thead role="rowgroup">
                                                        <tr role="row">
                                                            <th role="columnheader" scope="col" aria-colindex="1"><div>Kode</div></th>
                                                            <th role="columnheader" scope="col" aria-colindex="2"><div>nama</div></th>
                                                            <th role="columnheader" scope="col" aria-colindex="3"><div>stok</div></th>
                                                            <th role="columnheader" scope="col" aria-colindex="4"><div>satuan</div></th>
                                                            <th role="columnheader" scope="col" aria-colindex="5"><div>REAL </div></th>
                                                            <th role="columnheader" scope="col" aria-colindex="5"><div>Keterangan</div></th>
                                                            <th role="columnheader" scope="col" aria-colindex="5"><div>Selisih</div></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody role="rowgroup">
                                                        <tr v-for="item, index in table_1" :key="item.index" role="row">
                                                            <td aria-colindex="1" role="cell">{{ item.code_bbm }}</td>
                                                            <td aria-colindex="2" role="cell">{{ item.nama_bbm }}</td>
                                                            <td aria-colindex="3" role="cell">{{ Number(item.stokPersediaan).toLocaleString() }}</td>
                                                            <td aria-colindex="4" role="cell">Liter</td>
                                                            <td aria-colindex="5" role="cell">
                                                                <div :style="{ 'width': inp + 'px' }">
                                                                <input type="text" class="form-control form-control-sm col-sm-2" v-model="item_now[index]" @keypress="onlyNumber" >
                                                                </div>
                                                            </td>
                                                            <td aria-colindex="5" role="cell">
                                                                <div :style="{ 'width': inp + 'px' }">
                                                                <input type="text" class="form-control form-control-sm col-sm-2" v-model="keterangan[index]" >
                                                                </div>    
                                                            </td>
                                                            <td aria-colindex="5" role="cell">{{ item.stokPersediaan - item_now[index] }}</td>

                                                                <!-- <span :class="`text-${item.status_class}`"> {{ item.status }} </span> -->

                                                            
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

                </div>
                <div class="tab-pane fade" id="underline-profile" role="tabpanel" aria-labelledby="underline-profile-tab">

                    <div class="col-xl-12">
                        <div class="invoice-content">
                            <div class="invoice-detail-body">
                                <!-- <div class="invoice-detail-title">
                                    
                                    <div class="invoice-title">
                                    PO BBM
                                    </div>
                                </div> -->

                                <div class="invoice-detail-header">
                                    <div class="row justify-content-between">

                                        <div class="row invoice layout-top-spacing layout-spacing apps-invoice">
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <div class="doc-container">
                                                    <div class="row">
                                                        <div class="col-xl-9">
                                                            <div class="invoice-container">
                                                                <div class="table-responsive">

                                                                    <v-client-table :data="items" :columns="columns" :options="table_option">
                                                                        <template #tglOpnum="props"> {{ moment(props.row.tglOpnum).format("DD-MM-YYYY") }} </template>
                                                                        <template #totalOpnum="props"> {{ Number(props.row.totalOpnum).toLocaleString() }} </template>
                                                                        <template #action="props">
                                                                            <div class="custom-dropdown dropdown btn-group ">
                                                                                <div class="btn-group" href="#" role="button" id="pendingTask" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                    <!-- <button type="button" class="btn btn-blue">Open</button> -->
                                                                                    <div role="group" class="btn-group">
                                                                                        <div class="dropdown b-dropdown custom-dropdown show btn-group">
                                                                                            <a class="btn dropdown-toggle btn-dark"
                                                                                                ><svg
                                                                                                    xmlns="http://www.w3.org/2000/svg"
                                                                                                    width="24"
                                                                                                    height="24"
                                                                                                    viewBox="0 0 24 24"
                                                                                                    fill="none"
                                                                                                    stroke="currentColor"
                                                                                                    stroke-width="2"
                                                                                                    stroke-linecap="round"
                                                                                                    stroke-linejoin="round"
                                                                                                    class="feather feather-chevron-down"
                                                                                                >
                                                                                                    <polyline points="6 9 12 15 18 9"></polyline>
                                                                                                </svg>
                                                                                            </a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <ul class="dropdown-menu dropdown-menu-end">
                                                                                    <li>
                                                                                        <!-- <a href="javascript:void(0);" class="btn m-1 btn-light" @click="edit_row(props.row)"> Edit </a> -->
                                                                                        <router-link to="/editpenjualan" class="dropdown-item" @click="edit_row(props.row)">Edit</router-link>
                                                                                    </li>
                                                                                    <li>
                                                                                        <router-link :to="{ name: 'nosel', params: { id: props.row } }" class="dropdown-item">coba</router-link>
                                                                                        <!-- <a href="javascript:void(0);" class="btn m-1 btn-light" @click="view_row(props.row)"> Delete </a> -->
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                        </template>
                                                                    </v-client-table>

                                                                    
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-3">
                                                            <div class="invoice-actions-btn">
                                                                <div class="invoice-action-btn">
                                                                    <div class="row">

                                                                        <div class="col-xl-12 col-md-3 col-sm-6">
                                                                            <a href="javascript:;" class="btn btn-secondary btn-print action-print" @click="print()">Print</a>
                                                                        </div>
                                                                        <div class="col-xl-12 col-md-3 col-sm-6">
                                                                            <div class="row mb-4">
                                                                                <div class="col-sm">
                                                                                    <label for="inputState">Awal</label>
                                                                                    <flat-pickr v-model="sorting.startDate" 
                                                                                        :config="{dateFormat: 'd-m-Y'}"
                                                                                        class="form-control form-control-sm">
                                                                                    </flat-pickr>
                                                                                </div>
                                                                                <div class="col-sm">
                                                                                    <label for="inputState">Akhir</label>
                                                                                    <flat-pickr v-model="sorting.endDate" 
                                                                                        :config="{dateFormat: 'd-m-Y'}"
                                                                                        class="form-control form-control-sm">
                                                                                    </flat-pickr>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-xl-12 col-md-3 col-sm-6">
                                                                            <a href="javascript:;" @click="cari" class="btn btn-success btn-download">Cari</a>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
</template>

<script setup>
    import { onMounted, ref, computed } from 'vue';

    import '@/assets/sass/apps/invoice-add.scss';

    import flatPickr from 'vue-flatpickr-component';
    import 'flatpickr/dist/flatpickr.css';
    import '@/assets/sass/forms/custom-flatpickr.css';

    import { useStore } from 'vuex';
    
    import moment from "moment";

    import { useMeta } from '@/composables/use-meta';
    useMeta({ title: 'Opnum BBM' });

    const store = useStore();
    const table_1 = ref([]);
    const item_now = ref({});
    const keterangan = ref({});
    const noopnum = ref([]);
    const total = ref([]);
    const inp = ref(80);
    const headopnum = ref({
        kdOpnum : noopnum,
        tglOpnum: moment().format("D-M-YYYY"),
        userOpnum: '1',
        totalOpnum: total
    })

    // const pembelian = computed(() => {
    //     noopnum.value = store.getters.NoOpnum;
    //     // console.log(suppliers)
    //     return { noopnum }
    // });

    onMounted(() => {
        bind_data();
        getNoOpnum();
        bind_list_opnum();
    });

    const columns = ref(['kdOpnum', 'tglOpnum', 'totalOpnum', 'action']);
    const items = ref([]);
    const table_option = ref({
        perPage: 10,
        perPageValues: [5, 10, 20, 50],
        skin: 'table table-hover',
        columnsClasses: { action: 'actions text-center' },
        pagination: { nav: 'scroll', chunk: 5 },
        texts: {
            count: 'Showing {from} to {to} of {count}',
            filter: '',
            filterPlaceholder: 'Search...',
            limit: 'Results:',
        },
        sortable: ['kdOpnum', 'tglOpnum', 'totalOpnum'],
        sortIcon: {
            base: 'sort-icon-none',
            up: 'sort-icon-asc',
            down: 'sort-icon-desc',
        },
        resizableColumns: true,
    });
    const sorting = ref({
        startDate: moment().subtract(30,'d').format("D-M-YYYY"),
        endDate: moment().format("D-M-YYYY")
    });

    const bind_list_opnum = async () => {
        await store.dispatch('GetLaporanOpnum', sorting.value);
        setTimeout(function() { items.value = store.getters.SlaporanBbm; }, 4000);
    }

    const bbm = computed(() => {
        items.value = store.getters.SlaporanOpnum;

        let sum = 0;
        items.value.forEach(element => {
        sum +=  parseInt(element.total);
        });

        // console.log(sum)
        // return { items }
    });

    const getNoOpnum= async() => {
        await store.dispatch('GetNoOpnum')
        noopnum.value = store.getters.NoOpnum;
    }

    const bind_data = async () => {
        await store.dispatch('GetBbm');
        table_1.value = store.getters.StateBbm;
        
    }

    const simpanOpnum=() => {
        // const header =params.value
        // const headers =paramspelanggan.value

        var dataArr = table_1.value
        const arr = [];
        let tota = 0;
        for (let i = 0; i < dataArr.length; i++) {
            // console.log({kdBarang : dataArr[i].r_kdBarang, nmBarang : dataArr[i].r_nmBarang,});
            let subto = dataArr[i].last_price * (dataArr[i].stokPersediaan - item_now.value[i])
            let ket = keterangan.value[i]
            if (!isNaN(subto)) {
                if(!ket){
                    ket = '-'
                }
                arr.push ({
                    'kdBarang' : dataArr[i].code_bbm,
                    'nmBarang' : dataArr[i].nama_bbm,
                    'accid_persediaan' : dataArr[i].accid_persediaan,
                    'accid_biaya' : dataArr[i].accid_biaya,
                    'keterangan' : ket,
                    'qty' : item_now.value[i],
                    'selisih' : dataArr[i].stokPersediaan - item_now.value[i],
                    'total' : subto
                })
                tota += parseInt(subto)
                total.value = tota
                // alert(subto)
            }
            
            item_now.value[i] = NaN
            keterangan.value[i] = NaN
        
        }
        // console.log(tota)
        // const headerfull = Object.assign(header, headers)
        store.dispatch('CreateOpnum', [headopnum.value,arr])
        getNoOpnum();
        bind_data();
        // item_now.value = ''
        // keterangan.value = ''
    }

    const cari = () =>{
        bind_list_opnum();
    }


    const random_class = (index) => {
        if (index == 0) {
            return 'default';
        } else if (index == 1) {
            return 'primary';
        } else if (index == 2) {
            return 'secondary';
        } else if (index == 3) {
            return 'success';
        } else if (index == 4) {
            return 'dark';
        } else if (index == 5) {
            return 'danger';
        } else if (index == 6) {
            return 'info';
        } else if (index == 7) {
            return 'warning';
        }
        return 'dark';
    };

    function onlyNumber ($event) {
        //console.log($event.keyCode); //keyCodes value
        let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
        if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
            $event.preventDefault();
        }   
    }

</script>
