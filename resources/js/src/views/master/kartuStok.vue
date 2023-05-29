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
                                                    <!-- {{ items }} -->
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
                                                        </div> -->
                                                    <!-- </div> -->

                                                    <div class="table-responsive">
                                                        <!-- <div class="table-responsive"> -->
                                                            <table class="table">
                                                                <thead>
                                                                    <tr>
                                                                        <th colspan="2">LAPORAN  BARANG {{ props.nmBarang }}</th>
                                                                        <th colspan="2">Periode Tgl {{ sorting.startDate }} sd {{ sorting.endDate }}</th>
                                                                        <th colspan="2">Kode barang : {{ props.kdBarang }}</th>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>Tanggal</th>
                                                                        <!-- <th>Stok Awal</th> -->
                                                                        <th>Qty Beli</th>
                                                                        <th>Nilai Beli</th>
                                                                        <th>Qty Jual</th>
                                                                        <th>Nilai Jual</th>
                                                                        <!-- <th>Stok</th> -->
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr v-for="item in items" :key="item.id">
                                                                        <td>{{ moment(item.tgl).format("D-M-YYYY") }}</td>
                                                                        <!-- <td>{{ Number(item.stok_awal).toLocaleString() }}</td> -->
                                                                        <td>{{ Number(item.unit_beli).toLocaleString() }}</td>
                                                                        <td>{{ Number(item.total_beli).toLocaleString() }}</td>
                                                                        <td>{{ Number(item.unit_jual).toLocaleString() }}</td>
                                                                        <td>{{ Number(item.total_jual).toLocaleString() }}</td>
                                                                        <!-- <td>{{ Number((item.stok_akhir + item.unit_beli) - item.unit_jual ).toLocaleString() }}</td> -->
                                                                    </tr>
                                                                </tbody>
                                                                <thead>
                                                                    <tr>
                                                                        <!-- <th></th> -->
                                                                        <th>Total</th>
                                                                        <th>{{ Number(unit_beli_s).toLocaleString() }}</th>
                                                                        <th>{{ Number(total_beli_s).toLocaleString() }}</th>
                                                                        <th>{{ Number(unit_jual_s).toLocaleString() }}</th>
                                                                        <th>{{ Number(total_jual_s).toLocaleString() }}</th>
                                                                        <!-- <th>{{ Number(total_beli_s - total_jual_s).toLocaleString() }}</th> -->
                                                                    </tr>
                                                                    <tr>
                                                                        <!-- <th></th> -->
                                                                        <th>HPP</th>
                                                                        <th>{{ Number(unit_jual_s).toLocaleString() }}</th>
                                                                        <th>{{ Number(unit_jual_s * hpp_brg).toLocaleString() }}</th>
                                                                        <th></th>
                                                                        <!-- <th></th> -->
                                                                        <th>{{ Number( total_jual_s - (unit_jual_s * hpp_brg) ).toLocaleString() }}</th>
                                                                    </tr>
                                                                    <!-- <tr>
                                                                        <th></th>
                                                                        <th>Penyisihan</th>
                                                                        <th></th>
                                                                        <th></th>
                                                                        <th></th>
                                                                        <th></th>
                                                                        <th>{{ Number( (total_jual_s - (unit_jual_s * hpp_brg)) / 2 ).toLocaleString() }}</th>
                                                                    </tr> -->
                                                                    <tr>
                                                                        <!-- <th></th> -->
                                                                        <th>Laba</th>
                                                                        <th></th>
                                                                        <th></th>
                                                                        <th></th>
                                                                        <!-- <th></th> -->
                                                                        <th>{{ Number( (total_jual_s - (unit_jual_s * hpp_brg)) ).toLocaleString() }}</th>
                                                                    </tr>
                                                                    <tr>
                                                                        <th colspan="2" class="align-top mx-auto">
                                                                            
                                                                        </th>
                                                                        <th colspan="2" class="align-top mx-auto">
                                                                            <div class="table-responsive">
                                                                            

                                                                            </div>
                                                                        </th>
                                                                        <th colspan="2" class="align-top mx-auto" >
                                                                            <div class="table-responsive">
                                                                                
                                                                            </div>
                                                                                
                                                                        </th>
                                                                    </tr>
                                                                </thead>
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
                                        <div class="col-xl-12 col-md-3 col-sm-6">
                                            <a href="javascript:" @click="$router.go(-1)" class="btn btn-secondary btn-print action-print" >Kembali</a>
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

        <!--  -->


        
    </div>
