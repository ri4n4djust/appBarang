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
                                                    <div class="row invoice layout-top-spacing layout-spacing apps-invoice"></div>

                                                    <div class="table-responsive">
                                                        <!-- <div class="table-responsive"> -->
                                                            <button type="button" class="btn btn-danger btn-lg mb-3 me-3" v-if="load">
                                                                <span class="spinner-border text-white me-2 align-self-center loader-sm">Loading...</span> Loading
                                                            </button>                                        
                                                            <table style="font-size:8px">
                                                                <tbody  v-for="hrt in hartalist" :key="hrt.acc_id" :set="amount = hrt.amount" >
                                                                        
                                                                        <tr v-if="hrt.level === '1'" >
                                                                            <td v-if="hrt.jenis != 'Total'" style="min-width:70px">{{ hrt.acc_id }}</td>
                                                                            <td v-else></td>
                                                                            <td v-if="hrt.jenis === 'Total' || hrt.jenis.substring(0,1) === 'H'" style="min-width: 400px;" ><b>&nbsp;&nbsp;{{ hrt.name }}</b></td>
                                                                            <td v-else style="min-width: 400px;">&nbsp;&nbsp;{{ hrt.name }}</td>
                                                                            <td></td>
                                                                            <td></td>
                                                                            <td v-if="hrt.jenis === 'Total'" style="border-top: 1px solid black"></td>
                                                                            <td v-else></td>
                                                                            <td v-if="hrt.jenis === 'Detail' ">
                                                                                <div v-if="hrt.acc_id.substring(0,1) === '2'|| hrt.acc_id.substring(0,1) === '3' || hrt.acc_id.substring(0,1) === '4' || hrt.acc_id.substring(0,1) === '7'"> 
                                                                                    {{ Number(-1*amount).toLocaleString() }}
                                                                                </div>
                                                                                <div v-else>{{ Number(amount).toLocaleString() }}</div>
                                                                                <!-- <template v-if="hrt.acc_id.substring(0,1) === '2' || hrt.acc_id.substring(0,1) === '3' || hrt.acc_id.substring(0,1) === '4' || hrt.acc_id.substring(0,1) === '7'">
                                                                                    {{ -1*amount }}
                                                                                </template> -->
                                                                                
                                                                            </td>
                                                                            <td v-else-if="hrt.jenis === 'Total' "><b>
                                                                                <div v-if="hrt.acc_id.substring(0,1) === '2'|| hrt.acc_id.substring(0,1) === '3' || hrt.acc_id.substring(0,1) === '4' || hrt.acc_id.substring(0,1) === '7'"> 
                                                                                    {{ Number(-1*amount).toLocaleString() }}
                                                                                </div>
                                                                                <div v-else>{{ Number(amount).toLocaleString() }}</div>
                                                                            </b></td>
                                                                            <td v-else></td>
                                                                        </tr>
                                                                        <tr v-if="hrt.level === '2'">
                                                                            <td v-if="hrt.jenis != 'Total'" >{{ hrt.acc_id }}</td>
                                                                            <td v-else></td>
                                                                            <td v-if="hrt.jenis === 'Total' || hrt.jenis.substring(0,1) === 'H'" style="min-width: 300px;"><b>&nbsp;&nbsp;&nbsp;&nbsp;{{ hrt.name }}</b></td>
                                                                            <td v-else style="min-width: 300px;">&nbsp;&nbsp;&nbsp;&nbsp;{{ hrt.name }}</td>
                                                                            <td></td>
                                                                            <td v-if="hrt.jenis === 'Total'" style="border-top: 1px solid black"></td>
                                                                            <td v-else></td>
                                                                            <td v-if="hrt.jenis === 'Detail' ">
                                                                                <div v-if="hrt.acc_id.substring(0,1) === '2'|| hrt.acc_id.substring(0,1) === '3' || hrt.acc_id.substring(0,1) === '4' || hrt.acc_id.substring(0,1) === '7'"> 
                                                                                    {{ Number(-1*amount).toLocaleString() }}
                                                                                </div>
                                                                                <div v-else>{{ Number(amount).toLocaleString() }}</div>
                                                                            </td>
                                                                            <td v-else-if="hrt.jenis === 'Total'">
                                                                                <div v-if="hrt.acc_id.substring(0,1) === '2'|| hrt.acc_id.substring(0,1) === '3' || hrt.acc_id.substring(0,1) === '4' || hrt.acc_id.substring(0,1) === '7'"> 
                                                                                    {{ Number(-1*amount).toLocaleString() }}
                                                                                </div>
                                                                                <div v-else>{{ Number(amount).toLocaleString() }}</div>
                                                                            </td>
                                                                            <td v-else></td>
                                                                            <td></td>
                                                                        </tr>
                                                                        <tr v-if="hrt.level === '3'">
                                                                            <td v-if="hrt.jenis != 'Total'">{{ hrt.acc_id }}</td>
                                                                            <td v-else></td>
                                                                            <td v-if="hrt.jenis === 'Total' || hrt.jenis.substring(0,1) === 'H'" style="min-width: 300px;"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{ hrt.name }}</b></td>
                                                                            <td v-else style="min-width: 300px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{ hrt.name }}</td>
                                                                            <td v-if="hrt.jenis === 'Total'" style="border-top: 1px solid black"></td>
                                                                            <td v-else></td>
                                                                            <td v-if="hrt.jenis === 'Detail'">
                                                                                <div v-if="hrt.acc_id.substring(0,1) === '2'|| hrt.acc_id.substring(0,1) === '3' || hrt.acc_id.substring(0,1) === '4' || hrt.acc_id.substring(0,1) === '7'"> 
                                                                                    {{ Number(-1*amount).toLocaleString() }}
                                                                                </div>
                                                                                <div v-else>{{ Number(amount).toLocaleString() }}</div>
                                                                            </td>
                                                                            <td v-else-if="hrt.jenis === 'Total' ">
                                                                                <div v-if="hrt.acc_id.substring(0,1) === '2'|| hrt.acc_id.substring(0,1) === '3' || hrt.acc_id.substring(0,1) === '4' || hrt.acc_id.substring(0,1) === '7'"> 
                                                                                    {{ Number(-1*amount).toLocaleString() }}
                                                                                </div>
                                                                                <div v-else>{{ Number(amount).toLocaleString() }}</div>
                                                                            </td>
                                                                            <td></td>
                                                                            <td></td>
                                                                        </tr>
                                                                        <tr v-if="hrt.level === '4'">
                                                                            <td>{{ hrt.acc_id }}</td>
                                                                            <td style="min-width: 300px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{ hrt.name }}</td>
                                                                            <td>
                                                                                <div v-if="hrt.acc_id.substring(0,1) === '2'|| hrt.acc_id.substring(0,1) === '3' || hrt.acc_id.substring(0,1) === '4' || hrt.acc_id.substring(0,1) === '7'"> 
                                                                                    {{ Number(-1*amount).toLocaleString() }}
                                                                                </div>
                                                                                <div v-else>{{ Number(amount).toLocaleString() }}</div>
                                                                            </td>
                                                                            <td></td>
                                                                            <td></td>
                                                                            <td></td>
                                                                        </tr>

                                                                </tbody>
                                                            </table>
                                                        <!-- </div> -->
                                                    </div>


                                                </div>

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
                                        <!-- <div class="col-xl-12 col-md-3 col-sm-6">
                                            <router-link to="/apps/invoice/edit" class="btn btn-dark btn-edit">Edit</router-link>
                                        </div> -->

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

    useMeta({ title: 'Neraca Keuangan' });

    const store = useStore();

    const sorting = ref({
        startDate: '01-01-2022', // moment().subtract(30,'d').format("D-M-YYYY"),
        endDate: moment().format("D-M-YYYY")
    });

    const load = ref();

    const hartalist = ref();
    onMounted(() => {
        load.value = true;
        const harta = ref({
            group: '1,2,3'
        });
        var c = Object.assign(sorting.value, harta.value);
        store.dispatch('GetHarta', c);
        // hartalist.value = store.getters.StateHarta;
        setTimeout(function() { 
            // store.dispatch('GetCoaList')
            hartalist.value = store.getters.StateHarta;
            load.value = false ;
        }, 10000);

        
       
    })

    const cari = () => {
        load.value = true;
        const pendapatan = ref({group: '1,2,3'});
        var c = Object.assign(sorting.value, pendapatan.value);
        store.dispatch('GetPendapatan', c );
        
        setTimeout(function() { 
            // store.dispatch('GetCoaList')
            hartalist.value = store.getters.StateCoaPendapatan;
            // const pendapatan = hartalist.value.filter(p => p.acc_id === '60000');
            // console.log(hartalist.value);
            load.value = false;
        }, 10000);
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
    
    const print = () => {
        window.print();
    };
</script>
