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

        <!-- <div class="row invoice layout-top-spacing layout-spacing">
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="doc-container"> -->
        <div class="underline-content tabs">
            <ul class="nav nav-tabs mb-3" id="lineTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="underline-home-tab" data-bs-toggle="tab" href="#underline-home" role="tab" aria-controls="underline-home" aria-selected="true">
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
                            class="feather feather-home"
                        >
                            <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                            <polyline points="9 22 9 12 15 12 15 22"></polyline>
                        </svg>
                        Edit Transaksi Biaya
                    </a>
                </li>
                
            </ul>

            <div class="tab-content" id="lineTabContent-3">
                <div class="tab-pane fade show active" id="underline-home" role="tabpanel" aria-labelledby="underline-home-tab">

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
                                                            <input type="text" v-model="params.noNota" id="number" class="form-control form-control-sm" placeholder="#0001" disabled />
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
                                                        <th class="">Biaya</th>
                                                        <th class="">Satuan</th>
                                                        <th class="text-end">Akun</th>
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
                                                            <input type="text" v-model="item.biaya" :id="'biaya'+index" width="100%" @keyup="getTotal()" placeholder="Biaya" @keypress="onlyNumber"  />
                                                            <!-- <input type="text" v-model="item.kdPersediaan.kdPersediaan" :id="'rate'+index" class="form-control form-control-sm" placeholder="Price" /> -->
                                                        </td>
                                                        <td style="padding:0;margin:0;">
                                                            <input type="text" v-model="item.satuan" :id="'satuan'+index" width="100%"  placeholder="Satuan" />
                                                        </td>
                                                        <td style="padding:0;margin:0;">
                                                            <!-- <input type="text" v-model="item.kredit" :id="'total'+index" width="100%" placeholder="Quantity" /> -->
                                                            <select id="inputState" v-model="item.acc" class="form-select">
                                                                <option :value="ac.acc_id" v-for="ac in accs" :key="ac.acc_id" selected>{{ ac.name }}</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                        <button type="button" class="btn btn-secondary additem btn-sm" @click="add_item()">Add Item</button>
                                    </div>


                                    <div class="invoice-detail-total">
                                        <div class="row">

                                            <div class="col-md-6">
                                                <div class="invoice-actions-btn">
                                                    <div class="invoice-action-btn">
                                                        <div class="row">
                                                            <div class="col-sm-4">
                                                                <a href="javascript:;" @click="simpanBiaya" class="btn btn-success btn-download">Save</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            

                                            <div class="col-md-6">
                                                <div class="totals-row">

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
                                    
                                </div>
                            </div>
                        </div>

                        
                    </div>

                </div>
                <div class="tab-pane fade" id="underline-profile" role="tabpanel" aria-labelledby="underline-profile-tab">

                    <div class="col-xl-12">
                        <div class="invoice-content">
                            <div class="invoice-detail-body">
                                <!-- <div class="invoice-detail-title">
                                    
                                    <div class="invoice-title">
                                    PO BBM
                                    </div>
                                </div> -->
                                <!-- {{ listbiaya }} -->

                                <div class="invoice-detail-header">
                                    <div class="row justify-content-between">

                                        
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

    useMeta({ title: 'Edit Biaya' });

    const store = useStore();
    const router = useRouter();
    const route = useRoute();

    const items = ref([]);
    const listbiaya = ref([]);
    const accs = ref();
    const nobiaya = ref([]);
    const total = ref();
    const params = ref({
        noNota: props.kd_trans,
        tglNota: moment(props.startDate).format("YYYY-MM-DD"),
        // total: props.total,
    });
    const props = defineProps({
        id: String,
        kd_trans: String,
        startDate: String,
        // total: String
    });

    const columns = ref(['kd_trans', 'tglBiaya', 'keterangan_biaya' ,'jumlah', 'action']);
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
        sortable: ['kd_trans', 'tglBiaya', 'keterangan_biaya' ,'jumlah'],
        sortIcon: {
            base: 'sort-icon-none',
            up: 'sort-icon-asc',
            down: 'sort-icon-desc',
        },
        resizableColumns: true,
        resizableRows: true,
    });

    const sorting = ref({
        kd_trans: props.kd_trans,
        startDate: moment(props.startDate).format("YYYY-MM-DD"),
        // endDate: moment().format("D-M-YYYY")
    });

    const GetCoaList=() => {
        store.dispatch('GetCoaList', {acc: '6'})
    }
    // const getNoBiaya=() => {
    //     store.dispatch('GetNoBiaya')
    //     setTimeout(function() { nobiaya.value = store.getters.NoBiaya ; }, 2000);
    // }


    const getTotal=() =>{
        // const pajak = store.state.pajak;
        // const temptotal = subtotal.value - (subtotal.value * disc.value / 100)
        // total.value = (subtotal.value - (subtotal.value * disc.value / 100))
        // tax.value = temptotal * pajak /100
        total.value = 0;
        let il = items.value.length;
        // var t = 0;
        for(var i = 0;i<il;i++){
            total.value += parseInt(items.value[i].biaya); 
        }
        
    }


    const simpanBiaya=() => {

        store.dispatch('DeleteBiaya', { id:params.value.noNota})
        .then(response => {
            // console.log(response)
            const header =params.value
            // const headers =paramssupplier.value
            // const headerfull = Object.assign(header, headers)
            const detail =items.value ;
            // console.log(detail);
            store.dispatch('CreateBiaya', [header,detail] )
            // setTimeout(function() { getCart(); }, 5000);
            // getNoBiaya();
        }).catch(error => {
            console.log('error: ', error)
            return
        })

    }

    onMounted( async  () => {
        //set default data
        await store.dispatch('GetBiayaDetail', sorting.value);

        total.value = 0;
        const byArr = store.getters.StateBiayaDetail;
        for (let a = 0; a < byArr.length; a++) {
            items.value.push({ 
                id: a + 1, 
                name: byArr[a].keterangan_biaya, 
                biaya: byArr[a].jumlah, 
                satuan: byArr[a].satuan, 
                acc: byArr[a].accid 
            });
            total.value += parseInt(byArr[a].jumlah)
        }

        // let dt = new Date();
        // params.value.invoice_date = JSON.parse(JSON.stringify(dt));
        // dt.setDate(dt.getDate() + 5);
        // params.value.due_date = dt;

        console.log(total.value)
       
        GetCoaList();
        setTimeout(function() { 
            accs.value = store.getters.StateCoaList ; 
            // nobiaya.value = store.getters.NoBiaya ;
            // listbiaya.value = store.getters.StateListBiaya ;
            // console.log(listbiaya.value);
        }, 4000);
        
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
        items.value.push({ id: max_id + 1, name: '', biaya:'', satuan: '', acc: '' });
        // items.value[1].title.focus();
    };

    const remove_item = (item) => {
        items.value = items.value.filter((d) => d.id != item.id);
    };

    const getListBiaya = () => {
        store.dispatch('GetListBiaya', sorting.value );
        setTimeout(function() { listbiaya.value = store.getters.StateListBiaya ; }, 4000);
    };

    function onlyNumber ($event) {
        //console.log($event.keyCode); //keyCodes value
        let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
        if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
            $event.preventDefault();
        }   
    };

    const export_table = (type) => {
        let cols = columns.value.filter((d) => d != 'profile' && d != 'action');
        let records = listbiaya.value;
        let filename = 'Dafta Biaya | Periode Tgl :';
        let no = 1;

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
            var rowhtml = '<p>' + filename + sorting.value.startDate + ' s/d '+ sorting.value.endDate +'</p>';
            rowhtml +=
                '<table style="width: 95%; " cellpadding="0" cellcpacing="0" border="1"><thead><tr style="color: #515365; background: #eff5ff; -webkit-print-color-adjust: exact; print-color-adjust: exact; "> ';
            cols.map((d) => {
                rowhtml += '<th>' + capitalize(d) + '</th>';
            });
            rowhtml += '</tr></thead>';
            rowhtml += '<tbody>';

                records.map((item) => {
                rowhtml += '<tr>';
                // rowhtml += '<td>'+ parseInt(no+1)+'</td>';
                rowhtml += '<td>'+item.kd_trans+'</td>';
                rowhtml += '<td>'+moment(item.tglBiaya).format("DD-MM-YYYY")+'</td>';
                rowhtml += '<td>'+item.keterangan_biaya+'</td>';
                rowhtml += '<td>'+Number(item.jumlah).toLocaleString()+'</td>';
                rowhtml += '</tr>';
                // cols.map((d) => {
                //     let val = item[d] ? item[d] : '';
                //     rowhtml += '<td>' + val + '</td>';
                // }); 'kd_trans', 'tglBiaya', 'keterangan_biaya' ,'jumlah',
                rowhtml += '</tr>';
            });

            let sum = 0;
            // let sumtax = 0;
            records.forEach(element => {
            sum +=  parseInt(element.jumlah);
            // sumtax +=  parseInt(element.taxPenjualan);
            });


            rowhtml +=
                '<style>body {font-family:Arial; color:#495057;}p{text-align:center;font-size:8px;font-weight:bold;margin:15px;}table{ border-collapse: collapse; border-spacing: 0; }th,td{font-size:8px;text-align:left;padding: 4px;}th{padding:8px 4px;}tr:nth-child(2n-1){background:#f7f7f7; }</style>';
            rowhtml += '</tbody>';
            rowhtml += '<tfoot><tr>'
            rowhtml += '<th></th><th></th><th>Total</th><th>'+Number(sum).toLocaleString()+'</th></tr>'
            // rowhtml += '<tr><th></th><th></th><th></th><th></th><th>Total Net</th><th></th><th>'+Number(sum - sumtax).toLocaleString()+'</th>'
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

    const delete_row = (data) => {
        // alert(data.kd_trans);
        new window.Swal({
            title: 'Anda Yahin?',
            text: "Hapus Biaya !" +data.keterangan_biaya,
            type: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Delete',
            padding: '2em'
        }).then(result => {
            if (result.value) {
                store.dispatch('DeleteBiaya', { id:data.kd_trans})
                .then(response => {
                    getListBiaya();
                    getNoBiaya();
                    new window.Swal('Deleted!', 'Your file has been deleted.', 'success');
                }).catch(error => {
                    // console.log('error: ', error)
                    return
                })
            }
        });
    }

    const cari = () => {
        getListBiaya();
    }
</script>
