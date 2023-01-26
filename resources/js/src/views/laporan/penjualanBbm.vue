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
                    <div class="custom-table panel-body p-0">

                        <div class="d-flex flex-wrap justify-content-center justify-content-sm-start px-3 pt-3 pb-0">
                            <!-- <button variant="primary" class="btn m-1 btn-primary" @click="export_table('print')">Print</button> -->
                            <!-- <button variant="primary" class="btn m-1 btn-primary" @click="export_table('pdf')">PDF</button> -->
                            <h5>Daftar Penjualan</h5>
<span>{{ bbm }}</span>
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

                        <v-client-table :data="items" :columns="columns" :options="table_option">
                            <template #tgl_transaksi="props"> {{ moment(props.row.tgl_transaksi).format("DD-MM-YYYY") }} </template>
                            <template #last_price="props"> {{ Number(props.row.last_price).toLocaleString() }} </template>
                            <template #total="props"> {{ Number(props.row.total).toLocaleString() }} </template>
                            <template #action="props">
                                <div class="custom-dropdown dropdown btn-group ">
                                    <div class="btn-group" href="#" role="button" id="pendingTask" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <!-- <button type="button" class="btn btn-blue">Open</button> -->
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
                                            <a href="javascript:void(0);" class="dropdown-item" @click="edit_row(props.row)"> Edit </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item" @click="view_row(props.row)"> Delete </a>
                                        </li>
                                    </ul>
                                </div>
                            </template>
                        </v-client-table>

                        
                        
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

    import flatPickr from 'vue-flatpickr-component';
    import 'flatpickr/dist/flatpickr.css';
    import '@/assets/sass/forms/custom-flatpickr.css';

    import { useStore } from 'vuex';

    import moment from "moment";

    import { useMeta } from '@/composables/use-meta';
    useMeta({ title: 'Data Laporan Penjualan BBM' });

    const store = useStore();

    const columns = ref(['kd_trans', 'nama_bbm', 'nama_nosel' ,'r_regu', 'tgl_transaksi', 'last_price', 'cost_ltr', 'total', 'action']);
    const items = ref([]);
    const table_option = ref({
        perPage: 10,
        perPageValues: [5, 10, 20, 50],
        skin: 'table table-hover',
        columnsClasses: { action: 'actions text-center' },
        pagination: { nav: 'scroll', chunk: 5 },
        texts: {
            count: 'Showing {from} to {to} of {count}',
            filter: '',
            filterPlaceholder: 'Search...',
            limit: 'Results:',
        },
        sortable: ['kd_trans', 'nama_bbm', 'r_regu', 'tgl_transaksi',],
        sortIcon: {
            base: 'sort-icon-none',
            up: 'sort-icon-asc',
            down: 'sort-icon-desc',
        },
        resizableColumns: true,
    });
    const sorting = ref({
        startDate: moment().subtract(30,'d').format("D-M-YYYY"),
        endDate: moment().format("D-M-YYYY")
    });

    

    onMounted(() => {
        bind_data();
    });

    
    const bind_data = () => {
        store.dispatch('GetLaporanBbm', sorting.value);
        // items.value = store.getters.SlaporanBbm;
    }

    const bbm = computed(() => {
        items.value = store.getters.SlaporanBbm;

        let sum = 0;
        items.value.forEach(element => {
        sum +=  parseInt(element.total);
        });

        // console.log(sum)
        // return { items }
    });

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
                '<table style="width: 100%; " cellpadding="0" cellcpacing="0"><thead><tr style="color: #515365; background: #eff5ff; -webkit-print-color-adjust: exact; print-color-adjust: exact; "> ';
            cols.map((d) => {
                rowhtml += '<th>' + capitalize(d) + '</th>';
            });
            rowhtml += '</tr></thead>';
            rowhtml += '<tbody>';
            records.map((item) => {
                rowhtml += '<tr>';
                rowhtml += '<td>'+item.kd_trans+'</td>';
                rowhtml += '<td>'+item.nama_bbm+'</td>';
                rowhtml += '<td>'+item.nama_nosel+'</td>';
                rowhtml += '<td>'+item.r_regu+'</td>';
                rowhtml += '<td>'+moment(item.tgl_transaksi).format("DD-MM-YYYY")+'</td>';
                rowhtml += '<td>'+Number(item.last_price).toLocaleString()+'</td>';
                rowhtml += '<td>'+Number(item.cost_ltr).toLocaleString()+'</td>';
                rowhtml += '<td>'+Number(item.total).toLocaleString()+'</td>';
                rowhtml += '</tr>';
                // cols.map((d) => {
                //     let val = item[d] ? item[d] : '';
                //     rowhtml += '<td>' + val + '</td>';
                // });
                rowhtml += '</tr>';
            });
            // tot =+val[d];
            let sum = 0;
            records.forEach(element => {
            sum +=  parseInt(element.total);
            });

            // console.log(sum)

            rowhtml +=
                '<style>body {font-family:Arial; color:#495057;}p{text-align:center;font-size:18px;font-weight:bold;margin:15px;}table{ border-collapse: collapse; border-spacing: 0; }th,td{font-size:12px;text-align:left;padding: 4px;}th{padding:8px 4px;}tr:nth-child(2n-1){background:#f7f7f7; }</style>';
            rowhtml += '</tbody>';
            rowhtml += '<tfoot><tr>'

            rowhtml += '<th></th><th></th><th></th><th></th><th></th><th></th><th>Total</th>:<th>'+Number(sum).toLocaleString()+'</th>'
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
        // router.push({ name: 'user', params: { username: 'eduardo' } })
        alert('ID: '+ item);
    };
</script>
