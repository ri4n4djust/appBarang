<template>
    <div class="layout-px-spacing">
        <portal to="breadcrumb">
            <ul class="navbar-nav flex-row">
                <li>
                    <div class="page-header">
                        <nav class="breadcrumb-one" aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:;">Master</a></li>
                                <li class="breadcrumb-item active" aria-current="page"><span>Room List</span></li>
                            </ol>
                        </nav>
                    </div>
                </li>
            </ul>
        </portal>
        <div class="row layout-top-spacing">

            <div class="col-xl-12 col-lg-12 col-sm-12 layout-spacing">
                <div class="panel br-6 p-0">
                    <div class="custom-table">
                        <div class="table-header">
                            <div class="d-flex align-items-center">
                                <span>Results :</span>
                                <span class="ml-2">
                                    <b-select v-model="table_option.page_size" size="sm">
                                        <b-select-option value="5">5</b-select-option>
                                        <b-select-option value="10">10</b-select-option>
                                        <b-select-option value="20">20</b-select-option>
                                        <b-select-option value="50">50</b-select-option>
                                    </b-select>
                                </span>
                            </div>
                            <div class="header-search">
                                <b-input v-model="table_option.search_text" size="sm" placeholder="Search..." />
                                <div class="search-image">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                                </div>
                            </div>
                        </div>

                        <b-table ref="basic_table" responsive hover :items="items" :fields="columns" :per-page="table_option.page_size" :current-page="table_option.current_page" :filter="table_option.search_text"
                                 sort-by="name" :show-empty="true" @filtered="on_filtered">
                            <template #cell(salary)="row">
                                ${{row.item.salary}}
                            </template>
                            <template #cell(action)="row">
                                <a href="javascript:void(0);" class="mr-1" v-b-tooltip title="Edit" v-b-modal.editModal v-on:click ="edit(row.item)">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="24"
                                        height="24"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-width="1.5"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        class="feather feather-edit-2"
                                    >
                                        <path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path>
                                    </svg>
                                </a>
                                <a href="javascript:void(0);" v-b-tooltip title="Delete" @click="delete_row(row.item)">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="24"
                                        height="24"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-width="1.5"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        class="feather feather-trash"
                                    >
                                        <polyline points="3 6 5 6 21 6"></polyline>
                                        <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                    </svg>
                                </a>
                                
                            </template>
                        </b-table>

                        <div class="table-footer">
                            <div class="dataTables_info">Showing {{meta.total_items ? meta.start_index + 1 : 0}} to {{meta.end_index + 1}} of {{meta.total_items}}</div>
                            <div class="paginating-container pagination-solid flex-column align-items-right">
                                <b-pagination v-model="table_option.current_page" :total-rows="table_option.total_rows" :per-page="table_option.page_size" prev-text="Prev" next-text="Next" first-text="First" last-text="Last" first-class="first" prev-class="prev" next-class="next" last-class="last" class="rounded">
                                    <template #first-text>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 19l-7-7 7-7m8 14l-7-7 7-7" /></svg>
                                    </template>
                                    <template #prev-text>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" /></svg>
                                    </template>
                                    <template #next-text>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" /></svg>
                                    </template>
                                    <template #last-text>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 5l7 7-7 7M5 5l7 7-7 7" /></svg>
                                    </template>
                                </b-pagination>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

            

        <!-- Modal -->
        <b-modal id="editModal" title="Modal title">
            
            <p class="modal-text">
                <b-form @submit.prevent="submit">
                    <input type="hidden" v-model="editItem.id" />
                    <b-form-row class="mb-4">
                        <b-form-group label="Room Name" class="col-md-6">
                            <b-input type="text" v-model="editItem.roomName" placeholder="Room Name"></b-input>
                        </b-form-group>
                        <b-form-group label="Stok" class="col-md-6">
                            <b-input type="text" v-model="editItem.rRoomRate" placeholder="Rate"></b-input>
                        </b-form-group>
                    </b-form-row>
                    <b-form-row class="mb-4">
                        <b-form-group label="Hpp" class="col-md-6">
                            <b-input type="text" v-model="editItem.roomDesc" placeholder="Desc"></b-input>
                        </b-form-group>
                        <b-form-group label="Hrg Jual" class="col-md-6">
                            <b-input type="text" v-model="editItem.roomPic" placeholder="Gambar"></b-input>
                        </b-form-group>
                    </b-form-row>
                    <b-form-group class="mb-4" label="Address 2">
                        <b-input placeholder="Apartment, studio, or floor"></b-input>
                    </b-form-group>
                    <div class="field-wrapper">
                        <b-button type="submit" variant="primary" @click="$bvModal.hide('editModal')">SAVE</b-button>
                    </div>
                    <b-form-group class="mb-4" label="Address 2">
                    <select class="form-control" v-model="editItem.rRoomRate">
                    <option
                        v-for="project in rates"
                        :value="project.id"
                        :key="project.id"
                    >
                        {{ project.roomName }}
                    </option>
                    </select>
                    </b-form-group>
                </b-form>
            </p>
            <template #modal-footer>
                <b-button variant="default" data-dismiss="modal" @click="$bvModal.hide('editModal')"><i class="flaticon-cancel-12"></i> Discard</b-button>
                <b-button variant="primary">Save</b-button>
                <!-- <button onclick={window.print()}>Print only the above div</button> -->
                <b-button tag="a" variant="secondary" class="btn-print action-print" @click="printdet()">Print</b-button>
            </template>

            <div class="printView">
                <h1>Print me</h1>
                <table>
                    <tr>
                        <td>bfdfdhgf</td>
                    </tr>
                </table>
            </div>

            <input type="button" @click="printDiv('printing')" value="print a div!" />


        </b-modal>
        
    </div>
