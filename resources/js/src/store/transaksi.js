//store/modules/auth.js

import axios from 'axios';
const state = {
    pembelian: [],
    penjualan:[],
    linkacc: [],
    editpenjualan: [],
    stokopnum: [],
    editaplusan:[],
    kupon: [],
    biaya: [],
    link: [],
    listpobbm: []
  };
  
const getters = {
    StatePembelian: state => state.pembelian,
    StatePenjualan: state => state.penjualan,
    StateAcc: state => state.linkacc,
    SeditPenjualan: state => state.editpenjualan,
    SstokOpnum: state => state.stokopnum,
    SeditAplusan: state => state.editaplusan,
    Skupon: state => state.kupon,
    Sbiaya: state => state.biaya,
    Slink: state => state.link,
    SlistPobbm: state => state.listpobbm,
};

const actions = {

    async CreatePembelian({dispatch}, detail) {
        let response
        try {
            response = await axios.post('/api/store/pembelian', detail)
            localStorage.setItem('cartItemsP', '[]')
            const toast = window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em',
            });
            toast.fire({
                icon: 'success',
                title: 'Pembelian berhasil tersimpan',
                padding: '2em',
            });
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
                text: 'Mohon Lengkapi Data',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            return
        }
        // await dispatch('GetPembelian')
    },
    async CreateBarangDatang({dispatch}, detail) {
        let response
        try {
            response = await axios.post('/api/store/barang-datang', detail)
            localStorage.setItem('cartItemsP', '[]')
            const toast = window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em',
            });
            toast.fire({
                icon: 'success',
                title: 'Barang berhasil tersimpan',
                padding: '2em',
            });
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
                text: 'Gagal simpan barang',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            return
        }
        // await dispatch('GetPembelian')
    },
    async CreatePo({dispatch}, detail) {
        let response
        try {
            response = await axios.post('/api/store/po-bbm', detail)
            // localStorage.setItem('cartItemsP', '[]')
            const toast = window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em',
            });
            toast.fire({
                icon: 'success',
                title: 'Pembelian berhasil tersimpan',
                padding: '2em',
            });
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
                text: 'Mohon Lengkapi Data',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            return
        }
        // await dispatch('GetPembelian')
    },
    async ListPo({commit}, detail) {
        let response
        try {
            response = await axios.post('/api/list/po-bbm', detail)
            commit('setListpobbm', response.data.data)
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
                text: 'Gagal Load PO',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            return
        }
        // await dispatch('GetPembelian')
    },
    async CreatePenjualan({dispatch}, detail) {
        let response
        try {
            response = await axios.post('/api/store/penjualan', detail)
            const toast = window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em',
            });
            toast.fire({
                icon: 'success',
                title: 'Penjualan berhasil tersimpan',
                padding: '2em',
            });
            localStorage.setItem('cartItemsPen', '[]')
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
                text: 'Mohon Lengkapi Data',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            return
        }
        // await dispatch('GetPembelian')
    },

    async CreatePenjualanKupon({dispatch}, detail) {
        let response
        try {
            response = await axios.post('/api/store/penjualan-kupon', detail)
            const toast = window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em',
            });
            toast.fire({
                icon: 'success',
                title: 'Penjualan berhasil tersimpan',
                padding: '2em',
            });
            localStorage.setItem('cartKupon', '[]')
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
                text: 'Mohon Lengkapi Data',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            return
        }
        // await dispatch('GetPembelian')
    },

    async CreateOpnum({dispatch}, detail) {
        let response
        try {
            response = await axios.post('/api/store/opnum', detail)
            const toast = window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em',
            });
            toast.fire({
                icon: 'success',
                title: 'Opnum berhasil tersimpan',
                padding: '2em',
            });
            // localStorage.setItem('cartItemsPen', '[]')
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
                text: 'Mohon Lengkapi Data',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            return
        }
        // await dispatch('GetPembelian')
    },

    async CreateBiaya({dispatch}, detail) {
        let response
        try {
            response = await axios.post('/api/store/biaya', detail)
            const toast = window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em',
            });
            toast.fire({
                icon: 'success',
                title: 'Biaya berhasil tersimpan',
                padding: '2em',
            });
            // localStorage.setItem('cartItemsPen', '[]')
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
                text: 'Mohon Lengkapi Data',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            return
        }
        // await dispatch('GetPembelian')
    },

    async GetdetailPo({dispatch}, detail) {
        let response
        try {
            response = await axios.post('/api/detail/po-bbm', detail)
            // const toast = window.Swal.mixin({
            //     toast: true,
            //     position: 'top-center',
            //     showConfirmButton: false,
            //     timer: 3000,
            //     padding: '2em',
            // });
            // toast.fire({
            //     icon: 'success',
            //     title: 'Penjualan berhasil tersimpan',
            //     padding: '2em',
            // });
            localStorage.setItem('terimabarang', JSON.stringify(response.data.data))
            console.log(response.data.data)
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
                text: 'Mohon Lengkapi Data',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            return
        }
        // await dispatch('GetPembelian')
    },

    async insertJuurnalUmum({dispatch}, detail) {
        let response
        try {
            response = await axios.post('/api/store/jurnal-umum', detail)
            const toast = window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em',
            });
            toast.fire({
                icon: 'success',
                title: 'Jurnal berhasil tersimpan',
                padding: '2em',
            });
            // console.log(response.data.data)
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
                text: 'Mohon Lengkapi Data',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            return
        }
        // await dispatch('GetPembelian')
    },

    async NewKupon({ commit }, data){
            commit('setKupon', data)
    },
    async NewBiaya({ commit }, b){
        commit('setBiaya', b)
    },
    async NewLink({ commit }, b){
        commit('setLink', b)
    },

    async GetEditAplusan({ commit }, sort){
        let response
        try {
            response = await axios.post('/api/getedit-aplusam', sort)
            commit('setEditAplusan', response.data.data)
            commit('setKupon', data)
            commit('setBiaya', b)
            commit('setLink', b)
        } catch (ex) {
            // Handle error
            return
        }
    
    },
    async GetPembelian({ commit }){
        let response
        try {
            response = await axios.get('/api/getpembelian')
            commit('setPembelian', response.data.data)
        } catch (ex) {
            // Handle error
            return
        }
    
    },
    async GetAcc({ commit }){
        let response
        try {
            response = await axios.get('/api/linkacc')
            commit('setAcc', response.data.data)
        } catch (ex) {
            // Handle error
            return
        }
    },

    async GetDetailPenjualan({ commit }, kdPenjualan){
        let response
        try {
            response = await axios.post('/api/getdetail-penjualan', kdPenjualan)
            // commit('setAcc', response.data.data)
            var dataArr = response.data.data

            const arr = [];
            for (let i = 0; i < dataArr.length; i++) {
                // console.log({kdBarang : dataArr[i].r_kdBarang, nmBarang : dataArr[i].r_nmBarang,});
                arr.push ({
                    'kdBarang' : dataArr[i].r_kdBarang,
                    'nmBarang' : dataArr[i].r_nmBarang,
                    'hrgJual' : dataArr[i].hrgJual,
                    'qty' : dataArr[i].qty,
                    'satuan' : dataArr[i].satuanJual,
                    'total' : dataArr[i].totalJual
                })
              }
            // console.log(arr)

            localStorage.setItem('cartItemsPen', JSON.stringify(arr))
        } catch (ex) {
            // Handle error
            return
        }
    },

    async DeletePObbm({dispatch}, kd) {
        let response
        try {
            response = await axios.post('/api/delete/pobbm', kd)
            // console.log(response.data.data)
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
                text: 'PO Gagal Dihapus',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            return
        }
        // await dispatch('GetPembelian')
    },
    async getDetailPObbm({dispatch}, kd) {
        let response
        try {
            response = await axios.post('/api/detail/pobbm', kd)
            // console.log(response.data.data)
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
                text: 'PO Gagal Dihapus',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            return
        }
        // await dispatch('GetPembelian')
    },

    async DeleteBiaya({dispatch}, kd) {
        let response
        try {
            response = await axios.post('/api/delete/biaya', kd)
            // console.log(response.data.data)
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
                text: 'Biaya Gagal Dihapus',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            return
        }
        // await dispatch('GetPembelian')
    },
    
    async CreateEditPenjualan({commit}, item) {
        // await axios.post('/api/tambah/pelanggan', pel)
        await commit('setEditPenjualan', item)
        localStorage.setItem('headerEditPen', JSON.stringify([item]))
    },

};
const mutations = {
    setPembelian(state, beli){
        state.pembelian = beli
    },
    setAcc(state, acc){
        state.linkacc = acc
    },
    setEditPenjualan(state, editjual){
        state.editpenjualan = editjual
    },
    setEditAplusan(state, edita){
        state.editaplusan = edita
    },
    setKupon(state, data){
        state.kupon = data
    },
    setBiaya(state, b){
        state.biaya = b
    },
    setLink(state, l){
        state.link = l
    },
    setListpobbm(state, po){
        state.listpobbm = po
    }
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
