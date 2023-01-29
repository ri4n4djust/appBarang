<template>
    <div class="modal fade" id="modalBiaya" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Input Biaya</h5>
                    <button type="button" data-dismiss="modal" data-bs-dismiss="modal" aria-label="Close" class="btn-close"></button>
                </div>
                <div class="modal-body">
                    <!-- <h4 class="modal-heading mb-4 mt-2">Aligned Center</h4> -->
                    
                    <form>
                        <div class="row mb-4">
                            <div class="col-sm">
                                <label for="inputState">Biaya</label>
                                <input v-model="inputb.nilaiBiaya" class="form-control form-control-sm" placeholder="Satuan" />
                            </div>
                            <div class="col-sm-4">
                                <label for="inputState">Simpan</label><br>
                                <a class="btn btn-primary" @click="simpnBiaya">Simpan</a>
                                <input v-model="inputb.kdBiaya" class="form-control" placeholder="Kode" hidden />
                            </div>
                        </div>
                    </form>
                    <!-- <div class="row mb-4">
                        <div class="col-sm-4">
                            <label for="inputState">Tgl</label>
                            <flat-pickr v-model="inputb.tglBiaya" 
                            :config="{dateFormat: 'd-m-Y', static: true}" 
                            class="form-control form-control-sm flatpickr active" placeholder="Due Date">
                            </flat-pickr>
                        </div>
                    </div> -->
                    <div class="row mb-9">
                        <div class="col-sm-12">
                            <label for="inputState">Keterangan</label>
                            <quill-editor v-model="content1" :options="options1">
                                <!-- <div id="toolbar" slot="toolbar">
                                    <button type="button" data-bs-toggle="tooltip" data-bs-placement="bottom" class="ql-bold" title="Bold"></button>
                                    <button type="button" data-bs-toggle="tooltip" data-bs-placement="bottom" class="ql-underline" title="Underline"></button>
                                    <button type="button" data-bs-toggle="tooltip" data-bs-placement="bottom" class="ql-italic" title="Add italic text <cmd+i>"></button>
                                    <button type="button" data-bs-toggle="tooltip" data-bs-placement="bottom" class="ql-image" title="Upload image"></button>
                                    <button type="button" data-bs-toggle="tooltip" data-bs-placement="bottom" class="ql-code-block" title="Show code"></button>
                                </div> -->
                            </quill-editor>
                        </div>
                    </div>

                        
                        
                    
                    

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
                                <tr >
                                    <td aria-colindex="1" role="cell"></td>
                                    <td aria-colindex="2" role="cell"></td>
                                    <td aria-colindex="3" role="cell"></td>
                                    <td aria-colindex="4" role="cell"></td>
                                    
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn" data-dismiss="modal" data-bs-dismiss="modal"><i class="flaticon-cancel-12"></i> Discard</button>
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

