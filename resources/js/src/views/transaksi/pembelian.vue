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
                        <div class="col-xl-9">
                            <div class="invoice-content">
                                <div class="invoice-detail-body">
                                    <div class="invoice-detail-title">
                                       
                                        <div class="invoice-title">
                                            Invoice Pembelian
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

                                                    <div class="form-group row">
                                                        <label for="company-address" class="col-sm-3 col-form-label col-form-label-sm">Term</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" v-model="params.term" id="company-address" class="form-control form-control-sm" placeholder="XYZ Street" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="company-phone" class="col-sm-3 col-form-label col-form-label-sm">Jatuh Tempo</label>
                                                        <div class="col-sm-9">
                                                            <flat-pickr v-model="params.jthTempo" class="form-control form-control-sm flatpickr active" placeholder="Due Date"></flat-pickr>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xl-5 invoice-address-client">

                                                <div class="invoice-address-client-fields">
                                                    <div class="form-group row">
                                                        <label for="client-name" class="col-sm-3 col-form-label col-form-label-sm">Name</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" v-model="params.kodeSupplier" />
                                                            <input type="text" v-model="params.nmSupplier" id="client-name" class="form-control form-control-sm" placeholder="Client Name" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="client-address" class="col-sm-3 col-form-label col-form-label-sm">Address</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" v-model="params.almtSupplier" id="client-address" class="form-control form-control-sm" placeholder="XYZ Street" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="client-phone" class="col-sm-3 col-form-label col-form-label-sm">Phone</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" v-model="params.tlpSupplier" id="client-phone" class="form-control form-control-sm" placeholder="(123) 456 789" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="invoice-detail-terms">
                                        <div class="row justify-content-between">
                                            <!-- <div class="col-md-4"> -->
                                                <div class="form-group md-4">
                                                    <label for="number">Invoice Number</label>
                                                    <input type="text"  id="number" class="form-control form-control-sm" placeholder="#0001" />
                                                </div>
                                            <!-- </div> -->
                                            <!-- <div class="col-md-3"> -->
                                                <div class="form-group mb-1">
                                                    <label for="date">Invoice Date</label>
                                                    <flat-pickr  class="form-control form-control-sm flatpickr active" placeholder="Invoice Date"></flat-pickr>
                                                </div>
                                            <!-- </div> -->
                                            <!-- <div class="col-md-1"> -->
                                                <div class="form-group mb-1">
                                                    <label for="due">Due Date</label>
                                                    <flat-pickr  class="form-control form-control-sm flatpickr active" placeholder="Due Date"></flat-pickr>
                                                </div>
                                            <!-- </div> -->
                                            <!-- <div class="col-md-1"> -->
                                                <div class="form-group mb-1">
                                                    <label for="date">Invoice Date</label>
                                                    <flat-pickr  class="form-control form-control-sm flatpickr active" placeholder="Invoice Date"></flat-pickr>
                                                </div>
                                            <!-- </div> -->

                                            <!-- <div class="col-md-1"> -->
                                                <div class="form-group mb-1">
                                                    <label for="due">Due Date</label>
                                                    <flat-pickr  class="form-control form-control-sm flatpickr active" placeholder="Due Date"></flat-pickr>
                                                </div>
                                            <!-- </div> -->
                                        </div>
                                    </div>

                                    <div class="invoice-detail-items">
                                        <div class="table-responsive">
                                            <table class="table table-bordered item-table">
                                                <thead>
                                                    <tr>
                                                        <!-- <th class=""></th> -->
                                                        <th>Nama Barang</th>
                                                        <th>Harga</th>
                                                        <th>Qty</th>
                                                        <th>Total</th>
                                                        <th>Aksi</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr v-for="(item, index) in items" :key="index">
                                                        <!-- <td class="delete-item-row">
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
                                                        </td> -->
                                                        <td class="description">
                                                            <multiselect 
                                                                v-model="brg" 
                                                                :options="pembelian.barangs" 
                                                                :searchable="true"
                                                                track-by="nmBarang"
                                                                label="nmBarang"
                                                                open-direction="top"
                                                                placeholder="Choose..." 
                                                                selected-label="" 
                                                                select-label="" 
                                                                deselect-label="">
                                                            </multiselect>
                                                            <!-- <input type="text" v-model="item.title" class="form-control form-control-sm" placeholder="Item Description" /> -->
                                                        </td>
                                                        <td class="rate">
                                                            <input type="text" v-model="brg.hrgJual" class="form-control form-control-sm" placeholder="Price" @keypress="onlyNumber" />
                                                        </td>
                                                        <td class="qty">
                                                            <input type="text" v-model="qty" class="form-control form-control-sm" placeholder="Quantity" @keypress="onlyNumber" />
                                                        </td>
                                                        <td class="amount">
                                                            {{ brg.hrgJual * qty }}
                                                            <!-- <input type="number" v-model="total" class="form-control form-control-sm" placeholder="Total" disabled /> -->
                                                            <!-- <span class="editable-amount mt-2">
                                                                <span class="currency">$</span> <span class="amount">{{ item.amount }}</span>
                                                            </span> -->
                                                            
                                                        </td>
                                                        <td class="tax">
                                                            <button @click="addToCart(brg)" class="btn btn-xs btn-primary">
                                                               tambah 
                                                            </button>
                                                            <!-- <div class="checkbox-primary custom-control custom-checkbox">
                                                                <input type="checkbox" :id="`chktax-${index}`" v-model="item.is_tax" class="custom-control-input" />
                                                                <label class="custom-control-label" :for="`chktax-${index}`"></label>
                                                            </div> -->
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                        <div class="inv--product-table-section">
                                            <div class="table-responsive">
                                                <table class="table table-hover table-bordered item-table">
                                                    <thead>
                                                        <tr>
                                                            <th>Nama Barang</th>
                                                            <th>Harga</th>
                                                            <th>Qty</th>
                                                            <th>Total</th>
                                                            <th>Aksi</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr v-for="item in cartItems" :key="item.kdBarang">
                                                            <td class="description">{{ item.nmBarang }}</td>
                                                            <td class="rate">{{ new Intl.NumberFormat().format(item.hrgJual) }}</td>
                                                            <td class="qty">{{ item.qty }}</td>
                                                            <td class="amount">{{ new Intl.NumberFormat().format(item.total) }}</td>
                                                            <td class="tax">
                                                                <button type="button" class="btn btn-secondary additem btn-sm" @click="removeItem(id=item.kdBarang)">Hapus</button>
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
                                                                <a href="javascript:;" class="btn btn-primary btn-send" @click="taxSelected" v-bind="hide = true">+ pajak</a>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <router-link to="/apps/invoice/preview" class="btn btn-dark btn-preview">Preview</router-link>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <a href="javascript:;" @click="simpanPembelian" class="btn btn-success btn-download">Save</a>
                                                            </div>
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
                                                    <div class="invoice-totals-row invoice-summary-tax">
                                                        <div class="invoice-summary-label">Pajak</div>
                                                        <div class="invoice-summary-value">
                                                            <div class="tax-amount"><span class="currency"></span>
                                                                <span>{{ new Intl.NumberFormat().format(Math.floor((subtotal - (subtotal * disc / 100)) * pembelian.pajak/100)) }}</span>
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
    useMeta({ title: 'Pembelian' });

    const store = useStore();
    const router = useRouter();
    const route = useRoute();

    const items = ref([]);
    const brg = ref([]);
    const qty = ref(1);
    const subtotal = ref();
    const total = ref();
    const disc = ref(0);
    const tax = ref();
    const selected_file = ref(null);
    const params = ref({
        noNota: '',
        kodeSupplier: '',
        nmSupplier: '',
        almtSupplier: '',
        tlpSupplier: '',
        tglNota: '',
        term: '',
        jthTempo: '',
        notes: '',
        subtotal: subtotal,
        tax: tax,
        disc: disc,
        total: total,
    });
    const cartItems = ref([])
    // const newValue = ref()
    // const currency_list = ref([]);

    const pembelian = computed(() => {
        const barangs = store.getters.StateBarang;
        // const trs = store.getters.STransNosel;
        const pajak = store.state.pajak;
        // console.log('pajak : '+ pajak)
        return { barangs, pajak }
    });

    const getBarang=() => {
        store.dispatch('GetBarang')
    }

    const getTotal=() =>{
        total.value = subtotal.value - (subtotal.value * disc.value / 100)
        tax.value = total.value - (total.value * pembelian.pajak /100)
        // console.log('total :'+total.value)
        // return { tot }
    }

    function taxSelected() {
        const pajak = store.state.pajak;
        // const temptotal = subtotal.value - (subtotal.value * disc.value / 100)
        const temppajak = total.value * pajak /100
        total.value = total.value + temppajak
        // console.log('total : '+ temptotal + 'pajak :'+temppajak)
    }

    const simpanPembelian=() => {
        const header =params.value
        const detail =cartItems.value
        store.dispatch('CreatePembelian', [header,detail] )
    }

    onMounted(() => {
        //set default data
        items.value.push({ id: 1, title: '', description: '', rate: 0, quantity: 0, amount: 100, is_tax: false });

        let dt = new Date();
        params.value.invoice_date = JSON.parse(JSON.stringify(dt));
        dt.setDate(dt.getDate() + 5);
        params.value.due_date = dt;

       
        getBarang();
        getCart();
    });

    const change_file = (event) => {
        selected_file.value = URL.createObjectURL(event.target.files[0]);
    };

    const add_item = () => {
        let max_id = 0;
        if (items.value && items.value.length) {
            max_id = items.value.reduce((max, character) => (character.id > max ? character.id : max), items.value[0].id);
        }
        items.value.push({ id: max_id + 1, title: '', description: '', rate: 0, quantity: 0, amount: 0, is_tax: false });
    };

    const remove_item = (item) => {
        items.value = items.value.filter((d) => d.id != item.id);
    };

    function addToCart(brg) {
        // console.log(brg)
        if (localStorage.getItem('cartItemsP')===null){
            cartItems.value = [];
            // console.log(cartItems.value)
        }else{
            cartItems.value = JSON.parse(localStorage.getItem('cartItemsP'));
        }
            const oldItems = JSON.parse(localStorage.getItem('cartItemsP')) || [];
            // console.log(oldItems)
            const existingItem = oldItems.find(({ kdBarang }) => kdBarang === brg.kdBarang);
            if (existingItem) {
                const objIndex = cartItems.value.findIndex((e => e.kdBarang === brg.kdBarang));
                const oldName = cartItems.value[objIndex].nmBarang;
                const oldQty = cartItems.value[objIndex].qty;
                const newQty = parseInt(oldQty) + parseInt(qty.value) ;
                cartItems.value[objIndex].qty = parseInt(newQty);
                localStorage.setItem('cartItemsP',JSON.stringify(cartItems.value));
                alert(oldName+' Quantity Update')
                getCart();
                // isicart = Object.keys(JSON.parse(localStorage.getItem('cartItemsP'))).length;
            }else{
            cartItems.value.push({kdBarang:brg.kdBarang, nmBarang:brg.nmBarang,hrgJual:brg.hrgJual,qty:qty.value,total:qty.value * brg.hrgJual});	
            localStorage.setItem('cartItemsP',JSON.stringify(cartItems.value));
            getCart();
            // isicart = Object.keys(JSON.parse(localStorage.getItem('cartItemsP'))).length;
            alert(brg.nmBarang+ " berhasil disimpan")
            }
    }
    function removeItem(id) {
        // alert(id)
        const arrayFromStroage = JSON.parse(localStorage.getItem('cartItemsP'));
        const filtered = arrayFromStroage.filter(arrayFromStroage => arrayFromStroage.kdBarang !== id);
        localStorage.setItem('cartItemsP', JSON.stringify(filtered));
        // cartItems.value.splice(index, 1)
        // this.isicart = Object.keys(JSON.parse(localStorage.getItem('cartItemsP'))).length;
        getCart();
        console.log(filtered)
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
    function onlyNumber ($event) {
        //console.log($event.keyCode); //keyCodes value
        let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
        if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
            $event.preventDefault();
        }   
    }
</script>
