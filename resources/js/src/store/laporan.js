//store/modules/auth.js

import axios from 'axios';
const state = {
    laporanbbm: [],
    laporanbarang: [],
    pembelianpersediaan: [],
    laporanopnum: [],
    aplusan: [],
    listaplusan: [],
    listpenjualankupon: [],
    listbiaya: [],
    listbbmdatang: [],
    listpenyusutan: [],
    bukubesar: [],
    jurnalumum: [],
  };
  
const getters = {
    SlaporanBbm: state => state.laporanbbm,
    SlaporanBarang: state => state.laporanbarang,
    SlaporanPembelian: state => state.pembelianpersediaan,
    SlaporanOpnum: state => state.laporanopnum,
    StateListBiaya: state => state.listbiaya,
    Saplusan: state => state.aplusan,
    SlistAplusan: state => state.listaplusan,
    SlistPenjualanKupon: state => state.listpenjualankupon,
    SlistBbmDatang: state => state.listbbmdatang,
    SlistPenyusutan: state => state.listpenyusutan,
    SBukuBesar: state => state.bukubesar,
    StateGjList: state => state.jurnalumum,
};

const actions = {  
    async CreatePost({dispatch}, post) {
        await axios.post('/api/post', post)
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
            response = await axios.post('/api/listpenjualan-kupon', opnum)
            commit('setListPenjualanKupon', response.data.data)
        } catch (ex) {
            // Handle error
            alert('error load laporan list Kupon')
            return
        }
    },
    async GetListBiaya({ commit }, biaya){
        let response
        try {
            response = await axios.post('/api/list-biaya', biaya)
            commit('setListBiaya', response.data.data)
        } catch (ex) {
            // Handle error
            alert('error load laporan list Biaya')
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
    async GetListBbmDatang({ commit }, bbmdatang){
        let response
        try {
            response = await axios.post('/api/list-bbmdatang', bbmdatang)
            commit('setListBbmDatang', response.data.data)
        } catch (ex) {
            // Handle error
            alert('error load list bbm datang')
            return
        }
    },
    async GetListPenyusutan({ commit }, penyusutan){
        let response
        try {
            response = await axios.post('/api/list-penyusutan', penyusutan)
            commit('setListPenyusutan', response.data.data)
        } catch (ex) {
            // Handle error
            alert('error load list penyusutan')
            return
        }
    },
    async GetBukuBesar({ commit }, buku){
        let response
        try {
            response = await axios.post('/api/buku-besar', buku)
            commit('setBukuBesar', response.data.data)
        } catch (ex) {
            // Handle error
            alert('error load buku besar')
            return
        }
    },
    async GetJurnalUmum({ commit }, gj){
        let response
        try {
            response = await axios.post('/api/list-jurnalumum', gj)
            commit('setJurnalUmum', response.data.data)
        } catch (ex) {
            // Handle error
            alert('error load jurnal umum')
            return
        }
    },
    async EditBarang({dispatch}, Brg) {
        await axios.post('/api/update/barang', Brg)
        await dispatch('GetBarang')
        // await commit('setUser', detUser.data.user)
    },
    async DeleteBarang({dispatch}, id) {
        let response
        try {
            response = await axios.delete(`/api/hapus/barang/${id}`)
            await dispatch('GetBarang')
            const toast = window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em',
            });
            toast.fire({
                icon: 'success',
                title: 'Barang berhasil terhapus',
                padding: '2em',
            });
            return response ;
        } catch (ex) {
            // Handle error
            const toast =  window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em'
            });
            toast.fire({
                title: 'Error!',
                text: 'Barang Gagal Dihapus',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            throw 'error' ;
        }
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
    setListBiaya(state, biaya){
        state.listbiaya = biaya
    },
    setAplusan(state, ap){
        state.aplusan = ap
    },
    setListAplusan(state, lisap){
        state.listaplusan = lisap
    },
    setListBbmDatang(state, listdatang){
        state.listbbmdatang = listdatang
    },
    setListPenyusutan(state, listsusut){
        state.listpenyusutan = listsusut
    },
    setBukuBesar(state, bukubesar){
        state.bukubesar = bukubesar
    },
    setJurnalUmum(state, ju){
        state.jurnalumum = ju
    }


};

export default {
  state,
  getters,
  actions,
  mutations
};
