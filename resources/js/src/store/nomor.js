//store/modules/auth.js

import axios from 'axios';
const state = {
    nopembelian: [],
    nobarang: [],
    noopnum: [],
    nopobbm: []
    // nokupon: [],
  };
  
const getters = {
    NoBarang: state => state.nobarang,
    NoPembelian: state => state.nopembelian,
    NoPenjualan: state => state.nopenjualan,
    NoOpnum: state => state.noopnum,
    NoPobbm: state => state.nopobbm
    // NoKupon: state => state.nokupon
};

const actions = {  
    async GetNoPembelian({ commit }){
        let response
        try {
            response = await axios.get('/api/kdpembelian')
            commit('setNoPembelian', response.data.kdPembelian)
        } catch (ex) {
            // Handle error
            alert('error no pembelian')
            return
        }
    
    },
    async GetNoPenjualan({ commit }){
        let response
        try {
            response = await axios.get('/api/kdpenjualan')
            commit('setNoPenjualan', response.data.kdPenjualan)
        } catch (ex) {
            // Handle error
            alert('error no penjualan')
            return
        }
    
    },
    async GetNoBarang({ commit }){
        let response
        try {
            response = await axios.get('/api/kdbarang')
            commit('setNoBarang', response.data.kdBarang)
        } catch (ex) {
            // Handle error
            alert('error no barang')
            return
        }
    
    },
    async GetNoOpnum({ commit }){
        let response
        try {
            response = await axios.get('/api/kdopnum')
            commit('setNoOpnum', response.data.kdOpnum)
        } catch (ex) {
            // Handle error
            alert('error no opnum')
            return
        }
    
    },
    async GetNoOpnum({ commit }){
        let response
        try {
            response = await axios.get('/api/kdopnum')
            commit('setNoOpnum', response.data.kdOpnum)
        } catch (ex) {
            // Handle error
            alert('error no opnum')
            return
        }
    
    },
    async GetNoPobbm({ commit }){
        let response
        try {
            response = await axios.get('/api/kdpobbm')
            commit('setNoPobbm', response.data.kdPobbm)
        } catch (ex) {
            // Handle error
            alert('error no po bbm')
            return
        }
    
    },

};
const mutations = {
    setNoPembelian(state, pembelian){
        state.nopembelian = pembelian
    },
    setNoPenjualan(state, penjualan){
        state.nopenjualan = penjualan
    },
    setNoBarang(state, barang){
        state.nobarang = barang
    },
    setNoOpnum(state, op){
        state.noopnum = op
    },
    setNoPobbm(state, po){
        state.nopobbm = po
    },

};

export default {
  state,
  getters,
  actions,
  mutations
};
