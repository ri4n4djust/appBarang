//store/modules/auth.js

import axios from 'axios';
const state = {
    inventaris: [],
  };
  
const getters = {
    StateInventaris: state => state.inventaris,
};

const actions = {  
    async CreateInventaris({dispatch}, post) {
        await axios.post('/api/store/inventaris', post)
        await dispatch('GetInventaris')
    }, 
    async GetInventaris({ commit }){
        let response = await axios.get('/api/inventaris')
        commit('setInventaris', response.data.data)
    },
    async DeleteInventaris({dispatch}, id) {
        await axios.post('/api/hapus/bbm', id)
        await dispatch('GetInventaris')
        // await commit('setUser', detUser.data.user)
    },
    // async UpdateHargaBbm({dispatch}, newhrg){
    //     try{
    //         await axios.post('api/update/harga-bbm', newhrg)
    //         console.log(newhrg)
    //         await dispatch('GetBbm')
    //         const toast = window.Swal.mixin({
    //             toast: true,
    //             position: 'top-center',
    //             showConfirmButton: false,
    //             timer: 3000,
    //             padding: '2em',
    //         });
    //         toast.fire({
    //             icon: 'success',
    //             title: 'Berhasil Simpan Barang',
    //             padding: '2em',
    //         });
    //     } catch (err){
    //         const toast =  window.Swal.mixin({
    //             toast: true,
    //             position: 'top-center',
    //             showConfirmButton: false,
    //             timer: 3000,
    //             padding: '2em'
    //         });
    //         toast.fire({
    //             title: 'Error!',
    //             text: 'gagal disimpan',
    //             icon: 'error',
    //             // confirmButtonText: 'Cool',
    //             padding: '2em'
    //         });

    //     }
    // },

};
const mutations = {
    setInventaris(state, inv){
        state.inventaris = inv
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
