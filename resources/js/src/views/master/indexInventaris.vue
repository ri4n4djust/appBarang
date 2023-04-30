<template>
    <div class="layout-px-spacing">
        <teleport to="#breadcrumb">
            <ul class="navbar-nav flex-row">
                <li>
                    <div class="page-header">
                        <nav class="breadcrumb-one" aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:;">Master</a></li>
                                <li class="breadcrumb-item active" aria-current="page"><span>Inventaris</span></li>
                            </ol>
                        </nav>
                    </div>
                </li>
            </ul>
        </teleport>


        <div class="row layout-top-spacing">
            <div class="col-12 layout-spacing">
                <div class="panel br-6">
                    <div class="custom-table panel-body p-0">
                        <div class="d-flex flex-wrap justify-content-center justify-content-sm-start px-3 pt-3 pb-0">
                            <button class="btn btn-primary mb-2 me-2" data-bs-toggle="modal" data-bs-target="#exampleModalCenter">Tambah</button>
                            <button variant="primary" class="btn m-1 btn-primary" @click="export_table('print')">Print</button>
                            <button variant="primary" class="btn m-1 btn-primary" @click="export_table('pdf')">PDF</button>
                            <button class="btn btn-primary mb-2 me-2" data-bs-toggle="modal" data-bs-target="#modalPenyusutan">SUSUTKAN BERDASARKAN KATEGORI</button>
                            <!-- <flat-pickr v-model="input.tahun_pembuatan" class="form-control form-control-sm flatpickr active" placeholder="Invoice Date"></flat-pickr> -->
                        </div>

                        <v-client-table :data="items" :columns="columns" :options="table_option">
                            <template #nilai_inventaris="props"> {{ Number(props.row.nilai_inventaris).toLocaleString() }} </template>
                            <template #qty_inventaris="props"> {{ Number(props.row.qty_inventaris).toLocaleString() }} </template>
                            <template #action_jurnal="props">
                                
                                <div v-if="itemsjurnal.length === 0 ">
                                    Belum Disusutkan 
                                        <a href="javascript:void(0);" @click="jurnal_row(props.row)" >
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
                                                class="feather feather-settings text-primary"
                                            >
                                                <circle cx="12" cy="12" r="3"></circle>
                                                <path
                                                    d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"
                                                ></path>
                                            </svg>
                                        </a>
                                </div>
                                <div v-else-if="items.nilai_inventaris === 0 ">
                                    Belum Di beli 
                                        <!-- <a href="javascript:void(0);" @click="jurnal_row(props.row)" >
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
                                                class="feather feather-settings text-primary"
                                            >
                                                <circle cx="12" cy="12" r="3"></circle>
                                                <path
                                                    d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"
                                                ></path>
                                            </svg>
                                        </a> -->
                                </div>
                                <div v-else>
                                    
                                    <div :set="data = itemsjurnal.filter(n => n.rkode_inventaris === props.row.kode_inventaris)">

                                       
                                        <p v-if="data.length > 0">sudah  </p>
                                        <p v-else>belum
                                            <a href="javascript:void(0);" @click="jurnal_row(props.row)" >
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
                                                    class="feather feather-settings text-primary"
                                                >
                                                    <circle cx="12" cy="12" r="3"></circle>
                                                    <path
                                                        d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"
                                                    ></path>
                                                </svg>
                                            </a>
                                        </p>
                                            


                                    </div>
                                    
                                </div>
                                
                                
                            </template>
                            <template #action="props">
                                
                                <router-link :to="{name: 'rekapan', params: {startDate: props.row.tgl_trans, kd_trans:props.row.kd_trans, regu:props.row.r_regu }}" >
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
                                        class="feather feather-edit-2 text-success"
                                    >
                                        <path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path>
                                    </svg>
                                </router-link>
                                <a href="javascript:void(0);" @click="delete_row(props.row)" >
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
                                        class="feather feather-trash-2 text-danger"
                                    >
                                        <polyline points="3 6 5 6 21 6"></polyline>
                                        <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                        <line x1="10" y1="11" x2="10" y2="17"></line>
                                        <line x1="14" y1="11" x2="14" y2="17"></line>
                                    </svg>
                                </a>
                            </template>
                        </v-client-table>

                        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Tambah Data Inventaris</h5>
                                        <button type="button" data-dismiss="modal" data-bs-dismiss="modal" aria-label="Close" class="btn-close"></button>
                                    </div>
                                    <div class="modal-body">

                                        <div class="invoice-address-company-fields">
                                            <div class="form-group row">
                                                <label for="company-name" class="col-sm-3 col-form-label col-form-label-sm">Kode Inventaris</label>
                                                <div class="col-sm-9">
                                                    <input type="text" v-model="input.kode_inventaris" id="number" class="form-control form-control-sm" disabled />
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="nama" class="col-sm-3 col-form-label col-form-label-sm">Nama Inventaris</label>
                                                <div class="col-sm-9">
                                                    <input type="text" v-model="input.nama_inventaris" id="nama" class="form-control form-control-sm" placeholder="Nama Inventaris" />
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="nama" class="col-sm-3 col-form-label col-form-label-sm">Kategori</label>
                                                <div class="col-sm-9">
                                                    <select id="inputState" v-model="input.group_inventaris" class="form-select">
                                                        <option value="12200" selected>GEDUNG DAN BANGUNAN</option>
                                                        <option value="12300" selected>PERALATAN DAN MESIN</option>
                                                        <option value="12400">PERLENGKAPAN</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="nama" class="col-sm-3 col-form-label col-form-label-sm">Akun Akumulasi</label>
                                                <div class="col-sm-9">
                                                    <select id="inputState" v-model="input.accid_akum" class="form-select">
                                                        <option value="12501" selected>AKP. PERALATAN DAN MESIN</option>
                                                        <option value="12502">AKP. BANGUNAN DAN GEDUNG</option>
                                                        <option value="12503">AKP. PERALATAN</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="tahun" class="col-sm-3 col-form-label col-form-label-sm">Tahun Pembuatan</label>
                                                <div class="col-sm-9">
                                                    <input type="text" v-model="input.tahun_pembuatan" id="tahun" class="form-control form-control-sm" placeholder="Tahun Pembuatan" />
                                                    <!-- <flat-pickr v-model="input.tahun_pembuatan" class="form-control form-control-sm flatpickr active" placeholder="Invoice Date"></flat-pickr> -->
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="company-name" class="col-sm-3 col-form-label col-form-label-sm">Tahun Perakitan</label>
                                                <div class="col-sm-9">
                                                    <input type="text" v-model="input.tahun_perakitan" id="number" class="form-control form-control-sm" placeholder="Tahun Perakitan" />
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="company-name" class="col-sm-3 col-form-label col-form-label-sm">Warna</label>
                                                <div class="col-sm-9">
                                                    <input type="text" v-model="input.warna" id="number" class="form-control form-control-sm" placeholder="Warna" />
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="company-name" class="col-sm-3 col-form-label col-form-label-sm">Merek</label>
                                                <div class="col-sm-9">
                                                    <input type="text" v-model="input.merek" id="number" class="form-control form-control-sm" placeholder="Merek" />
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="company-name" class="col-sm-3 col-form-label col-form-label-sm">Umur Ekonomis</label>
                                                <div class="col-sm-9">
                                                    <input type="text" v-model="input.umur_ekonomis" id="number" class="form-control form-control-sm" placeholder="Umur Ekonomis" />
                                                </div>
                                            </div>
                                        </div>
                                        
                                        
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn" data-dismiss="modal" data-bs-dismiss="modal"><i class="flaticon-cancel-12"></i> Discard</button>
                                        <button type="button" class="btn btn-primary" @click="simpan_inventaris">Save</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="modalPenyusutan" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Penyusutan Inventaris</h5>
                                        <button type="button" data-dismiss="modal" data-bs-dismiss="modal" aria-label="Close" class="btn-close"></button>
                                    </div>
                                    <div class="modal-body">

                                        <div class="invoice-address-company-fields">
                                            <div class="form-group row">
                                                <label for="nama" class="col-sm-3 col-form-label col-form-label-sm">Kategori</label>
                                                <div class="col-sm-9">
                                                    <select id="inputState" v-model="input.group_inventaris" class="form-select">
                                                        <option value="12200" selected>GEDUNG DAN BANGUNAN</option>
                                                        <option value="12300" selected>PERALATAN DAN MESIN</option>
                                                        <option value="12400">PERLENGKAPAN</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn" data-dismiss="modal" data-bs-dismiss="modal"><i class="flaticon-cancel-12"></i> Discard</button>
                                        <button type="button" class="btn btn-primary" @click="jurnal_kat()">Save</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        
                        
                    </div>
                </div>
            </div>
        </div>


        <!--  -->


        
    </div>
