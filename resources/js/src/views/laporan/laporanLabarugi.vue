<template>
    <div class="layout-px-spacing">
        <teleport to="#breadcrumb">
            <ul class="navbar-nav flex-row">
                <li>
                    <div class="page-header">
                        <nav class="breadcrumb-one" aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:;">DataTables</a></li>
                                <li class="breadcrumb-item active" aria-current="page"><span>HTML5 Export</span></li>
                            </ol>
                        </nav>
                    </div>
                </li>
            </ul>
        </teleport>

        <div class="row layout-top-spacing">
            <div class="col-12 layout-spacing">
                <div class="panel br-6">
                    <div class="custom-table panel-body p-2">

                        <div class="d-flex flex-wrap justify-content-center justify-content-sm-start px-3 pt-3 pb-0">
                            <!-- <button variant="primary" class="btn m-1 btn-primary" @click="export_table('print')">Print</button> -->
                            <!-- <button variant="primary" class="btn m-1 btn-primary" @click="export_table('pdf')">PDF</button> -->
                            <h5>Laporan Laba Rugi</h5>
<!-- <span>{{ bbm }}</span> -->
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-7">
                                    <div class="input-group mb-4">
                                        <flat-pickr v-model="sorting.startDate"
                                        :config="{dateFormat: 'd-m-Y'}" 
                                            class="form-control form-control-sm">
                                        </flat-pickr>
                                        <flat-pickr v-model="sorting.endDate" 
                                        :config="{dateFormat: 'd-m-Y'}"
                                            class="form-control form-control-sm">
                                        </flat-pickr>
                                        <button variant="primary" class="btn m-1 btn-primary" @click="bind_data()" >CARI</button>
                                        <button variant="primary" class="btn m-1 btn-primary" @click="export_table('print')">Print</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        

        <div class="row invoice layout-top-spacing layout-spacing apps-invoice">
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="doc-container">
                    <div class="row">
                        <div class="col-xl-9">
                            <div class="invoice-container">
                                <div class="invoice-inbox">
                                    <div id="ct" class="">
                                        <div class="invoice-00001">
                                            <div class="content-section">

                                                

                                                <div class="inv--detail-section inv--customer-detail-section">
                                                    <!-- <div class="row"> -->
                                                        <!-- <div class="col-xl-8 col-lg-7 col-md-6 col-sm-4 align-self-center">
                                                            <p class="inv-to">Invoice To</p>
                                                        </div>

                                                        <div class="col-xl-4 col-lg-5 col-md-6 col-sm-8 align-self-center order-sm-0 order-1 inv--payment-info">
                                                            <h6 class="inv-title">Payment Info:</h6>
                                                        </div> -->

                                                        <!-- <div class="col-xl-8 col-lg-7 col-md-6 col-sm-4">
                                                            <p class="inv-customer-name">Jesse Cory</p>
                                                            <p class="inv-street-addr">405 Mulberry Rd. Mc Grady, NC, 28649</p>
                                                            <p class="inv-email-address">redq@company.com</p>
                                                            <p class="inv-email-address">(128) 666 070</p>
                                                        </div>

                                                        <div class="col-xl-4 col-lg-5 col-md-6 col-sm-8 col-12 order-sm-0 order-1">
                                                            <div class="inv--payment-info">
                                                                <p><span class="inv-subtitle">Bank Name:</span> <span>Bank of America</span></p>
                                                                <p><span class="inv-subtitle">Account Number: </span> <span>1234567890</span></p>
                                                                <p><span class="inv-subtitle">SWIFT code:</span> <span>VS70134</span></p>
                                                                <p><span class="inv-subtitle">Country: </span> <span>United States</span></p>
                                                            </div>
                                                        </div>
                                                    </div> -->

                                                    <div class="table-responsive">
                                                        <!-- <div class="table-responsive"> -->
                                                            <table class="table table-hover table-bordered">
                                                                <thead>
                                                                    <tr>
                                                                        <th colspan="2">SPBU 54.903.06</th>
                                                                        <th colspan="2">Laporan Laba Rugi</th>
                                                                        <th colspan="2">Periode Tgl {{sorting.startDate }} sd {{sorting.endDate }}</th>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                            <table cellspacing="0" style="border:1px solid;" >
                                                                <thead>
                                                                    <tr><th colspan="6">Pendapatan</th></tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td width="50"></td>
                                                                        <td colspan="5">Penjualan BBM</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td width="50"></td>
                                                                        <td colspan="2" width="300">PERTMAX</td>
                                                                       
                                                                        <td width="80">{{ Number(bbmPertamax.total || 0).toLocaleString() }}</td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td colspan="2">PERTALITE</td>
                                                                        
                                                                        <td>{{ Number(bbmPertalite.total || 0).toLocaleString() }}</td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td colspan="2">DEX LITE</td>
                                                                        
                                                                        <td >{{ Number(bbmDexlite.total || 0).toLocaleString() }}</td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td colspan="5">Penjualan Non BBM</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td width="50"></td>
                                                                        <td colspan="2">GAS 3Kg</td>
                                                                       
                                                                        <td  >{{ Number(gas3kg.total || 0).toLocaleString() }}</td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td width="50"></td>
                                                                        <td colspan="2">GAS 12Kg</td>
                                                                       
                                                                        <td  >{{ Number(gas12kg.total || 0).toLocaleString() }}</td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td colspan="2">OLI</td>
                                                                        
                                                                        <td>{{ Number(oli || 0).toLocaleString()  }}</td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td colspan="2">Biaya Sewa</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td width="80">75,650,000</td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td colspan="2">Lainnya</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>5345345</td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td colspan="2">Total</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>{{ Number(totalPendapatan).toLocaleString() }}</td>
                                                                    </tr>
                                                                    
                                                                </tbody>
                                                            </table>
                                                        <!-- </div> -->
                                                    </div>

                                                    <div class="table-responsive">
                                                        <!-- <div class="table-responsive"> -->
                                                            <table cellspacing="0">
                                                                <thead>
                                                                    <tr><th colspan="6">Beban</th></tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td width="50"></td>
                                                                        <td colspan="5">Harga Pokok Penjualan BBM</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td width="50"></td>
                                                                        <td colspan="2" width="300">PERTMAX</td>
                                                                       
                                                                        <td>{{ Number(bbmPertamaxHpp.total || 0).toLocaleString() }}</td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td colspan="2">PERTALITE</td>
                                                                        
                                                                        <td>{{ Number(bbmPertaliteHpp.total || 0).toLocaleString() }}</td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td colspan="2">DEX LITE</td>
                                                                        
                                                                        <td>{{ Number(bbmDexliteHpp.total || 0).toLocaleString() }}</td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td colspan="5">Harga Pokok Penjualan Non BBM</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td width="50"></td>
                                                                        <td colspan="2">GAS 3Kg</td>
                                                                       
                                                                        <td>{{ Number(gas3kgHpp.totalHp || 0).toLocaleString() }}</td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td width="50"></td>
                                                                        <td colspan="2">GAS 12Kg</td>
                                                                       
                                                                        <td>{{ Number(gas12kgHpp.totalHp || 0).toLocaleString() }}</td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td colspan="2">OLI</td>
                                                                        
                                                                        <td>{{ Number(oliHpp || 0).toLocaleString() || 0 }}</td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td colspan="2">Biaya Listrik</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>32135</td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td colspan="2">Biaya Gaji</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>51436516</td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td colspan="2">Lainnya</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>2154</td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td colspan="2">Total</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>{{ Number(totalHpp).toLocaleString() }}</td>
                                                                    </tr>
                                                                    
                                                                </tbody>
                                                            </table>
                                                        <!-- </div> -->
                                                    </div>

                                                    <div class="table-responsive">
                                                        <!-- <div class="table-responsive"> -->
                                                            <table class="table table-hover table-bordered">
                                                                <thead>
                                                                    <tr><th colspan="6">Biaya Operasional</th></tr>
                                                                    <tr>
                                                                        <th>Nozzel</th>
                                                                        <th>Meter Awal</th>
                                                                        <th>Meter Akhir</th>
                                                                        <th>Volume/Liter</th>
                                                                        <th>Harga</th>
                                                                        <th>Total</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td></td>
                                                                    </tr>
                                                                </tbody>
                                                                <tfoot>
                                                                    <tr>
                                                                        <th colspan="2" class="align-top mx-auto">

                                                                        </th>
                                                                        <th colspan="2" class="align-top mx-auto">
                                                                            
                                                                        </th>
                                                                        <th colspan="2" class="align-top mx-auto" >
                                                                            
                                                                        </th>
                                                                    </tr>
                                                                </tfoot>
                                                            </table>
                                                        <!-- </div> -->
                                                    </div>




                                                </div>

                                                

                                                <!-- <div class="inv--detail-section inv--customer-detail-section">
                                                    <div class="row">

                                                        <div class="col-sm-4">
                                                            <p class="inv-customer-name">Jesse Cory</p>
                                                            <p class="inv-street-addr">405 Mulberry Rd. Mc Grady, NC, 28649</p>
                                                            <p class="inv-email-address">redq@company.com</p>
                                                            <p class="inv-email-address">(128) 666 070</p>
                                                        </div>

                                                        <div class="col-sm-4">
                                                            <p class="inv-customer-name">Jesse Cory</p>
                                                            <p class="inv-street-addr">405 Mulberry Rd. Mc Grady, NC, 28649</p>
                                                            <p class="inv-email-address">redq@company.com</p>
                                                            <p class="inv-email-address">(128) 666 070</p>
                                                        </div>

                                                        <div class="col-sm-4">
                                                            <p class="inv-customer-name">Jesse Cory</p>
                                                            <p class="inv-street-addr">405 Mulberry Rd. Mc Grady, NC, 28649</p>
                                                            <p class="inv-email-address">redq@company.com</p>
                                                            <p class="inv-email-address">(128) 666 070</p>
                                                        </div>

                                                    </div>
                                                </div> -->



                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-3">
                            <div class="invoice-actions-btn">
                                <div class="invoice-action-btn">
                                    <div class="row">
                                      
                                        <div class="col-xl-12 col-md-3 col-sm-6">
                                            <a href="javascript:;" class="btn btn-secondary btn-print action-print" @click="print()">Print</a>
                                        </div>
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

    import '@/assets/sass/scrollspyNav.scss';
    import '@/assets/sass/tables/table-basic.scss';
    import '@/assets/sass/apps/invoice-preview.scss';

    import flatPickr from 'vue-flatpickr-component';
    import 'flatpickr/dist/flatpickr.css';
    import '@/assets/sass/forms/custom-flatpickr.css';

    import moment from "moment";

    import { useStore } from 'vuex';
    import { useRouter, useRoute } from 'vue-router'

    import { useMeta } from '@/composables/use-meta';

    useMeta({ title: 'Aplusan' });

    const store = useStore();

    const pendapatan = ref({});
    const bbmPertamax = ref([]);
    const bbmPertalite = ref([]);
    const bbmDexlite = ref([]);
    const gas3kg = ref([]);
    const gas12kg = ref([]);
    const oli = ref([]);
    const totalPendapatan = ref([]);

    const bebanhpp = ref({});
    const bbmPertamaxHpp = ref([]);
    const bbmPertaliteHpp = ref([]);
    const bbmDexliteHpp = ref([]);
    const gas3kgHpp = ref([]);
    const gas12kgHpp = ref([]);
    const oliHpp = ref([]);
    const totalHpp = ref([]);

    const items = ref([]);
    const kupon = ref([]);
    const biaya = ref([]);
    const link = ref([]);
    const sorting = ref({
        startDate: moment().subtract(30,'d').format("D-M-YYYY"),
        endDate: moment().format("D-M-YYYY")
    });

    const props = defineProps({
        id: String,
        startDate: String,
        kd_trans: String,
        last_price: String,
    });

    onMounted(() => {
        bind_data();
        // total_aplusan();
    });

    
    const bind_data = async () => {
        // oli.value = 0;
        await store.dispatch('GetPendapatan', sorting.value);
        pendapatan.value = store.getters.StatePendapatan;
        bbmPertamax.value = store.getters.StatePendapatan[0][0];
        bbmPertalite.value = store.getters.StatePendapatan[0][1];
        bbmDexlite.value = store.getters.StatePendapatan[0][2];
        if(bbmPertamax.value === undefined){bbmPertamax.value = 0}
        if(bbmPertalite.value === undefined){bbmPertalite.value = 0}
        if(bbmDexlite.value === undefined){bbmDexlite.value = 0}
        

        const arr_nonbbm = store.getters.StatePendapatan[1];
        gas3kg.value = arr_nonbbm.find(o => o.r_kdBarang === 'BRG0004');
        gas12kg.value =  arr_nonbbm.find(o => o.r_kdBarang === 'BRG0005');

        const arr_oli = store.getters.StatePendapatan[2];
        oli.value = arr_oli.reduce((n, {total}) => n + Number(total), 0)  // arr_oli.reduce((a, b) => {a += b.total }); 
        // console.log(oli.value)

        if(gas3kg.value === undefined){gas3kg.value = 0}
        if(gas12kg.value === undefined){gas12kg.value = 0}
        // if(oli.value === undefined || oli.value == isNaN){oli.value = '0'}

        totalPendapatan.value = Number(bbmPertamax.value.total || 0) + Number(bbmPertalite.value.total || 0) + Number(bbmDexlite.value.total || 0) + Number(gas3kg.value.total || 0) + Number(gas12kg.value.total || 0) + Number(oli.value|| 0);
        // console.log(totalPendapatan.value)
        // bbmPertamax.value = pendapatan.value[0][0].total;
        // console.log(gas3kg.value);
        await store.dispatch('GetBebanHpp', sorting.value);
        bebanhpp.value = store.getters.StateBebanHpp;

        bbmPertamaxHpp.value = store.getters.StateBebanHpp[0][0];
        bbmPertaliteHpp.value = store.getters.StateBebanHpp[0][1];
        bbmDexliteHpp.value = store.getters.StateBebanHpp[0][2];
        if(bbmPertamaxHpp.value === undefined){bbmPertamaxHpp.value = 0}
        if(bbmPertaliteHpp.value === undefined){bbmPertaliteHpp.value = 0}
        if(bbmDexliteHpp.value === undefined){bbmDexliteHpp.value = 0}

        const arr_nonbbmhpp = store.getters.StateBebanHpp[1];
        gas3kgHpp.value = arr_nonbbmhpp.find(o => o.r_kdBarang === 'BRG0004');
        gas12kgHpp.value =  arr_nonbbmhpp.find(o => o.r_kdBarang === 'BRG0005');
        // oliHpp.value =  arr_nonbbmhpp.find(o => o.r_kdBarang === 'BRG0006');
        if(gas3kgHpp.value === undefined){gas3kgHpp.value = 0}
        if(gas12kgHpp.value === undefined){gas12kgHpp.value = 0}
        // if(oliHpp.value === undefined){oliHpp.value = 0}
        oliHpp.value = arr_oli.reduce((n, {totalHpp}) => n + Number(totalHpp), 0) 

        totalHpp.value = Number(bbmPertamaxHpp.value.total || 0) + Number(bbmPertaliteHpp.value.total || 0) + Number(bbmDexliteHpp.value.total || 0) + Number(gas3kgHpp.value.total || 0) + Number(gas12kgHpp.value.total || 0) + Number(oliHpp.value|| 0);

    }

    const barangs = computed(() => {
        items.value = store.getters.Saplusan;
        // console.log(items)
        // return { items }
    });
    
    // const total_aplusan = async () =>{
    //     await store.dispatch('GetAplusan', sorting.value);
    //     // items.value = store.getters.Saplusan;
    //     let arr = store.getters.Saplusan;
    //     let sum = 0;
    //     arr.forEach(element => {
    //         sum +=  parseInt(element.total);
    //     });
    //     // totaljual.value = sum;
    //     console.log(sum)
    // }

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
                '<table style="width: 70%; " cellpadding="0" cellcpacing="0" border="1"><thead><tr style="color: #515365; background: #eff5ff; -webkit-print-color-adjust: exact; print-color-adjust: exact; "> ';
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
    const print = () => {
        window.print();
    };
</script>
