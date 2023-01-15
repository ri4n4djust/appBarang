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
                            <div class="col-4">
                                <div class="w-detail">
                                    <p class="w-title">{{ nama_bbm  }}</p>
                                    <p class="w-stats">Harga {{ last_price }}</p>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="w-detail">
                                    <p class="w-title">Paid Visits</p>
                                    <p class="w-stats">7,929</p>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="w-detail">
                                    <flat-pickr v-model="date1" 
                                    :config="{dateFormat: 'Y-m-d'}" 
                                    class="form-control flatpickr active"></flat-pickr>
                                    TIME
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4 layout-spacing" v-for="list, index in nosels.nosel" :key="list.id_nosel">
                <div class="widget widget-card-two">
                    <div class="widget-heading">
                        <div class="media">
                            <div class="media-aside align-self-start">
                                <div class="w-img">
                                    <img src="@/assets/images/nosel.jpg" alt="img-fluid" />
                                </div>
                            </div>
                            <div class="media-body">
                                <h6>{{ nama_bbm  }} {{ list.nama_nosel }}</h6>
                                <p class="meta-date-time"></p>
                                <a href="javascript:;" class="btn btn-secondary">{{ list.meter_akhir }}</a>
                            </div>
                        </div>
                    </div>
                    <div class="widget-content">
                        <h5>Cost {{ meter_now[index] - list.meter_akhir}} Liter</h5>
                        <h5>Penjualan {{ (meter_now[index] - list.meter_akhir) * last_price }} </h5>
                        <h3><input v-model="meter_now[index]" required ></h3>
                        <button type="button" class="btn btn-success mb-2 me-1" @click="saveTransBbm(id_nosel=list.id_nosel, oldmeter=list.meter_akhir, newmeter=meter_now[index],costltr=meter_now[index] - list.meter_akhir,jual=(meter_now[index] - list.meter_akhir) * last_price )">Simpan</button>
                    </div>
                    <div class="widget-content">
                        hjghjgjhgj
                    </div>
                </div>
            </div>

            <!-- {{nosels.nosel}} -->

        </div>
    </div>
</template>
<script setup>
    import '@/assets/sass/widgets/widgets.scss';

    import flatPickr from 'vue-flatpickr-component';
    import 'flatpickr/dist/flatpickr.css';
    import '@/assets/sass/forms/custom-flatpickr.css';

    import { computed, ref, onMounted } from 'vue';
    import { useStore } from 'vuex';
    import { useRouter, useRoute } from 'vue-router'

    import { useMeta } from '@/composables/use-meta';
    // import index from 'vue3-json-excel';
    useMeta({ title: 'Detail Nozzel' });

    const store = useStore();
    const router = useRouter();
    const route = useRoute();

    const props = defineProps({
    id: String,
    nama_bbm: String,
    last_meter: String,
    last_price: String,
    });
    const date1 = ref(new Date());
    const meter_now = ref({});
    const list = ref({});
    
    
    
    const nosels = computed(() => {
        const nosel = store.getters.StateNosel;
        return { nosel }
    });


    function saveTransBbm(id_nosel,oldmeter,newmeter,costltr,jual){
        const idbbm = props.id;
        const harga = ref(props.last_price);
        const tgl = new Date(date1.value).toISOString().slice(0,10);
        store.dispatch('CreateTransNosel', {
            'r_bbm': idbbm,
            'r_nosel': id_nosel,
            'tgl_transaksi': tgl, 
            'cost_ltr': costltr, 
            'last_price': harga.value, 
            'last_meter': newmeter, 
            'total': jual
        })
        // console.log(idbbm+'='+oldmeter+'='+newmeter+'='+costltr+'='+jual)
    }

    onMounted(() => {
        function getNosel(){
            const id = props.id;
            store.dispatch('GetNosel', {'key1': id})
        }
        getNosel();

        // function getTransBbm(){
        //     // const bbmnosel = 
            
        // };

    })

   

</script>