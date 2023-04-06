<template>
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Input Kupon</h5>
                    <button type="button" data-dismiss="modal" data-bs-dismiss="modal" aria-label="Close" class="btn-close"></button>
                </div>
                <div class="modal-body">
                    <!-- <h4 class="modal-heading mb-4 mt-2">Aligned Center</h4> -->
                    <!-- <form> -->
                        <!-- <div class="row mb-4">
                            <div class="col-sm-4">
                                <label for="inputState">Tgl</label>
                                <flat-pickr v-model="inputk.tglKupon" 
                                :config="{dateFormat: 'd-m-Y', static: true}" 
                                class="form-control form-control-sm flatpickr active" placeholder="Due Date">
                                </flat-pickr>
                            </div>
                        </div> -->
                        <div class="row mb-4">
                            <div class="col-sm">
                                <label for="inputState">Nama Pelanggan</label>
                                <!-- <multiselect 
                                    v-model="inputk.kdpelanggan" 
                                    :options="kupon.pelanggans" 
                                    :searchable="true"
                                    :allow-empty="false"
                                    track-by="nmPelanggan"
                                    label="nmPelanggan"
                                    open-direction="top"
                                    placeholder="Choose..." 
                                    selected-label="" 
                                    select-label="" 
                                    deselect-label="">
                                </multiselect> -->
                                <select class="form-select form-select-sm" v-model="inputk.kdp" >
                                    <option :value="ls.kdPelanggan" v-for="ls in kupon.pelanggans" :key="ls.id">{{ ls.nmPelanggan }}</option>
                                </select>
                            </div>
                            <div class="col-sm">
                                <label for="inputState">Nilai Kupon</label>
                                <input v-model="inputk.nilaiKupon" class="form-control form-control-sm" placeholder="Nilai" @keypress="onlyNumber" />
                            </div>
                            <div class="col-sm-4">
                                <label for="inputState">Simpan</label><br>
                                <a class="btn btn-primary" @click="simpnKupon">Simpan</a>
                                <input v-model="inputk.kdkupon" class="form-control" placeholder="Kode" hidden />
                            </div>
                        </div>
                        
                    <!-- </form> -->

                    <div class="table-responsive">
                        <table role="table" aria-busy="false" aria-colcount="5" class="table table-bordered" id="__BVID__415">
                            <thead role="rowgroup">
                                <tr role="row">
                                    <th role="columnheader" scope="col" aria-colindex="1"><div>Name</div></th>
                                    <th role="columnheader" scope="col" aria-colindex="2"><div>Date</div></th>
                                    <th role="columnheader" scope="col" aria-colindex="3"><div>Total</div></th>
                                    <th role="columnheader" scope="col" aria-colindex="4" class="text-center"><div>Hapus</div></th>
                                </tr>
                            </thead>
                            <tbody role="rowgroup">
                                <tr v-for="kp in cartKupon" :key="kp.kdp">
                                    <td aria-colindex="1" role="cell">{{ kp.kdp }}</td>
                                    <td aria-colindex="2" role="cell">{{ kp.tglKupon }}</td>
                                    <td aria-colindex="3" role="cell">{{ Number(kp.nilaiKupon).toLocaleString() }}</td>
                                    <td aria-colindex="4" role="cell">
                                        <button type="button" class="btn btn-secondary additem btn-sm" @click="removeItem(id=kp.kdp)">Hapus</button>
                                    </td>
                                    
                                </tr>
                            </tbody>
                            <tfoot role="rowgroup">
                                <tr role="row">
                                    <th role="columnheader" scope="col" aria-colindex="1"><div>Name</div></th>
                                    <th role="columnheader" scope="col" aria-colindex="2"><div>Total</div></th>
                                    <th role="columnheader" scope="col" aria-colindex="3"><div>{{ Number(total).toLocaleString() }}</div></th>
                                    <th role="columnheader" scope="col" aria-colindex="4" class="text-center"></th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>

                </div>
                <div class="modal-footer">
                    <!-- <button type="button" class="btn" data-dismiss="modal" data-bs-dismiss="modal"><i class="flaticon-cancel-12"></i> Discard</button> -->
                    <!-- <button type="button" class="btn btn-primary">Save</button> -->
                </div>
            </div>
        </div>
    </div>
