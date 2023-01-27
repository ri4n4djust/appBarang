
import axios from 'axios';
const state = {
    user: [],
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
            localStorage.setItem('tokenLogin', JSON.stringify(response.data.user))
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
    LogOut(state){
        state.user = [];
    },
};

export default {
  state,
  getters,
  actions,
  mutations
};
