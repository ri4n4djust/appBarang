//store/modules/auth.js

import axios from 'axios';
const state = {
    nosel: null,
  };
  
const getters = {
    StateNosel: state => state.nosel,
};

const actions = {  
    async CreateNosel({dispatch}, nosel) {
        await axios.post('/api/store/nosel', nosel)
        await dispatch('GetNosel')
    }, 
    async GetNosel({ commit }, payload){
        let response = await axios.post('/api/nosel', payload)
        commit('setNosel', response.data.data)
    },
    async EditNosel({dispatch}, nosel) {
        await axios.post('/api/update/nosel', nosel)
        await dispatch('GetNosel')
        // await commit('setUser', detUser.data.user)
    },
    async DeleteNosel({dispatch}, id) {
        let response
        try {
            response = await axios.delete(`/api/hapus/nosel/${id}`)
            await dispatch('GetNosel')
            const toast = window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em',
            });
            toast.fire({
                icon: 'success',
                title: 'Nosel berhasil tersimpan',
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
                text: 'Nosel Gagal di hapus',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            throw 'error' ;
        }
    },
    

};
const mutations = {
    setNosel(state, nosel){
        state.nosel = nosel
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
