//store/modules/auth.js

import axios from 'axios';
const state = {
    transnosel: null,
    transnoselregu: null
  };
  
const getters = {
    STransNosel: state => state.transnosel,
    STransNoselRegu: state => state.transnoselregu,
    
};

const actions = {  
    async CreateTransNosel({commit}, transnosel) {
        let response = await axios.post('api/store/transnosel', transnosel)
        // commit('setTransNosel', response.data.data)
        // await dispatch('GetTransNosel', payload)
    }, 
    async GetTransNosel({ commit }, payload){
        let response = await axios.post('api/transnosel', payload)
        commit('setTransNosel', response.data.data)
        
    },
    async GetTransNoselRegu({ commit }){
        let response = await axios.post('api/transnoselregu')
        commit('setTransNoselRegu', response.data.data)
        
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
    setTransNosel(state, transnosel){
        state.transnosel = transnosel
        // console.log(state.transnosel)
    },
    setTransNoselRegu(state, transnoselregu){
        state.transnoselregu = transnoselregu
        // console.log(state.transnosel)
    },
    // GetTransNosel(state, transnosel){
    //     state.transnosel = transnosel
    // },
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
