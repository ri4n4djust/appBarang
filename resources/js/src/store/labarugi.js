//store/modules/auth.js

import axios from 'axios';
const state = {
    pendapatan: [],
    bebanhpp: [],
    stokfifo: []
  };
  
const getters = {
    StatePendapatan: state => state.pendapatan,
    StateBebanHpp: state => state.bebanhpp,
    StateFifo: state => state.stokfifo
};

const actions = {  
    async GetPendapatan({ commit }, payload){
        let response
        try {
            response = await axios.post('/api/labarugi/pendapatan', payload)
            commit('setPendapatan', response.data.data)

        } catch (ex) {
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
    },
    async GetBebanHpp({ commit }, payload){
        let response
        try {
            response = await axios.post('/api/labarugi/beban-hpp', payload)
            commit('setBebanHpp', response.data.data)

        } catch (ex) {
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
    },

    async GetStokFifo({ commit }){
        let response
        try {
            response = await axios.get('/api/stok/stok-fifo')
            commit('setStokFifo', response.data.data)

        } catch (ex) {
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
    },
    

};
const mutations = {
    setPendapatan(state, pendapatan){
        state.pendapatan = pendapatan
    },
    setBebanHpp(state, beban){
        state.bebanhpp = beban
    },
    setStokFifo(state, fifo){
        state.stokfifo = fifo
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
