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
                                                    <div class="row">
                                                        <!-- <div class="col-xl-8 col-lg-7 col-md-6 col-sm-4 align-self-center">
                                                            <p class="inv-to">Invoice To</p>
                                                        </div>

                                                        <div class="col-xl-4 col-lg-5 col-md-6 col-sm-8 align-self-center order-sm-0 order-1 inv--payment-info">
                                                            <h6 class="inv-title">Payment Info:</h6>
                                                        </div> -->

                                                        <div class="col-xl-8 col-lg-7 col-md-6 col-sm-4">
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
                                                    </div>

                                                    <div class="inv--product-table-section">
                                                        <!-- <div class="table-responsive"> -->
                                                            <table class="table table-striped table-bordered">
                                                                <thead>
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
                                                                    <tr v-for="item in items" :key="item.id">
                                                                        <td>{{ item.nama_nosel }}</td>
                                                                        <td>{{ item.awal_meter }}</td>
                                                                        <td>{{ item.last_meter }}</td>
                                                                        <td>{{ item.cost_ltr }}</td>
                                                                        <td>{{ Number(item.last_price).toLocaleString() }}</td>
                                                                        <td>{{ Number(item.total).toLocaleString() }}</td>
                                                                    </tr>
                                                                </tbody>
                                                                <tfoot>
                                                                    <tr>
                                                                        <th colspan="2" class="align-top mx-auto">
                                                                            <table>
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th colspan="2">Langganan Kupon</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <tr v-for="pon in kupon" :key="pon.r_kdPelanggan">
                                                                                        <td aria-colindex="1" role="cell">{{ pon.nmPelanggan }}</td>
                                                                                        <td aria-colindex="2" role="cell">{{ pon.total }}</td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </th>
                                                                        <th colspan="2" class="align-top mx-auto">
                                                                            <table>
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th colspan="2">Total Penjualan Regu A</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody role="rowgroup">
                                                                                    <tr >
                                                                                        <td aria-colindex="1" role="cell">PERTAMAX</td>
                                                                                        <td aria-colindex="2" role="cell">{{Number(totalPertamax).toLocaleString()}}</td>
                                                                                    </tr>
                                                                                    <tr >
                                                                                        <td aria-colindex="1" role="cell">PERTALITE</td>
                                                                                        <td aria-colindex="2" role="cell">{{Number(totalPertalite).toLocaleString()}}</td>
                                                                                    </tr>
                                                                                    <tr >
                                                                                        <td aria-colindex="1" role="cell">DEXLITE</td>
                                                                                        <td aria-colindex="2" role="cell">{{Number(totalDexlite).toLocaleString()}}</td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </th>
                                                                        <th class="align-top">
                                                                            <!-- <table>
                                                                                <thead role="rowgroup">
                                                                                    <tr >
                                                                                        <th aria-colindex="1" role="cell">Total</th>
                                                                                        <th aria-colindex="2" role="cell">{{ Number(totaljual).toLocaleString() }}</th>
                                                                                    </tr>
                                                                                    <tr >
                                                                                        <th aria-colindex="1" role="cell">Kupon</th>
                                                                                        <th aria-colindex="2" role="cell">{{ Number(totalkupon).toLocaleString() }}</th>
                                                                                    </tr>
                                                                                    <tr >
                                                                                        <th aria-colindex="1" role="cell">Link Aja</th>
                                                                                        <th aria-colindex="2" role="cell">6757</th>
                                                                                    </tr>
                                                                                    <tr >
                                                                                        <th aria-colindex="1" role="cell">Biaya</th>
                                                                                        <th aria-colindex="2" role="cell">6757</th>
                                                                                    </tr>
                                                                                    <tr >
                                                                                        <th aria-colindex="1" role="cell">Total Cash</th>
                                                                                        <th aria-colindex="2" role="cell">6757</th>
                                                                                    </tr>
                                                                                    <tr >
                                                                                        <th aria-colindex="1" role="cell">Saldo Plus</th>
                                                                                        <th aria-colindex="2" role="cell">6757</th>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table> -->
                                                                                <tr >
                                                                                    <th >Total</th>
                                                                                    <th >{{ Number(totaljual).toLocaleString() }}</th>
                                                                                </tr>
                                                                                <tr >
                                                                                    <th >Kupon</th>
                                                                                    <th >{{ Number(totalkupon).toLocaleString() }}</th>
                                                                                </tr>
                                                                                <tr >
                                                                                    <th >Biaya</th>
                                                                                    <th >{{ Number(totalbiaya).toLocaleString() }}</th>
                                                                                </tr>
                                                                                <tr >
                                                                                    <th >Link Aja</th>
                                                                                    <th >{{ Number(totallink).toLocaleString() }}</th>
                                                                                </tr>
                                                                                <tr >
                                                                                    <th >Total Cash</th>
                                                                                    <th >{{ Number(totaljual -totalkupon -totalbiaya - totallink).toLocaleString() }}</th>
                                                                                </tr>
                                                                                <tr >
                                                                                    <th >Saldo Plus</th>
                                                                                    <th >6757</th>
                                                                                </tr>
                                                                        </th>
                                                                    </tr>
                                                                </tfoot>
                                                            </table>
                                                        <!-- </div> -->
                                                    </div>


                                                </div>

                                                

                                                <div class="inv--detail-section inv--customer-detail-section">
                                                    <div class="row">
                                                        <!-- <div class="col-xl-8 col-lg-7 col-md-6 col-sm-4 align-self-center">
                                                            <p class="inv-to">Invoice To</p>
                                                        </div>

                                                        <div class="col-xl-4 col-lg-5 col-md-6 col-sm-8 align-self-center order-sm-0 order-1 inv--payment-info">
                                                            <h6 class="inv-title">Payment Info:</h6>
                                                        </div> -->

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

    import moment from "moment";

    import { useStore } from 'vuex';
    import { useRouter, useRoute } from 'vue-router'

    import { useMeta } from '@/composables/use-meta';