</template>
<style>
.printing {
        visibility:hidden;
        }
        .printView {
        visibility:hidden;
}
@media print
    {

        .printView {
        visibility:visible;
        }

        .printing .printView {
        /* You can have any CSS here to make the view better on print */
        position:absolute;
        top:0;
        }
    }
    </style>
<script>
    import { mapGetters, mapState } from 'vuex';
    import { mapActions } from "vuex";
    import '@/assets/sass/scrollspyNav.scss';
    import '@/assets/sass/components/custom-modal.scss';
    import highlight from '@/components/plugins/highlight.vue';

    export default {
        metaInfo: { title: 'Bootstrap Basic Table' },
        components: {
            highlight
        },
        data() {
            return {
                items: [], columns: [],
                table_option: { total_rows: 0, current_page: 1, page_size: 10, search_text: '' },
                meta: {},
                editItem: '',
            }
        },
        watch: {
            table_option: {
                handler: function () { this.get_meta(); },
                deep: true
            },
        },
        created(){
            this.GetRoom();
            this.GetRate();
            this.bind_data();
        },
        // mounted() {
        //     this.bind_data();     
        //     this.GetBarang();
        // },
        computed: {
            // ...mapActions(["GetPosts"]),
            ...mapGetters(['StateRoom']),
        },
        methods: {
            ...mapActions(['GetRoom', 'EditRoom']),
            async submit() {
                const Brg = new FormData();
                Brg.append("id", this.editItem.id);
                Brg.append("roomName", this.editItem.roomName);
                Brg.append("rRoomRate", this.editItem.rRoomRate);
                Brg.append("roomDesc", this.editItem.roomDesc);
                Brg.append("roomPic", this.editItem.roomPic);
                try {
                    await this.EditRoom(Brg);
                    this.showError = false
                    const toast = this.$swal.mixin({
                            toast: true,
                            position: 'top-end',
                            showConfirmButton: false,
                            timer: 3000,
                            padding: '2em'
                        });
                        toast.fire({
                            icon: 'success',
                            title: 'Update successfully',
                            padding: '2em'
                        });
                    
                } catch (error) {
                    this.showError = true
                    const toast = this.$swal.mixin({
                            toast: true,
                            position: 'top-end',
                            showConfirmButton: false,
                            timer: 3000,
                            padding: '2em'
                        });
                        toast.fire({
                            icon: 'error',
                            title: 'Update Error',
                            padding: '2em'
                        });
                }
            },
            edit(item){
                this.editItem = item;
                // alert(item.nmBarang);
            },
            bind_data() {
                this.columns = [
                    { key: 'roomCode', label: 'Kode' },
                    { key: 'roomName', label: 'Nama' },
                    { key: 'rRoomRate', label: 'Hrg Pokok' },
                    { key: 'roomDesc', label: 'Hrg Jual' },
                    { key: 'roomPic', label: 'Satuan' },
                    { key: 'action', label: 'Actions', class: 'actions text-center' }
                ];

                this.items = this.StateRoom.data;
                // this.items = [
                //     { id: 1, name: 'Tiger Nixon', position: 'System Architect', office: 'Edinburgh', age: 61, start_date: '2011/04/25', salary: '320,800' },
                //     { id: 2, name: 'Garrett Winters', position: 'Accountant', office: 'Tokyo', age: 63, start_date: '2011/07/25', salary: '170,750' },
                //     { id: 3, name: 'Ashton Cox', position: 'Junior Technical Author', office: 'San Francisco', age: 66, start_date: '2009/01/12', salary: '86,000' },
                //     { id: 4, name: 'Cedric Kelly', position: 'Senior Javascript Developer', office: 'Edinburgh', age: 22, start_date: '2012/03/29', salary: '433,060' },
                //     { id: 5, name: 'Airi Satou', position: 'Accountant', office: 'Tokyo', age: 33, start_date: '2008/11/28', salary: '162,700' },
                //     { id: 6, name: 'Brielle Williamson', position: 'Integration Specialist', office: 'New York', age: 61, start_date: '2012/12/02', salary: '372,000' },
                //     { id: 7, name: 'Herrod Chandler', position: 'Sales Assistant', office: 'San Francisco', age: 59, start_date: '2012/08/06', salary: '137,500' },
                //     { id: 8, name: 'Rhona Davidson', position: 'Integration Specialist', office: 'Tokyo', age: 55, start_date: '2010/10/14', salary: '327,900' },
                //     { id: 9, name: 'Colleen Hurst', position: 'Javascript Developer', office: 'San Francisco', age: 39, start_date: '2009/09/15', salary: '205,500' },
                //     { id: 10, name: 'Sonya Frost', position: 'Software Engineer', office: 'Edinburgh', age: 23, start_date: '2008/12/13', salary: '103,600' },
                // ];

                this.table_option.total_rows = this.items.length;
                this.get_meta();
            },
            on_filtered(filtered_items) {
                this.refresh_table(filtered_items.length);
            },
            
            delete_row(item) {
                const nmBarang = item.roomName;
                this.$swal({
                    icon: 'warning',
                    title: 'Are you sure to detele '+ nmBarang + '?',
                    text: "You won't be able to revert this!",
                    showCancelButton: true,
                    confirmButtonText: 'Delete',
                    padding: '2em'
                }).then(result => {
                    if (result.value) {
                        const id = item.id;
                        this.$store.dispatch('DeleteRoom', id);
                        this.items = this.items.filter(d => d.id != item.id);
                        this.refresh_table(this.items.length);
                        this.$swal('Deleted!', 'Your file has been deleted.', 'success');
                    }
                });
            },
            refresh_table(total) {
                this.table_option.total_rows = total;
                this.table_option.currentPage = 1;
            },
            get_meta() {
                var startPage; var endPage;
                var totalPages = this.table_option.page_size < 1 ? 1 : Math.ceil(this.table_option.total_rows / this.table_option.page_size);
                totalPages = Math.max(totalPages || 0, 1);

                var maxSize = 5;
                var isMaxSized = typeof maxSize !== 'undefined' && maxSize < totalPages;
                if (isMaxSized) {
                    startPage = Math.max(this.table_option.current_page - Math.floor(maxSize / 2), 1);
                    endPage = startPage + maxSize - 1;

                    if (endPage > totalPages) { endPage = totalPages; startPage = endPage - maxSize + 1; }
                }
                else { startPage = 1; endPage = totalPages; }
                let startIndex = (this.table_option.current_page - 1) * this.table_option.page_size;
                let endIndex = Math.min(startIndex + this.table_option.page_size - 1, this.table_option.total_rows - 1);

                var pages = Array.from(Array((endPage + 1) - startPage).keys()).map(i => startPage + i);
                this.meta = {
                    total_items: this.table_option.total_rows,
                    current_page: this.table_option.current_page,
                    page_size: this.table_option.page_size,
                    total_pages: totalPages,
                    start_page: startPage,
                    end_page: endPage,
                    start_index: startIndex,
                    end_index: endIndex,
                    pages: pages
                };
            },
            print() {
                window.print();
            },
            printdet() {
                // var printContents = document.getElementById(printdet).innerHTML;
                // window.print(printContents);
                
            },
            printDiv() {
                const bodyElement = document.getElementsByTagName('body')[0];

                bodyElement.classList.add('printing');
                window.print();
                bodyElement.classList.remove('printing');
            },
        }
    };
</script>
