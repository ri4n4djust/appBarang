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
                                            Jurnal Umum
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

                                            <div class="col-xl-5 invoice-address-client">

                                            </div>
                                        </div>
                                    </div>

                                    <div class="invoice-detail-items">
                                        <div class="table-responsive">
                                            <table>
                                                <thead>
                                                    <tr style="padding:0;margin:0;">
                                                        <th class=""></th>
                                                        <th class="text-end">Akun</th>
                                                        <th>Description</th>
                                                        <th class="">DEBET</th>
                                                        <th class="">KREDIT</th>
                                                        
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr v-for="(item, index) in items" :key="index">
                                                        <td style="padding:0;margin:0;">
                                                            <ul >
                                                                <li>
                                                                    <a href="javascript:void(0);" class="delete-item" @click="remove_item(item)">
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
                                                                            class="feather feather-x-circle"
                                                                        >
                                                                            <circle cx="12" cy="12" r="10"></circle>
                                                                            <line x1="15" y1="9" x2="9" y2="15"></line>
                                                                            <line x1="9" y1="9" x2="15" y2="15"></line>
                                                                        </svg>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </td>
                                                        <td style="padding:0;margin:0;">
                                                            <!-- <input type="text" v-model="item.kredit" :id="'total'+index" width="100%" placeholder="Quantity" /> -->
                                                            <select id="inputState" v-model="item.acc" class="form-select">
                                                                <option :value="ac.acc_id" v-for="ac in accs" :key="ac.acc_id" selected>{{ ac.name }}</option>
                                                            </select>
                                                        </td>
                                                        <td style="padding:0;margin:0;" >
                                                            <input type="text" v-model="item.name">
                                                            <!-- <select id="inputState" v-model="item.title" style="width: 100%;height: 25px;">
                                                                <option :value="br" v-for="br in barangs" :key="br.id" selected>{{ br.nama_bbm }}</option>
                                                            </select> -->
                                                        </td>
                                                        <td style="padding:0;margin:0;">
                                                            <input type="text" v-model="item.debet" :id="'debet'+index" width="100%" @keyup="getTotal()" placeholder="Debet" @keypress="onlyNumber ($event)" />
                                                            <!-- <input type="text" v-model="item.kdPersediaan.kdPersediaan" :id="'rate'+index" class="form-control form-control-sm" placeholder="Price" /> -->
                                                        </td>
                                                        <td style="padding:0;margin:0;">
                                                            <input type="text" v-model="item.kredit" :id="'kredit'+index" width="100%"  placeholder="Kredit" @keypress="onlyNumber ($event)" />
                                                        </td>
                                                        
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                        <button type="button" class="btn btn-secondary additem btn-sm" @click="add_item()">Add Item</button>
                                    </div>


                                    <div class="invoice-detail-total">
                                        <div class="row">

                                            <div class="col-md-6">
                                                <div class="invoice-actions-btn">
                                                    <div class="invoice-action-btn">
                                                        <div class="row">
                                                            <div class="col-sm-4">
                                                                <a href="javascript:;" @click="simpanBiaya" class="btn btn-success btn-download">Save</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            

                                            <div class="col-md-6">
                                                <div class="totals-row">

                                                    <div class="invoice-totals-row invoice-summary-balance-due">
                                                        <div class="invoice-summary-label">Total</div>
                                                         <div class="invoice-summary-label"></div>
                                                        <div class="invoice-summary-value">
                                                            <!-- <div class="balance-due-amount"> -->
                                                                <span>{{ new Intl.NumberFormat().format(Math.floor(total)) }}</span>
                                                            <!-- </div> -->
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

                                                                    <v-client-table :data="list" :columns="columns" :options="table_option">
                                                                        <template #notrans="props"> {{ props.row.notrans }} </template>
                                                                        <template #tgl="props"> {{ moment(props.row.tgl).format("DD-MM-YYYY") }} </template>
                                                                        <template #keterangan_biaya="props"> {{ props.row.memo }} </template>
                                                                        <template #debet="props"> {{ Number(props.row.debet).toLocaleString() }} </template>
                                                                        <template #kredit="props"> {{ Number(props.row.kredit).toLocaleString() }} </template>
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
                                                                            <a href="javascript:;" class="btn btn-secondary btn-print" @click="export_table(type='print')">Print</a>
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
    useMeta({ title: 'Jurnal Umum' });

    const store = useStore();
    const router = useRouter();
    const route = useRoute();

    const items = ref([]);
    const list = ref([]);
    const accs = ref();
    const nobiaya = ref([]);
    const total = ref();
    const params = ref({
        noNota: nobiaya,
        tglNota: moment().format("YYYY-MM-DD"),
        total: total,
    });

    const columns = ref(['notrans', 'tgl', 'name' ,'memo' ,'debet', 'kredit' ,'action']);
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
        sortable: ['kd_trans', 'tglBiaya', 'keterangan_biaya' ,'jumlah'],
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

    const GetCoaList=() => {
        store.dispatch('GetCoaList', {acc: ''})
        setTimeout(function() { accs.value = store.getters.StateCoaList ; }, 2000);
    }
    const GetNoJurnalUmum=() => {
        store.dispatch('GetNoJurnalUmum');
        setTimeout(function() { nobiaya.value = store.getters.NoJurnalUmum ; }, 2000);
    }
    const GetJurnalUmum =() => {
        store.dispatch('GetJurnalUmum', sorting.value)
        setTimeout(function() { list.value = store.getters.StateGjList ; }, 2000);
    }


    const getTotal=() =>{
        // const pajak = store.state.pajak;
        // const temptotal = subtotal.value - (subtotal.value * disc.value / 100)
        // total.value = (subtotal.value - (subtotal.value * disc.value / 100))
        // tax.value = temptotal * pajak /100
        total.value = 0;
        let il = items.value.length;
        // var t = 0;
        for(var i = 0;i<il;i++){
            total.value += parseInt(items.value[i].debet);
        }
        
    }


    const simpanBiaya=() => {
        const header =params.value
        // const headers =paramssupplier.value
        // const headerfull = Object.assign(header, headers)
        const detail =items.value ;
        console.log(detail);
        store.dispatch('insertJuurnalUmum', [header,detail] )
        // setTimeout(function() { getCart(); }, 5000);
        GetNoJurnalUmum();
    }

    onMounted( async () => {
        //set default data
        items.value = []
        items.value.push({ 
            id: 1, 
            name: '',
            satuan: '', 
            acc: '', 
        },{ 
            id: 2, 
            name: '',
            satuan: '', 
            acc: '', 
        },
        );

        let dt = new Date();
        params.value.invoice_date = JSON.parse(JSON.stringify(dt));
        dt.setDate(dt.getDate() + 5);
        params.value.due_date = dt;

        // console.log(paramssupplier.value)
       
        GetCoaList();
        GetNoJurnalUmum();
        GetJurnalUmum();
        
    });


    const add_item = () => {
        
        let max_id = 0;
        // let sub = 0
        // for(let i = 0; i < items.value.length; i++){
        //     sub = items.value[i].rate * items.value[i].quantity;
        // }
        if (items.value && items.value.length) {
            max_id = items.value.reduce((max, character) => (character.id > max ? character.id : max), items.value[0].id);
            // items.title.value.focus();
        }
        items.value.push({ id: max_id + 1, name: '', biaya:'', satuan: '', acc: '' });
        // items.value[1].title.focus();
    };

    const remove_item = (item) => {
        items.value = items.value.filter((d) => d.id != item.id);
    };

    function onlyNumber ($event) {
        //console.log($event.keyCode); //keyCodes value
        let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
        if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
            $event.preventDefault();
        }   
    }
    const cari = () => {
        GetNoJurnalUmum();
        GetJurnalUmum();
    }
</script>