</template>
<script setup>

import moment from "moment";

 //flatpickr
 import flatPickr from 'vue-flatpickr-component';
import 'flatpickr/dist/flatpickr.css';
import '@/assets/sass/forms/custom-flatpickr.css';

import Multiselect from '@suadelabs/vue3-multiselect';
import '@suadelabs/vue3-multiselect/dist/vue3-multiselect.css';

import { computed, ref, onMounted, onBeforeMount } from 'vue';
import { useStore } from 'vuex';
import { useRouter, useRoute } from 'vue-router'
import { async } from "q";

const store = useStore();
const router = useRouter();
const route = useRoute();

const pelanggans = ref({})
const noKupon = ref([]);
const kdp = ref([]);
const total = ref([]);

const inputk = ref({
    tglKupon: moment().format('D-M-YYYY'),
    // notranskupon: noKupon,
    // kdp: kdp,
    // nilaiKupon: 
    // regu: regu,
})

const cartKupon = ref([]);

const kupon = computed(() => {
        // const listkupon = store.getters.StateBarang;
        const pelanggans = store.getters.StatePelanggan;
        // const accs = store.getters.StateAcc;
        noKupon.value = store.getters.NoTransKupon;
        // tot.value = brg.value.hrgJual * qty.value;
        // const pajak = ref(store.state.pajak);
        // console.log(suppliers)
        return { pelanggans, noKupon }
    });

onMounted(() =>{
    // console.log( cartKupon.value)
    getPelanggan();
    
    setTimeout(() => {
        getlist();
    }, 1000)
    // localStorage.setItem('kupon', '[]')


})

onBeforeMount(() =>{
    // getlist();
})

const simpnKupon = async () =>{
    // console.log(inputk.value)
    if (localStorage.getItem('kupon')=== '[]' ){
            
            // cartKupon.value = [inputk.value];
            cartKupon.value.push(inputk.value);
            localStorage.setItem('kupon', JSON.stringify(cartKupon.value))
            await store.dispatch('NewKupon', cartKupon.value)
            getlist();
            reset_input();
    }else{
            // cartKupon.value = JSON.parse(localStorage.getItem('kupon'))
            
            cartKupon.value.push(inputk.value);
            localStorage.setItem('kupon',JSON.stringify(cartKupon.value));
            await store.dispatch('NewKupon', cartKupon.value)
            // console.log(inputk.value)
            getlist();
            reset_input();
    }
    
    
}
const reset_input = () => {
    inputk.value = {
        tglKupon: moment().format('D-M-YYYY')
    };
    getPelanggan();
}
const removeItem = (id) =>{
    const arrayFromStroage = JSON.parse(localStorage.getItem('kupon'));
    const filtered = arrayFromStroage.filter(arrayFromStroage => arrayFromStroage.kdp !== id);
    localStorage.setItem('kupon', JSON.stringify(filtered));
    store.dispatch('NewKupon', filtered)
    getlist();
}
    

const getlist = async () => {
    // await store.dispatch('GetPelanggan')
    cartKupon.value = JSON.parse(localStorage.getItem('kupon'));
    let sum = 0;
    cartKupon.value.forEach(element => {
        sum +=  parseInt(Number(element.nilaiKupon));
        // alert(sum);
    });
    total.value = sum
}

const getPelanggan = async () => {
    await store.dispatch('GetPelanggan')
    pelanggans.value = store.getters.StatePelanggan;
}

function onlyNumber ($event) {
    //console.log($event.keyCode); //keyCodes value
    let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
    if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
        $event.preventDefault();
    }   
}

</script>