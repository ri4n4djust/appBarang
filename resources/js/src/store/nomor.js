//store/modules/auth.js

import axios from 'axios';
const state = {
    nopembelian: [],
    nobarang: [],
    noopnum: [],
    nopobbm: [],
    noterimabbm: [],
    nokupon: [],
    nobiaya: [],
    nojurnalumum: []
  };
  
const getters = {
    NoBarang: state => state.nobarang,
    NoPembelian: state => state.nopembelian,
    NoPenjualan: state => state.nopenjualan,
    NoOpnum: state => state.noopnum,
    NoPobbm: state => state.nopobbm,
    NoTerimaBbm: state => state.noterimabbm,
    NoKupon: state => state.nokupon,
    NoBiaya: state => state.nobiaya,
    NoJurnalUmum: state => state.nojurnalumum
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
    async GetNoBiaya({ commit }){
        let response
        try {
            response = await axios.get('/api/kdbiaya')
            commit('setNoBiaya', response.data.kdBiaya)
        } catch (ex) {
            // Handle error
            alert('error no biaya')
            return
        }
    
    },
    async GetNoJurnalUmum({ commit }){
        let response
        try {
            response = await axios.get('/api/kdjurnal-umum')
            commit('setNoJurnalUmum', response.data.kdJurnal)
        } catch (ex) {
            // Handle error
            alert('error no biaya')
            return
        }
    
    },
    async GetNoKupon({ commit }){
        let response
        try {
            response = await axios.get('/api/kdkupon')
            commit('setNoKupon', response.data.kdKupon)
        } catch (ex) {
            // Handle error
            alert('error no Kupon')
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
    async GetTerimabbm({ commit }){
        let response
        try {
            response = await axios.get('/api/kdbbmdatang')
            commit('setTerimabbm', response.data.kdBbmdatang)
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
    setNoBiaya(state, bi){
        state.nobiaya = bi
    },
    setNoJurnalUmum(state, gj){
        state.nojurnalumum = gj
    },
    setNoKupon(state, kp){
        state.nokupon = kp
    },
    setNoPobbm(state, po){
        state.nopobbm = po
    },
    setTerimabbm(state, gr){
        state.noterimabbm = gr
    },

};

export default {
  state,
  getters,
  actions,
  mutations
};
