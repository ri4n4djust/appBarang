<template>
    <div class="layout-px-spacing">
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

        

        <div class="row invoice layout-top-spacing layout-spacing apps-invoice">
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="doc-container">
                    <div class="row">
                        <div class="col-xl-9">

                            <div id="tableSimple" class="col-lg-12 col-12 layout-spacing">
                                <div class="statbox panel box box-shadow">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                                                <h4>Biaya</h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <!-- <div class="table-responsive"> -->

                                            
                                            <table>
                                                <tbody  v-for="hrt in hartalist" :key="hrt.acc_id" :set="amount = hrt.amount">
                                                    
                                                        <tr v-if="hrt.level === '1'" >
                                                            <td v-if="hrt.jenis != 'Total'" style="min-width:100px">{{ hrt.acc_id }} 
                                                                <a href="javascript:void(0);" title="Edit"  @click="edit_acc(accid=hrt.acc_id, level=hrt.level, parent=hrt.parent, name=hrt.name, jenis=hrt.jenis)">
                                                                    <i class="far fa-address-book"></i>
                                                                </a>
                                                            </td>
                                                            <td v-else></td>
                                                            <td v-if="hrt.jenis === 'Total' || hrt.jenis.substring(0,1) === 'H'" style="min-width: 400px;" ><b>&nbsp;&nbsp;{{ hrt.name }}</b></td>
                                                            <td v-else style="min-width: 400px;">&nbsp;&nbsp;{{ hrt.name }}</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td v-if="hrt.jenis === 'Total'" style="border-top: 1px solid black"></td>
                                                            <td v-else></td>
                                                            <td v-if="hrt.jenis === 'Detail'">
                                                                <div v-if="hrt.acc_id.substring(0,1) === '6'|| hrt.acc_id.substring(0,1) === '3' || hrt.acc_id.substring(0,1) === '4' || hrt.acc_id.substring(0,1) === '5'"> 
                                                                    {{ Number(-1*amount).toLocaleString() }}
                                                                </div>
                                                                <div v-else>{{ Number(amount).toLocaleString() }}</div>
                                                            </td>
                                                            <td v-else-if="hrt.jenis === 'Total'"><b>
                                                                <div v-if="hrt.acc_id.substring(0,1) === '6'|| hrt.acc_id.substring(0,1) === '3' || hrt.acc_id.substring(0,1) === '4' || hrt.acc_id.substring(0,1) === '5'"> 
                                                                    {{ Number(-1*amount).toLocaleString() }}
                                                                </div>
                                                                <div v-else>{{ Number(amount).toLocaleString() }}</div>
                                                            </b></td>
                                                            <td v-else></td>
                                                        </tr>
                                                        <tr v-if="hrt.level === '2'">
                                                            <td v-if="hrt.jenis != 'Total'" >{{ hrt.acc_id }}
                                                                <a href="javascript:void(0);" title="Edit" @click="edit_acc(accid=hrt.acc_id, level=hrt.level, parent=hrt.parent, name=hrt.name, jenis=hrt.jenis)">edit</a>
                                                            </td>
                                                            <td v-else></td>
                                                            <td v-if="hrt.jenis === 'Total' || hrt.jenis.substring(0,1) === 'H'" style="min-width: 300px;"><b>&nbsp;&nbsp;&nbsp;&nbsp;{{ hrt.name }}</b></td>
                                                            <td v-else style="min-width: 300px;">&nbsp;&nbsp;&nbsp;&nbsp;{{ hrt.name }}</td>
                                                            <td></td>
                                                            <td v-if="hrt.jenis === 'Total'" style="border-top: 1px solid black"></td>
                                                            <td v-else></td>
                                                            <td v-if="hrt.jenis === 'Detail'">
                                                                <div v-if="hrt.acc_id.substring(0,1) === '6'|| hrt.acc_id.substring(0,1) === '3' || hrt.acc_id.substring(0,1) === '4' || hrt.acc_id.substring(0,1) === '5'"> 
                                                                    {{ Number(-1*amount).toLocaleString() }}
                                                                </div>
                                                                <div v-else>{{ Number(amount).toLocaleString() }}</div>
                                                            </td>
                                                            <td v-else-if="hrt.jenis === 'Total'">
                                                                <div v-if="hrt.acc_id.substring(0,1) === '6'|| hrt.acc_id.substring(0,1) === '3' || hrt.acc_id.substring(0,1) === '4' || hrt.acc_id.substring(0,1) === '5'"> 
                                                                    {{ Number(-1*amount).toLocaleString() }}
                                                                </div>
                                                                <div v-else>{{ Number(amount).toLocaleString() }}</div>
                                                            </td>
                                                            <td v-else></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr v-if="hrt.level === '3'">
                                                            <td v-if="hrt.jenis != 'Total'">{{ hrt.acc_id }}
                                                                <a href="javascript:void(0);" title="Edit" @click="edit_acc(accid=hrt.acc_id, level=hrt.level, parent=hrt.parent, name=hrt.name, jenis=hrt.jenis)">edit</a>
                                                            </td>
                                                            <td v-else></td>
                                                            <td v-if="hrt.jenis === 'Total' || hrt.jenis.substring(0,1) === 'H'" style="min-width: 300px;"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{ hrt.name }}</b></td>
                                                            <td v-else style="min-width: 300px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{ hrt.name }}</td>
                                                            <td v-if="hrt.jenis === 'Total'" style="border-top: 1px solid black"></td>
                                                            <td v-else></td>
                                                            <td v-if="hrt.jenis === 'Detail'">
                                                                <div v-if="hrt.acc_id.substring(0,1) === '6'|| hrt.acc_id.substring(0,1) === '3' || hrt.acc_id.substring(0,1) === '4' || hrt.acc_id.substring(0,1) === '5'"> 
                                                                    {{ Number(-1*amount).toLocaleString() }}
                                                                </div>
                                                                <div v-else>{{ Number(amount).toLocaleString() }}</div>
                                                            </td>
                                                            <td v-else-if="hrt.jenis === 'Total'">
                                                                <div v-if="hrt.acc_id.substring(0,1) === '6'|| hrt.acc_id.substring(0,1) === '3' || hrt.acc_id.substring(0,1) === '4' || hrt.acc_id.substring(0,1) === '5'"> 
                                                                    {{ Number(-1*amount).toLocaleString() }}
                                                                </div>
                                                                <div v-else>{{ Number(amount).toLocaleString() }}</div>
                                                            </td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr v-if="hrt.level === '4'">
                                                            <td>{{ hrt.acc_id }}
                                                                <a href="javascript:void(0);" title="Edit" @click="edit_acc(accid=hrt.acc_id, level=hrt.level, parent=hrt.parent, name=hrt.name, jenis=hrt.jenis)">edit</a>
                                                            </td>
                                                            <td style="min-width: 300px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{ hrt.name }}</td>
                                                            <td>
                                                                <div v-if="hrt.acc_id.substring(0,1) === '6'|| hrt.acc_id.substring(0,1) === '3' || hrt.acc_id.substring(0,1) === '4' || hrt.acc_id.substring(0,1) === '5'"> 
                                                                    {{ Number(-1*amount).toLocaleString() }}
                                                                </div>
                                                                <div v-else>{{ Number(amount).toLocaleString() }}</div>
                                                            </td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>

                                                </tbody>
                                            </table>
                                        <!-- </div> -->

                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <Modal v-model:visible="isVisible" :draggable="true" :title="edit">
                            <input type="text" class="form-control" v-model="selected.oldid" />
                            <div class="input-group input-group-sm mb-4">
                                <select v-model="selected.parent" class="form-control">
                                    <option v-for="hrt in hartalist" :key="hrt.acc_id" :value="hrt.parent">Acc Parent {{ hrt.parent }}</option>
                                </select>
                            </div>
                            <div class="input-group input-group-sm mb-4">
                                <select v-model="selected.level" class="form-control">
                                    <option v-for="hrt in hartalist" :key="hrt.acc_id" :value="hrt.level">Level {{ hrt.level }}</option>
                                </select>
                            </div>
                            <div class="input-group mb-4">
                                <select v-model="selected.jenis" class="form-control" >
                                    <option v-for="hrt in hartalist" :key="hrt.acc_id" :value="hrt.jenis">{{ hrt.jenis }}</option>
                                </select>
                                
                            </div>
                            <div class="input-group input-group-sm mb-4">
                                <input type="text" class="form-control" v-model="selected.newacc" />
                            </div>
                            <div class="input-group input-group-sm mb-4">
                                <select v-model="selected.accid" class="form-control" disabled>
                                    <option v-for="hrt in hartalist" :key="hrt.acc_id" :value="hrt.acc_id">{{ hrt.name }}</option>
                                </select>
                            </div>
                            <div class="input-group input-group-sm mb-4">
                                <input type="text" class="form-control" v-model="selected.name" />
                            </div>
                            <div class="input-group input-group-sm mb-4">
                                <a href="javascript:;" @click="simpan_acc()" class="btn btn-success btn-download">Simpan</a>
                            </div>
                        </Modal>
                        <div class="col-xl-3">
                            <div class="invoice-actions-btn">
                                <div class="invoice-action-btn">
                                    <div class="row">
                                        
                                        <div class="col-xl-12 col-md-3 col-sm-6">
                                            <a href="javascript:;" class="btn btn-secondary btn-print action-print" @click="print()">Print</a>
                                        </div>
                                        <div class="col-xl-12 col-md-3 col-sm-6">
                                            <div class="row mb-4">
                                                <div class="col-sm">
                                                    <label for="inputState">Awal</label>
                                                    <flat-pickr v-model="sorting.startDate" 
                                                        :config="{dateFormat: 'd-m-Y'}"
                                                        class="form-control form-control-sm">
                                                    </flat-pickr>
                                                </div>
                                                <div class="col-sm">
                                                    <label for="inputState">Akhir</label>
                                                    <flat-pickr v-model="sorting.endDate" 
                                                        :config="{dateFormat: 'd-m-Y'}"
                                                        class="form-control form-control-sm">
                                                    </flat-pickr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-12 col-md-3 col-sm-6">
                                            <a href="javascript:;" @click="cari" class="btn btn-success btn-download">Cari</a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>

                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    import '@/assets/sass/apps/invoice-preview.scss';

    import { computed, ref, onMounted, reactive } from 'vue';
    import { useStore } from 'vuex';
    import { useRouter, useRoute } from 'vue-router';

    import { Modal } from 'usemodal-vue3';
    import moment from "moment";

    import flatPickr from 'vue-flatpickr-component';
    import 'flatpickr/dist/flatpickr.css';
    import '@/assets/sass/forms/custom-flatpickr.css';

    import { useMeta } from '@/composables/use-meta';
    useMeta({ title: 'BBM' });
    
    const store = useStore();
    const router = useRouter();
    const route = useRoute();

    // const showModal = ref(false);
    const isVisible = ref(false);
    const selected = ref({
        accid: '',
        name: '',
        level: '',
        parent: '',
        jenis: '',
        oldid: '',
        amount: 0
    });
    // const selectedLevel = ref({});
    const sorting = ref({
        startDate: moment().subtract(30,'d').format("D-M-YYYY"),
        endDate: moment().format("D-M-YYYY"),
        group: '6',
    });

    // const modalRef = ref(null);
    // const openModal = () => Modal.getInstance(modalRef.value)?.show();
    const hartalist = ref();
    onMounted(() => {
        const harta = ref({
            group: '6'
        });
        store.dispatch('GetHarta', harta.value);
        // hartalist.value = store.getters.StateHarta;
        setTimeout(function() { 
            // store.dispatch('GetCoaList')
            hartalist.value = store.getters.StateHarta;
        }, 3000);
       
    });

    const cari = () => {
        store.dispatch('GetHarta', sorting.value);
        // hartalist.value = store.getters.StateHarta;
        setTimeout(function() { 
            // store.dispatch('GetCoaList')
            hartalist.value = store.getters.StateHarta;
        }, 3000);
    }

    const newacc = computed(() => {
        const accs = store.getters.StateAcc;
        noterima.value = store.getters.NoTerimaBbm;
        const pajak = store.state.pajak;
        return { pajak }
    });

    const edit_acc = (accid, level, parent, name, jenis) =>{
        // alert('yg di edit : '+ accid + ' level : '+ level + 'parent : '+ parent);
        selected.value.accid = accid ;
        selected.value.level = level ;
        selected.value.parent = parent ;
        selected.value.name = name ;
        selected.value.jenis = jenis ;
        isVisible.value = true;
        // console.log(isVisible.value)

    }

    const simpan_acc = () => {

        store.dispatch('CreateAcc', selected.value).then((res) => {
        if (res.data.success === true) {
            console.log('berhasil');
            store.dispatch('GetHarta', { group: '6' });
            setTimeout(function() { 
                // store.dispatch('GetCoaList')
                hartalist.value = store.getters.StateHarta;
            }, 3000);
            isVisible.value = false;
        } else {
            console.log('gagal');
        }
        });

    }
    
</script>
