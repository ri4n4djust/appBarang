
import axios from 'axios';
const state = {
    user: [],
    token: localStorage.getItem('tokenLogin'),
  };
  
const getters = {
    isAuthenticated: state => !!state.token,    
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
        try {
            const response = await axios.post('/api/login', User)
            await commit('setUser', response.data.user)
            const toast = window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em',
            });
            toast.fire({
                icon: 'success',
                title: 'Berhasil Login',
                padding: '2em',
            });
            axios.defaults.headers.common['Authorization'] = 'Bearer '+response.data.token;
            localStorage.setItem('tokenLogin', response.data.token)
            commit('setToken', response.data.token)
            return response
        } catch (error) {
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
                text: 'Username atau password salah',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            throw 'jhjhvjnhv'
        }

    },
    
    async LogOut({commit}){
        let user = []
        localStorage.removeItem('tokenLogin');
        // localStorage.removeItem('vuex');
        commit('LogOut', user)
    }  

};
const mutations = {
    setUser(state, email){
        state.user = email
    },
    setToken(state, token){
        state.token = token
    },
    LogOut(state){
        state.user = [];
        state.token = ''
    },
};

export default {
  state,
  getters,
  actions,
  mutations
};
