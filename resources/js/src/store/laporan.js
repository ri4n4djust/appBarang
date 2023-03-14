//store/modules/auth.js

import axios from 'axios';
const state = {
    laporanbbm: [],
    laporanbarang: [],
    pembelianpersediaan: [],
    laporanopnum: [],
    aplusan: [],
    listaplusan: [],
    listpenjualankupon: []
  };
  
const getters = {
    SlaporanBbm: state => state.laporanbbm,
    SlaporanBarang: state => state.laporanbarang,
    SlaporanPembelian: state => state.pembelianpersediaan,
    SlaporanOpnum: state => state.laporanopnum,
    Saplusan: state => state.aplusan,
    SlistAplusan: state => state.listaplusan,
    SlistPenjualanKupon: state => state.listpenjualankupon,
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
    async GetLaporanPembelian({ commit }, belibrg){
        let response
        try {
            response = await axios.post('/api/pembelian-barang', belibrg)
            commit('setLaporanPembelian', response.data.data)
        } catch (ex) {
            // Handle error
            alert('error load laporan pembelian barang')
            return
        }
    },
    async GetLaporanOpnum({ commit }, opnum){
        let response
        try {
            response = await axios.post('/api/laporan-opnum', opnum)
            commit('setLaporanOpnum', response.data.data)
        } catch (ex) {
            // Handle error
            alert('error load laporan opnum barang')
            return
        }
    },
    async GetListPenjualanKupon({ commit }, opnum){
        let response
        try {
            response = await axios.post('/api/listpejualan-kupon', opnum)
            commit('setListPenjualanKupon', response.data.data)
        } catch (ex) {
            // Handle error
            alert('error load laporan list Kupon')
            return
        }
    },
    async GetAplusan({ commit }, aplus){
        let response
        try {
            response = await axios.post('/api/aplusan', aplus)
            commit('setAplusan', response.data.data)
        } catch (ex) {
            // Handle error
            alert('error load Aplusan bbm')
            return
        }
    },
    async GetListAplusan({ commit }, laplus){
        let response
        try {
            response = await axios.post('/api/list-aplusan', laplus)
            commit('setListAplusan', response.data.data)
        } catch (ex) {
            // Handle error
            alert('error load list Aplusan bbm')
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
    // async editAplus({commit}, da) {
    //     commit('setAplusan', da)
    //     // await commit('setUser', detUser.data.user)
    // },
    

};
const mutations = {
    setLaporanBbm(state, bbm){
        state.laporanbbm = bbm
    },
    setLaporanBarang(state, barang){
        state.laporanbarang = barang
    },
    setLaporanPembelian(state, belibarang){
        state.pembelianpersediaan = belibarang
    },
    setLaporanOpnum(state, op){
        state.laporanopnum = op
    },
    setListPenjualanKupon(state, kp){
        state.listpenjualankupon = kp
    },
    setAplusan(state, ap){
        state.aplusan = ap
    },
    setListAplusan(state, lisap){
        state.listaplusan = lisap
    }

};

export default {
  state,
  getters,
  actions,
  mutations
};
