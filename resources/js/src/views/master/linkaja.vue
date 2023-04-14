<template>
    <div class="modal fade" id="modalLinkAja" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Input Pembayaran Link Aja</h5>
                    <button type="button" data-dismiss="modal" data-bs-dismiss="modal" aria-label="Close" class="btn-close"></button>
                </div>
                <div class="modal-body">
                    <div class="layout-px-spacing">    
                        <!-- <h4 class="modal-heading mb-4 mt-2">Aligned Center</h4> -->
                        <div class="row layout-top-spacing">
                            <div class="col-xl-12 col-lg-12 col-sm-12 layout-spacing">

                                <div class="panel br-6 p-0">    
                                    <!-- <form> -->
                                        <div class="row mb-4">
                                            <div class="col-sm">
                                            <label for="inputState">BBM</label>
                                                <select class="form-select form-select-sm" v-model="inputl.kdbm" >
                                                    <option :value="ls.nama_bbm" v-for="ls in link.bbms" :key="ls.id">{{ ls.nama_bbm }}</option>
                                                </select>
                                            </div>
                                            <div class="col-sm">
                                                <label for="inputState">Jumlah</label>
                                                <input v-model="inputl.nilaiLink" class="form-control form-control-sm" placeholder="Jumlah" @keypress="onlyNumber"  />
                                            </div>
                                            <div class="col-sm-4">
                                                <label for="inputState">Simpan</label><br>
                                                <a class="btn btn-primary" @click="simpnLink">Simpan</a>
                                            </div>
                                        </div>
                                    <!-- </form> -->
                                   

                                </div>
                            </div>
                        </div>

                        <div class="row layout-top-spacing">
                            <div class="col-xl-12 col-lg-12 col-sm-12 layout-spacing">

                                <div class="panel br-6 p-0">    
                                    <div class="table-responsive">
                                        <table role="table" aria-busy="false" aria-colcount="5" class="table table-bordered">
                                            <thead role="rowgroup">
                                                <tr role="row">
                                                    <th role="columnheader" scope="col" aria-colindex="1"><div>BBM</div></th>
                                                    <th role="columnheader" scope="col" aria-colindex="2"><div>Tanggal</div></th>
                                                    <th role="columnheader" scope="col" aria-colindex="3"><div>Jumlah</div></th>
                                                    <th role="columnheader" scope="col" aria-colindex="4" class="text-center"><div>Hapus</div></th>
                                                </tr>
                                            </thead>
                                            <tbody role="rowgroup">
                                                <tr v-for="b in cartLink" :key="b.id" >
                                                    <td aria-colindex="1" role="cell">{{ b.kdbm }}</td>
                                                    <td aria-colindex="2" role="cell">{{ b.tglLink }}</td>
                                                    <td aria-colindex="3" role="cell">{{ b.nilaiLink }}</td>
                                                    <td aria-colindex="4" role="cell">
                                                        <button type="button" class="btn btn-secondary additem btn-sm" @click="removeBiaya(id=b.ketBiaya)">Hapus</button>
                                                    </td>
                                                    
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>

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

import { computed, ref, onMounted } from 'vue';
import { useStore } from 'vuex';
import { useRouter, useRoute } from 'vue-router'

const store = useStore();
const router = useRouter();
const route = useRoute();

const cartLink = ref([]);
const cartBbm = ref([]);
const bbm = ref([]);
const totallink = ref();


const inputl = ref({
    tglLink: moment().format('D-M-YYYY'),
    // notransbiaya: noBiaya,
    // ketBiaya: content1,
    // regu: regu,
})

// const cartKupon = ref([]);
const link = computed(() => {
        // const listkupon = store.getters.StateBarang;
        const bbms = store.getters.StateBbm;
        return { bbms }
    });

onMounted(() =>{
    // getPelanggan();
    getBbm();
    localStorage.setItem('link', '[]')
})

const getBbm = async () => {
    await store.dispatch('GetBbm')
    bbm.value = store.getters.StateBbm;
}

const simpnLink = async () =>{
    console.log(inputl.value)
    if (localStorage.getItem('link')==='[]'){
            // cartKupon.value = [];
        
            // console.log(cartItems.value)
            cartLink.value.push(inputl.value);
            localStorage.setItem('link', JSON.stringify(cartLink.value))
            await store.dispatch('NewLink', cartLink.value)
            getlistb();
    }else{
            // cartKupon.value = JSON.parse(localStorage.getItem('kupon'))
            
            cartLink.value.push(inputl.value);
            localStorage.setItem('link',JSON.stringify(cartLink.value));
            await store.dispatch('NewLink', cartLink.value)
            // console.log(inputk.value)
            getlistb();
    }
    // inputb.value = {
    //     ketBiaya: '',
    //     nilaiBiaya: ''
    // }
    // alert('simpan  biaya')
}

const removeBiaya = (id) =>{
    const arrayFromStroage = JSON.parse(localStorage.getItem('link'));
    const filtered = arrayFromStroage.filter(arrayFromStroage => arrayFromStroage.ketBiaya !== id);
    localStorage.setItem('link', JSON.stringify(filtered));
    store.dispatch('NewLink', filtered)
    getlistb();
}

const getlistb = () => {
    // await store.dispatch('GetPelanggan')
    cartLink.value = JSON.parse(localStorage.getItem('link')) || [];
    let suml = 0;
    cartLink.value.forEach(e => {
        suml +=  Number(e.nilaiLink);
        // alert(sum);
    });
    totallink.value = suml
    console.log(suml)
}

function onlyNumber ($event) {
    //console.log($event.keyCode); //keyCodes value
    let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
    if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
        $event.preventDefault();
    }   
}
    

</script>