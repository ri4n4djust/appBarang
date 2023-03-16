//store/modules/auth.js

import axios from 'axios';
const state = {
    coalist: [],
    harta: [],
  };
  
const getters = {
    StateHarta: state => state.harta,
    StateCoaList: state => state.coalist,
};

const actions = {  
    async CreateAcc({dispatch}, post) {
        let res
        try {
            res = await axios.post('/api/store/coa-acc', post)
            // await dispatch('GetHarta')
            return res ;
        } catch (ex) {
            // Handle error
            return res ;
        }
    }, 
    async GetHarta({ commit }, group){
        let response = await axios.post('/api/get/acc-data', group)
        commit('setHarta', response.data.data)
    },
    async GetCoaList({ commit }, list){
        let response = await axios.post('/api/get/coa', list)
        commit('setCoa', response.data.data)
    },
    

};
const mutations = {
    setHarta(state, harta){
        state.harta = harta
    },
    setCoa(state, coa){
        state.coalist = coa
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
