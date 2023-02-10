//store/modules/auth.js

import axios from 'axios';
const state = {
    harta: [],
  };
  
const getters = {
    StateHarta: state => state.harta,
};

const actions = {  
    async CreateHarta({dispatch}, post) {
        await axios.post('/api/store/coa-harta', post)
        await dispatch('GetHarta')
    }, 
    async GetHarta({ commit }){
        let response = await axios.get('/api/coa/harta')
        commit('setHarta', response.data.data)
    },
    

};
const mutations = {
    setHarta(state, harta){
        state.harta = harta
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
