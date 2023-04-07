<template>
    <div class="layout-px-spacing apps-invoice-add">
        <teleport to="#breadcrumb">
            <ul class="navbar-nav flex-row">
                <li>
                    <div class="page-header">
                        <nav class="breadcrumb-one" aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:;">Apps</a></li>
                                <li class="breadcrumb-item active" aria-current="page"><span>Penjualan</span></li>
                            </ol>
                        </nav>
                    </div>
                </li>
            </ul>
        </teleport>

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
                    <div class="col-xl-12">
                        <div class="invoice-content">
                            <div class="invoice-detail-body">
                                <div class="invoice-detail-title">
                                
                                    <div class="invoice-title">
                                        Penjualan Kupon
                                    </div>
                                </div>

                                <div class="invoice-detail-header">
                                    <div class="row justify-content-between">
                                        <div class="col-xl-5 invoice-address-company">

                                            <div class="invoice-address-company-fields">
                                                <div class="form-group row">
                                                    <label for="company-name" class="col-sm-3 col-form-label col-form-label-sm">No Nota</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" v-model="params.noNota" id="number" class="form-control form-control-sm" placeholder="#0001" />
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="company-email" class="col-sm-3 col-form-label col-form-label-sm">Tgl</label>
                                                    <div class="col-sm-9">
                                                        <flat-pickr v-model="params.tglNota" class="form-control form-control-sm flatpickr active" placeholder="Invoice Date"></flat-pickr>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <!-- <div class="col-xl-5 invoice-address-client">

                                            <div class="invoice-address-client-fields">
                                                <div class="form-group row">
                                                    <label for="client-name" class="col-sm-3 col-form-label col-form-label-sm">Pelanggan</label>
                                                    <div class="col-sm-9">
                                                        <multiselect 
                                                            v-model="paramspelanggan" 
                                                            :options="penjualan.pelanggans" 
                                                            :searchable="true"
                                                            :allow-empty="false"
                                                            track-by="nmPelanggan"
                                                            label="nmPelanggan"
                                                            open-direction="top"
                                                            placeholder="Choose..." 
                                                            selected-label="" 
                                                            select-label="" 
                                                            deselect-label="">
                                                        </multiselect>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="client-address" class="col-sm-3 col-form-label col-form-label-sm">Address</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" v-model="paramspelanggan.almtPelanggan" id="client-address" class="form-control form-control-sm" placeholder="XYZ Street" />
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="client-phone" class="col-sm-3 col-form-label col-form-label-sm">Phone</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" v-model="paramspelanggan.noHpPelanggan" id="client-phone" class="form-control form-control-sm" placeholder="(123) 456 789" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div> -->
                                    </div>
                                </div>

                                <div class="invoice-detail-items">
                                    <div class="row">
                                        <div class="form-group col-md-3">
                                            <label for="inputCity">NAMA PELANGGAN</label>
                                            <multiselect 
                                                v-model="paramspelanggan" 
                                                :options="penjualan.pelanggans" 
                                                :searchable="true"
                                                :allow-empty="false"
                                                track-by="nmPelanggan"
                                                label="nmPelanggan"
                                                open-direction="top"
                                                placeholder="Choose..." 
                                                selected-label="" 
                                                select-label="" 
                                                deselect-label="">
                                            </multiselect>
                                        </div>
                                        <div class="form-group col-md-2">
                                            <label for="inputState">Alamat</label>
                                            <input type="text" v-model="paramspelanggan.almtPelanggan" class="form-control form-control-sm" placeholder="Price" />
                                        </div>
                                        <div class="form-group col-md-2">
                                            <label for="inputZip">TOTAL</label><br>
                                            <!-- {{ new Intl.NumberFormat().format(paramspelanggan.hrgJual * qty) }} -->
                                            <input type="text" v-model="paramspelanggan.total" class="form-control form-control-sm" placeholder="Quantity" @keypress="onlyNumber" />
                                        </div>
                                        <div class="form-group col-md-1">
                                            <label for="aksi">Aksi</label>
                                            <button @click="addToCart(paramspelanggan)" class="btn btn-xs btn-primary">
                                                + 
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="invoice-detail-items">
                                    <div class="inv--product-table-section">
                                        <div class="table-responsive">
                                            <table class="table table-hover table-bordered item-table">
                                                <thead>
                                                    <tr>
                                                        <th>Nama Pelanggan</th>
                                                        <th>Alamat</th>
                                                        <th>Total</th>
                                                        <th>Aksi</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr v-for="item in cartKupon" :key="item.kdPelanggan">
                                                        <td class="description">{{ item.nmPelanggan }}</td>
                                                        <td class="qty">{{ item.almtPelanggan }}</td>
                                                        <td class="amount">{{ new Intl.NumberFormat().format(item.total) }}</td>
                                                        <td class="tax">
                                                            <button type="button" class="btn btn-secondary additem btn-sm" @click="removeItem(id=item.kdPelanggan)">Hapus</button>
                                                            <!-- <div class="icon-container">
                                                                <i data-feather="trash"></i><span class="icon-name"> trash</span>
                                                            </div> -->
                                                        </td>
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
                                                        <div class="col-sm-4">
                                                            <a href="javascript:;" @click="simpanPenjualan" class="btn btn-success btn-download">Save</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        

                                        <div class="col-md-6">
                                            <div class="totals-row">
                                                <div class="invoice-totals-row invoice-summary-balance-due">
                                                    <div class="invoice-summary-label">Total</div>
                                                    <!-- <div class="invoice-summary-label"></div> -->
                                                    <div class="invoice-summary-value">
                                                        <div class="balance-due-amount"><span class="currency"></span>
                                                            <span>{{ new Intl.NumberFormat().format(Math.floor(total)) }}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="invoice-detail-note">
                                    <div class="row">
                                        <div class="col-md-12 align-self-center">
                                            <div class="form-group row invoice-note">
                                                <label for="invoice-detail-notes" class="col-sm-12 col-form-label col-form-label-sm">Notes:</label>
                                                <div class="col-sm-12">
                                                    <textarea
                                                        v-model="params.notes"
                                                        rows="3"
                                                        id="invoice-detail-notes"
                                                        class="form-control"
                                                        placeholder='Notes - For example, "Thank you for doing business with us"'
                                                    ></textarea>
                                                </div>
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
                                                                <div class="custom-table panel-body p-0">

                                                                    <v-client-table :data="items" :columns="columns" :options="table_option">
                                                                        <template #tglPenjualanKupon="props"> {{ moment(props.row.tglPenjualanKupon).format("DD-MM-YYYY") }} </template>
                                                                        <template #total="props"> {{ Number(props.row.total).toLocaleString() }} </template>
                                                                        <template #action="props">
                                                                            <a href="javascript:void(0);" @click="edit_row(props.row)">
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
                                                                            <!-- <a href="javascript:void(0);" @click="delete_row(props.row)"> Delete </a> -->
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
                                                                            <a href="javascript:;" class="btn btn-secondary btn-print" @click="print()">Print</a>
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
                                                                            <a href="javascript:;" @click="cari_data()" class="btn btn-success btn-download">Cari</a>
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
    import { computed, onMounted, ref, onBeforeMount } from 'vue';
    import '@/assets/sass/apps/invoice-add.scss';

    //flatpickr
    import flatPickr from 'vue-flatpickr-component';
    import 'flatpickr/dist/flatpickr.css';
    import '@/assets/sass/forms/custom-flatpickr.css';

    import Multiselect from '@suadelabs/vue3-multiselect';
    import '@suadelabs/vue3-multiselect/dist/vue3-multiselect.css';

    import moment from "moment";

    import { useStore } from 'vuex';
    import { useRouter, useRoute } from 'vue-router'

    import { useMeta } from '@/composables/use-meta';
    useMeta({ title: 'Penjualan' });

    const store = useStore();
    const router = useRouter();
    const route = useRoute();

    const items = ref([]);
    const nopenjualan = ref([]);
    const qty = ref(1);
    const subtotal = ref();
    const total = ref();
    const selected_file = ref(null);
    const tot = ref();
    const payment = ref([]);
    const params = ref({
        noNota: nopenjualan,
        tglNota: moment().format("YYYY-MM-DD"),
        term: 0,
        jthTempo: moment().format("YYYY-MM-DD"),
        notes: '',
        subtotal: subtotal,
        total: total,
    });
    const paramspelanggan = ref({
        kdPelanggan: '',
        nmPelanggan: '',
        almtPelanggan: '',
        noHpPelanggan: '',

    });
    const cartKupon = ref([])
    // const newValue = ref()
    // const currency_list = ref([]);
    const columns = ref(['noPenjualanKupon', 'tglPenjualanKupon', 'total', 'action']);
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
        sortable: ['noPenjualanKupon', 'tglPenjualanKupon',],
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

    const penjualan = computed(() => {
        const pelanggans = store.getters.StatePelanggan;
        nopenjualan.value = store.getters.NoKupon;
        tot.value = paramspelanggan.value.hrgJual * qty.value;
        // const pajak = ref(store.state.pajak);
        // console.log(suppliers)
        return { pelanggans, nopenjualan, tot }
    });

    const getPelanggan=() => {
        store.dispatch('GetPelanggan')
    }
    const getNoPenjualan=() => {
        store.dispatch('GetNoKupon')
    }


    const getTotal=() =>{
        const pajak = store.state.pajak;
        total.value = subtotal.value ;
        
        // return { tot }
    }
   
    const get_data = () => {
        store.dispatch('GetListPenjualanKupon', sorting.value );
        setTimeout(function() { items.value = store.getters.SlistPenjualanKupon ; }, 3000);
    };

    const cari_data = () => {
        get_data();
    }

    const simpanPenjualan=() => {
        const header =params.value
        // const headers =paramspelanggan.value
        // const headerfull = Object.assign(header, headers)
        const detail =cartKupon.value
        store.dispatch('CreatePenjualanKupon', [header,detail] )
        total.value = 0
        subtotal.value = 0
        setTimeout(function() { 
            getCart(); 
        }, 5000);
        getNoPenjualan();
        total.value = 0
    }

    onMounted(() => {
       
        getPelanggan();
        getCart();
        getNoPenjualan();
        get_data();
    });


    function addToCart(paramspelanggan) {
        // console.log(paramspelanggan)
        if (localStorage.getItem('cartKupon')===null){
            cartKupon.value = [];
            // console.log(cartItems.value)
        }else{
            cartKupon.value = JSON.parse(localStorage.getItem('cartKupon'));
        }
            const oldItems = JSON.parse(localStorage.getItem('cartKupon')) || [];
            // console.log(oldItems)
            const existingItem = oldItems.find(({ kdPelanggan }) => kdPelanggan === paramspelanggan.kdPelanggan);
            if (existingItem) {
                const objIndex = cartKupon.value.findIndex((e => e.kdPelanggan === paramspelanggan.kdPelanggan));
                const oldName = cartKupon.value[objIndex].nmPelanggan;
                const oldTotal = cartKupon.value[objIndex].total;
                const newTotal = parseInt(oldTotal) + parseInt(paramspelanggan.total) ;
                cartKupon.value[objIndex].total = parseInt(newTotal);
                localStorage.setItem('cartKupon',JSON.stringify(cartKupon.value));
                alert(oldName+' Quantity Update')
                getCart();
                getTotal()
                // isicart = Object.keys(JSON.parse(localStorage.getItem('cartItemsP'))).length;
            }else{
            cartKupon.value.push({kdPelanggan:paramspelanggan.kdPelanggan, nmPelanggan:paramspelanggan.nmPelanggan,almtPelanggan:paramspelanggan.almtPelanggan,total:paramspelanggan.total});	
            localStorage.setItem('cartKupon',JSON.stringify(cartKupon.value));
            getCart();
            getTotal()
            // isicart = Object.keys(JSON.parse(localStorage.getItem('cartItemsP'))).length;
            alert(paramspelanggan.nmPelanggan+ " berhasil disimpan")
            }
    }
    function removeItem(id) {
        // alert(id)
        const arrayFromStroage = JSON.parse(localStorage.getItem('cartKupon'));
        const filtered = arrayFromStroage.filter(arrayFromStroage => arrayFromStroage.kdPelanggan !== id);
        localStorage.setItem('cartKupon', JSON.stringify(filtered));
        // cartItems.value.splice(index, 1)
        // this.isicart = Object.keys(JSON.parse(localStorage.getItem('cartItemsP'))).length;
        getCart();
        // subtotal.value = 0
        // total.value = 0
        // console.log(filtered)
        // alert(filtered.nmPelanggan)
    }

    function getCart() {
        // subtotal.value = []
        if (localStorage.getItem('cartKupon')===null){
            cartKupon.value = localStorage.setItem('cartKupon', '[]');
            // subtotal.value = 0
            // total.value = 0
        }else if(localStorage.getItem('cartKupon')==='[]'){
            // alert('masi kosong')
            cartKupon.value = localStorage.setItem('cartKupon', '[]')
            getTotal();
            subtotal.value = 0
            total.value = 0
        }else{
            cartKupon.value = JSON.parse(localStorage.getItem('cartKupon'));
            getSubtotal();
            getTotal();
            
    // this.isicart = JSON.parse(localStorage.getItem('cartItemsP')).length;
        }

    }


    function getSubtotal(){
        const allItems = JSON.parse(localStorage.getItem('cartKupon')) || [];
        let sum = 0;
        subtotal.value = 0
        for(let i = 0; i < allItems.length; i++){
        sum += (parseFloat(allItems[i].total));
        }
        subtotal.value = sum
        // console.log(subtotal.value)
        // return sum;
    }
    function onlyNumber ($event) {
        //console.log($event.keyCode); //keyCodes value
        let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
        if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
            $event.preventDefault();
        }   
    }
</script>
