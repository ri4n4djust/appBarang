//store/modules/auth.js

import axios from 'axios';
const state = {
    pembelian: [],
    penjualan:[],
    linkacc: [],
    editpenjualan: [],
    stokopnum: [],
  };
  
const getters = {
    StatePembelian: state => state.pembelian,
    StatePenjualan: state => state.penjualan,
    StateAcc: state => state.linkacc,
    SeditPenjualan: state => state.editpenjualan,
    SstokOpnum: state => state.stokopnum
};

const actions = {

    async CreatePembelian({dispatch}, detail) {
        let response
        try {
            response = await axios.post('api/store/pembelian', detail)
            localStorage.setItem('cartItemsP', '[]')
            const toast = window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em',
            });
            toast.fire({
                icon: 'success',
                title: 'Pembelian berhasil tersimpan',
                padding: '2em',
            });
        } catch (ex) {
            // Handle error
            const toast =  window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em'
            });
            toast.fire({
                title: 'Error!',
                text: 'Mohon Lengkapi Data',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            return
        }
        // await dispatch('GetPembelian')
    },
    async CreatePenjualan({dispatch}, detail) {
        let response
        try {
            response = await axios.post('api/store/penjualan', detail)
            const toast = window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em',
            });
            toast.fire({
                icon: 'success',
                title: 'Penjualan berhasil tersimpan',
                padding: '2em',
            });
            localStorage.setItem('cartItemsPen', '[]')
        } catch (ex) {
            // Handle error
            const toast =  window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em'
            });
            toast.fire({
                title: 'Error!',
                text: 'Mohon Lengkapi Data',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            return
        }
        // await dispatch('GetPembelian')
    },

    async CreateOpnum({dispatch}, detail) {
        let response
        try {
            response = await axios.post('api/store/opnum', detail)
            const toast = window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em',
            });
            toast.fire({
                icon: 'success',
                title: 'Penjualan berhasil tersimpan',
                padding: '2em',
            });
            // localStorage.setItem('cartItemsPen', '[]')
        } catch (ex) {
            // Handle error
            const toast =  window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em'
            });
            toast.fire({
                title: 'Error!',
                text: 'Mohon Lengkapi Data',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            return
        }
        // await dispatch('GetPembelian')
    },

    async GetPembelian({ commit }){
        let response
        try {
            response = await axios.get('api/getpembelian')
            commit('setPembelian', response.data.data)
        } catch (ex) {
            // Handle error
            return
        }
    
    },
    async GetAcc({ commit }){
        let response
        try {
            response = await axios.get('api/linkacc')
            commit('setAcc', response.data.data)
        } catch (ex) {
            // Handle error
            return
        }
    },

    async GetDetailPenjualan({ commit }, kdPenjualan){
        let response
        try {
            response = await axios.post('/api/getdetail-penjualan', kdPenjualan)
            // commit('setAcc', response.data.data)
            var dataArr = response.data.data

            const arr = [];
            for (let i = 0; i < dataArr.length; i++) {
                // console.log({kdBarang : dataArr[i].r_kdBarang, nmBarang : dataArr[i].r_nmBarang,});
                arr.push ({
                    'kdBarang' : dataArr[i].r_kdBarang,
                    'nmBarang' : dataArr[i].r_nmBarang,
                    'hrgJual' : dataArr[i].hrgJual,
                    'qty' : dataArr[i].qty,
                    'satuan' : dataArr[i].satuanJual,
                    'total' : dataArr[i].totalJual
                })
              }
            // console.log(arr)

            localStorage.setItem('cartItemsPen', JSON.stringify(arr))
        } catch (ex) {
            // Handle error
            return
        }
    },
    
    async CreateEditPenjualan({commit}, item) {
        // await axios.post('/api/tambah/pelanggan', pel)
        await commit('setEditPenjualan', item)
        localStorage.setItem('headerEditPen', JSON.stringify([item]))
    },

};
const mutations = {
    setPembelian(state, beli){
        state.pembelian = beli
    },
    setAcc(state, acc){
        state.linkacc = acc
    },
    setEditPenjualan(state, editjual){
        state.editpenjualan = editjual
    }
    // DeleteBarang({dispatch}, id) {
    //     axios.delete(`hapus/barang/${id}`)
    //     dispatch('GetBarang')
    //     // await commit('setUser', detUser.data.user)
    // },

};

export default {
  state,
  getters,
  actions,
  mutations
};
