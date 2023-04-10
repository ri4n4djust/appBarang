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
        let response
        try {
            response = await axios.delete(`/api/hapus/supplier/${id}`)
            await dispatch('GetSupplier')
            const toast = window.Swal.mixin({
                toast: true,
                position: 'top-center',
                showConfirmButton: false,
                timer: 3000,
                padding: '2em',
            });
            toast.fire({
                icon: 'success',
                title: 'Supplier berhasil tersimpan',
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
                text: 'Supplier Gagal di hapus',
                icon: 'error',
                // confirmButtonText: 'Cool',
                padding: '2em'
            });
            throw 'error' ;
        }
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
