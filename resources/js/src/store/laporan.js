//store/modules/auth.js

import axios from 'axios';
const state = {
    laporanbbm: [],
    laporanbarang: [],
  };
  
const getters = {
    SlaporanBbm: state => state.laporanbbm,
    SlaporanBarang: state => state.laporanbarang,
};

const actions = {  
    async CreatePost({dispatch}, post) {
        await axios.post('api/post', post)
        await dispatch('GetBarang')
    }, 

    async GetLaporanBbm({ commit }, lapbbm){
        let response
        try {
            response = await axios.post('/api/laporan-bbm', lapbbm)
            commit('setLaporanBbm', response.data.data)
        } catch (ex) {
            // Handle error
            alert('error load laporan bbm')
            return
        }
    },
    async GetLaporanBarang({ commit }, lapbrg){
        let response
        try {
            response = await axios.post('/api/laporan-barang', lapbrg)
            commit('setLaporanBarang', response.data.data)
        } catch (ex) {
            // Handle error
            alert('error load laporan barang')
            return
        }
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
    setLaporanBbm(state, bbm){
        state.laporanbbm = bbm
    },
    setLaporanBarang(state, barang){
        state.laporanbarang = barang
    },

};

export default {
  state,
  getters,
  actions,
  mutations
};