const content1 = ref(`
<h1>This is a heading text...</h1>
                                        <br/>
                                        <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dui arcu, pellentesque id mattis sed, mattis semper erat. Etiam commodo arcu a mollis consequat. Curabitur pretium auctor tortor, bibendum placerat elit feugiat et. Ut ac turpis nec dui ullamcorper ornare. Vestibulum finibus quis magna at accumsan. Praesent a purus vitae tortor fringilla tempus vel non purus. Suspendisse eleifend nibh porta dolor ullamcorper laoreet. Ut sit amet ipsum vitae lectus pharetra tincidunt. In ipsum quam, iaculis at erat ut, fermentum efficitur ipsum. Nunc odio diam, fringilla in auctor et, scelerisque at lorem. Sed convallis tempor dolor eu dictum. Cras ornare ornare imperdiet. Pellentesque sagittis lacus non libero fringilla faucibus. Aenean ullamcorper enim et metus vestibulum, eu aliquam nunc placerat. Praesent fringilla dolor sit amet leo pulvinar semper. </p>
                                        <br/>
                                        <p> Curabitur vel tincidunt dui. Duis vestibulum eget velit sit amet aliquet. Curabitur vitae cursus ex. Aliquam pulvinar vulputate ullamcorper. Maecenas luctus in eros et aliquet. Cras auctor luctus nisl a consectetur. Morbi hendrerit nisi nunc, quis egestas nibh consectetur nec. Aliquam vel lorem enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nunc placerat, enim quis varius luctus, enim arcu tincidunt purus, in vulputate tortor mi a tortor. Praesent porta ornare fermentum. Praesent sed ligula at ante tempor posuere a at lorem. </p>
                                        <br/>
                                        <p> Aliquam diam felis, vehicula ut ipsum eu, consectetur tincidunt ipsum. Vestibulum sed metus ac nisi tincidunt mollis sed non urna. Vivamus lacinia ullamcorper interdum. Sed sed erat vel leo venenatis pretium. Sed aliquet sem nunc, ut iaculis dolor consectetur et. Vivamus ligula sapien, maximus nec pellentesque ut, imperdiet at libero. Vivamus semper nulla lectus, id dapibus nulla convallis id. Quisque elementum lectus ac dui gravida, ut molestie nunc convallis. Pellentesque et odio non dolor convallis commodo sit amet a ante. </p>
`);
const options1 = ref({
        modules: {
            toolbar: [[{ header: [1, 2, false] }], ['bold', 'italic', 'underline'], ['image', 'code-block']],
        },
    });

const pelanggans = ref({})
const noBiaya = ref([]);
const kdp = ref([]);

const inputb = ref({
    tglBiaya: moment().format('D-M-YYYY'),
    notransbiaya: noBiaya,
    keterangan: '',
    // regu: regu,
})

// const cartKupon = ref([]);


onMounted(() =>{
    // getPelanggan();
    // getlist();
})

const simpnBiaya = async () =>{
    // localStorage.setItem('kupon', JSON.stringify(inputk.value))
    // await store.dispatch('CreateTransKupon', inputk.value)
    // if (localStorage.getItem('kupon')===null){
    //         // cartKupon.value = [];
    //         // console.log(cartItems.value)
    //         localStorage.setItem('kupon', JSON.stringify(inputk.value))
    //         getlist();
    // }else{
    //         // cartKupon.value = JSON.parse(localStorage.getItem('kupon'))
            
    //         cartKupon.value.push([inputk.value]);
    //         localStorage.setItem('kupon',JSON.stringify(cartKupon.value));
    //         console.log(inputk.value)
    //         getlist();
    // }
    alert('simpan  biaya')
}
    // }
    //     const oldItems = JSON.parse(localStorage.getItem('kupon')) || [];

    //     // console.log(oldItems)
    //     const existingItem = oldItems.find(({ kdPelanggan }) => kdPelanggan === brg.kdPelanggan);
    //     if (existingItem) {
    //         const objIndex = cartKupon.value.findIndex((e => e.kdPelanggan === brg.kdBarang));
    //         const oldName = cartKupon.value[objIndex].nmBarang;
    //         const oldQty = cartKupon.value[objIndex].qty;
    //         const oldTotal = cartKupon.value[objIndex].total;
    //         const newQty = parseInt(oldQty) + parseInt(qty.value) ;
    //         const newTotal = parseInt(oldTotal) + parseInt(qty.value * brg.hrgJual) ;
    //         cartKupon.value[objIndex].qty = parseInt(newQty);
    //         cartKupon.value[objIndex].total = parseInt(newTotal);
    //         localStorage.setItem('kupon',JSON.stringify(cartKupon.value));
    //         alert(oldName+' Quantity Update')
    //         getCart();
    //         // isicart = Object.keys(JSON.parse(localStorage.getItem('cartItemsP'))).length;
    //     }else{
    //     cartItemsPen.value.push({tglKupon:brg.kdBarang, kdp:brg.nmBarang,nilaiKupon:brg.hrgJual});	
    //     localStorage.setItem('cartKupon',JSON.stringify(cartKupon.value));
    //     getCart();
    //     // isicart = Object.keys(JSON.parse(localStorage.getItem('cartItemsP'))).length;
    //     alert(brg.nmBarang+ " berhasil disimpan")
    // }
// }



</script>