import { async } from 'q';
    useMeta({ title: 'Aplusan' });

    const store = useStore();

    const totaljual = ref();
    const totalkupon = ref();
    const totalbiaya = ref();
    const totallink = ref();
    const totalPertamax = ref();
    const totalPertalite = ref();
    const totalDexlite = ref();

    const items = ref([]);
    const kupon = ref([]);
    const biaya = ref([]);
    const link = ref([]);
    const sorting = ref({
        startDate: moment().format("D-M-YYYY"),
        // endDate: moment().format("D-M-YYYY")
    });

    

    onMounted(() => {
        bind_data();
        // total_aplusan();
    });

    
    const bind_data = async () => {
        await store.dispatch('GetAplusan', sorting.value);
        items.value = store.getters.Saplusan[0];
        kupon.value = store.getters.Saplusan[1];
        biaya.value = store.getters.Saplusan[2];
        // let ar = items.value ;
        let sum = 0;
        items.value.forEach(element => {
            sum +=  parseInt(Number(element.total));
            // alert(sum);
        });
        totaljual.value = sum

        let sumk = 0;
        kupon.value.forEach(elem => {
            sumk +=  parseInt(Number(elem.total));
            // alert(sum);
        });
        totalkupon.value = sumk

        let sumb = 0;
        biaya.value.forEach(ele => {
            sumb +=  parseInt(Number(ele.jumlah));
            // alert(sum);
        });
        totalbiaya.value = sumb

        let suml = 0;
        link.value.forEach(ele => {
            suml +=  parseInt(Number(ele.jumlah_link));
            // alert(sum);
        });
        totallink.value = suml
        
        let totalPX = items.value.filter(
            (item) => item.r_bbm === 1
        ).reduce((accumulator, item) => {
            return accumulator += Number(item.total);
        }, 0);
        totalPertamax.value = totalPX

        let totalPL = items.value.filter(
            (item) => item.r_bbm === 2
        ).reduce((accumulator, item) => {
            return accumulator += Number(item.total);
        }, 0);
        totalPertalite.value = totalPL

        let totalDX = items.value.filter(
            (item) => item.r_bbm === 3
        ).reduce((accumulator, item) => {
            return accumulator += Number(item.total);
        }, 0);
        totalDexlite.value = totalDX

        console.log(totalPX)
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
                '<table style="width: 100%; " cellpadding="0" cellcpacing="0"><thead><tr style="color: #515365; background: #eff5ff; -webkit-print-color-adjust: exact; print-color-adjust: exact; "> ';
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
