<template>
    <div class="layout-px-spacing">
        <teleport to="#breadcrumb">
            <ul class="navbar-nav flex-row">
                <li>
                    <div class="page-header">
                        <nav class="breadcrumb-one" aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:;">Tables</a></li>
                                <li class="breadcrumb-item active" aria-current="page"><span>Basic</span></li>
                            </ol>
                        </nav>
                    </div>
                </li>
            </ul>
        </teleport>

        <div class="row layout-top-spacing">
            <!-- <div class="nav sidenav">
                <div class="sidenav-content" v-scroll-spy-active v-scroll-spy-link>
                    <a href="#tableSimple" class="nav-link">Simple</a>
                    <a href="#tableHover" class="nav-link">Hover</a>
                    <a href="#tableStriped" class="nav-link">Striped</a>
                    <a href="#tableLight" class="nav-link">Light</a>
                    <a href="#tableCaption" class="nav-link">Caption</a>
                    <a href="#tableProgress" class="nav-link">Progress</a>
                    <a href="#tableContextual" class="nav-link">Contextual</a>
                    <a href="#tableDropdown" class="nav-link">Dropdown</a>
                    <a href="#tableFooter" class="nav-link">Footer</a>
                    <a href="#tableCheckbox" class="nav-link">Checkbox</a>
                </div>
            </div> -->
            <div class="row layout-top-spacing">
                <div class="col-lg-12">
                    <div class="alert alert-arrow-left alert-icon-left alert-light-info mb-0 text-break">
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
                            class="feather feather-bell"
                        >
                            <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path>
                            <path d="M13.73 21a2 2 0 0 1-3.46 0"></path>
                        </svg>
                        Stok Opnum 
                    </div>
                </div>
            </div>

            <div class="row layout-top-spacing">

                <div id="tableHover" class="col-lg-12 layout-spacing">
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
                                            <th role="columnheader" scope="col" aria-colindex="5"><div>Qty</div></th>
                                            <th role="columnheader" scope="col" aria-colindex="5"><div>Keterangan</div></th>
                                            <th role="columnheader" scope="col" aria-colindex="5"><div>Selisih</div></th>
                                        </tr>
                                    </thead>
                                    <tbody role="rowgroup">
                                        <tr v-for="item, index in table_1" :key="item.index" role="row">
                                            <td aria-colindex="1" role="cell">{{ item.kdPersediaan }}</td>
                                            <td aria-colindex="2" role="cell">{{ item.nmPersediaan }}</td>
                                            <td aria-colindex="3" role="cell">{{ item.stokPersediaan }}</td>
                                            <td aria-colindex="4" role="cell">{{ item.satuanPersediaan }}</td>
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

                                            
                                            <!-- <td aria-colindex="5" role="cell" class="text-center">
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
                                                    class="feather feather-trash-2 icon"
                                                >
                                                    <polyline points="3 6 5 6 21 6"></polyline>
                                                    <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                                    <line x1="10" y1="11" x2="10" y2="17"></line>
                                                    <line x1="14" y1="11" x2="14" y2="17"></line>
                                                </svg>
                                            </td> -->
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
</template>

<script setup>
    import { onMounted, ref, computed } from 'vue';

    import '@/assets/sass/scrollspyNav.scss';
    import '@/assets/sass/tables/table-basic.scss';

    import flatPickr from 'vue-flatpickr-component';
    import 'flatpickr/dist/flatpickr.css';
    import '@/assets/sass/forms/custom-flatpickr.css';

    import { useStore } from 'vuex';
    
    import moment from "moment";

    import { useMeta } from '@/composables/use-meta';
    useMeta({ title: 'Tables' });

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
    });

    const getNoOpnum= async() => {
        await store.dispatch('GetNoOpnum')
        noopnum.value = store.getters.NoOpnum;
    }

    const bind_data = async () => {
        await store.dispatch('GetPersediaan');
        table_1.value = store.getters.StatePersediaan;
        
    }

    const simpanOpnum=() => {
        // const header =params.value
        // const headers =paramspelanggan.value

        var dataArr = table_1.value
        const arr = [];
        let tota = 0;
        for (let i = 0; i < dataArr.length; i++) {
            // console.log({kdBarang : dataArr[i].r_kdBarang, nmBarang : dataArr[i].r_nmBarang,});
            let subto = dataArr[i].lastPrice * (dataArr[i].stokPersediaan - item_now.value[i])
            let ket = keterangan.value[i]
            if (!isNaN(subto)) {
                if(!ket){
                    ket = '-'
                }
                arr.push ({
                    'kdBarang' : dataArr[i].kdPersediaan,
                    'nmBarang' : dataArr[i].nmPersediaan,
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
