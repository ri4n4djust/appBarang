import axios from 'axios';
const state = {
    pelanggan: null,
  };
  
const getters = {
    StatePelanggan: state => state.pelanggan,
};

const actions = {  
    async CreatePelanggan({dispatch}, pel) {
        await axios.post('tambah/pelanggan', pel)
        await dispatch('GetPelanggan')
    }, 
    async GetPelanggan({ commit }){
        let response = await axios.get('pelanggan')
        commit('setPelanggan', response.data)
    },
    async EditPelanggan({dispatch}, Brg) {
        await axios.post('update/pelanggan', Brg)
        await dispatch('GetPelanggan')
        // await commit('setUser', detUser.data.user)
    },
    async DeletePelanggan({dispatch}, id) {
        await axios.delete(`hapus/pelanggan/${id}`)
        await dispatch('GetPelanggan')
        // await commit('setUser', detUser.data.user)
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
