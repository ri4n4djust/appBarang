<template>
    <div class="modal fade" id="modalBiaya" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Input Biaya</h5>
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
                                                <label for="inputState">Biaya</label>
                                                <input v-model="inputb.nilaiBiaya" class="form-control form-control-sm" placeholder="Biaya" />
                                            </div>
                                            <div class="col-sm-4">
                                                <label for="inputState">Simpan</label><br>
                                                <a class="btn btn-primary" @click="simpnBiaya">Simpan</a>
                                            </div>
                                        </div>
                                    <!-- </form> -->
                                    <div class="row mb-4">
                                        <div class="col-sm">
                                            <label for="inputState">Keterangan</label>
                                            <!-- <quill-editor v-model="inputb.ketBiaya" :options="options1"> -->

                                                <!-- <div id="toolbar" slot="toolbar">
                                                    <button type="button" data-bs-toggle="tooltip" data-bs-placement="bottom" class="ql-image" title="Upload image"></button>
                                                    <button type="button" data-bs-toggle="tooltip" data-bs-placement="bottom" class="ql-code-block" title="Show code"></button>
                                                </div> -->
                                            <!-- </quill-editor> -->
                                            <textarea class="form-control" v-model="inputb.ketBiaya" rows="4"></textarea>
                                        </div>
                                    </div>

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
                                                    <th role="columnheader" scope="col" aria-colindex="1"><div>Keterangan</div></th>
                                                    <th role="columnheader" scope="col" aria-colindex="2"><div>Tanggal</div></th>
                                                    <th role="columnheader" scope="col" aria-colindex="3"><div>Total</div></th>
                                                    <th role="columnheader" scope="col" aria-colindex="4" class="text-center"><div>Hapus</div></th>
                                                </tr>
                                            </thead>
                                            <tbody role="rowgroup">
                                                <tr v-for="b in cartBiaya" :key="b.ketBiaya" >
                                                    <td aria-colindex="1" role="cell">{{ b.ketBiaya }}</td>
                                                    <td aria-colindex="2" role="cell">{{ b.tglBiaya }}</td>
                                                    <td aria-colindex="3" role="cell">{{ b.nilaiBiaya }}</td>
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

import { quillEditor } from 'vue3-quill';
import 'vue3-quill/lib/vue3-quill.css';


import { computed, ref, onMounted } from 'vue';
import { useStore } from 'vuex';
import { useRouter, useRoute } from 'vue-router'

const store = useStore();
const router = useRouter();
const route = useRoute();


const cartBiaya = ref([]);
const noBiaya = ref([]);
const totalbiaya = ref();


const inputb = ref({
    tglBiaya: moment().format('D-M-YYYY'),
    // notransbiaya: noBiaya,
    // ketBiaya: content1,
    // regu: regu,
})

// const cartKupon = ref([]);


onMounted(() =>{
    // getPelanggan();
    setTimeout(() => {
        getlistb();
    }, 1000)
    // localStorage.setItem('biaya', '[]')
})

const simpnBiaya = async () =>{
    console.log(inputb.value)
    if (localStorage.getItem('biaya')==='[]'){
            // cartKupon.value = [];
        
            // console.log(cartItems.value)
            cartBiaya.value.push(inputb.value);
            localStorage.setItem('biaya', JSON.stringify(cartBiaya.value))
            await store.dispatch('NewBiaya', cartBiaya.value)
            getlistb();
    }else{
            // cartKupon.value = JSON.parse(localStorage.getItem('kupon'))
            
            cartBiaya.value.push(inputb.value);
            localStorage.setItem('biaya',JSON.stringify(cartBiaya.value));
            await store.dispatch('NewBiaya', cartBiaya.value)
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
    const arrayFromStroage = JSON.parse(localStorage.getItem('biaya'));
    const filtered = arrayFromStroage.filter(arrayFromStroage => arrayFromStroage.ketBiaya !== id);
    localStorage.setItem('biaya', JSON.stringify(filtered));
    store.dispatch('NewBiaya', filtered)
    getlistb();
}

const getlistb = () => {
    // await store.dispatch('GetPelanggan')
    cartBiaya.value = JSON.parse(localStorage.getItem('biaya')) || [];
    let sumb = 0;
    cartBiaya.value.forEach(e => {
        sumb +=  Number(e.nilaiBiaya);
        // alert(sum);
    });
    totalbiaya.value = sumb
    console.log(sumb)
}
    

</script>