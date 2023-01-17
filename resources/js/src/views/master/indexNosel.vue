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
                                    <p class="w-stats">Harga  {{ Number(last_price).toLocaleString()}}</p>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="w-detail">
                                    <p class="w-title">Regu {{ regu }}</p>
                                    <select class="form-select form-select-sm" v-model="regu" >
                                        <option value="all" :selected="A">All</option>
                                        <option :value="ls.reguPegawai" v-for="ls in nosels.regu" :key="ls.id_nosel">{{ ls.reguPegawai }}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="w-detail">
                                    <p class="w-title">Tanggal</p>
                                    <flat-pickr v-model="date1" 
                                    :config="{dateFormat: 'Y-m-d'}" 
                                    class="form-control flatpickr active form-control-sm"></flat-pickr>
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
                                <h6> {{ list.nama_nosel }}</h6>
                                <p class="meta-date-time"></p>
                                <a href="javascript:;" class="btn btn-secondary">{{ list.meter_akhir }}</a>
                            </div>
                        </div>
                    </div>
                    <div class="widget-content">
                        <h5>Cost {{ Math.abs(meter_now[index] - list.meter_akhir) }} Liter</h5>
                        <h5>Penjualan {{ new Intl.NumberFormat().format(Math.abs((meter_now[index] - list.meter_akhir) * last_price)) }} </h5>
                        <h3><input type="text" class="form-control" v-model="meter_now[index]" ></h3>
                        <button type="button" class="btn btn-success mb-2 me-1" @click="saveTransBbm(id_nosel=list.id_nosel,newmeter=meter_now[index],costltr=meter_now[index] - list.meter_akhir,jual=(meter_now[index] - list.meter_akhir) * last_price )">Simpan</button>
                    </div>
                    <div class="widget-content">
                        <!-- {{ nosels.trs }} -->
                        <div v-for="lis in nosels.trs" :key="lis.id_nosel">
                            <span v-if="list.id_nosel === lis.r_nosel">
                                <h5>{{ lis.r_nosel }}</h5>
                            </span>
                            
                        </div>
                    </div>
                </div>
            </div>

            
            

        </div>
    </div>
</template>
<script setup>
    import '@/assets/sass/widgets/widgets.scss';

    import flatPickr from 'vue-flatpickr-component';
    import 'flatpickr/dist/flatpickr.css';
    import '@/assets/sass/forms/custom-flatpickr.css';

    import '@/assets/sass/scrollspyNav.scss';
    import '@/assets/sass/components/custom-sweetalert.scss';

    import moment from "moment";

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
    const date1 = ref(moment().format("YYYY-MM-DD"));
    const meter_now = ref({});
    const regu = ref(null);
    // const listtrans = ref([]);

    
    
    
    const nosels = computed(() => {
        const nosel = store.getters.StateNosel;
        const trs = store.getters.STransNosel;
        const regu = store.getters.STransNoselRegu;
        return { nosel, trs, regu }
    });
    


    function saveTransBbm(id_nosel,newmeter,costltr,jual){
        // console.log(regu.value);
        if(regu.value === null){
            // alert(regu.value)
            const toast =  window.Swal.mixin({
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em'
            });
            toast.fire({
                title: 'Error!',
                text: 'Do you want to continue',
                icon: 'error',
                confirmButtonText: 'Cool',
                padding: '2em'
            });
        }else{
            const idbbm = props.id;
            const harga = ref(props.last_price);
            // const tgl = date1.value.substring(0, 10)
            const tgl = moment(date1.value).format("YYYY-MM-DD")
            store.dispatch('CreateTransNosel', {
                'r_bbm': idbbm,
                'r_nosel': id_nosel,
                'r_regu': regu.value,
                'tgl_transaksi': tgl, 
                'cost_ltr': costltr, 
                'last_price': harga.value, 
                'last_meter': newmeter, 
                'total': jual
            })
            getNosel();
            getTrans();
            const toast = window.Swal.mixin({
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em',
            });
            toast.fire({
                icon: 'success',
                title: 'Signed in successfully',
                padding: '2em',
            });
        }
    }
    const getNosel=() => {
        const id = props.id;
        store.dispatch('GetNosel', {'key1': id})
    }
    const getTrans=() => {
        const id = props.id;
        const tgl = moment(date1.value).format("YYYY-MM-DD")
        store.dispatch('GetTransNosel', {'r_bbm': id, 'tgl': tgl})
    }
    const getRegu=() => {
        store.dispatch('GetTransNoselRegu')
    }

    onMounted(() => {
        getNosel();
        getTrans();
        getRegu();

        // function getTransBbm(){
        //     // const bbmnosel = 
            
        // };

    })

   

</script>