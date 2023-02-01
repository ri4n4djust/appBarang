//store/modules/auth.js

import axios from 'axios';
const state = {
    barang: [],
    persediaan: [],
    kategori: [],
  };
  
const getters = {
    StateBarang: state => state.barang,
    StatePersediaan: state => state.persediaan,
    StateKategori: state => state.kategori,
};

const actions = {  
    async CreateBarang({dispatch}, post) {
        try{
            await axios.post('api/store/barang', post)
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
                title: 'Berhasil Simpan Barang',
                padding: '2em',
            });
        } catch (err){
            const toast =  window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em'
            });
            toast.fire({
                title: 'Error!',
                text: 'gagal disimpan',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });

        }
    }, 
    async GetBarang({ commit }){
        let response
        try {
            response = await axios.get('/api/barang')
            commit('setBarang', response.data.data)
        } catch (ex) {
            // Handle error
            return
        }
    
    },
    async GetPersediaan({ commit }){
        let response
        try {
            response = await axios.get('/api/persediaan')
            commit('setPersediaan', response.data.data)
        } catch (ex) {
            // Handle error
            return
        }
    
    },
    async GetKategori({ commit }){
        let response
        try {
            response = await axios.get('/api/kategori')
            commit('setKategori', response.data.data)
        } catch (ex) {
            // Handle error
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
    setBarang(state, barang){
        state.barang = barang
    },
    setPersediaan(state, persediaan){
        state.persediaan = persediaan
    },
    setKategori(state, kategori){
        state.kategori = kategori
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
