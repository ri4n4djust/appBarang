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
                                            Invoice Penjualan
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
                                                            <select id="inputState" v-model="params.term" class="form-select">
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
                                                {{ new Intl.NumberFormat().format(brg.hrgJual * qty) }}
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
                                        
                                    </div>

                                    <div class="invoice-detail-note">
                                        <div class="row">
                                            <div class="col-md-12 align-self-center">
                                                <div class="form-group row invoice-note">
                                                    <label for="invoice-detail-notes" class="col-sm-12 col-form-label col-form-label-sm">Notes:</label>
                                                    <div class="col-sm-12">
                                                        <textarea
                                                            v-model="headerfull.notes"
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
    useMeta({ title: 'Penjualan' });

    const store = useStore();
    const router = useRouter();
    const route = useRoute();

    const cartItemsPen = ref([])
    const headerfull = ref([])
    const subtotal = ref(headerfull.value.totalPenjualan);
    const brg = ref([]);
    const qty = ref(1);
    const oldnota = ref(headerfull.value.noPenjualan);

    const params = ref({
        noNota: oldnota,
        tglNota: moment().format("YYYY-MM-DD"),
        term: headerfull.value.termPenjualan,
        jthTempo: moment().format("YYYY-MM-DD"),
        notes: headerfull.value.notePenjualan,
        subtotal: subtotal,
        // tax: tax,
        // disc: disc,
        // total: total,
    });
    

   
   

    const penjualan = computed(() => {
        const barangs = store.getters.StateBarang;
        const pelanggans = store.getters.SeditPenjualan;
        const accs = store.getters.StateAcc;
        // // nopenjualan.value = store.getters.NoPenjualan;
        // // const pajak = ref(store.state.pajak);
        // // console.log(suppliers)
        return { barangs, pelanggans, accs }
    });

    onMounted(  () => {
        console.log(headerfull.value)
        // getCart();
        try {
            // store.dispatch('GetBarang')
            // cartItemsPen.value = JSON.parse(localStorage.getItem('cartItemsPen'))
        } catch(e) {
            // cartItemsPen.value = []
        }
    });

    onBeforeMount(() => {
        setTimeout(() => {
            console.log(' before onmount edit')
            try {
                store.dispatch('GetBarang')
                cartItemsPen.value = JSON.parse(localStorage.getItem('cartItemsPen'))
                headerfull.value = JSON.parse(localStorage.getItem('headerEditPen'))
            } catch(e) {
                cartItemsPen.value = []
            }
        }, 1) // 1 seems to work better for me than 0
    })

    onUnmounted(() => {
        // window.onbeforeunload = null
        // alert('kal tutup')
        localStorage.setItem('cartItemsPen', '[]')
        localStorage.setItem('headerEditPen', '[]')
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
        
        console.log('total tanpa pajak :'+tax.value)
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
        const header =params.value
        const headers =paramspelanggan.value
        const headerfull = Object.assign(header, headers)
        const detail =cartItemsPen.value
        store.dispatch('CreatePenjualan', [headerfull,detail] )
        total.value = 0
        subtotal.value = 0
        tax.value = 0
        setTimeout(function() { 
            getCart(); 
        }, 5000);
        getNoPenjualan();
        total.value = 0
        divpajak.value = false
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