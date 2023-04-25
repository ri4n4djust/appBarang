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

        <!-- <div class="row invoice layout-top-spacing layout-spacing"> -->
            <!-- <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
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
                                    Transaksi
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="underline-profile-tab" data-bs-toggle="tab" href="#underline-profile" role="tab" aria-controls="underline-profile" aria-selected="false"
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
                                        class="feather feather-user"
                                    >
                                        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                        <circle cx="12" cy="7" r="4"></circle>
                                    </svg>
                                    Daftar
                                </a>
                            </li>
                        </ul>

                        <div class="tab-content" id="lineTabContent-3">
                            <div class="tab-pane fade show active" id="underline-home" role="tabpanel" aria-labelledby="underline-home-tab">
                               
                                <!-- <div class="row"> -->
                                    <div class="col-xl-12">
                                        <div class="invoice-content">
                                            <div class="invoice-detail-body">
                                                <div class="invoice-detail-title">
                                                
                                                    <div class="invoice-title">
                                                    PO BBM
                                                    </div>
                                                </div>

                                                <div class="invoice-detail-header">
                                                    <div class="row justify-content-between">
                                                        <div class="col-xl-5 invoice-address-company">

                                                            <div class="invoice-address-company-fields">
                                                                <div class="form-group row">
                                                                    <label for="company-name" class="col-sm-3 col-form-label col-form-label-sm">No PO</label>
                                                                    <div class="col-sm-9">
                                                                        <input type="text" v-model="params.no_po" id="number" class="form-control form-control-sm" placeholder="#0001" disabled />
                                                                    </div>
                                                                </div>

                                                                <div class="form-group row">
                                                                    <label for="company-email" class="col-sm-3 col-form-label col-form-label-sm">Tgl</label>
                                                                    <div class="col-sm-9">
                                                                        <flat-pickr v-model="params.tgl_so" class="form-control form-control-sm flatpickr active" placeholder="Invoice Date"></flat-pickr>
                                                                    </div>
                                                                </div>


                                                            </div>
                                                        </div>

                                                        <div class="col-xl-5 invoice-address-client">

                                                            <div class="invoice-address-client-fields">
                                                                <div class="form-group row">
                                                                    <label for="client-name" class="col-sm-3 col-form-label col-form-label-sm">Name</label>
                                                                    <div class="col-sm-9">
                                                                        <multiselect 
                                                                            v-model="paramssupplier" 
                                                                            :options="pembelian.suppliers" 
                                                                            :searchable="true"
                                                                            :allow-empty="false"
                                                                            track-by="nmSupplier"
                                                                            label="nmSupplier"
                                                                            open-direction="top"
                                                                            placeholder="Choose..." 
                                                                            selected-label="" 
                                                                            select-label="" 
                                                                            deselect-label="">
                                                                        </multiselect>
                                                                    </div>

                                                                </div>
                                                                <div class="form-group row">
                                                                    <label for="company-name" class="col-sm-3 col-form-label col-form-label-sm">No SO</label>
                                                                    <div class="col-sm-9">
                                                                        <input type="text" v-model="params.no_so" id="number" class="form-control form-control-sm" placeholder="#0001" />
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                

                                                <div class="invoice-detail-items">
                                                    <div class="table-responsive">
                                                        <table class="table table-bordered item-table">
                                                            <thead>
                                                                <tr style="padding:0;margin:0;">
                                                                    <th></th>
                                                                    <th>Description</th>
                                                                    <th>Rate</th>
                                                                    <th>Qty</th>
                                                                    <th>pph</th>
                                                                    <th>Total</th>
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
                                                                        <select id="inputState" v-model="item.title" class="form-select">
                                                                            <option :value="br" v-for="br in barangs" :key="br.id" selected>{{ br.nama_bbm }}</option>
                                                                        </select>
                                                                    </td>
                                                                    <td style="padding:0;margin:0;">
                                                                        <input type="text" v-model="item.rate" :id="'rate'+index" class="form-control" placeholder="Price" />
                                                                    </td>
                                                                    <td style="padding:0;margin:0;">
                                                                        <input type="text" v-model="item.quantity" :id="'quantity'+index" class="form-control"  placeholder="Quantity" />
                                                                    </td>
                                                                    <td style="padding:0;margin:0;">
                                                                        <input type="text" v-model="item.pph" :id="'pph'+index" class="form-control" placeholder="pph" />
                                                                    </td>
                                                                    <td style="padding:0;margin:0;">
                                                                        <input type="text" v-model="item.total" :id="'total'+index" class="form-control" placeholder="total" />
                                                                        <!-- {{ Number((item.rate * item.quantity) + item.pph).toLocaleString() }} -->
                                                                        <input type="hidden" v-model="item.amount" :id="'amount'+index" class="form-control" placeholder="total" />
                                                                        
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
                                                                            <a href="javascript:;" @click="simpanPembelian" class="btn btn-success btn-download">Save</a>
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
                                                                <!-- <div class="invoice-totals-row invoice-summary-total">
                                                                    <div class="invoice-summary-label">Disc</div>
                                                                    <input type="text" v-model="params.disc" class="form-control form-control-sm" >%
                                                                    <div class="invoice-summary-label"></div>
                                                                    <div class="invoice-summary-value">
                                                                        <div class="total-amount"><span class="currency"></span><span>{{ new Intl.NumberFormat().format(Math.floor(subtotal * disc / 100)) }}</span></div>
                                                                    </div>
                                                                </div> -->
                                                                <div class="invoice-totals-row invoice-summary-total">
                                                                    <div class="invoice-summary-label">PPH</div>
                                                                    <div class="invoice-summary-label"></div>
                                                                    <div class="invoice-summary-value">
                                                                        <div class="subtotal-amount"><span class="currency"></span>
                                                                            <input type="hidden" v-model="params.disc" class="form-control form-control-sm" >
                                                                            <input type="text" v-model="params.pph" class="form-control form-control-sm" @keyup="getTotal" >
                                                                        </div>
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

                                            </div>
                                        </div>
                                    </div>

                                    
                                <!-- </div> -->


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

                                            <div class="invoice-detail-header">
                                                <div class="row justify-content-between">
                                                    <div class="row invoice layout-top-spacing layout-spacing apps-invoice">
                                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                            <div class="doc-container">
                                                                <div class="row">
                                                                    <div class="col-xl-9">
                                                                        <div class="invoice-container">
                                                                            <div class="custom-table panel-body p-0"> 
                                                                                <v-client-table :data="listpobbm" :columns="columns" :options="table_option">
                                                                                    <template #podate="props"> {{ moment(props.row.podate).format("DD-MM-YYYY") }} </template>
                                                                                    <template #no_so="props">{{ props.row.no_so }}</template>
                                                                                    <template #status_po="props">

                                                                                        <div :set="dat = listpobbm.find(n => n.no_so === props.row.no_so)">
                                                                                            <div v-if="dat.qty_recieve === props.row.qty_grpo">
                                                                                                <div v-if="dat.total_net === props.row.total_terima ">
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
                                                                                                        class="feather feather-check-circle text-primary"
                                                                                                    >
                                                                                                        <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
                                                                                                        <polyline points="22 4 12 14.01 9 11.01"></polyline>
                                                                                                    </svg>
                                                                                                </div>
                                                                                                <div v-if="parseInt(dat.total_net) < parseInt(props.row.total_terima) ">
                                                                                                    PO kekurangan Bayar
                                                                                                </div>
                                                                                                <div v-if="parseInt(dat.total_net) > parseInt(props.row.total_terima) ">
                                                                                                    Ada Pengembalian Dana

                                                                                                </div>
                                                                                            </div>
                                                                                            <!-- <div v-else-if="dat.qty_recieve === props.row.qty_grpo && props.row.total_terima < dat.total_net ">
                                                                                                kurang bayar {{ dat.total_net }} && {{ props.row.total_terima }}
                                                                                            </div>
                                                                                            <div v-else-if="dat.qty_recieve === props.row.qty_grpo && props.row.total_terima > dat.total_net ">
                                                                                               kelebihan bayar {{ dat.total_net }} && {{ props.row.total_terima }}
                                                                                            </div> -->
                                                                                            <div v-else-if="dat.qty_recieve != props.row.qty_grpo">
                                                                                                dalam proses 
                                                                                                <!-- {{ dat.total_net }} && {{ props.row.total_terima }} -->
                                                                                            </div>
                                                                                        </div> 

                                                                                    </template>
                                                                                    <template #qty_grpo="props"> {{ Number(props.row.qty_grpo).toLocaleString() }} </template>
                                                                                    <template #qty_recieve="props"> {{ Number(props.row.qty_recieve).toLocaleString() }} </template>
                                                                                    <template #subTotal="props"> {{ Number(props.row.subTotal).toLocaleString() }} </template>
                                                                                    <template #total_terima="props"> {{ Number(props.row.total_terima).toLocaleString() }} </template>
                                                                                    <template #pph="props"> {{ Number(props.row.pph).toLocaleString() }} </template>
                                                                                    <template #total="props"> {{ Number(props.row.total).toLocaleString() }} </template>
                                                                                    <template #action="props">
                                                                                        <a href="javascript:void(0);" @click="edit_row(props.row)" >
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
                                                                                        </a>
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
                                                                                        <!-- <div class="custom-dropdown dropdown btn-group ">
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
                                                                                                    <router-link :to="{ name: 'nosel', params: { id: 'hgjhg'} }" class="dropdown-item">coba</router-link>
                                                                                                </li>
                                                                                            </ul>
                                                                                        </div> -->
                                                                                    </template>
                                                                                </v-client-table>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xl-3">
                                                                        <div class="invoice-actions-btn">
                                                                            <div class="invoice-action-btn">
                                                                                <div class="row">

                                                                                    <div class="col-xl-12 col-md-3 col-sm-6">
                                                                                        <a href="javascript:;" class="btn btn-secondary btn-print" @click="export_table(type='print')">Print</a>
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
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    
                <!-- </div>
            </div> -->
        <!-- </div> -->
    </div>
