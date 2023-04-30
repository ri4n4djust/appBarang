//store/modules/auth.js

import axios from 'axios';
const state = {
    inventaris: [],
    penyusutan: [],
    laporanpembelianinventaris: [],
    listinvkat: []
  };
  
const getters = {
    StateInventaris: state => state.inventaris,
    StatePenyusutan: state => state.penyusutan,
    StateLaporanPembelianInventaris: state => state.laporanpembelianinventaris,
    StateListInvKat : state => state.listinvkat,
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
        let response
        try {
            await axios.post('/api/hapus/inventaris', id)
            await dispatch('GetInventaris')
            // console.log(response.data.data)
            const toast = window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em',
            });
            toast.fire({
                icon: 'success',
                title: 'Inventaris berhasil terhapus',
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
                text: 'Inventaris Gagal Dihapus',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            throw 'error' ;
        }
    },
    async DeletePengadaanInv({dispatch}, id) {
        let response
        try {
            response = await axios.post('/api/delete/pengadaan', id)
            // console.log(response.data.data)
            const toast = window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em',
            });
            toast.fire({
                icon: 'success',
                title: 'Pengadaan berhasil terhapus',
                padding: '2em',
            });
            return response ;
        } catch (ex) {
            // Handle error
            // console.log(ex);
            const toast =  window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em'
            });
            toast.fire({
                title: 'Error!',
                text: ex.response.data.message,
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            throw 'error';
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
                text: 'Mohon Lengkapi Data',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            throw 'error' ;
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
                title: 'Penyusutan berhasil tersimpan',
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
                text: 'Mohon Lengkapi Data',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            throw 'error' ;
        }
        // await dispatch('GetPembelian')
    },

    async CreatePenyusutanInvByKat({dispatch}, detail) {
        let response
        try {
            response = await axios.post('/api/penyusutan/inventaris-bykat', detail)
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
                title: 'Penyusutan berhasil tersimpan',
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
                text: 'Mohon Lengkapi Data',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            throw 'error' ;
        }
        // await dispatch('GetPembelian')
    },

    async getInvKat({commit}, kat) {
        let response
        try {
            response = await axios.post('/api/penyusutan/getinv-bykat', kat)
            // localStorage.setItem('cartItemsPe', '[]')
            // commit('setListKat', response.data.data);
            response = response.data.data;
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
                text: 'Mohon Lengkapi Data',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            throw 'error' ;
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
