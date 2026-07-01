<template>
  <div id="app">
    <h1>Livraria UB Social</h1>
    <AddBook @book-added="fetchBooks" />
    <ListBooks @edit-book="selectBooToEdit" ref="ListBooks" />
    <EditBook v-if="selectedBook" :book="selectedBook" @book-updated="handleBookUpdated" @cancel-edit="cancelEdit" />
  </div>
</template>

<script>
  import ListBooks from './components/ListBooks.vue';
  import AddBook from './components/AddBook.vue';
  import EditBook from './components/EditBook.vue';

  export default {
    components: {
      ListBooks,
      AddBook,
      EditBook,
    },
    data() {
      return {
        selectedBook: null,
      };
    },
    methods: {
      fetchBooks() {
        this.$refs.ListBooks.fetchBooks();
      },
      selectBooToEdit(book) {
        this.selectedBook = book;
      },
      handleBookUpdated() {
        this.selectedBook = null;
        this.fetchBooks();
      },
      cancelEdit() {
        this.selectedBook = null;
      }
    }
  };
</script>

<style>
  #app {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
  }

  form input {
    display: block;
    margin: 10px 0;
    padding: 5px;
  }

  button {
    margin: 5px;
    padding: 5px 10px;
    cursor: pointer;
  }
</style>