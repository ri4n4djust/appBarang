<template>
    <div class="layout-px-spacing">
        <teleport to="#breadcrumb">
            <ul class="navbar-nav flex-row">
                <li>
                    <div class="page-header">
                        <nav class="breadcrumb-one" aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:;">Laporan</a></li>
                                <li class="breadcrumb-item active" aria-current="page"><span>Pembelian</span></li>
                            </ol>
                        </nav>
                    </div>
                </li>
            </ul>
        </teleport>

        

        <div class="row layout-top-spacing">
            <div class="col-12 layout-spacing">
                <div class="panel br-6">
                    <div class="custom-table panel-body p-0">

                        <div class="d-flex flex-wrap justify-content-center justify-content-sm-start px-3 pt-3 pb-0">
                            <!-- <button variant="primary" class="btn m-1 btn-primary" @click="export_table('print')">Print</button> -->
                            <!-- <button variant="primary" class="btn m-1 btn-primary" @click="export_table('pdf')">PDF</button> -->
                            <h5>General Ledger</h5>
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
                                        <!-- <div class="input-group input-group-sm mb-4"> -->
                                            <select v-model="sorting.acc_id" class="form-control">
                                                <option value="-">Pilih Akun</option>
                                                <option v-for="hrt in items_coa" :key="hrt.acc_id" :value="hrt.acc_id">{{ hrt.name }}</option>
                                            </select>
                                        <!-- </div> -->
                                        <button variant="primary" class="btn m-1 btn-primary" @click="bind_data()" >CARI</button>
                                        <button variant="primary" class="btn m-1 btn-primary" @click="export_table('print')">Print</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="button" class="btn btn-danger btn-lg mb-3 me-3" v-if="load">
                            <span class="spinner-border text-white me-2 align-self-center loader-sm">Loading...</span> Loading
                        </button>

                        <v-client-table :data="items" :columns="columns" :options="table_option" v-if="items.debet != 0 && items.kredit != 0">
                            <template #Tanggal="props"> {{ moment(props.row.Tanggal).format("D-M-YYYY") }} </template>
                            <template #Debet="props"> {{ Number(props.row.Debet).toLocaleString() }} </template>
                            <template #Kredit="props"> {{ Number(props.row.Kredit).toLocaleString() }} </template>
                            <template #Saldo="props"> {{ Number(props.row.Saldo).toLocaleString() }} </template>
                            <!-- <template #action="props">
                                <div class="custom-dropdown dropdown btn-group ">
                                    <div class="btn-group" href="#" role="button" id="pendingTask" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <div role="group" class="btn-group">
                                            <div class="dropdown b-dropdown custom-dropdown show btn-group">
                                                <a class="btn dropdown-toggle btn-dark"
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
                                                        class="feather feather-chevron-down"
                                                    >
                                                        <polyline points="6 9 12 15 18 9"></polyline>
                                                    </svg>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                            <router-link to="/editpenjualan" class="dropdown-item" @click="edit_row(props.row)">Edit</router-link>
                                        </li>
                                        <li>
                                            <router-link :to="{ name: 'nosel', params: { id: props.row } }" class="dropdown-item">coba</router-link>
                                        </li>
                                    </ul>
                                </div>
                            </template> -->
                        </v-client-table>

                        
                        
                    </div>
                </div>
            </div>
        </div>


        <!--  -->
        
    </div>
</template>

