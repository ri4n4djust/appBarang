//store/modules/auth.js

import axios from 'axios';
const state = {
    inventaris: [],
    penyusutan: [],
    laporanpembelianinventaris: []
  };
  
const getters = {
    StateInventaris: state => state.inventaris,
    StatePenyusutan: state => state.penyusutan,
    StateLaporanPembelianInventaris: state => state.laporanpembelianinventaris
};

const actions = {  
    async CreateInventaris({dispatch}, post) {
        await axios.post('/api/store/inventaris', post)
        await dispatch('GetInventaris')
    }, 
    async GetInventaris({ commit }){
        let response = await axios.get('/api/inventaris')
        commit('setInventaris', response.data.data)
    },
    async GetPembelianInventaris({ commit }, data){
        let response = await axios.post('/api/laporan/pembelian-inventaris', data)
        commit('setLaporanInventaris', response.data.data)
    },
    async DeleteInventaris({dispatch}, id) {
        await axios.post('/api/hapus/bbm', id)
        await dispatch('GetInventaris')
        // await commit('setUser', detUser.data.user)
    },
    async DeletePengadaanInv({dispatch}, id) {
        let response
        try {
            response = await axios.post('/api/delete/pengadaan', id)
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
                text: 'Pengadaan Gagal Dihapus',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            return
        }
    },
    
    async CreatePembelianInventaris({dispatch}, detail) {
        let response
        try {
            response = await axios.post('/api/pembelian/inventaris', detail)
            localStorage.setItem('cartItemsPe', '[]')
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
    async CreatePenyusutanInventaris({dispatch}, detail) {
        let response
        try {
            response = await axios.post('/api/penyusutan/inventaris', detail)
            // localStorage.setItem('cartItemsPe', '[]')
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

};
const mutations = {
    setInventaris(state, inv){
        state.inventaris = inv
    },
    setLaporanInventaris(state, li){
        state.laporanpembelianinventaris = li
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
