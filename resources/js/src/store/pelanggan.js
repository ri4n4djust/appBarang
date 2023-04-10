import axios from 'axios';
const state = {
    pelanggan: [],
  };
  
const getters = {
    StatePelanggan: state => state.pelanggan,
};

const actions = {  
    async CreatePelanggan({dispatch}, pel) {
        await axios.post('/api/tambah/pelanggan', pel)
        await dispatch('GetPelanggan')
    }, 
    async GetPelanggan({ commit }){
        // let response = await axios.get('/api/pelanggan')
        // commit('setPelanggan', response.data.data)
        let response
        try {
            response = await axios.get('/api/pelanggan')
            commit('setPelanggan', response.data.data)
        } catch (ex) {
            // Handle error
            alert('error get pelanggan')
            return
        }
    },
    async DeletePelanggan({dispatch}, id) {
        let response
        try {
            response = await axios.delete(`/api/hapus/pelanggan/${id}`)
            await dispatch('GetPelanggan')
            const toast = window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em',
            });
            toast.fire({
                icon: 'success',
                title: 'Pelanggan berhasil tersimpan',
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
                text: 'Pelanggan Gagal di hapus',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            throw 'error' ;
        }
    },
    

};
const mutations = {
    setPelanggan(state, pelanggan){
        state.pelanggan = pelanggan
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
