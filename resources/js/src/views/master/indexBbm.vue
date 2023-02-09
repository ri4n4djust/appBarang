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

            <ul class="navbar-nav flex-row ms-auto">
                <li class="nav-item more-dropdown">
                    <div class="dropdown custom-dropdown-icon">
                        <a href="javascript:;" class="nav-link dropdown-toggle" id="ddlSettings" data-bs-toggle="dropdown" aria-expanded="false">
                            <span>Settings</span>
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
                                class="feather feather-chevron-down"
                            >
                                <polyline points="6 9 12 15 18 9"></polyline>
                            </svg>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="ddlSettings">
                            <li><a class="dropdown-item" data-value="Settings" href="javascript:void(0);">Settings</a></li>
                            <li><a class="dropdown-item" data-value="Mail" href="javascript:void(0);">Mail</a></li>
                            <li><a class="dropdown-item" data-value="Print" href="javascript:void(0);">Print</a></li>
                            <li><a class="dropdown-item" data-value="Download" href="javascript:void(0);">Download</a></li>
                            <li><a class="dropdown-item" data-value="Share" href="javascript:void(0);">Share</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </teleport>

        

        <div class="row layout-top-spacing">

        <!-- <div class="col-md-4 layout-spacing">
            <div class="widget widget-wallet-balance">
                <div class="widget-heading d-block">
                    <div class="wallet-usr-info">
                        <div class="usr-name">
                            <span><img src="@/assets/images/profile-32.jpeg" alt="admin-profile" class="img-fluid" /> Alan Green</span>
                        </div>
                        <div class="add">
                            <span
                                ><svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="24"
                                    height="24"
                                    viewBox="0 0 24 24"
                                    fill="none"
                                    stroke="currentColor"
                                    stroke-width="2"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    class="feather feather-plus"
                                >
                                    <line x1="12" y1="5" x2="12" y2="19"></line>
                                    <line x1="5" y1="12" x2="19" y2="12"></line></svg
                            ></span>
                        </div>
                    </div>
                    <div class="wallet-balance">
                        <p>Wallet Balance</p>
                        <h5><span class="w-currency">$</span>2953</h5>
                    </div>
                </div>

                <div class="widget-amount">
                    <div class="w-a-info funds-received me-3">
                        <span
                            >Received
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="18"
                                height="18"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                class="feather feather-chevron-up text-success float-end"
                            >
                                <polyline points="18 15 12 9 6 15"></polyline></svg
                        ></span>
                        <p>$97.99</p>
                    </div>
                    <div class="w-a-info funds-spent">
                        <span
                            >Spent
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="18"
                                height="18"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                class="feather feather-chevron-down text-danger float-end"
                            >
                                <polyline points="6 9 12 15 18 9"></polyline></svg
                        ></span>
                        <p>$53.00</p>
                    </div>
                </div>

                <div class="widget-content">
                    <div class="bills-stats mb-4">
                        <span>Pending</span>
                    </div>
                    <div class="invoice-list">
                        <div class="inv-detail mb-4">
                            <div class="info-detail-1">
                                <p>Netflix</p>
                                <p><span class="w-currency">$</span> <span class="bill-amount">13.85</span></p>
                            </div>
                            <div class="info-detail-2">
                                <p>BlueHost VPN</p>
                                <p><span class="w-currency">$</span> <span class="bill-amount">15.66</span></p>
                            </div>
                        </div>
                        <div class="inv-action">
                            <a href="javascript:;" class="btn view-details btn-outline-secondary">View Details</a>
                            <a href="javascript:;" class="btn pay-now btn-outline-success">Pay Now $29.51</a>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->

        

        <div v-for="list in users.bbm" :key="list.id" class="col-md-4 layout-spacing"  >
            <router-link :to="{ name: 'nosel', params: { id: list.id, nama_bbm: list.nama_bbm,last_meter: list.last_meter,last_price: list.last_price } }"></router-link>
                <div class="widget widget-wallet-balance">
                    <div class="widget-heading d-block">
                        <div class="wallet-balance">
                            <p>{{ list.nama_bbm }}</p>
                            <!-- <h5><span class="w-currency">$</span>2953</h5> -->
                            <button class="btn btn-primary mb-2 me-1" @click="openModal(list)">PERUBAHAN HARGA</button>
                        </div>
                    </div>

                    <div class="widget-amount">
                        <div class="w-a-info funds-spent">
                            <span>Harga Terakhir</span>
                            <p>{{ new Intl.NumberFormat().format(list.sale_price)  }}</p>
                        </div>
                    </div>
                    <div class="widget-content">
                        <div class="invoice-list">
                            
                            <span><img :src="require(`@/assets/images/${list.logo_bbm}`)" alt="admin-profile" class="img-fluid"/></span>
                            
                        </div>
                    </div>
                </div>

                
            
        </div>
        
        <vue-final-modal v-model="isOpen">
            <!-- <div class="modal fade" id="modal_demo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
                <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Input Kupon</h5>
                            <button type="button" data-dismiss="modal" data-bs-dismiss="modal" aria-label="Close" class="btn-close"></button>
                        </div>
                        <div class="modal-body">
                            <h4 class="modal-heading mb-4 mt-2">Aligned Center</h4>
                            <form>
                                <div class="row mb-4">
                                    <div class="col-sm-4">
                                        <label for="inputState">Tgl</label>
                                        <flat-pickr v-model="input_perubahan.tglPerubahan" 
                                        :config="{dateFormat: 'd-m-Y', static: true}" 
                                        class="form-control form-control-sm flatpickr active" placeholder="Due Date">
                                        </flat-pickr>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col-sm">
                                        <label for="inputState">Harga Terbaru</label>
                                        <input v-model="input_perubahan.harga_baru" class="form-control form-control-sm" placeholder="Nilai" @keypress="onlyNumber" />
                                    </div>
                                    <div class="col-sm-4">
                                        <label for="inputState">Simpan</label><br>
                                        <a class="btn btn-primary" @click="Simpan">Simpan</a>
                                        <!-- <input v-model="code" class="form-control" placeholder="Kode"  /> -->
                                    </div>
                                </div>
                                
                            </form>

                            

                        </div>
                        <div class="modal-footer">
                            <!-- <button type="button" class="btn" data-dismiss="modal" data-bs-dismiss="modal"><i class="flaticon-cancel-12"></i> Discard</button> -->
                            <!-- <button type="button" class="btn btn-primary" @click="Simpan">Save</button> -->
                        </div>
                    </div>
                </div>
            <!-- </div> -->
        </vue-final-modal>


        <!-- <div class="modal fade" v-show="isOpen" id="modal_demo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Input Kupon</h5>
                        <button type="button" data-dismiss="modal" data-bs-dismiss="modal" aria-label="Close" class="btn-close"></button>
                    </div>
                    <div class="modal-body">
                        <h4 class="modal-heading mb-4 mt-2">Aligned Center</h4>
                        <form>
                            <div class="row mb-4">
                                <div class="col-sm-4">
                                    <label for="inputState">Tgl</label>
                                    <flat-pickr v-model="input_perubahan.tglPerubahan" 
                                    :config="{dateFormat: 'd-m-Y', static: true}" 
                                    class="form-control form-control-sm flatpickr active" placeholder="Due Date">
                                    </flat-pickr>
                                </div>
                            </div>
                            <div class="row mb-4">
                                <div class="col-sm">
                                    <label for="inputState">Harga Terbaru</label>
                                    <input v-model="input_perubahan.harga_baru" class="form-control form-control-sm" placeholder="Nilai" @keypress="onlyNumber" />
                                </div>
                                <div class="col-sm-4">
                                    <label for="inputState">Simpan</label><br>
                                    <a class="btn btn-primary" @click="simpnPerubahan">Simpan</a>
                                    <input v-model="list.code_bbm" class="form-control" placeholder="Kode"  />
                                </div>
                            </div>
                            
                        </form>

                        

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn" data-dismiss="modal" data-bs-dismiss="modal"><i class="flaticon-cancel-12"></i> Discard</button>
                        <button type="button" class="btn btn-primary">Save</button>
                    </div>
                </div>
            </div>
        </div> -->

          <!-- {{ users.bbm }}   -->
            
            
        </div>
    </div>
