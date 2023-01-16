//store/modules/auth.js

import axios from 'axios';
const state = {
    barang: [],
  };
  
const getters = {
    StateBarang: state => state.barang,
};

const actions = {  
    async CreatePost({dispatch}, post) {
        await axios.post('api/post', post)
        await dispatch('GetBarang')
    }, 
    async GetBarang({ commit }){
        let response
        try {
            response = await axios.get('api/barang')
            commit('setBarang', response.data.data)
        } catch (ex) {
            // Handle error
            return
        }
    
        // Handle success
        // const data = response.body
        // const data = response.data.data
        // let response = await axios.get('api/barang')
        // commit('setBarang', response.data.data)
        // console.log(data)
    },
    async EditBarang({dispatch}, Brg) {
        await axios.post('api/update/barang', Brg)
        await dispatch('GetBarang')
        // await commit('setUser', detUser.data.user)
    },
    async DeleteBarang({dispatch}, id) {
        await axios.delete(`api/hapus/barang/${id}`)
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
