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
        await axios.post('api/bbm', post)
        await dispatch('GetBbm')
    }, 
    async GetBbm({ commit }){
        let response = await axios.get('api/bbm')
        commit('setBbm', response.data.data)
    },
    async EditBbm({dispatch}, Bbm) {
        await axios.post('api/update/bbm', Bbm)
        await dispatch('GetBbm')
        // await commit('setUser', detUser.data.user)
    },
    async DeleteBbm({dispatch}, id) {
        await axios.delete(`api/hapus/bbm/${id}`)
        await dispatch('GetBbm')
        // await commit('setUser', detUser.data.user)
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