</template>

<script setup>
    import '@/assets/sass/widgets/widgets.scss';
    import { computed, ref, onMounted, reactive } from 'vue';
    import { useStore } from 'vuex';
    import { useRouter, useRoute } from 'vue-router'


    import flatPickr from 'vue-flatpickr-component';
    import 'flatpickr/dist/flatpickr.css';
    import '@/assets/sass/forms/custom-flatpickr.css';

    import moment from "moment";

    import { useMeta } from '@/composables/use-meta';
    useMeta({ title: 'BBM' });

    const isOpen = ref(false);
    const code = ref();
    const harga_old = ref();

    
    const store = useStore();
    const router = useRouter();
    const route = useRoute();
    const input_perubahan = ref({
        tglPerubahan: moment().format('D-M-YYYY'),
        code_bbm: code,
        harga_lama: harga_old
    })

    function Simpan() {
        // console.log(input_perubahan.value)
        store.dispatch('UpdateHargaBbm', input_perubahan.value)
        isOpen.value = false;
    }
    const openModal = (list) => {
        code.value = list.code_bbm;
        harga_old.value = list.sale_price;
        isOpen.value = true;
    }

    // BBM
    const users = computed(() => {
        const bbm = store.getters.StateBbm;
        return { users, bbm }
    });

    // const modalRef = ref(null);
    // const openModal = () => Modal.getInstance(modalRef.value)?.show();

    onMounted(() => {
        function getData(){
            store.dispatch('GetBbm')
        }
        getData();
       
    })
    
</script>
