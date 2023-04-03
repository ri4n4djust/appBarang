import axios from 'axios';
const state = {
    ppn: [],
    pph22: [],
    // pajak: 11, // []
  };
  
const getters = {
    StatePpn: state => state.ppn,
    StatePph22: state => state.pph,
    // pajak: state => state.pajak
};

const actions = {  
    async GetPpn( {commit} ) {
        let response = await axios.get('kdbarang')
        commit('setPpn', response.data.kdBarang)
    }, 
    async GetPph22({ commit }){
        // let response = await axios.get('kdpelanggan')
        // commit('setPph22', response.data.kdPelanggan)
        let pph22 = 11;
        commit('setPph22', pph22)
        
    },
    // async GetPajak({ commit }){
    //     let response = await axios.get('kdpelanggan')
    //     commit('setPajak', response.data.kdPelanggan)
    // },
    

};
const mutations = {
    setPpn(state, ppn){
        state.ppn = ppn
    },
    setPph22(state, pph22){
        state.pph22 = pph22
    },
    // setPajak(state, pjk){
    //     state.pajak = pjk
    // },
};

export default {
  state,
  getters,
  actions,
  mutations
};