<script setup>
    import { computed, onMounted, ref, onBeforeMount } from 'vue';

    //pdf export
    import jsPDF from 'jspdf';
    import 'jspdf-autotable';

    import flatPickr from 'vue-flatpickr-component';
    import 'flatpickr/dist/flatpickr.css';
    import '@/assets/sass/forms/custom-flatpickr.css';

    import { useStore } from 'vuex';
    import { useRouter, useRoute } from 'vue-router'

    import moment from "moment";

    import { useMeta } from '@/composables/use-meta';
    useMeta({ title: 'Buku Besar' });

    const store = useStore();
    const router = useRouter()
    const load = ref();

    const columns = ref(['NoTransaksi','Memo' ,'Tanggal', 'Debet', 'Kredit', 'Saldo']);
    const items = ref([]);
    const acc_id = ref('-');
    const items_coa = ref([]);
    const table_option = ref({
        perPage: 100,
        perPageValues: [100, 200],
        skin: 'table table-hover',
        columnsClasses: { action: 'actions text-center' },
        pagination: { nav: 'scroll', chunk: 5 },
        texts: {
            count: 'Showing {from} to {to} of {count}',
            filter: '',
            filterPlaceholder: 'Search...',
            limit: 'Results:',
        },
        // sortable: ['noNota', 'tglPembelian', 'nmSupplier', 'subTotal', 'disc', 'total',],
        sortIcon: {
            base: 'sort-icon-none',
            up: 'sort-icon-asc',
            down: 'sort-icon-desc',
        },
        resizableColumns: true,
    });
    const sorting = ref({
        startDate: moment().subtract(30,'d').format("D-M-YYYY"),
        endDate: moment().format("D-M-YYYY"),
        acc_id: acc_id
    });

    

    onMounted(() => {
        bind_data();
        bind_acc();
        // console.log('on mount pagr')
    });
    onBeforeMount(() => {
        // console.log(' before onmount')
        
    })

    
    const bind_data = () => {
        load.value = true;
        store.dispatch('GetGL', sorting.value);
        setTimeout(function() { 
            items.value = store.getters.StateGL; 
            load.value = false
        }, 1000);
    }
    const bind_acc = () => {
        load.value = true;
        store.dispatch('GetListCoa');
        setTimeout(function() { 
            items_coa.value = store.getters.StateListCoa; 
            load.value = false
        }, 1000);
    }
    

    // const bbm = computed(() => {
    //     items.value = store.getters.SlaporanPembelian;

    //     let sum = 0;
    //     items.value.forEach(element => {
    //     sum +=  parseInt(element.total);
    //     });

    //     // console.log(sum)
    //     // return { items }
    // });

    const export_table = (type) => {
        let cols = columns.value.filter((d) => d != 'profile' && d != 'action');
        let records = items.value;
        let filename = 'Laporan PT. TAMAN KUSUMA';

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
                '<table style="width: 100%; " cellpadding="0" cellcpacing="0"><thead><tr style="color: #515365; background: #eff5ff; -webkit-print-color-adjust: exact; print-color-adjust: exact; "> ';
            
            rowhtml += '<td colspan=3>LAPORAN BUKU BESAR</td>';
            rowhtml += '<td>'+moment(cols[0].Tanggal).format("DD-MM-YYYY")+'</td>';
            rowhtml += '<td></td>';
            rowhtml += '<td></td>';
            rowhtml += '</tr>';
            rowhtml += '<tr>';
            cols.map((d) => {
                rowhtml += '<th>' + capitalize(d) + '</th>';
            });
            rowhtml += '</tr></thead>';

            rowhtml += '<tbody>';
            records.map((item) => {
                rowhtml += '<tr>';
                rowhtml += '<td>'+item.NoTransaksi+'</td>';
                rowhtml += '<td>'+item.Memo+'</td>';
                rowhtml += '<td>'+moment(item.Tanggal).format("DD-MM-YYYY")+'</td>';
                rowhtml += '<td>'+Number(item.Debet).toLocaleString()+'</td>';
                rowhtml += '<td>'+Number(item.Kredit).toLocaleString()+'</td>';
                rowhtml += '<td>'+Number(item.Saldo).toLocaleString()+'</td>';
                rowhtml += '</tr>';
                // cols.map((d) => {
                //     let val = item[d] ? item[d] : '';
                //     rowhtml += '<td>' + val + '</td>';
                // });
                rowhtml += '</tr>';
            });
            // tot =+val[d];
            // let sum = 0;
            // let sumtax = 0;
            // records.forEach(element => {
            // sum +=  parseInt(element.totalPenjualan);
            // sumtax +=  parseInt(element.taxPenjualan);
            // });

            // console.log(sum)

            rowhtml +=
                '<style>body {font-family:Arial; color:#495057;}p{text-align:center;font-size:18px;font-weight:bold;margin:15px;}table{ border-collapse: collapse; border-spacing: 0; }th,td{font-size:12px;text-align:left;padding: 4px;}th{padding:8px 4px;}tr:nth-child(2n-1){background:#f7f7f7; }</style>';
            rowhtml += '</tbody>';
            rowhtml += '<tfoot><tr>'

            rowhtml += '<th></th><th></th><th></th><th></th><th></th><th></th></tr>'
            rowhtml += '<tr><th></th><th></th><th></th><th> Net</th><th></th><th></th>'
            rowhtml += '</tr></tfoot></table>'
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
    const edit_row = (item) => {
        store.dispatch('GetDetailPmbelian', {kd : item.noPenjualan})
        store.dispatch('CreateEditPembelian', item);
        // router.push({ path: '/editpenjualan' })
        // alert('ID: '+ item.noPenjualan);
    };
</script>
