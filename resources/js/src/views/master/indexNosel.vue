<template>
    <div class="layout-px-spacing dash_2">
        <teleport to="#breadcrumb">
            <ul class="navbar-nav flex-row">
                <li>
                    <div class="page-header">
                        <nav class="breadcrumb-one" aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item active" aria-current="page"><span>Widgets</span></li>
                            </ol>
                        </nav>
                    </div>
                </li>
            </ul>
        </teleport>

        <div class="row layout-top-spacing">
            
            <div class="col-md-12 layout-spacing">
                <div class="widget widget-statistics">
                    <div class="widget-heading">
                        <h5>Statistics</h5>
                        
                    </div>
                    <div class="widget-content">
                        <div class="row">
                            <div class="col-6">
                                <div class="w-detail">
                                    <p class="w-title">{{ nama_bbm  }}</p>
                                    <p class="w-stats">Harga {{ last_price }}</p>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="w-detail">
                                    <p class="w-title">Paid Visits</p>
                                    <p class="w-stats">7,929</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-5 layout-spacing" v-for="list, index in nosels.nosel" :key="list.id_nosel">
                <div class="widget widget-card-two">
                    <div class="widget-heading">
                        <div class="media">
                            <div class="media-aside align-self-start">
                                <div class="w-img">
                                    <img src="@/assets/images/nosel.jpg" alt="img-fluid" />
                                </div>
                            </div>
                            <div class="media-body">
                                <h6>{{ nama_bbm  }} Nozzel : {{ list.nama_nosel }}</h6>
                                <p class="meta-date-time"></p>
                                <a href="javascript:;" class="btn btn-secondary">{{ list.meter_akhir }}</a>
                            </div>
                        </div>
                    </div>
                    <div class="widget-content">
                        <h5>Cost Liter</h5>
                        <h5>Penjualan</h5>
                        <input v-model="meter_now">
                    </div>
                </div>
            </div>

            {{nosels.nosel}}

        </div>
    </div>
</template>
<script setup>
    import '@/assets/sass/widgets/widgets.scss';
    import { computed, ref, onMounted } from 'vue';
    import { useStore } from 'vuex';
    import { useRouter, useRoute } from 'vue-router'

    import { useMeta } from '@/composables/use-meta';
    useMeta({ title: 'Widgets' });

    const store = useStore();
    const router = useRouter();
    const route = useRoute();

    const props = defineProps({
    id: String,
    nama_bbm: String,
    last_meter: String,
    last_price: String,
    })
    
    // console.log(props.id);

    

    // onMounted(() => {
    //     const id = route.params.location
    //     console.log('data yg dikirim :  '+JSON.stringify(id))
      
    // })
    const nosels = computed(() => {
        const nosel = store.getters.StateNosel;
        return { nosel }
    });
    onMounted(() => {
        function getNosel(){
            const id = props.id ;
            store.dispatch('GetNosel', {'key1': id})
        }
        getNosel();
    })

   

</script>