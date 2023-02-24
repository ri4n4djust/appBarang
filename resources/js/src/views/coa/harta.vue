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
            <div id="tableSimple" class="col-lg-12 col-12 layout-spacing">
                <div class="statbox panel box box-shadow">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                                <h4>Harta</h4>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            
                            <table border="1px">
                                <tbody  v-for="hrt in hartalist" :key="hrt.acc_id">

                                    <tr v-if="hrt.level === '1'">
                                        <td v-if="hrt.jenis != 'Total'">{{ hrt.acc_id }}</td>
                                        <td v-if="hrt.jenis === 'Total' || hrt.jenis.substring(0,1) === 'H'"><b>&nbsp;&nbsp;{{ hrt.name }}</b></td>
                                        <td v-else>&nbsp;&nbsp;{{ hrt.name }}</td>
                                        <td></td>
                                        <td></td>
                                        <td v-if="hrt.jenis === 'Total'"></td>
                                        <td  v-else></td>
                                        <td v-if="hrt.jenis === 'Detail'">{{ hrt.amount }}</td>
                                        <td v-else-if="hrt.jenis === 'Total'">{{ hrt.amount }}</td>
                                        <td v-else></td>
                                    </tr>
                                    <tr v-if="hrt.level === '2'">
                                        <td v-if="hrt.jenis != 'Total'">{{ hrt.acc_id }}</td>
                                        <td v-if="hrt.jenis === 'Total' || hrt.jenis.substring(0,1) === 'H'"><b>&nbsp;&nbsp;&nbsp;&nbsp;{{ hrt.name }}</b></td>
                                        <td v-else>&nbsp;&nbsp;&nbsp;&nbsp;{{ hrt.name }}</td>
                                        <td></td>
                                        <td v-if="hrt.jenis === 'Total'"></td>
                                        <td v-else></td>
                                        <td v-if="hrt.jenis === 'Detail'">{{ hrt.amount }}</td>
                                        <td v-else-if="hrt.jenis === 'Total'">{{ hrt.amount }}</td>
                                        <td v-else></td>
                                    </tr>
                                    <tr v-if="hrt.level === '3'">
                                        <td v-if="hrt.jenis != 'Total'">{{ hrt.acc_id }}</td>
                                        <td v-if="hrt.jenis === 'Total' || hrt.jenis.substring(0,1) === 'H'"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{ hrt.name }}</b></td>
                                        <td v-else>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{ hrt.name }}</td>
                                        <td v-if="hrt.jenis === 'Total'"></td>
                                        <td  v-else></td>
                                        <td>{{ hrt.amount }}</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr v-if="hrt.level === '4'">
                                        <td>{{ hrt.acc_id }}</td>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{ hrt.name }}</td>
                                        <td>{{ hrt.amount }}</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</template>

<script setup>
    import '@/assets/sass/widgets/widgets.scss';
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
            group: '1'
        });
        store.dispatch('GetHarta', harta.value);
        // hartalist.value = store.getters.StateHarta;
        setTimeout(function() { 
            // store.dispatch('GetCoaList')
            hartalist.value = store.getters.StateHarta;
        }, 5000);
       
    })
    
</script>
