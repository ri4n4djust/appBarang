//store/modules/auth.js

import axios from 'axios';
const state = {
    pembelian: [],
  };
  
const getters = {
    StatePembelian: state => state.pembelian,
};

const actions = {  
    async CreatePembelian({dispatch}, detail) {
        await axios.post('api/store/pembelian', detail)
        // await dispatch('GetPembelian')
    }, 
    async Getpembelian({ commit }){
        let response
        try {
            response = await axios.get('api/getpembelian')
            commit('setPembelian', response.data.data)
        } catch (ex) {
            // Handle error
            return
        }
    
    },
    
    

};
const mutations = {
    setPembelian(state, beli){
        state.pembelian = beli
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
