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
                            <h5>Daftar Transaksi Opnum</h5>
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
                            <template #tglOpnum="props"> {{ moment(props.row.tglOpnum).format("DD-MM-YYYY") }} </template>
                            <template #selisihOpnum="props"> {{ Number(props.row.selisihOpnum).toLocaleString() }} </template>
                            <template #nilaiOpnum="props"> {{ Number(props.row.nilaiOpnum).toLocaleString() }} </template>
                            <template #action="props">
                                <router-link :to="{name: 'rekapan', params: {startDate: props.row.tgl_trans, kd_trans:props.row.kd_trans, regu:props.row.r_regu }}" >
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
                                        class="feather feather-edit-2"
                                    >
                                        <path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path>
                                    </svg>
                                </router-link>
                                <a href="javascript:void(0);" @click="delete_row(props.row)" >
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
                                        class="feather feather-trash-2"
                                    >
                                        <polyline points="3 6 5 6 21 6"></polyline>
                                        <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                        <line x1="10" y1="11" x2="10" y2="17"></line>
                                        <line x1="14" y1="11" x2="14" y2="17"></line>
                                    </svg>
                                </a>
                            </template>
                        </v-client-table>

                        <div class="table-condensed table-responsive">
                            <table role="table" aria-busy="false" aria-colcount="4" class="table b-table table-hover table-bordered" id="__BVID__354">
                                <thead role="rowgroup" class="">
                                    <tr role="row" class="">
                                        <th role="columnheader" scope="col" aria-colindex="1" class=""><div>PERTAMAX : {{ Number(total_px).toLocaleString() }}</div></th>
                                        <th role="columnheader" scope="col" aria-colindex="2" class=""><div>PERTALITE : {{ Number(total_pl).toLocaleString() }}</div></th>
                                        <th role="columnheader" scope="col" aria-colindex="3" class=""><div>DEXLITE : {{ Number(total_dx).toLocaleString() }}</div></th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        
                        
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
    useMeta({ title: 'Data Laporan Penjualan BBM' });

    const store = useStore();
    const router = useRouter()

    const columns = ref(['r_opnum', 'tglOpnum', 'nmPersediaan', 'selisihOpnum' ,'nilaiOpnum', 'action']);
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
        sortable: ['kdOpnum', 'tglOpnum', 'totalOpnum'],
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
        // console.log('on mount pagr')
    });
    onBeforeMount(() => {
        // console.log(' before onmount')
        
    })

    
    const bind_data = () => {
        store.dispatch('GetLaporanOpnum', sorting.value);
        // items.value = store.getters.SlaporanBbm;
    }

    const total_px = ref();
    const total_pl = ref();
    const total_dx = ref();

    const bbm = computed(() => {
        items.value = store.getters.SlaporanOpnum;

        total_px.value = items.value .filter(i => i.r_kdPersediaan === 'BRG0001').reduce((a, b) => Number(a) + Number(b.selisihOpnum), 0);
        total_pl.value = items.value .filter(i => i.r_kdPersediaan === 'BRG0002').reduce((a, b) => Number(a) + Number(b.selisihOpnum), 0);
        total_dx.value = items.value .filter(i => i.r_kdPersediaan === 'BRG0003').reduce((a, b) => Number(a) + Number(b.selisihOpnum), 0);

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
                rowhtml += '<td>'+item.kdOpnum+'</td>';
                rowhtml += '<td>'+moment(item.tglOpnum).format("DD-MM-YYYY")+'</td>';
                // rowhtml += '<td>'+item.nmPelanggan+'</td>';
                rowhtml += '<td>'+Number(item.totalOpnum).toLocaleString()+'</td>';
                // rowhtml += '<td>'+Number(item.discPenjualan).toLocaleString()+'</td>';
                // rowhtml += '<td>'+Number(item.taxPenjualan).toLocaleString()+'</td>';
                // rowhtml += '<td>'+Number(item.totalPenjualan).toLocaleString()+'</td>';
                rowhtml += '</tr>';
                // cols.map((d) => {
                //     let val = item[d] ? item[d] : '';
                //     rowhtml += '<td>' + val + '</td>';
                // });'kdOpnum', 'tglOpnum', 'totalOpnum',
                rowhtml += '</tr>';
            });
            // tot =+val[d];
            let sum = 0;
            // let sumtax = 0;
            records.forEach(element => {
            sum +=  parseInt(element.totalOpnum);
            // sumtax +=  parseInt(element.taxPenjualan);
            });

            // console.log(sum)

            rowhtml +=
                '<style>body {font-family:Arial; color:#495057;}p{text-align:center;font-size:18px;font-weight:bold;margin:15px;}table{ border-collapse: collapse; border-spacing: 0; }th,td{font-size:12px;text-align:left;padding: 4px;}th{padding:8px 4px;}tr:nth-child(2n-1){background:#f7f7f7; }</style>';
            rowhtml += '</tbody>';
            rowhtml += '<tfoot><tr>'

            // rowhtml += '<th></th><th></th><th></th><th></th><th>Total</th><th>'+Number(sumtax).toLocaleString()+'</th><th>'+Number(sum).toLocaleString()+'</th></tr>'
            rowhtml += '<tr><th>Total Net</th><th></th><th>'+Number(sum).toLocaleString()+'</th>'
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
        store.dispatch('GetDetailPenjualan', {kd : item.noPenjualan})
        store.dispatch('CreateEditPenjualan', item);
        // router.push({ path: '/editpenjualan' })
        // alert('ID: '+ item.noPenjualan);
    };
    const delete_row = (item) => {
        // alert(data.kd_trans);
        new window.Swal({
            title: 'Anda Yahin?',
            text: "Hapus Opnum !" +item.r_opnum,
            type: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Delete',
            padding: '2em'
        }).then(result => {
            if (result.value) {
                store.dispatch('DeleteOpnum', { id:item.r_opnum})
                .then(response => {
                    bind_data();
                    new window.Swal('Deleted!', 'Your file has been deleted.', 'success');
                }).catch(error => {
                    // console.log('error: ', error)
                    return
                })
            }
        });
    }
</script>
