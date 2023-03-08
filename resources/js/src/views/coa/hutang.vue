<template>
    <div class="layout-px-spacing dash_2">
        <teleport to="#breadcrumb">
            <ul class="navbar-nav flex-row">
                <li>
                    <div class="page-header">
                        <nav class="breadcrumb-one" aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:;">Dashboard</a></li>
                                <li class="breadcrumb-item active" aria-current="page"><span>Sales</span></li>
                            </ol>
                        </nav>
                    </div>
                </li>
            </ul>
        </teleport>

        

        <div class="row layout-top-spacing">

            <div class="doc-container">
                <div class="row">
                    <div class="col-xl-9">
                        <div id="tableSimple" class="col-lg-12 col-12 layout-spacing">
                            <div class="statbox panel box box-shadow">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                                            <h4>Hutang</h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <!-- <div class="table-responsive"> -->
                                        
                                        <table>
                                            <tbody  v-for="hrt in hartalist" :key="hrt.acc_id" :set="amount = hrt.amount">
                                                
                                                    <tr v-if="hrt.level === '1'" >
                                                        <td v-if="hrt.jenis != 'Total'" style="min-width:70px">{{ hrt.acc_id }}</td>
                                                        <td v-else></td>
                                                        <td v-if="hrt.jenis === 'Total' || hrt.jenis.substring(0,1) === 'H'" style="min-width: 400px;" ><b>&nbsp;&nbsp;{{ hrt.name }}</b></td>
                                                        <td v-else style="min-width: 400px;">&nbsp;&nbsp;{{ hrt.name }}</td>
                                                        <td></td>
                                                        <td></td>
                                                        <td v-if="hrt.jenis === 'Total'" style="border-top: 1px solid black"></td>
                                                        <td v-else></td>
                                                        <td v-if="hrt.jenis === 'Detail'">
                                                            <!-- <div v-if="hrt.acc_id.substring(0,1) === '2'|| hrt.acc_id.substring(0,1) === '2'">  -->
                                                                {{ Number(amount).toLocaleString() }}
                                                            <!-- </div> -->
                                                            <!-- <div>{{ Number(amount).toLocaleString() }}</div> -->
                                                            
                                                        </td>
                                                        <td v-else-if="hrt.jenis === 'Total'"><b>{{ Number(amount).toLocaleString() }}</b></td>
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
                                                        <td v-if="hrt.jenis === 'Detail'">{{ Number(amount).toLocaleString() }}</td>
                                                        <td v-else-if="hrt.jenis === 'Total'">{{ Number(amount).toLocaleString() }}</td>
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
                                                        <td v-if="hrt.jenis === 'Detail'">{{ Number(amount).toLocaleString() }}</td>
                                                        <td v-else-if="hrt.jenis === 'Total'">{{ Number(amount).toLocaleString() }}</td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr v-if="hrt.level === '4'">
                                                        <td>{{ hrt.acc_id }}</td>
                                                        <td style="min-width: 300px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{ hrt.name }}</td>
                                                        <td>{{ Number(amount).toLocaleString() }}</td>
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
                    <div class="col-xl-3">
                        <div class="invoice-actions-btn">
                            <div class="invoice-action-btn">
                                <div class="row">
                                    
                                    <div class="col-xl-12 col-md-3 col-sm-6">
                                        <a href="javascript:;" class="btn btn-secondary btn-print action-print" @click="print()">Print</a>
                                    </div>
                                    <div class="col-xl-12 col-md-3 col-sm-6">
                                        <a href="javascript:;" class="btn btn-primary btn-send">Send Invoice</a>
                                    </div>
                                    <div class="col-xl-12 col-md-3 col-sm-6">
                                        <a href="javascript:;" class="btn btn-success btn-download">Download</a>
                                    </div>
                                    <div class="col-xl-12 col-md-3 col-sm-6">
                                        <router-link to="/apps/invoice/edit" class="btn btn-dark btn-edit">Edit</router-link>
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
    import '@/assets/sass/apps/invoice-preview.scss';
    import { computed, ref, onMounted, reactive } from 'vue';
    import { useStore } from 'vuex';
    import { useRouter, useRoute } from 'vue-router'

    import moment from "moment";

    import { useMeta } from '@/composables/use-meta';
    useMeta({ title: 'BBM' });

    
    const store = useStore();
    const router = useRouter();
    const route = useRoute();


    // const modalRef = ref(null);
    // const openModal = () => Modal.getInstance(modalRef.value)?.show();
    const hartalist = ref();
    onMounted(() => {
        const harta = ref({
            group: '2'
        });
        store.dispatch('GetHarta', harta.value);
        // hartalist.value = store.getters.StateHarta;
        setTimeout(function() { 
            // store.dispatch('GetCoaList')
            hartalist.value = store.getters.StateHarta;
        }, 3000);
       
    })
    
</script>
