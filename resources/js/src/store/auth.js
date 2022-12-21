
import axios from 'axios';
const state = {
    user: null,
  };
  
const getters = {
    isAuthenticated: state => !!state.user,    
    StateUser: state => state.user,

};

const actions = {

    async Register({dispatch}, form) {
        await axios.post('register', form)
        let UserForm = new FormData()
        UserForm.append('username', form.username)
        UserForm.append('password', form.password)
        await dispatch('LogIn', UserForm)
    },
    async LogIn({commit}, User) {
        const detUser = await axios.post('login', User)
        await commit('setUser', detUser.data.user)
    },
    
    async LogOut({commit}){
        let user = null
        // const vuex = JSON.parse(localStorage.getItem('vuex'));
        // localStorage.removeItem('vuex');
        commit('logout', user)
    }  

};
const mutations = {
    setUser(state, email){
        state.user = email
    },
    LogOut(state){
        state.user = null;
    },
};

export default {
  state,
  getters,
  actions,
  mutations
};