</template>

<script setup>
    import { computed, onMounted, ref } from 'vue';

    //pdf export
    import jsPDF from 'jspdf';
    import 'jspdf-autotable';

    import { useStore } from 'vuex';
    import moment from "moment";

    //flatpickr
    import flatPickr from 'vue-flatpickr-component';
    import 'flatpickr/dist/flatpickr.css';
    import '@/assets/sass/forms/custom-flatpickr.css';

    import { useMeta } from '@/composables/use-meta';
    useMeta({ title: 'Data Inventaris' });

    const store = useStore();

    const columns = ref(['kode_inventaris', 'action_jurnal','nama_inventaris', 'tahun_pembuatan', 'tahun_perakitan', 'merek', 'umur_ekonomis', 'nilai_inventaris', 'qty_inventaris' ,'action']);
    const items = ref([]);
    const itemsjurnal = ref([]);
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
        sortable: ['kode_inventaris', 'nama_inventaris', 'tahun_pembuatan',],
        sortIcon: {
            base: 'sort-icon-none',
            up: 'sort-icon-asc',
            down: 'sort-icon-desc',
        },
        resizableColumns: true,
    });

    const config = ref({
        wrap: true, // set wrap to true only when using 'input-group'
        altFormat: 'M j, Y',
        altInput: true,
        dateFormat: 'Y-m-d',
        // locale: Hindi, // locale for this instance only          
    });

    const kd = ref([]);
    const kdpenyusutan = ref([]);
    const input = ref({
        kode_inventaris: kd,
        tahun_pembuatan: moment().format("YYYY-MM-DD"),
        tahun_perakitan: moment().format("YYYY-MM-DD"),
    });

    onMounted(() => {
        bind_data();
        getKdInventaris();
        getKdPenyusutan();
    });

    
    const bind_data = () => {
        store.dispatch('GetInventaris');
        setTimeout(function() { 
            let c = store.getters.StateInventaris;
            items.value = c[0];
            itemsjurnal.value = c[1];
            // console.log(items.value);
        }, 2000);
    };

    const simpan_inventaris = () => {
        store.dispatch('CreateInventaris', input.value)
        .then(response => {
            bind_data();
            getKdInventaris();
            // new window.Swal('Deleted!', 'Your file has been deleted.', 'success');
        }).catch(error => {
            // console.log('error: ', error)
            return
        });
        
    };

    const getKdInventaris = () =>{
        store.dispatch('GetNoInventaris');
        setTimeout(function() { 
            kd.value = store.getters.NoInventaris ; 
            // console.log(kd.value)
        }, 2000);
    };

    const getKdPenyusutan = () =>{
        store.dispatch('GetNoPenyusutan');
        setTimeout(function() { 
            kdpenyusutan.value = store.getters.NoPenyusutan ; 
            // console.log(kd.value)
        }, 4000);
    };

    const jurnal_row = (row) => {
        // console.log(row)
        let kode = row.kode_inventaris ;
        let bulan = row.umur_ekonomis * 12 || 0;
        let qty_aset = row.qty_inventaris ;
        let acc_id = row.group_inventaris ;
        let nilai_inv = row.nilai_inventaris ;
        let nilai1 = nilai_inv / qty_aset || 0 ;
        let penyusutan1bln = Math.floor(nilai1 / bulan || 0) ;
        let tgl = moment().format("YYYY-M-D");
        const arrp = [] ;
        arrp.push({
            'kode_penyusutan': kdpenyusutan.value,
            'kode_inventaris' : kode,
            'tgl_penyusutan' : tgl,
            'jumlah_penyusutan' : penyusutan1bln,
            'acc_id' : acc_id,
            'accid_akum': row.accid_akum

        });

        new window.Swal({
            title: 'Anda Yahin?',
            text: "Anda akan menyusutkan " +row.nama_inventaris,
            type: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Ya',
            padding: '2em'
        }).then(result => {
            if (result.value) {
                store.dispatch('CreatePenyusutanInventaris', arrp)
                .then(response => {
                    bind_data();
                    getKdInventaris();
                    getKdPenyusutan();
                    // new window.Swal('Deleted!', 'Your file has been deleted.', 'success');
                }).catch(error => {
                    // console.log('error: ', error)
                    return
                })
                
                // new window.Swal('Deleted!', 'Your file has been deleted.', 'success');

            }
        });

    };

    const jurnal_kat = () => {

        let group = input.value.group_inventaris;
        // console.log(group);
        store.dispatch('getInvKat', {group : group})
        .then(response => {
            let brg_inv = response
            // console.log(brg_inv);
            const arr_kat = [];
            for (let i = 0; i < brg_inv.length; i++) {

                let bulan = brg_inv[i].umur_ekonomis * 12 || 0;
                let qty_aset = brg_inv[i].qty_inventaris ;
                let nilai_inv = brg_inv[i].nilai_inventaris ;
                let nilai1 = nilai_inv / qty_aset || 0 ;
                let penyusutan1bln = Math.floor(nilai1 / bulan || 0) ;
                let tgl = moment().format("YYYY-M-D");

                arr_kat.push({
                    'kode_penyusutan': kdpenyusutan.value,
                    'kode_inventaris' : brg_inv[i].kode_inventaris,
                    'tgl_penyusutan' : tgl,
                    'jumlah_penyusutan' : penyusutan1bln,
                    'acc_id' : brg_inv[i].group_inventaris,
                    'accid_akum': brg_inv[i].accid_akum
                });

            }
            console.log(arr_kat);
            store.dispatch('CreatePenyusutanInvByKat', {data : arr_kat})
            .then(response => {
                bind_data();
                getKdInventaris();
                getKdPenyusutan();
                // new window.Swal('Deleted!', 'berhasil disusutkan.', 'success');
            }).catch(error => {
                // console.log('error: ', error)
                return
            })
            // new window.Swal('Deleted!', 'Your file has been deleted.', 'success');
        }).catch(error => {
            // console.log('error: ', error)
            return
        })

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
                '<table style="width: 100%; " cellpadding="0" cellcpacing="0"><thead><tr style="color: #515365; background: #eff5ff; -webkit-print-color-adjust: exact; print-color-adjust: exact; "> ';
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
    const delete_row = (item) => {

        // alert('ID: ' + item.kdBarang + ', Name: ' + item.nmBarang);
        new window.Swal({
            title: 'Anda Yahin?',
            text: "Hapus Inventaris !" +item.nama_inventaris,
            type: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Delete',
            padding: '2em'
        }).then(result => {
            if (result.value) {
                store.dispatch('DeleteInventaris', { id: item.kode_inventaris} )
                .then(response => {
                    bind_data();
                    getKdInventaris();
                    new window.Swal('Deleted!', 'Your file has been deleted.', 'success');
                }).catch(error => {
                    // console.log('error: ', error)
                    return
                })

            }
        });
    };
</script>
