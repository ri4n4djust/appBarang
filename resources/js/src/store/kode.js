import axios from 'axios';
const state = {
    kdPelanggan: null,
    kdBarang: null
  };
  
const getters = {
    StateKodePelanggan: state => state.kdPelanggan,
    StateKodeBarang: state => state.kdBarang,
};

const actions = {  
    async GetKdBarang( {commit} ) {
        let response = await axios.get('kdbarang')
        commit('setKdBarang', response.data.kdBarang)
    }, 
    async GetKdPelanggan({ commit }){
        let response = await axios.get('kdpelanggan')
        commit('setKdPelanggan', response.data.kdPelanggan)
    },

    

};
const mutations = {
    setKdBarang(state, kdBarang){
        state.kdBarang = kdBarang
    },
    setKdPelanggan(state, kdPelanggan){
        state.kdPelanggan = kdPelanggan
    },

};

export default {
  state,
  getters,
  actions,
  mutations
};
