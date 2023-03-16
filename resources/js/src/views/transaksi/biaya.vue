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
                                            Form Biaya
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

                                                <!-- <div class="invoice-address-client-fields">
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

                                                    
                                                </div> -->
                                            </div>
                                        </div>
                                    </div>

                                    <div class="invoice-detail-items">
                                        <div class="table-responsive">
                                            <table>
                                                <thead>
                                                    <tr style="padding:0;margin:0;">
                                                        <th class=""></th>
                                                        <th>Description</th>
                                                        <th class="">Rate</th>
                                                        <th class="">Qty</th>
                                                        <th class="text-end">pph</th>
                                                        <th class="text-end">Total</th>
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
                                                        <td style="padding:0;margin:0;" >
                                                            <input type="text" v-model="item.name">
                                                            <!-- <select id="inputState" v-model="item.title" style="width: 100%;height: 25px;">
                                                                <option :value="br" v-for="br in barangs" :key="br.id" selected>{{ br.nama_bbm }}</option>
                                                            </select> -->
                                                        </td>
                                                        <td style="padding:0;margin:0;">
                                                            <input type="text" v-model="item.biaya" :id="'rate'+index" width="100%" @keyup="getTotal(total=item.total, pph=item.pph, qty=item.quantity, index)" placeholder="Price" />
                                                            <!-- <input type="text" v-model="item.kdPersediaan.kdPersediaan" :id="'rate'+index" class="form-control form-control-sm" placeholder="Price" /> -->
                                                        </td>
                                                        <td style="padding:0;margin:0;">
                                                            <input type="text" v-model="item.satuan" :id="'quantity'+index" width="100%"  placeholder="Quantity" />
                                                        </td>
                                                        <td style="padding:0;margin:0;">
                                                            <!-- <input type="text" v-model="item.kredit" :id="'total'+index" width="100%" placeholder="Quantity" /> -->
                                                            <select id="inputState" v-model="item.acc" class="form-select">
                                                                <option :value="ac" v-for="ac in accs" :key="ac.acc_id" selected>{{ ac.name }}</option>
                                                            </select>
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

                                    <div class="invoice-detail-items">
                                        <div class="inv--product-table-section">
                                            <div class="table-responsive">
                                                <table class="table table-hover table-bordered item-table">
                                                    <thead>
                                                        <tr>
                                                            <th>Nama Barang</th>
                                                            <th>Harga</th>
                                                            <th>Qty</th>
                                                            <th>Satuan</th>
                                                            <th>Total</th>
                                                            <th>Aksi</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr v-for="item in cartBiaya" :key="item.kdBarang">
                                                            <td class="description">{{ item.nmBarang }}</td>
                                                            <td class="rate">{{ new Intl.NumberFormat().format(item.hrgPokok) }}</td>
                                                            <td class="qty">{{ item.qty }}</td>
                                                            <td class="qty">{{ item.satuan }}</td>
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
    useMeta({ title: 'Input Biaya' });

    const store = useStore();
    const router = useRouter();
    const route = useRoute();

    const searchTerm = ref('')
    const countries = ref({});

    const items = ref([]);
    const brg = ref([]);
    const accs = ref();
    const nopembelian = ref([]);
    const qty = ref(1);
    const tot = ref();
    const subtotal = ref();
    const total = ref();
    const disc = ref(0);
    const tax = ref();
    const selected_file = ref(null);
    const payment = ref([]);
    const params = ref({
        noNota: nopembelian,
        tglNota: moment().format("YYYY-MM-DD"),
        term: 0,
        subtotal: subtotal,
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
    const cartBiaya = ref([])
    const divpajak = ref(false)
    // const currency_list = ref([]);

    const pembelian = computed(() => {
        // accs.value = store.getters.StateCoaList;
        nopembelian.value = store.getters.NoPembelian;
        const pajak = store.state.pajak;
        tot.value = brg.value.lastPrice * qty.value;
        // console.log(suppliers)
        return { pajak, nopembelian, accs, tot }
    });

    // const selectedCountry = ref('')
    const selectCountry = (country) => {
        searchTerm.value = country
        searchCountries.length = 0
    }

    const searchCountries = computed(() => {
        if (searchTerm.value === '') {
            return []
        }
        let matches = 0
        return countries.value.filter(country => {
            if (country.name.toLowerCase().includes(searchTerm.value.toLowerCase()) && matches < 10) {
            matches++
            return country
            }
        })
    });

    const GetCoaList=() => {
        store.dispatch('GetCoaList', {acc: '6'})
    }


    const getTotal=() =>{
        const pajak = store.state.pajak;
        const temptotal = subtotal.value - (subtotal.value * disc.value / 100)
        total.value = (subtotal.value - (subtotal.value * disc.value / 100))
        tax.value = temptotal * pajak /100
        
        console.log('total tanpa pajak :'+tax.value)
        // return { tot }
    }


    const simpanPembelian=() => {
        const header =params.value
        const headers =paramssupplier.value
            const headerfull = Object.assign(header, headers)
            const detail =cartBiaya.value
            store.dispatch('CreatePembelian', [headerfull,detail] )
            setTimeout(function() { getCart(); }, 5000);
            getNoPembelian();
    }

    onMounted( async () => {
        //set default data
        items.value = []
        items.value.push({ 
            id: 1, 
            code_akun: '',
            nama_akun: '', 
            debet: '', 
            kredit: '', 
        });

        let dt = new Date();
        params.value.invoice_date = JSON.parse(JSON.stringify(dt));
        dt.setDate(dt.getDate() + 5);
        params.value.due_date = dt;

        // console.log(paramssupplier.value)
       
        GetCoaList();
        getCart();
        setTimeout(function() { accs.value = store.getters.StateCoaList; }, 5000);
        
        
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
        items.value.push({ id: max_id + 1, code_akun: '', nama_akun:'', debet: '', kredit: '' });
        // items.value[1].title.focus();
    };

    const remove_item = (item) => {
        items.value = items.value.filter((d) => d.id != item.id);
    };

    function addToCart(brg) {
        // console.log(brg)
        if (localStorage.getItem('cartBiaya')===null){
            cartBiaya.value = [];
            // console.log(cartBiaya.value)
        }else{
            cartBiaya.value = JSON.parse(localStorage.getItem('cartBiaya'));
        }
            const oldItems = JSON.parse(localStorage.getItem('cartBiaya')) || [];
            // console.log(oldItems)
            const existingItem = oldItems.find(({ kdBarang }) => kdBarang === brg.kdPersediaan);
            if (existingItem) {
                const objIndex = cartBiaya.value.findIndex((e => e.kdBarang === brg.kdPersediaan));
                const oldName = cartBiaya.value[objIndex].nmBarang;
                const oldQty = cartBiaya.value[objIndex].qty;
                const oldTotal = cartBiaya.value[objIndex].total;
                const newQty = parseInt(oldQty) + parseInt(qty.value) ;
                const newTotal = parseInt(oldTotal) + parseInt(qty.value * brg.lastPrice) ;
                cartBiaya.value[objIndex].qty = parseInt(newQty);
                cartBiaya.value[objIndex].total = parseInt(newTotal);
                localStorage.setItem('cartBiaya',JSON.stringify(cartBiaya.value));
                alert(oldName+' Quantity Update')
                getCart();
                // isicart = Object.keys(JSON.parse(localStorage.getItem('cartBiaya'))).length;
            }else{
            cartBiaya.value.push({kdBarang:brg.kdPersediaan, nmBarang:brg.nmPersediaan,hrgPokok:brg.lastPrice,qty:qty.value,satuan:brg.satuanPersediaan,total:qty.value * brg.lastPrice});	
            localStorage.setItem('cartBiaya',JSON.stringify(cartBiaya.value));
            getCart();
            // isicart = Object.keys(JSON.parse(localStorage.getItem('cartBiaya'))).length;
            alert(brg.nmPersediaan+ " berhasil disimpan")
            }
    }
    function removeItem(id) {
        // alert(id)
        const arrayFromStroage = JSON.parse(localStorage.getItem('cartBiaya'));
        const filtered = arrayFromStroage.filter(arrayFromStroage => arrayFromStroage.kdBarang !== id);
        localStorage.setItem('cartBiaya', JSON.stringify(filtered));
        // cartBiaya.value.splice(index, 1)
        // this.isicart = Object.keys(JSON.parse(localStorage.getItem('cartBiaya'))).length;
        getCart();
        // console.log(filtered)
        // alert(filtered.nmBarang)
    }

    function getCart() {
        // subtotal.value = []
        if (localStorage.getItem('cartBiaya')===null){
            cartBiaya.value = localStorage.setItem('cartBiaya', '[]');
            subtotal.value = 0
        }else{
            cartBiaya.value = JSON.parse(localStorage.getItem('cartBiaya'));
            getSubtotal();
            getTotal();
            
    // this.isicart = JSON.parse(localStorage.getItem('cartBiaya')).length;
        }

    }

    const addPayment = () => {
        payment.value = localStorage.setItem('payment', '[]');
        // alert('add payment')
    };

    function getSubtotal(){
        const allItems = JSON.parse(localStorage.getItem('cartBiaya')) || [];
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
