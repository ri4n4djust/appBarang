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

        <div class="row invoice layout-top-spacing layout-spacing">
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="doc-container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="invoice-content">
                                <div class="invoice-detail-body">
                                    <div class="invoice-detail-title">
                                       
                                        <div class="invoice-title">
                                           PO BBM
                                        </div>
                                    </div>

                                    <div class="invoice-detail-header">
                                        <div class="row justify-content-between">
                                            <div class="col-xl-5 invoice-address-company">

                                                <div class="invoice-address-company-fields">
                                                    <div class="form-group row">
                                                        <label for="company-name" class="col-sm-3 col-form-label col-form-label-sm">No PO</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" v-model="params.no_po" id="number" class="form-control form-control-sm" placeholder="#0001" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="company-email" class="col-sm-3 col-form-label col-form-label-sm">Tgl</label>
                                                        <div class="col-sm-9">
                                                            <flat-pickr v-model="params.tgl_so" class="form-control form-control-sm flatpickr active" placeholder="Invoice Date"></flat-pickr>
                                                        </div>
                                                    </div>


                                                </div>
                                            </div>

                                            <div class="col-xl-5 invoice-address-client">

                                                <div class="invoice-address-client-fields">
                                                    <div class="form-group row">
                                                        <label for="client-name" class="col-sm-3 col-form-label col-form-label-sm">Name</label>
                                                        <div class="col-sm-9">
                                                            <multiselect 
                                                                v-model="paramssupplier" 
                                                                :options="pembelian.suppliers" 
                                                                :searchable="true"
                                                                :allow-empty="false"
                                                                track-by="nmSupplier"
                                                                label="nmSupplier"
                                                                open-direction="top"
                                                                placeholder="Choose..." 
                                                                selected-label="" 
                                                                select-label="" 
                                                                deselect-label="">
                                                            </multiselect>
                                                        </div>

                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="company-name" class="col-sm-3 col-form-label col-form-label-sm">No SO</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" v-model="params.no_so" id="number" class="form-control form-control-sm" placeholder="#0001" />
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- <div class="invoice-detail-items">
                                        <div class="row" v-for="(item, index) in items" :key="index">
                                            <div class="form-group col-md-3">
                                                <label for="inputCity">NAMA BARANG</label>
                                                <multiselect 
                                                    v-model="brg" 
                                                    :options="pembelian.barangs" 
                                                    :searchable="true"
                                                    track-by="nmPersediaan"
                                                    label="nmPersediaan"
                                                    open-direction="top"
                                                    placeholder="Choose..." 
                                                    selected-label="" 
                                                    select-label="" >
                                                </multiselect>
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="inputState">HARGA</label>
                                                <input type="text" v-model="item.lastPrice" class="form-control form-control-sm" placeholder="Price" @keypress="onlyNumber" />
                                            </div>
                                            <div class="form-group col-sm-2">
                                                <label for="inputZip">QTY</label>
                                                <input type="text" v-model="qty" class="form-control form-control-sm" placeholder="Quantity" @keypress="onlyNumber" />
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="satuan">SATUAN</label>
                                                <input type="text" v-model="item.satuanPersediaan" class="form-control form-control-sm" id="satuan" />
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="inputZip">TOTAL</label><br>
                                                <input type="text" v-model="tot" class="form-control form-control-sm" placeholder="Quantity" @keypress="onlyNumber" />
                                            </div>
                                            <div class="form-group col-md-1">
                                                <label for="aksi">Aksi</label>
                                                <button @click="addToCart(brg)" class="btn btn-xs btn-primary">
                                                    + 
                                                </button>
                                            </div>
                                        </div>
                                    </div> -->

                                    <div class="invoice-detail-items">
                                        <div class="table-responsive">
                                            <table class="table table-bordered item-table">
                                                <thead>
                                                    <tr>
                                                        <th class=""></th>
                                                        <th>Description</th>
                                                        <th class="">Rate</th>
                                                        <th class="">Qty</th>
                                                        <th class="text-end">Amount</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr v-for="(item, index) in items" :key="index">
                                                        <td class="delete-item-row">
                                                            <ul class="table-controls">
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
                                                        <td class="description">
                                                            <select id="inputState" v-model="item.title" class="form-select">
                                                                <option :value="br" v-for="br in barangs" selected>{{ br.nama_bbm }}</option>
                                                                <!-- <option value="BRG0001" selected>PERTAMAX</option>
                                                                <option value="BRG0002">PERTALITE</option>
                                                                <option value="BRG0003">DEXLITE</option> -->
                                                            </select>
                                                            <!-- <multiselect 
                                                                v-model="item.kdPersediaan" 
                                                                :options="pembelian.barangs" 
                                                                :searchable="true"
                                                                track-by="nmPersediaan"
                                                                label="nmPersediaan"
                                                                open-direction="top"
                                                                placeholder="Choose..." 
                                                                selected-label="" 
                                                                select-label="" >
                                                            </multiselect> -->
                                                            <!-- <input type="text" v-model="item.title" :id="'nama'+index" class="form-control form-control-sm" placeholder="Item Description" /> -->
                                                        </td>
                                                        <td class="rate">
                                                            <input type="text" v-model="item.rate" :id="'rate'+index" class="form-control form-control-sm" placeholder="Price" />
                                                            <!-- <input type="text" v-model="item.kdPersediaan.kdPersediaan" :id="'rate'+index" class="form-control form-control-sm" placeholder="Price" /> -->
                                                        </td>
                                                        <td class="text-end qty">
                                                            <input type="text" v-model="item.quantity" :id="'quantity'+index" class="form-control form-control-sm" placeholder="Quantity" />
                                                        </td>
                                                        <td class="text-end amount">
                                                            <span class="editable-amount mt-2">
                                                                <span class="currency"></span> <span class="amount">{{ item.rate * item.quantity || 0 }}</span>
                                                            </span>
                                                        </td>
                                                        <!-- <td class="text-center tax">
                                                            <input type="text" v-model="item.mount" class="form-control form-control-sm" placeholder="Price" /> -->
                                                            <!-- <input type="text" :id="item.amount" :value="item.rate * item.quantity" class="form-control form-control-sm" placeholder="Quantity" @keypress="onlyNumber" /> -->
                                                            <!-- <div class="checkbox-primary custom-control custom-checkbox">
                                                                <input type="checkbox" :id="`chktax-${index}`" v-model="item.is_tax" class="custom-control-input" />
                                                                <label class="custom-control-label" :for="`chktax-${index}`"></label>
                                                            </div> -->
                                                        <!-- </td> -->
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
                                                                <div v-if="divpajak">
                                                                    <a href="javascript:;" class="btn btn-primary btn-send" @click="taxRemove" >- pajak</a>
                                                                </div>
                                                                <div v-if="!divpajak">
                                                                    <a href="javascript:;" class="btn btn-primary btn-send" @click="taxSelected" >+ pajak</a>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <!-- <router-link to="/apps/invoice/preview" class="btn btn-dark btn-preview">Preview</router-link> -->
                                                                <a href="javascript:;" @click="addPayment" class="btn btn-dark btn-preview" data-bs-toggle="modal" data-bs-target="#modalPayment">Pembayaran</a>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <a href="javascript:;" @click="simpanPembelian" class="btn btn-success btn-download">Save</a>
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

                                            <div class="col-md-6">
                                                <div class="totals-row">
                                                    <div class="invoice-totals-row invoice-summary-subtotal">
                                                        <div class="invoice-summary-label">Sub Total</div>
                                                         <div class="invoice-summary-label"></div>
                                                        <div class="invoice-summary-value">
                                                            <div class="subtotal-amount"><span class="currency"></span><span class="amount">{{new Intl.NumberFormat().format(subtotal)}}</span></div>
                                                        </div>
                                                    </div>
                                                    <div class="invoice-totals-row invoice-summary-total">
                                                         <div class="invoice-summary-label">Disc</div>
                                                        <input type="text" v-model="params.disc" class="form-control form-control-sm" >%
                                                        <div class="invoice-summary-label"></div>
                                                        <div class="invoice-summary-value">
                                                            <div class="total-amount"><span class="currency"></span><span>{{ new Intl.NumberFormat().format(Math.floor(subtotal * disc / 100)) }}</span></div>
                                                        </div>
                                                    </div>
                                                    <div v-show="divpajak">
                                                        <div class="invoice-totals-row invoice-summary-tax">
                                                            <div class="invoice-summary-label">Pajak</div>
                                                            <div class="invoice-summary-value">
                                                                <div class="tax-amount"><span class="currency"></span>
                                                                    <span>{{ new Intl.NumberFormat().format(Math.floor((subtotal - (subtotal * disc / 100)) * pembelian.pajak/100)) }}</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
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
    useMeta({ title: 'PO BBM' });

    const store = useStore();
    const router = useRouter();
    const route = useRoute();

    const kdBarang = ref();
    const nmBarang = ref()
    const items = ref({});
    const barangs = ref([]);
    const nopobbm = ref([]);
    const qty = ref(1);
    const tot = ref();
    const subtotal = ref();
    const total = ref();
    const disc = ref(0);
    const tax = ref();
    const selected_file = ref(null);
    const payment = ref([]);
    const params = ref({
        no_po: nopobbm,
        tgl_so: moment().format("YYYY-MM-DD"),
        term: 0,
        jthTempo: moment().format("YYYY-MM-DD"),
        notes: '',
        subtotal: subtotal,
        tax: 11,
        disc: disc,
        total: total,
    });
    const paramssupplier = ref({
        kdSupplier: '',
        nmSupplier: '',
        almtSupplier: '',
        tlpSupplier: '',

    });
    const paramsacc = ref({
        noAcc: '',
        nmAcc: '',
        nilai: '',
        // tlpSupplier: '',

    });

    // const item = ref({
    //     title: [],
    //     rate: [],
    //     quantity: [],
    //     // tlpSupplier: '',

    // });

    const cartItems = ref([])
    const divpajak = ref(false)
    // const currency_list = ref([]);
    

    const pembelian = computed(() => {
        barangs.value = store.getters.StateBbm;
        const suppliers = store.getters.StateSupplier;
        const accs = store.getters.StateAcc;
        nopobbm.value = store.getters.NoPobbm;
        const pajak = store.state.pajak;
        subtotal.value = 0;
        let tot = 0;
        for(let i = 0; i < items.value.length; i++){
            subtotal.value += (parseFloat(items.value[i].rate) * parseFloat(items.value[i].quantity));
            items.value[i].amount = parseFloat(items.value[i].rate) * parseFloat(items.value[i].quantity)
        }
        getTotal()
        // console.log(tot)
        return { barangs, pajak, suppliers, nopobbm, accs, subtotal, tot }
    });

    const getBbm=() => {
        store.dispatch('GetBbm')
    }
    const getSupplier=() => {
        store.dispatch('GetSupplier')
    }
    const getNoPobbm=() => {
        store.dispatch('GetNoPobbm')
    }
    const getAcc=() => {
        store.dispatch('GetAcc')
    }


    const getTotal=() =>{
        const pajak = store.state.pajak;
        const temptotal = subtotal.value - (subtotal.value * disc.value / 100)
        total.value = (subtotal.value - (subtotal.value * disc.value / 100))
        tax.value = temptotal * pajak /100
        
        // console.log('total tanpa pajak :'+tax.value)
        // return { tot }
    }
    const getTotalWtax=() =>{
        const pajak = store.state.pajak;
        const temptotal = subtotal.value - (subtotal.value * disc.value / 100)
        tax.value = temptotal * pajak /100
        total.value = (subtotal.value - (subtotal.value * disc.value / 100)) + tax.value
        
        
        // console.log('total dengan pajak:'+tax.value)
        // return { tot }
    }

    function taxSelected() {
        const pajak = store.state.pajak;
        const temptotal = subtotal.value - (subtotal.value * disc.value / 100)
        // const temppajak = temptotal * pajak /100
        
        tax.value = temptotal * pajak /100
        total.value = total.value + tax.value
        // total.value = (subtotal.value - (subtotal.value * disc.value / 100)) + tax.value
        divpajak.value = true
        // console.log(tax.value)
        getTotalWtax()
        // console.log('total : '+ temptotal + 'pajak :'+temppajak)
    }

    function taxRemove() {
        const pajak = store.state.pajak;
        const temptotal = subtotal.value - (subtotal.value * disc.value / 100)
        // const temppajak = total.value * pajak /100
        
        tax.value = temptotal * pajak /100
        total.value = total.value - tax.value
        // total.value = (subtotal.value - (subtotal.value * disc.value / 100)) + tax.value
        divpajak.value = false
        // console.log(tax.value)
        getTotal()
        // console.log('total : '+ temptotal + 'pajak :'+temppajak)
    }

    const simpanPembelian=() => {
        // console.log(items.value)
        const header =params.value
        const headers =paramssupplier.value
        const headerfull = Object.assign(header, headers)
        const data =items.value
        let detail = []
        for(let i = 0; i < data.length; i++){

            detail.push({
                // qty_order: data[i].quantity,
                kdBarang : data[i].title.code_bbm,
                nmBarang: data[i].title.nama_bbm,
                amount: data[i].amount,
                quantity: data[i].quantity,
                rate: data[i].rate,
            })
        }
        console.log(detail)
        store.dispatch('CreatePo', [headerfull,detail] )
        setTimeout(function() { getCart(); }, 5000);
        getNoPobbm();
    }

    onMounted(() => {
        //set default data
        items.value = []
        items.value.push({ 
            id: 1, 
            title: '',
            nmBarang: '', 
            description: '', 
            rate: 0, 
            quantity: 0, 
            amount: 0, 
            is_tax: false 
        });
        

        let dt = new Date();
        params.value.invoice_date = JSON.parse(JSON.stringify(dt));
        dt.setDate(dt.getDate() + 5);
        params.value.due_date = dt;

        // console.log(paramssupplier.value)
       
        getBbm();
        getAcc();
        getSupplier();
        getCart();
        getNoPobbm();
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

    const remove_item = (item) => {
        items.value = items.value.filter((d) => d.id != item.id);
    };

    // function addToCart(brg) {
    //     // console.log(brg)
    //     if (localStorage.getItem('cartItemsP')===null){
    //         cartItems.value = [];
    //         // console.log(cartItems.value)
    //     }else{
    //         cartItems.value = JSON.parse(localStorage.getItem('cartItemsP'));
    //     }
    //         const oldItems = JSON.parse(localStorage.getItem('cartItemsP')) || [];
    //         // console.log(oldItems)
    //         const existingItem = oldItems.find(({ kdBarang }) => kdBarang === brg.kdPersediaan);
    //         if (existingItem) {
    //             const objIndex = cartItems.value.findIndex((e => e.kdBarang === brg.kdPersediaan));
    //             const oldName = cartItems.value[objIndex].nmBarang;
    //             const oldQty = cartItems.value[objIndex].qty;
    //             const oldTotal = cartItems.value[objIndex].total;
    //             const newQty = parseInt(oldQty) + parseInt(qty.value) ;
    //             const newTotal = parseInt(oldTotal) + parseInt(qty.value * brg.lastPrice) ;
    //             cartItems.value[objIndex].qty = parseInt(newQty);
    //             cartItems.value[objIndex].total = parseInt(newTotal);
    //             localStorage.setItem('cartItemsP',JSON.stringify(cartItems.value));
    //             alert(oldName+' Quantity Update')
    //             getCart();
    //             // isicart = Object.keys(JSON.parse(localStorage.getItem('cartItemsP'))).length;
    //         }else{
    //         cartItems.value.push({kdBarang:brg.kdPersediaan, nmBarang:brg.nmPersediaan,hrgPokok:brg.lastPrice,qty:qty.value,satuan:brg.satuanPersediaan,total:qty.value * brg.lastPrice});	
    //         localStorage.setItem('cartItemsP',JSON.stringify(cartItems.value));
    //         getCart();
    //         // isicart = Object.keys(JSON.parse(localStorage.getItem('cartItemsP'))).length;
    //         alert(brg.nmPersediaan+ " berhasil disimpan")
    //         }
    // }
    function removeItem(id) {
        // alert(id)
        const arrayFromStroage = JSON.parse(localStorage.getItem('cartItemsP'));
        const filtered = arrayFromStroage.filter(arrayFromStroage => arrayFromStroage.kdBarang !== id);
        localStorage.setItem('cartItemsP', JSON.stringify(filtered));
        // cartItems.value.splice(index, 1)
        // this.isicart = Object.keys(JSON.parse(localStorage.getItem('cartItemsP'))).length;
        getCart();
        // console.log(filtered)
        // alert(filtered.nmBarang)
    }
    // function updateItem(barcode, index) {
    //     const cartItems = JSON.parse(localStorage.getItem('cartItemsP'));
    //     const objIndex = cartItems.findIndex((e => e.barcode === barcode));
    //     const newQty = parseInt(this.crt[index].qty) ;
    //     cartItems[objIndex].qty = parseInt(newQty);
    //     localStorage.setItem('cartItemsP',JSON.stringify(cartItems));
    //     //alert('Quantity Update')
    //     this.getCart();
    //     this.isicart = Object.keys(JSON.parse(localStorage.getItem('cartItemsP'))).length;
    // }

    function getCart() {
        // subtotal.value = []
        if (localStorage.getItem('cartItemsP')===null){
            cartItems.value = localStorage.setItem('cartItemsP', '[]');
            subtotal.value = 0
        }else{
            cartItems.value = JSON.parse(localStorage.getItem('cartItemsP'));
            getSubtotal();
            getTotal();
            
    // this.isicart = JSON.parse(localStorage.getItem('cartItemsP')).length;
        }

    }

    const addPayment = () => {
        payment.value = localStorage.setItem('payment', '[]');
        // alert('add payment')
    };

    function getSubtotal(){
        const allItems = JSON.parse(localStorage.getItem('cartItemsP')) || [];
        let sum = 0;
        subtotal.value = 0
        for(let i = 0; i < allItems.length; i++){
        sum += (parseFloat(allItems[i].total));
        }
        subtotal.value = sum
        // console.log(subtotal.value)
        // return sum;
    }

    const add_item = () => {
        let max_id = 0;
        // let sub = 0
        // for(let i = 0; i < items.value.length; i++){
        //     sub = items.value[i].rate * items.value[i].quantity;
        // }
        if (items.value && items.value.length) {
            max_id = items.value.reduce((max, character) => (character.id > max ? character.id : max), items.value[0].id);
        }
        items.value.push({ id: max_id + 1, title: '', kdBarang:'', description: '', rate: 0, quantity: 0, amount: 0, is_tax: false });
    };
    
    function onlyNumber ($event) {
        //console.log($event.keyCode); //keyCodes value
        let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
        if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
            $event.preventDefault();
        }   
    }
</script>
