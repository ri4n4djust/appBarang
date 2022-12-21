//store/modules/auth.js

import axios from 'axios';
const state = {
    barang: null,
  };
  
const getters = {
    StateBarang: state => state.barang,
};

const actions = {  
    async CreatePost({dispatch}, post) {
        await axios.post('post', post)
        await dispatch('GetBarang')
    }, 
    async GetBarang({ commit }){
        let response = await axios.get('barang')
        commit('setBarang', response.data)
    },
    async EditBarang({dispatch}, Brg) {
        await axios.post('update/barang', Brg)
        await dispatch('GetBarang')
        // await commit('setUser', detUser.data.user)
    },
    async DeleteBarang({dispatch}, id) {
        await axios.delete(`hapus/barang/${id}`)
        await dispatch('GetBarang')
        // await commit('setUser', detUser.data.user)
    },
    

};
const mutations = {
    setBarang(state, barang){
        state.barang = barang
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
