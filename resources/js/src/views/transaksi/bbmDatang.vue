<template>
    <div class="layout-px-spacing apps-invoice-add">
        <teleport to="#breadcrumb">
            <ul class="navbar-nav flex-row">
                <li>
                    <div class="page-header">
                        <nav class="breadcrumb-one" aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:;">Apps</a></li>
                                <li class="breadcrumb-item active" aria-current="page"><span>Kedatangan BBM</span></li>
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
                        <!-- <div class="col-xl-12"> -->
                            <div class="invoice-content">
                                <div class="invoice-detail-body">
                                    <div class="invoice-detail-title">
                                       
                                        <div class="invoice-title">
                                            Kedatangan BBM
                                        </div>
                                    </div>

                                    <div class="invoice-detail-header">
                                        <div class="row justify-content-between">
                                            <div class="col-xl-5 invoice-address-company">

                                                <div class="invoice-address-company-fields">
                                                    <div class="form-group row">
                                                        <label for="company-name" class="col-sm-3 col-form-label col-form-label-sm">No Nota</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" v-model="params.no_br" id="number" class="form-control form-control-sm" placeholder="#0001" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="company-email" class="col-sm-3 col-form-label col-form-label-sm">Tgl</label>
                                                        <div class="col-sm-9">
                                                            <flat-pickr v-model="params.tgl_terima" class="form-control form-control-sm flatpickr active" placeholder="Invoice Date"></flat-pickr>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="col-xl-5 invoice-address-client">

                                                <div class="invoice-address-client-fields">

                                                    <div class="input-group mb-4">
                                                        <input type="text" class="form-control" v-model="params.no_so" placeholder="Cari SO" aria-label="Cari SO" />
                                                        <!-- <input type="text" class="form-control" v-model="params.no_po" placeholder="Cari SO" aria-label="Cari SO" /> -->
                                                        <button class="btn btn-primary" @click="openModal()">Cari</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <vue-final-modal v-model="isOpen">
                                    <!-- <div class="modal fade" id="modalSo" tabindex="-1" role="dialog" aria-labelledby="modalSo" aria-hidden="true"> -->
                                        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Daftar PO</h5>
                                                    <button type="button" data-dismiss="modal" data-bs-dismiss="modal" aria-label="Close" class="btn-close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <!-- {{ listpo }} -->
                                                    <!-- <h4 class="modal-heading mb-4 mt-2">Aligned Center</h4> -->

                                                    <div class="table-responsive">
                                                        <table role="table" aria-busy="false" aria-colcount="5" class="table table-bordered" >
                                                            <thead role="rowgroup">
                                                                <tr role="row">
                                                                    <th role="columnheader" scope="col" aria-colindex="1"><div>No Po</div></th>
                                                                    <th role="columnheader" scope="col" aria-colindex="2"><div>No SO</div></th>
                                                                    <th role="columnheader" scope="col" aria-colindex="3"><div>Tgl</div></th>
                                                                    <th role="columnheader" scope="col" aria-colindex="4" class="text-center"><div>Pilih</div></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody role="rowgroup">
                                                                <tr v-for="ls in listpo" :key="ls.idPo">
                                                                    <td role="cell">{{ ls.no_po }}</td>
                                                                    <td role="cell">{{ ls.no_so }}</td>
                                                                    <td role="cell">{{ moment(ls.tgl_po).format('D-M-YYYY') }}</td>
                                                                    <td role="cell">
                                                                        <button type="button" class="btn btn-secondary additem btn-sm" @click="get(ls)">Pilih</button>
                                                                    </td>
                                                                    
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>

                                                </div>
                                                <div class="modal-footer">
                                                    <!-- <button type="button" class="btn" data-dismiss="modal" data-bs-dismiss="modal"><i class="flaticon-cancel-12"></i> Discard</button> -->
                                                    <!-- <button type="button" class="btn btn-primary">Save</button> -->
                                                </div>
                                            </div>
                                        </div>
                                    <!-- </div> -->
                                    </vue-final-modal>

                                    

                                    <div class="invoice-detail-items">
                                        <div class="inv--product-table-section">
                                            <div class="table-responsive">
                                                <table class="table table-hover table-bordered item-table">
                                                    <thead>
                                                        <tr>
                                                            <th>Nama Barang</th>
                                                            <th>Harga</th>
                                                            <th>Qty Order</th>
                                                            <th>Qty Terima</th>
                                                            <th>Qty Datang</th>
                                                            <th>Total</th>
                                                            <th>Sisa</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr v-for="item, index in brg" :key="item.kdBarang">
                                                            <td class="amount">{{ item.nmBarang }}</td>
                                                            <td class="rate">
                                                                {{ new Intl.NumberFormat().format(item.hrgBeli) }}
                                                                <input type="text" v-model="item.hrgBeli" class="form-control" />
                                                            </td>
                                                            <td class="qty">{{ item.qty }}</td>
                                                            <td class="qty">{{ item.qty_recieve }}</td>
                                                            <td class="qty"><input type="text" v-model="qty_datang[index]" class="form-control" /></td>
                                                            <td class="qty">{{ new Intl.NumberFormat().format(qty_datang[index] * item.hrgBeli) }}</td>
                                                            <td class="amount">{{ new Intl.NumberFormat().format((item.qty -item.qty_recieve) - qty_datang[index]) }}</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <!-- <button type="button" class="btn btn-secondary additem btn-sm" @click="add_item()">Add Item</button> -->
                                    </div>

                                    

                                    <div class="invoice-detail-total">
                                        <div class="row">

                                            <div class="col-md-6">
                                                <div class="invoice-actions-btn">
                                                    <div class="invoice-action-btn">
                                                        <div class="row">
                                                            <!-- <div class="col-sm-4">
                                                                <div v-if="divpajak">
                                                                    <a href="javascript:;" class="btn btn-primary btn-send" @click="taxRemove" >- pajak</a>
                                                                </div>
                                                                <div v-if="!divpajak">
                                                                    <a href="javascript:;" class="btn btn-primary btn-send" @click="taxSelected" >+ pajak</a>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <a href="javascript:;" @click="addPayment" class="btn btn-dark btn-preview" data-bs-toggle="modal" data-bs-target="#modalPayment">Pembayaran</a>
                                                            </div> -->
                                                            <div class="col-sm-4">
                                                                <a href="javascript:;" @click="simpanKedatangan" class="btn btn-success btn-download">Save</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="modal fade" id="modalPayment" tabindex="-1" role="dialog" aria-labelledby="modalPayment" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="modalPayment">Vertically Aligned</h5>
                                                            <button type="button" data-dismiss="modal" data-bs-dismiss="modal" aria-label="Close" class="btn-close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <h4 class="modal-heading mb-4 mt-2">Aligned Center</h4>
                                                            <multiselect 
                                                                v-model="paramsacc" 
                                                                :options="pembelian.accs" 
                                                                :searchable="true"
                                                                track-by="name"
                                                                label="name"
                                                                open-direction="top"
                                                                placeholder="Choose..." 
                                                                selected-label="" 
                                                                select-label="" >
                                                            </multiselect>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn" data-dismiss="modal" data-bs-dismiss="modal"><i class="flaticon-cancel-12"></i> Discard</button>
                                                            <button type="button" class="btn btn-primary">Save</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            
                                        </div>
                                    </div>

                                    
                                </div>
                            </div>
                        <!-- </div> -->

                        
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
                                <!-- {{ listbiaya }} -->

                                <div class="invoice-detail-header">
                                    <div class="row justify-content-between">

                                        <div class="row invoice layout-top-spacing layout-spacing apps-invoice">
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <div class="doc-container">
                                                    <div class="row">
                                                        <div class="col-xl-9">
                                                            <div class="invoice-container">
                                                                <div class="custom-table panel-body p-0">

                                                                    <v-client-table :data="listbbmdatang" :columns="columns" :options="table_option">
                                                                        <template #r_kdterima="props"> {{ props.row.r_kdterima }} </template>
                                                                        <template #tgl_terima="props"> {{ moment(props.row.tgl_terima).format("DD-MM-YYYY") }} </template>
                                                                        <template #r_pono="props"> {{ props.row.r_pono }} </template>
                                                                        <template #r_poso="props"> {{ props.row.r_poso }} </template>
                                                                        <template #nama_bbm="props"> {{ props.row.nama_bbm }} </template>
                                                                        <template #qty_terima="props"> {{ Number(props.row.qty_terima).toLocaleString() }} </template>
                                                                        <template #action="props">
                                                                            <a href="javascript:void(0);" @click="edit_row(props.row)" >
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
                                                                                    class="feather feather-trash-2"
                                                                                >
                                                                                    <polyline points="3 6 5 6 21 6"></polyline>
                                                                                    <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                                                                    <line x1="10" y1="11" x2="10" y2="17"></line>
                                                                                    <line x1="14" y1="11" x2="14" y2="17"></line>
                                                                                </svg>
                                                                            </a>
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
                                                                            <a href="javascript:;" class="btn btn-info btn-download" @click="export_table(type='print')">Print</a>
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
                                                                            <a href="javascript:;" @click="cari()" class="btn btn-success btn-download">Cari</a>
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
    // import { onMounted, ref } from 'vue';
    import '@/assets/sass/apps/invoice-add.scss';

    //flatpickr
    import flatPickr from 'vue-flatpickr-component';
    import 'flatpickr/dist/flatpickr.css';
    import '@/assets/sass/forms/custom-flatpickr.css';

    import Multiselect from '@suadelabs/vue3-multiselect';
    import '@suadelabs/vue3-multiselect/dist/vue3-multiselect.css';

    import moment from "moment";


    import { computed, ref, onMounted, watch } from 'vue';
    import { useStore } from 'vuex';
    import { useRouter, useRoute } from 'vue-router'

    import { useMeta } from '@/composables/use-meta';
    useMeta({ title: 'BBM Datang' });

    const store = useStore();
    const router = useRouter();
    const route = useRoute();

    const items = ref([]);
    const listbbmdatang = ref([]);
    const brg = ref([]);
    const noterima = ref([]);
    const qty = ref(1);
    const tot = ref();
    const subtotal = ref();
    const total = ref();
    const disc = ref(0);
    const tax = ref();
    const selected_file = ref(null);
    const payment = ref([]);
    const listpo = ref([]);
    const no_so = ref();
    const no_po = ref();
    const r_supplier = ref();
    const isOpen = ref(false);
    const params = ref({
        no_br: noterima,
        tgl_terima: moment().format("YYYY-MM-DD"),
        term: 0,
        jthTempo: moment().format("YYYY-MM-DD"),
        no_so: no_so,
        no_po: no_po,
        subtotal: subtotal,
        tax: 11,
        disc: disc,
        total: total,
        kdSupplier: r_supplier
    });

    const columns = ref(['r_kdterima', 'r_nopo', 'r_noso' ,'tgl_terima', 'nama_bbm' ,'qty_terima', 'action']);
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
        sortable: ['r_kdterima', 'r_nopo', 'r_noso' ,'tgl_terima', 'nama_bbm' ,'qty_terima',],
        sortIcon: {
            base: 'sort-icon-none',
            up: 'sort-icon-asc',
            down: 'sort-icon-desc',
        },
        resizableColumns: true,
        resizableRows: true,
    });
    const sorting = ref({
        startDate: moment().subtract(30,'d').format("D-M-YYYY"),
        endDate: moment().format("D-M-YYYY")
    });
    const cartItems = ref([])
    const divpajak = ref(false)
    const qty_datang = ref([]);
    const harga_datang = ref([]);

    const pembelian = computed(() => {
        const accs = store.getters.StateAcc;
        noterima.value = store.getters.NoTerimaBbm;
        const pajak = store.state.pajak;
        tot.value = brg.value.lastPrice * qty.value;
        listpo.value = store.getters.SlistPobbm;
        // console.log(suppliers)
        return { pajak, noterima, accs, tot, listpo}
    });

    // const getBarang=() => {
    //     store.dispatch('GetPersediaan')
    // }

    
    const getNoTerima=() => {
        store.dispatch('GetTerimabbm')
    }
    const getListPo=() => {
        store.dispatch('ListPo', sorting.value)
       
    }
    const getListBbmDatang=() => {
        store.dispatch('GetListBbmDatang', sorting.value)
        setTimeout(function() { listbbmdatang.value = store.getters.SlistBbmDatang ; }, 2000);
       
    }
    const cari = () => {
         getListBbmDatang();
    }
    
    const simpanKedatangan=() => {
        const header =params.value
        // const headers =paramssupplier.value
            // const headerfull = Object.assign(header, headers)
            const detail =brg.value
            const arrdetail = []
            for (let i = 0; i < detail.length; i++) {
                if(qty_datang.value[i] != null && qty_datang.value[i] != ''){
                    arrdetail.push({
                        'kdbbm': detail[i].kdBarang,
                        'nmBarang': detail[i].nmBarang,
                        'hrgPokok': detail[i].hrgBeli,
                        'qty_order': detail[i].qty,
                        'qty_datang': qty_datang.value[i],
                        'qty_sisa': detail[i].qty - qty_datang.value[i],
                        'no_po': detail[i].r_noPo,
                        'nilai_datang': qty_datang.value[i] * detail[i].hrgBeli,
                        'accid_persediaan': detail[i].accid_persediaan,
                    })
                }
            }
            store.dispatch('CreateBarangDatang', [header,arrdetail] )
            setTimeout(function() { 
                // getCart(); 
                brg.value = {};
            }, 5000);
            getNoTerima();
    }

    onMounted( async () => {
        //set default data
        // items.value.push({ id: 1, title: '', description: '', rate: 0, quantity: 0, amount: 100, is_tax: false });

        let dt = new Date();
        params.value.invoice_date = JSON.parse(JSON.stringify(dt));
        dt.setDate(dt.getDate() + 5);
        params.value.due_date = dt;

        // console.log(paramssupplier.value)
       
        // getBarang();
        // getAcc();
        getListBbmDatang();
        getNoTerima();
        // getListPo();
        
    });

    const change_file = (event) => {
        selected_file.value = URL.createObjectURL(event.target.files[0]);
    };

    // const add_item = () => {
    //     let max_id = 0;
    //     if (items.value && items.value.length) {
    //         max_id = items.value.reduce((max, character) => (character.id > max ? character.id : max), items.value[0].id);
    //     }
    //     items.value.push({ id: max_id + 1, title: '', description: '', rate: 0, quantity: 0, amount: 0, is_tax: false });
    // };


    const get = async (item) => {
        // items.value = items.value.filter((d) => d.id != item.id);
        // console.log(item)
        await store.dispatch('GetdetailPo', {no_po: item.no_po})
        no_so.value = item.no_so
        no_po.value = item.no_po
        r_supplier.value = item.kdSupplier
        // harga_datang.value =
        isOpen.value = false;
        brg.value = JSON.parse(localStorage.getItem('terimabarang'));
    };

    const openModal = () => {
        getListPo();
        // code.value = list.code_bbm;
        // harga_old.value = list.last_price;
        isOpen.value = true;
    }

    
    const export_table = (type) => {
        let cols = columns.value.filter((d) => d != 'profile' && d != 'action');
        let records = listbbmdatang.value;
        let filename = 'Daftar BBM Datang | Periode Tgl : ';

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
            var rowhtml = '<p>' + filename + sorting.value.startDate + ' s/d ' + sorting.value.endDate + '</p>';
            rowhtml +=
                '<table style="width: 95%; " cellpadding="0" cellcpacing="0" border="1"><thead><tr style="color: #515365; background: #eff5ff; -webkit-print-color-adjust: exact; print-color-adjust: exact; "> ';
            cols.map((d) => {
                rowhtml += '<th>' + capitalize(d) + '</th>';
            });
            rowhtml += '</tr></thead>';
            rowhtml += '<tbody>';

            // records.map((item) => {
            //     rowhtml += '<tr>';
            //     cols.map((d) => {
            //         let val = item[d] ? item[d] : '';
            //         rowhtml += '<td>' + val + '</td>';
            //     });
            //     rowhtml += '</tr>';
            // });
            records.map((item) => {
                rowhtml += '<tr>';
                rowhtml += '<td>'+item.r_kdterima+'</td>';
                rowhtml += '<td>'+item.r_nopo+'</td>';
                rowhtml += '<td>'+item.r_noso+'</td>';
                rowhtml += '<td>'+moment(item.tgl_terima).format("DD-MM-YYYY")+'</td>';
                rowhtml += '<td>'+item.nama_bbm+'</td>';
                rowhtml += '<td>'+Number(item.qty_terima).toLocaleString()+'</td>';
                rowhtml += '</tr>';
                // cols.map((d) => {
                //     let val = item[d] ? item[d] : '';
                //     rowhtml += '<td>' + val + '</td>';
                // });
                rowhtml += '</tr>';
            });
            rowhtml +=
                '<style>body {font-family:Arial; color:#495057;}p{text-align:center;font-size:8px;font-weight:bold;margin:15px;}table{ border-collapse: collapse; border-spacing: 0; }th,td{font-size:8px;text-align:left;padding: 4px;}th{padding:8px 4px;}tr:nth-child(2n-1){background:#f7f7f7; }</style>';
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

    // const addPayment = () => {
    //     payment.value = localStorage.setItem('payment', '[]');
    //     // alert('add payment')
    // };

    function onlyNumber ($event) {
        //console.log($event.keyCode); //keyCodes value
        let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
        if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
            $event.preventDefault();
        }   
    }

    const delete_row = (data) => {
        // alert(data.kd_trans);
        new window.Swal({
            title: 'Anda Yakin?',
            text: "Hapus BBM Datang !" +data.r_kdterima,
            type: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Delete',
            padding: '2em'
        }).then(result => {
            if (result.value) {
                store.dispatch('DeleteBbmDatang', { id:data.r_kdterima})
                .then(response => {
                    getListBbmDatang();
                    getNoTerima();
                    new window.Swal('Deleted!', 'Your file has been deleted.', 'success');
                }).catch(error => {
                    // console.log('error: ', error)
                    return
                })
                
            }
        });
    }
</script>
