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
        await axios.delete(`/api/hapus/nosel/${id}`)
        await dispatch('GetNosel')
        // await commit('setUser', detUser.data.user)
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