</template>

<script setup>
    // import { onMounted, ref } from 'vue';
    import '@/assets/sass/apps/invoice-add.scss';
    import '@/assets/sass/components/tabs-accordian/custom-tabs.scss';

    //flatpickr
    import flatPickr from 'vue-flatpickr-component';
    import 'flatpickr/dist/flatpickr.css';
    import '@/assets/sass/forms/custom-flatpickr.css';

    import '@/assets/sass/font-icons/fontawesome/css/regular.css';
    import '@/assets/sass/font-icons/fontawesome/css/fontawesome.css';
    import feather from 'feather-icons';

    import Multiselect from '@suadelabs/vue3-multiselect';
    import '@suadelabs/vue3-multiselect/dist/vue3-multiselect.css';

    import moment from "moment";

    import { computed, ref, onMounted, watch } from 'vue';
    import { useStore } from 'vuex';
    import { useRouter, useRoute } from 'vue-router'

    import { useMeta } from '@/composables/use-meta';
    useMeta({ title: 'PO BBM' });

    const store = useStore();
    const router = useRouter();
    const route = useRoute();

    const kdBarang = ref();
    const nmBarang = ref()
    const items = ref({});
    const barangs = ref([]);
    const nopobbm = ref([]);
    const qty = ref(1);
    const tot = ref();
    const subtotal = ref();
    const total = ref();
    const disc = ref(0);
    const tax = ref();
    const pph = ref();
    const selected_file = ref(null);
    const payment = ref([]);
    const params = ref({
        no_po: nopobbm,
        tgl_so: moment().format("YYYY-MM-DD"),
        term: 0,
        jthTempo: moment().format("YYYY-MM-DD"),
        notes: '',
        subtotal: subtotal,
        tax: 11,
        disc: disc,
        total: total,
        pph:pph
    });
    const paramssupplier = ref({
        kdSupplier: '',
        nmSupplier: '',
        almtSupplier: '',
        tlpSupplier: '',

    });
    const paramsacc = ref({
        noAcc: '',
        nmAcc: '',
        nilai: '',
        // tlpSupplier: '',

    });

    const columns = ref(['no_so', 'status_po' ,'supplier_name', 'podate', 'qty_grpo', 'qty_recieve','subTotal','total_terima','pph','total' ,'action']);
    const listpobbm = ref([]);
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
        sortable: ['no_so', 'supplier_name', 'podate', 'qty_grpo', 'qty_recieve',],
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
        cari: 'all'
    });

    const cartItems = ref([])
    const divpajak = ref(false)
    // const currency_list = ref([]);
    

    const pembelian = computed(() => {
        barangs.value = store.getters.StateBbm;
        const suppliers = store.getters.StateSupplier;
        const accs = store.getters.StateAcc;
        nopobbm.value = store.getters.NoPobbm;
        const pajak = store.state.pajak;
        subtotal.value = 0;
        pph.value = 0;
        let tot = 0;
        for(let i = 0; i < items.value.length; i++){
            subtotal.value += (parseFloat(items.value[i].rate) * parseFloat(items.value[i].quantity));
            items.value[i].total = (parseFloat(items.value[i].rate) * parseFloat(items.value[i].quantity)) + parseFloat(items.value[i].pph);
            items.value[i].amount = (parseFloat(items.value[i].rate) * parseFloat(items.value[i].quantity));
            pph.value += parseFloat(items.value[i].pph);
        }
        getTotal()
        // console.log(pph.value)
        listpobbm.value = store.getters.SlistPobbm;

        return { barangs, pajak, suppliers, nopobbm, accs, subtotal, tot, listpobbm }
    });

    // const bbm = computed(() => {
    //     listpobbm.value = store.getters.SlistPobbm;

    //     let sum = 0;
    //     listpobbm.value.forEach(element => {
    //     sum +=  parseInt(element.total);
    //     });
    // });

    const getBbm=() => {
        store.dispatch('GetBbm')
    }
    const getSupplier=() => {
        store.dispatch('GetSupplier')
    }
    const getNoPobbm=() => {
        store.dispatch('GetNoPobbm')
    }

    const cari = () => {
        getListPo();
    }


    const getTotal=() =>{
        const pajak = store.state.pajak;
        const temptotal = subtotal.value - (subtotal.value * disc.value / 100);
        total.value = (subtotal.value - (subtotal.value * disc.value / 100)) + parseInt(pph.value)
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

    const simpanPembelian=() => {
        // console.log(items.value)
        const header =params.value
        const headers =paramssupplier.value
        const headerfull = Object.assign(header, headers)
        const data =items.value
        let detail = []
        for(let i = 0; i < data.length; i++){

            detail.push({
                // qty_order: data[i].quantity,
                kdBarang : data[i].title.code_bbm,
                nmBarang: data[i].title.nama_bbm,
                amount: data[i].amount,
                quantity: data[i].quantity,
                rate: data[i].rate,
                total: data[i].total,
                pph_bbm: data[i].pph,
                accid_persediaan: data[i].title.accid_persediaan
            })
        }
        // console.log(detail)
        store.dispatch('CreatePo', [headerfull,detail] )
        .then(response => {
            // setTimeout(function() { getCart(); }, 5000);
            getNoPobbm();
            reset_form();
        }).catch(error => {
            // console.log('error: ', error)
            return
        })
    }

    const edit_row = (row) => {
        // alert('edit '+row);
        console.log(row);
    };

    const delete_row = (row) => {
        // alert('delete ' + row);
        new window.Swal({
            title: 'Anda Yahin?',
            text: "Hapus Po !" +row.no_po,
            type: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Delete',
            padding: '2em'
        }).then(result => {
            if (result.value) {
                store.dispatch('DeletePObbm', { id:row.no_po})
                .then(response => {
                    getListPo();
                    getNoPobbm();
                    new window.Swal('Deleted!', 'Your file has been deleted.', 'success');
                }).catch(error => {
                    // console.log('error: ', error)
                    return
                })
            }
        });
    }

    onMounted(() => {
        //set default data
        items.value = []
        items.value.push({ 
            id: 1, 
            title: '',
            nmBarang: '', 
            description: '', 
            rate: '', 
            quantity: '', 
            amount: '', 
            total: '',
            pph: 0 
        });
        

        let dt = new Date();
        params.value.invoice_date = JSON.parse(JSON.stringify(dt));
        dt.setDate(dt.getDate() + 5);
        params.value.due_date = dt;

        // console.log(paramssupplier.value)

        feather.replace();
       
        getBbm();
        // getAcc();
        getSupplier();
        getCart();
        getNoPobbm();
        getListPo();
    });

    const reset_form = () => {
        //set default data
        items.value = []
        items.value.push({ 
            id: 1, 
            title: '',
            nmBarang: '', 
            description: '', 
            rate: '', 
            quantity: '', 
            amount: '', 
            total: '',
            pph: 0 
        });
        

        let dt = new Date();
        params.value.invoice_date = JSON.parse(JSON.stringify(dt));
        dt.setDate(dt.getDate() + 5);
        params.value.due_date = dt;

        // console.log(paramssupplier.value)
       
        getBbm();
        // getAcc();
        getSupplier();
        getCart();
        getNoPobbm();
        getListPo();
        pph.value = '';
    }

    const change_file = (event) => {
        selected_file.value = URL.createObjectURL(event.target.files[0]);
    };

    const export_table = (type) => {
        let cols = columns.value.filter((d) => d != 'profile' && d != 'action');
        let records = listpobbm.value;
        let filename = 'Daftar PO BBM | Periode Tgl : ';

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
            var rowhtml = '<p>' + filename + sorting.value.startDate + ' s/d ' + sorting.value.endDate + '</p>';
            rowhtml +=
                '<table style="width: 95%; " cellpadding="0" cellcpacing="0" border="1"><thead><tr style="color: #515365; background: #eff5ff; -webkit-print-color-adjust: exact; print-color-adjust: exact; "> ';
            cols.map((d) => {
                rowhtml += '<th>' + capitalize(d) + '</th>';
            });
            rowhtml += '</tr></thead>';
            rowhtml += '<tbody>';

            // records.map((item) => {
            //     rowhtml += '<tr>';
            //     cols.map((d) => {
            //         let val = item[d] ? item[d] : '';
            //         rowhtml += '<td>' + val + '</td>';
            //     });
            //     rowhtml += '</tr>';
            // }); 'no_so', 'supplier_name', 'podate', 'qty_grpo', 'qty_recieve','pph','total'
            records.map((item) => {
                rowhtml += '<tr>';
                rowhtml += '<td>'+item.no_so+'</td>';
                rowhtml += '<td>'+item.supplier_name+'</td>';
                rowhtml += '<td>'+moment(item.podate).format("DD-MM-YYYY")+'</td>';
                rowhtml += '<td>'+Number(item.qty_grpo).toLocaleString()+'</td>';
                rowhtml += '<td>'+Number(item.qty_recieve).toLocaleString()+'</td>';
                rowhtml += '<td>'+Number(item.suTotal).toLocaleString()+'</td>';
                rowhtml += '<td>'+Number(item.pph).toLocaleString()+'</td>';
                rowhtml += '<td>'+Number(item.total).toLocaleString()+'</td>';
                rowhtml += '</tr>';
                // cols.map((d) => {
                //     let val = item[d] ? item[d] : '';
                //     rowhtml += '<td>' + val + '</td>';
                // });
                rowhtml += '</tr>';
            });
            rowhtml +=
                '<style>body {font-family:Arial; color:#495057;}p{text-align:center;font-size:8px;font-weight:bold;margin:15px;}table{ border-collapse: collapse; border-spacing: 0; }th,td{font-size:8px;text-align:left;padding: 4px;}th{padding:8px 4px;}tr:nth-child(2n-1){background:#f7f7f7; }</style>';
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

    // const add_item = () => {
    //     let max_id = 0;
    //     if (items.value && items.value.length) {
    //         max_id = items.value.reduce((max, character) => (character.id > max ? character.id : max), items.value[0].id);
    //     }
    //     items.value.push({ id: max_id + 1, title: '', description: '', rate: 0, quantity: 0, amount: 0, is_tax: false });
    // };

    const remove_item = (item) => {
        items.value = items.value.filter((d) => d.id != item.id);
    };

    const getListPo=() => {
        store.dispatch('ListPo', sorting.value)
       
    };

    function removeItem(id) {
        // alert(id)
        const arrayFromStroage = JSON.parse(localStorage.getItem('cartItemsP'));
        const filtered = arrayFromStroage.filter(arrayFromStroage => arrayFromStroage.kdBarang !== id);
        localStorage.setItem('cartItemsP', JSON.stringify(filtered));
        // cartItems.value.splice(index, 1)
        // this.isicart = Object.keys(JSON.parse(localStorage.getItem('cartItemsP'))).length;
        getCart();
        // console.log(filtered)
        // alert(filtered.nmBarang)
    }

    function getCart() {
        // subtotal.value = []
        if (localStorage.getItem('cartItemsP')===null){
            cartItems.value = localStorage.setItem('cartItemsP', '[]');
            subtotal.value = 0
        }else{
            cartItems.value = JSON.parse(localStorage.getItem('cartItemsP'));
            getSubtotal();
            getTotal();
            
        }

    }

    const addPayment = () => {
        payment.value = localStorage.setItem('payment', '[]');
        // alert('add payment')
    };

    function getSubtotal(){
        const allItems = JSON.parse(localStorage.getItem('cartItemsP')) || [];
        let sum = 0;
        subtotal.value = 0
        for(let i = 0; i < allItems.length; i++){
        sum += (parseFloat(allItems[i].total));
        }
        subtotal.value = sum
        // console.log(subtotal.value)
        // return sum;
    }

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
        items.value.push({ id: max_id + 1, title: '', kdBarang:'', description: '', rate: '', quantity: '', amount: '', total: '', pph: 0 });
        // items.value[1].title.focus();
    };
    
    function onlyNumber ($event) {
        //console.log($event.keyCode); //keyCodes value
        let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
        if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
            $event.preventDefault();
        }   
    }
</script>
