//store/modules/auth.js

import axios from 'axios';
const state = {
    bbm: null,
  };
  
const getters = {
    StateBbm: state => state.bbm,
};

const actions = {  
    async CreatePost({dispatch}, post) {
        await axios.post('/api/bbm', post)
        await dispatch('GetBbm')
    }, 
    async GetBbm({ commit }){
        let response = await axios.get('/api/bbm')
        commit('setBbm', response.data.data)
    },
    async EditBbm({dispatch}, Bbm) {
        await axios.post('/api/update/bbm', Bbm)
        await dispatch('GetBbm')
        // await commit('setUser', detUser.data.user)
    },
    async DeleteBbm({dispatch}, id) {
        let response
        try {
            response = await axios.delete(`/api/hapus/bbm/${id}`)
            await dispatch('GetBbm')
            const toast = window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em',
            });
            toast.fire({
                icon: 'success',
                title: 'BBM berhasil terhapus',
                padding: '2em',
            });
            return response ;
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
                text: 'BBM Gagal Dihapus',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            throw 'error' ;
        }
    },
    async UpdateHargaBbm({dispatch}, newhrg){
        try{
            await axios.post('api/update/harga-bbm', newhrg)
            console.log(newhrg)
            await dispatch('GetBbm')
            const toast = window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em',
            });
            toast.fire({
                icon: 'success',
                title: 'Berhasil Simpan Barang',
                padding: '2em',
            });
        } catch (err){
            const toast =  window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em'
            });
            toast.fire({
                title: 'Error!',
                text: 'gagal disimpan',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });

        }
    },

};
const mutations = {
    setBbm(state, bbm){
        state.bbm = bbm
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
