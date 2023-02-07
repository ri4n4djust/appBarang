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
                                                        <button class="btn btn-primary" @click="openModal()">Button</button>
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

                                    <!-- <div class="invoice-detail-items">
                                        <div class="row">
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
                                                <input type="text" v-model="brg.lastPrice" class="form-control form-control-sm" placeholder="Price" @keypress="onlyNumber" />
                                            </div>
                                            <div class="form-group col-sm-2">
                                                <label for="inputZip">QTY</label>
                                                <input type="text" v-model="qty" class="form-control form-control-sm" placeholder="Quantity" @keypress="onlyNumber" />
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="satuan">SATUAN</label>
                                                <input type="text" v-model="brg.satuanPersediaan" class="form-control form-control-sm" id="satuan" />
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
                                                            <th>Sisa</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr v-for="item, index in brg" :key="item.kdBarang">
                                                            <td class="description">{{ item.nmBarang }}</td>
                                                            <td class="rate">{{ new Intl.NumberFormat().format(item.hrgBeli) }}</td>
                                                            <td class="qty">{{ item.qty }}</td>
                                                            <td class="qty">{{ item.qty_recieve }}</td>
                                                            <td class="qty"><input type="text" v-model="qty_datang[index]" class="form-control" /></td>
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
    useMeta({ title: 'Barang Datang' });

    const store = useStore();
    const router = useRouter();
    const route = useRoute();

    const items = ref([]);
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
    const sorting = ref({
        startDate: moment().subtract(30,'d').format("D-M-YYYY"),
        endDate: moment().format("D-M-YYYY")
    });
    const cartItems = ref([])
    const divpajak = ref(false)
    const qty_datang = ref([]);

    const pembelian = computed(() => {
        const accs = store.getters.StateAcc;
        noterima.value = store.getters.NoTerimaBbm;
        const pajak = store.state.pajak;
        tot.value = brg.value.lastPrice * qty.value;
        listpo.value = store.getters.SlistPobbm;
        // console.log(suppliers)
        return { pajak, noterima, accs, tot, listpo}
    });

    const getBarang=() => {
        store.dispatch('GetPersediaan')
    }
    const getNoTerima=() => {
        store.dispatch('GetTerimabbm')
    }
    const getListPo=() => {
        store.dispatch('ListPo', sorting.value)
       
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
                        'no_po': detail[i].r_noPo
                    })
                }
            }
            store.dispatch('CreateBarangDatang', [header,arrdetail] )
            setTimeout(function() { 
                // getCart(); 
            }, 5000);
            getNoTerima();
    }

    onMounted( async () => {
        //set default data
        items.value.push({ id: 1, title: '', description: '', rate: 0, quantity: 0, amount: 100, is_tax: false });

        let dt = new Date();
        params.value.invoice_date = JSON.parse(JSON.stringify(dt));
        dt.setDate(dt.getDate() + 5);
        params.value.due_date = dt;

        // console.log(paramssupplier.value)
       
        getBarang();
        getAcc();
        // getSupplier();
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
        r_supplier.value = item.r_supplier
        isOpen.value = false;
        brg.value = JSON.parse(localStorage.getItem('terimabarang'));
    };

    const openModal = () => {
        getListPo();
        // code.value = list.code_bbm;
        // harga_old.value = list.last_price;
        isOpen.value = true;
    }

    


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
</script>
