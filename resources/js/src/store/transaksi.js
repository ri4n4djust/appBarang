//store/modules/auth.js

import axios from 'axios';
const state = {
    pembelian: [],
    linkacc: []
  };
  
const getters = {
    StatePembelian: state => state.pembelian,
    StateAcc: state => state.linkacc,
};

const actions = {

    async CreatePembelian({dispatch}, detail) {
        let response
        try {
            response = await axios.post('api/store/pembelian', detail)
            localStorage.setItem('cartItemsP', '[]')
            const toast = window.Swal.mixin({
                toast: true,
                position: 'top-end',
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
                position: 'top-end',
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
    
    

};
const mutations = {
    setPembelian(state, beli){
        state.pembelian = beli
    },
    setAcc(state, acc){
        state.linkacc = acc
    },
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
