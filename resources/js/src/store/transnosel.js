//store/modules/auth.js

import axios from 'axios';
const state = {
    transnosel: null,
  };
  
const getters = {
    StateTransNosel: state => state.transnosel,
};

const actions = {  
    async CreateTransNosel({dispatch}, nosel) {
        await axios.post('api/store/transnosel', nosel)
        await dispatch('GetTransNosel', nosel.id)
    }, 
    async GetTransNosel({ commit }, payload){
        let response = await axios.post('api/transnosel', payload)
        commit('setTransNosel', response.data.data)
    },
    async EditTransNosel({dispatch}, nosel) {
        await axios.post('api/update/transnosel', nosel)
        await dispatch('GetTransNosel')
        // await commit('setUser', detUser.data.user)
    },
    async DeleteTransNosel({dispatch}, id) {
        await axios.delete(`api/hapus/transnosel/${id}`)
        await dispatch('GetTransNosel')
        // await commit('setUser', detUser.data.user)
    },
    

};
const mutations = {
    setTransNosel(state, nosel){
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
