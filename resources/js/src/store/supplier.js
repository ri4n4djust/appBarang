import axios from 'axios';
const state = {
    supplier: [],
  };
  
const getters = {
    StateSupplier: state => state.supplier,
};

const actions = {  
    async CreateSupplier({dispatch}, pel) {
        await axios.post('/apitambah/supplier', pel)
        await dispatch('GetSupplier')
    }, 
    async GetSupplier({ commit }){
        let response
        try {
            response = await axios.get('/api/supplier')
            commit('setSupplier', response.data.data)
        } catch (ex) {
            // Handle error
            return
        }
    },
    
    async DeleteSupplier({dispatch}, id) {
        await axios.delete(`/api/hapus/supplier/${id}`)
        await dispatch('GetSupplier')
        // await commit('setUser', detUser.data.user)
    },
    

};
const mutations = {
    setSupplier(state, supplier){
        state.supplier = supplier
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
