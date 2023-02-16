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
                                <h4>Simple Table</h4>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table role="table" aria-busy="false" aria-colcount="5" class="table table-bordered" >
                                <thead role="rowgroup">
                                    <tr role="row">
                                        <th role="columnheader" scope="col" aria-colindex="2"><div>Code</div></th>
                                        <th role="columnheader" scope="col" aria-colindex="3"><div>Name</div></th>
                                        <th role="columnheader" scope="col" aria-colindex="4" class="text-center"><div>status</div></th>
                                    </tr>
                                </thead>
                                <tbody role="rowgroup" v-for="lv1 in users.lv1" :key="lv1.id">
                                    <div style="width:100%">
                                        <tr role="row" >
                                            <td aria-colindex="2" role="cell">
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
                                                    class="feather feather-trash-2 icon"
                                                >
                                                    <polyline points="3 6 5 6 21 6"></polyline>
                                                    <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                                    <line x1="10" y1="11" x2="10" y2="17"></line>
                                                    <line x1="14" y1="11" x2="14" y2="17"></line>
                                                </svg>
                                                {{lv1.acc_id}}
                                            </td>
                                            <td>{{lv1.name}}</td>
                                            <td aria-colindex="3" role="cell">
                                                    
                                            </td>
                                            <td aria-colindex="4" role="cell">0</td>
                                        </tr>
                                    </div>
                                    <div v-for="lv2 in users.lv2" :key="lv2.id">
                                        <tr role="row" v-if="lv1.acc_id === lv2.parent" >
                                            <td aria-colindex="2" role="cell">
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
                                                    class="feather feather-trash-2 icon"
                                                >
                                                    <polyline points="3 6 5 6 21 6"></polyline>
                                                    <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                                    <line x1="10" y1="11" x2="10" y2="17"></line>
                                                    <line x1="14" y1="11" x2="14" y2="17"></line>
                                                </svg>
                                                {{lv2.acc_id}}
                                            </td>
                                            <td></td>
                                            <td aria-colindex="3" role="cell">{{ lv2.acc_id }}{{ lv2.name }}</td>
                                            <td aria-colindex="4" role="cell">0</td>
                                            <td >0</td>
                                        </tr>
                                    </div>
                                    <div v-for="lv3 in users.lv3" :key="lv3.id">
                                        <tr role="row" v-if="lv2.acc_id === lv3.parent" >
                                            <td aria-colindex="2" role="cell">
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
                                                    class="feather feather-trash-2 icon"
                                                >
                                                    <polyline points="3 6 5 6 21 6"></polyline>
                                                    <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                                    <line x1="10" y1="11" x2="10" y2="17"></line>
                                                    <line x1="14" y1="11" x2="14" y2="17"></line>
                                                </svg>
                                                {{lv3.acc_id}}
                                            </td>
                                            <td></td>
                                            <td aria-colindex="3" role="cell">{{ lv3.acc_id }}{{ lv3.name }}</td>
                                            <td aria-colindex="4" role="cell">0</td>
                                            <td >0</td>
                                        </tr>
                                    </div>
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

    function Simpan() {
        // console.log(input_perubahan.value)
        store.dispatch('UpdateHargaBbm', input_perubahan.value)
        isOpen.value = false;
    }
    // BBM
    const users = computed(() => {
        const bbm = store.getters.StateBbm;
        const lv1 = coalist.value.level1;
        const lv2 = coalist.value.level2;
        return { users, bbm, lv1, lv2 }
    });

    // const modalRef = ref(null);
    // const openModal = () => Modal.getInstance(modalRef.value)?.show();
    const coalist = ref({});
    onMounted(() => {
        
        store.dispatch('GetCoaList')
        // coalist.value = store.getters.StateCoaList;
        setTimeout(function() { 
            // store.dispatch('GetCoaList')
            coalist.value = store.getters.StateCoaList;
        }, 5000);
       
    })
    
</script>
