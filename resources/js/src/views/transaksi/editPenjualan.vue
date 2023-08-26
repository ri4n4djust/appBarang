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
        <div class="row invoice layout-top-spacing layout-spacing">
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="doc-container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="invoice-content">
                                <div class="invoice-detail-body">
                                    <div class="invoice-detail-title">
                                       
                                        <div class="invoice-title">
                                            Edit Invoice Penjualan
                                        </div>
                                    </div>

                                    <div class="invoice-detail-header">
                                        <div class="row justify-content-between">
                                            <div class="col-xl-5 invoice-address-company">

                                                <div class="invoice-address-company-fields">
                                                    <div class="form-group row">
                                                        <label for="company-name" class="col-sm-3 col-form-label col-form-label-sm">No Nota</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" v-model="params.noNota" id="number" class="form-control form-control-sm" disabled />
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
                                                            <select id="inputState" v-model="params.termPenjualan" class="form-select">
                                                                <option value="0" selected>Cash</option>
                                                                <option value="1">Kredit</option>
                                                            </select>
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
                                                            <input type="text" v-model="paramspelanggan.almtPelanggan" class="form-control form-control-sm" placeholder="XYZ Street" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="client-phone" class="col-sm-3 col-form-label col-form-label-sm">Phone</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" v-model="paramspelanggan.noHpPelanggan" class="form-control form-control-sm" placeholder="(123) 456 789" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                    </div>

                                    <div class="invoice-detail-items">
                                        <div class="row">
                                            <div class="form-group col-md-3">
                                                <label for="inputCity">NAMA BARANG</label>
                                                <multiselect 
                                                    v-model="brg" 
                                                    :options="penjualan.barangs" 
                                                    :searchable="true"
                                                    track-by="nmBarang"
                                                    label="nmBarang"
                                                    open-direction="top"
                                                    placeholder="Choose..." 
                                                    selected-label="" 
                                                    select-label="" >
                                                </multiselect>
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="inputState">HARGA</label>
                                                <input type="text" v-model="brg.hrgJual" class="form-control form-control-sm" placeholder="Price" @keypress="onlyNumber" />
                                            </div>
                                            <div class="form-group col-sm-2">
                                                <label for="inputZip">QTY</label>
                                                <input type="text" v-model="qty" class="form-control form-control-sm" placeholder="Quantity" @keypress="onlyNumber" />
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="satuan">SATUAN</label>
                                                <input type="text" v-model="brg.satuanBarang" class="form-control form-control-sm" id="satuan" />
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="inputZip">TOTAL</label><br>
                                                <!-- {{ new Intl.NumberFormat().format(brg.hrgJual * qty) }} -->
                                                <input type="text" v-model="tot" class="form-control form-control-sm" placeholder="Quantity" @keypress="onlyNumber" />
                                            </div>
                                            <div class="form-group col-md-1">
                                                <label for="aksi">Aksi</label>
                                                <button @click="addToCart(brg)" class="btn btn-xs btn-primary">
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
                                                            <th>Nama Barang</th>
                                                            <th>Harga</th>
                                                            <th>Qty</th>
                                                            <th>Satuan</th>
                                                            <th>Total</th>
                                                            <th>Aksi</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr v-for="item in cartItemsPen" :key="item.kdBarang">
                                                            <td class="description">{{ item.nmBarang }}</td>
                                                            <td class="rate">{{ new Intl.NumberFormat().format(item.hrgJual) }}</td>
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
                                                                <a href="javascript:;" @click="simpanPenjualan" class="btn btn-success btn-download">Save</a>
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
                                                        <input type="text" v-model="params.disc" @keyup="getTotal" class="form-control form-control-sm" >%
                                                        <div class="invoice-summary-label"></div>
                                                        <div class="invoice-summary-value">
                                                            <div class="total-amount"><span class="currency"></span><span>{{ new Intl.NumberFormat().format(Math.floor(subtotal * disc / 100)) }}</span></div>
                                                        </div>
                                                    </div>
                                                    <div v-show="divpajak">
                                                        <div class="invoice-totals-row invoice-summary-tax" >
                                                            <div class="invoice-summary-label">Pajak</div>
                                                            <div class="invoice-summary-value">
                                                                <div class="tax-amount"><span class="currency"></span>
                                                                    <span>{{ new Intl.NumberFormat().format(Math.floor( tax )) }}</span>
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
 import { computed, onMounted, ref, onBeforeMount, onUnmounted } from 'vue';
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
    useMeta({ title: 'Edit Penjualan' });

    const store = useStore();
    const router = useRouter();
    const route = useRoute();

    const cartItemsPen = ref([])
    const headerfull = ref([])
    const nop = ref([])
    const kdPel = ref([])
    const nmPel = ref([])
    const tglP = ref([])
    const subtotal = ref()
    const total = ref();
    const disc = ref([]);
    const tax = ref(0);
    const brg = ref({});
    const qty = ref(1);
    const tot = ref();
    const divpajak = ref(false)
    // const oldnota = ref(headerfull.value.noPenjualan);
    // let nop = headerfull[0].noPenjualan;
    const props = defineProps({
        id: String,
        startDate: String,
        kd_trans: String,
        regu: String,
    });

    const params = ref({
        noNota: props.kd_trans,
        tglNota: props.startDate,// moment(tglP).format("YYYY-MM-DD"),
        // term: 0,
        // jthTempo: moment().format("YYYY-MM-DD"),
        // notes: '',
        // subtotal: subtotal,
        // tax: tax,
        // disc: disc,
        // total: total, 
    });

    const paramspelanggan = ref({
        // kdPelanggan: kdPel.value,
        // nmPelanggan: nmPel.value,
        // almtPelanggan: '',
        // noHpPelanggan: '',

    });

    const penjualan = computed(() => {
        const barangs = store.getters.StateBarang;
        const pelanggans = store.getters.StatePelanggan;
        const accs = store.getters.StateAcc;
        tot.value = brg.value.hrgJual * qty.value;
        // // const pajak = ref(store.state.pajak);
        // // console.log(suppliers)
        return { barangs, pelanggans, accs, tot }
    });

    

    onMounted( async () => {
        // console.log(headerfull.value[0].noPenjualan)
        // params.noNota.value = headerfull.value[0].noPenjualan
        await store.dispatch('GetDetailPenjualan', params.value);
        const arr = store.getters.SdetailPenjualan;
        const brgArr = arr[1];

        for(let i = 0; i < brgArr.length; i++){

            cartItemsPen.value.push({
                kdBarang: brgArr[i].r_kdBarang,
                nmBarang: brgArr[i].r_nmBarang,
                hrgJual: brgArr[i].hrgJual,
                qty: brgArr[i].qty,
                satuan: brgArr[i].satuanJual,
                total: brgArr[i].totalJual

            })
        };
        localStorage.setItem('cartItemsPen', JSON.stringify(cartItemsPen.value));
        store.dispatch('GetBarang');
        paramspelanggan.value = arr[0];
        getPelanggan();
        getAcc();
        // setTimeout(() => {
        //     // console.log(' before onmount edit')
        //     try {
                
        //         // cartItemsPen.value = JSON.parse(localStorage.getItem('cartItemsPen'))
        //         // headerfull.value = JSON.parse(localStorage.getItem('headerEditPen'))
        //         console.log(arr[0])
        //         // nop.value = arr.noPenjualan
        //         // kdPel.value = arr[0].r_pelanggan
        //         // nmPel.value = arr[0].nmPelanggan
        //         // disc.value = arr[0].discPercentP
        //         // tglP.value = arr[0].tglPenjualan
                
                
        //         getCart()
                
        //     } catch(e) {
        //         // cartItemsPen.value = []
        //     }
        // }, 1000) // 1 seems to work better for me than 0
    });

    onBeforeMount(() => {
        // setTimeout(() => {
            console.log(' before onmount edit')
            // try {
            //     store.dispatch('GetBarang')
            //     cartItemsPen.value = JSON.parse(localStorage.getItem('cartItemsPen'))
            //     params.value = JSON.parse(localStorage.getItem('headerEditPen'))
            // } catch(e) {
            //     cartItemsPen.value = []
            // }
        // }, 100) // 1 seems to work better for me than 0
    })

    onUnmounted(() => {
        // window.onbeforeunload = null
        // alert('kal tutup')
        localStorage.setItem('cartItemsPen', '[]')
        // localStorage.setItem('headerEditPen', '[]')
    })

    // const getBarang=() => {
    //     store.dispatch('GetBarang')
    // }
    const getPelanggan=() => {
        store.dispatch('GetPelanggan')
    }
    // const getNoPenjualan=() => {
    //     store.dispatch('GetNoPenjualan')
    // }
    const getAcc=() => {
        store.dispatch('GetAcc')
    }

    const getTotal=() =>{
        const pajak = store.state.pajak;
        const temptotal = subtotal.value - (subtotal.value * disc.value / 100)
        total.value = (subtotal.value - (subtotal.value * disc.value / 100))
        tax.value = temptotal * pajak /100
        
        console.log('total tanpa pajak :'+total.value)
        // return { tot }
    }
    const getTotalWtax=() =>{
        const pajak = store.state.pajak;
        const temptotal = subtotal.value - (subtotal.value * disc.value / 100)
        tax.value = temptotal * pajak /100
        total.value = (subtotal.value - (subtotal.value * disc.value / 100)) + tax.value
        
        
        console.log('total dengan pajak:'+tax.value)
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

    const simpanPenjualan=() => {

        store.dispatch('DeletePenjualan', { id:props.kd_trans})

        const header =params.value
        const headers =paramspelanggan.value
        const headerfull = Object.assign(header, headers)
        const detail =cartItemsPen.value
        store.dispatch('CreatePenjualan', [headerfull,detail] )
        total.value = 0
        subtotal.value = 0
        tax.value = 0
        // setTimeout(function() { 
        //     getCart(); 
        // }, 5000);
        router.push({ name: 'penjualan-barang' })
        total.value = 0
        divpajak.value = false
    }

    function addToCart(brg) {
        // console.log(brg)
        if (localStorage.getItem('cartItemsPen')===null){
            cartItemsPen.value = [];
            // console.log(cartItems.value)
        }else{
            cartItemsPen.value = JSON.parse(localStorage.getItem('cartItemsPen'));
        }
            const oldItems = JSON.parse(localStorage.getItem('cartItemsPen')) || [];
            // console.log(oldItems)
            const existingItem = oldItems.find(({ kdBarang }) => kdBarang === brg.kdBarang);
            if (existingItem) {
                const objIndex = cartItemsPen.value.findIndex((e => e.kdBarang === brg.kdBarang));
                const oldName = cartItemsPen.value[objIndex].nmBarang;
                const oldQty = cartItemsPen.value[objIndex].qty;
                const oldTotal = cartItemsPen.value[objIndex].total;
                const newQty = parseInt(oldQty) + parseInt(qty.value) ;
                const newTotal = parseInt(oldTotal) + parseInt(qty.value * brg.hrgJual) ;
                cartItemsPen.value[objIndex].qty = parseInt(newQty);
                cartItemsPen.value[objIndex].total = parseInt(newTotal);
                localStorage.setItem('cartItemsPen',JSON.stringify(cartItemsPen.value));
                alert(oldName+' Quantity Update')
                getCart();
                // isicart = Object.keys(JSON.parse(localStorage.getItem('cartItemsP'))).length;
            }else{
            cartItemsPen.value.push({kdBarang:brg.kdBarang, nmBarang:brg.nmBarang,hrgJual:brg.hrgJual,qty:qty.value,satuan:brg.satuanBarang,total:qty.value * brg.hrgJual});	
            localStorage.setItem('cartItemsPen',JSON.stringify(cartItemsPen.value));
            getCart();
            // isicart = Object.keys(JSON.parse(localStorage.getItem('cartItemsP'))).length;
            alert(brg.nmBarang+ " berhasil disimpan")
            }
    }

    function removeItem(id) {
        // alert(id)
        const arrayFromStroage = JSON.parse(localStorage.getItem('cartItemsPen'));
        const filtered = arrayFromStroage.filter(arrayFromStroage => arrayFromStroage.kdBarang !== id);
        localStorage.setItem('cartItemsPen', JSON.stringify(filtered));
        // cartItems.value.splice(index, 1)
        // this.isicart = Object.keys(JSON.parse(localStorage.getItem('cartItemsP'))).length;
        getCart();
        // subtotal.value = 0
        // total.value = 0
        // console.log(filtered)
        // alert(filtered.nmBarang)
    }

    function getCart() {
        // subtotal.value = []
        if (localStorage.getItem('cartItemsPen')===null){
            cartItemsPen.value = localStorage.setItem('cartItemsPen', '[]');
            // subtotal.value = 0
            // total.value = 0
        }else if(localStorage.getItem('cartItemsPen')==='[]'){
            // alert('masi kosong')
            cartItemsPen.value = localStorage.setItem('cartItemsPen', '[]')
            getTotal();
            subtotal.value = 0
            total.value = 0
            tax.value = 0
        }else{
            cartItemsPen.value = JSON.parse(localStorage.getItem('cartItemsPen'));
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
        const allItems = JSON.parse(localStorage.getItem('cartItemsPen')) || [];
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