</template>

<script setup>
    import { computed, onMounted, ref } from 'vue';

    //pdf export
    import jsPDF from 'jspdf';
    import 'jspdf-autotable';

    //flatpickr
    import flatPickr from 'vue-flatpickr-component';
    import 'flatpickr/dist/flatpickr.css';
    import '@/assets/sass/forms/custom-flatpickr.css';

    import '@/assets/sass/scrollspyNav.scss';
    import '@/assets/sass/tables/table-basic.scss';
    import '@/assets/sass/apps/invoice-preview.scss';

    import moment from "moment";

    import { useStore } from 'vuex';
    import { useRouter, useRoute } from 'vue-router'

    import { useMeta } from '@/composables/use-meta';

    useMeta({ title: 'Kartu Stok' });

    const store = useStore();

    const unit_beli_s = ref();
    const total_beli_s = ref()
    const unit_jual_s = ref();
    const total_jual_s  = ref();
    const hpp_brg = ref();

    const items = ref([]);
    const sorting = ref({
        startDate: moment().subtract(30,'d').format("D-M-YYYY"),
        kdBarang: props.kdBarang,
        endDate: moment().format("D-M-YYYY")
    });

    const props = defineProps({
        endDate: String,
        startDate: String,
        kdBarang: String,
        nmBarang: String,
    });

    onMounted(() => {
        bind_data();
        // total_aplusan();
        // console.log(props)
        // const awal = moment(props.startDate, 'YYYY-MM-DD');
        // const akhir = moment(props.endDate, 'YYYY-MM-DD');

        // console.log(awal)
        // var daylist = getDaysArray(new Date(awal),new Date(akhir));
        // // daylist.map((v)=>v.toDateString().slice(0,10)).join("")

        // console.log(daylist);
    });

    

    var getDaysArray = function(start, end) {
        for(var arr=[],dt=new Date(start); dt<=new Date(end); dt.setDate(dt.getDate()+1)){
            arr.push(new Date(dt));
        }
        return arr;
    };

    const bind_data = async () => {
        await store.dispatch('GetKartuStok', {startDate: props.startDate, endDate: props.endDate, kdBarang: props.kdBarang});
        setTimeout(function() { items.value = store.getters.StateListKartuStok; }, 2000);
        // console.log(props.kdBarang)
    }

    const barangs = computed(() => {
        items.value = store.getters.Saplusan;
        // console.log(items)
        // return { items }
    });
    
    const cari = async () =>{
       
        await store.dispatch('GetKartuStok', {startDate: sorting.value.startDate, endDate: sorting.value.endDate, kdBarang: sorting.value.kdBarang});
        setTimeout(function() { items.value = store.getters.StateListKartuStok; }, 2000);

         sorting.value = {
            startDate: sorting.value.startDate,
            endDate: sorting.value.endDate,

        }

        let arr = store.getters.StateListKartuStok;
        let sum_beli = 0;
        let sum_unit_beli = 0;
        let sum_jual = 0;
        let sum_unit_jual = 0;
        let harga_pokok = 0;
        arr.forEach(element => {
            sum_beli +=  parseInt(element.total_beli);
            sum_unit_beli +=  parseInt(element.unit_beli);
            sum_jual +=  parseInt(element.total_jual);
            sum_unit_jual +=  parseInt(element.unit_jual);
            // harga_pokok = parseInt(element.total_beli) / parseInt(element.unit_beli);
        });
        unit_beli_s.value = sum_unit_beli ;
        total_beli_s.value = sum_beli;
        unit_jual_s.value = sum_unit_jual;
        total_jual_s.value = sum_jual;
        hpp_brg.value = sum_beli / sum_unit_beli;
        // props.startDate = sorting.startDate.value;
        // props.endDate = sorting.endDate.value;
        // console.log(sorting.startDate.value)
    }

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
<style scoped>
  /* CSS styling */
  table{ border-collapse: collapse; border-spacing: 0; }th,td{font-size:12px;text-align:left;padding: 4px;}th{padding:8px 4px;}tr:nth-child(2n-1){background:#f7f7f708; }
</style>
