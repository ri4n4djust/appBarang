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
