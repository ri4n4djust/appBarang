import axios from 'axios';
const state = {
    room: null,
  };
  
const getters = {
    StateRoom: state => state.room,
};

const actions = {  
    async CreateRoom({dispatch}, rom) {
        await axios.post('tambah/room', rom)
        await dispatch('GetRoom')
    }, 
    async GetRoom({ commit }){
        let response = await axios.get('room')
        commit('setRoom', response.data)
    },
    async EditRoom({dispatch}, rom) {
        await axios.post('update/room', rom)
        await dispatch('GetRoom')
        // await commit('setUser', detUser.data.user)
    },
    async DeleteRoom({dispatch}, id) {
        await axios.delete(`hapus/room/${id}`)
        await dispatch('GetRoom')
        // await commit('setUser', detUser.data.user)
    },
    

};
const mutations = {
    setRoom(state, room){
        state.room = room
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
