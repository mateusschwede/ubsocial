<template>
    <div>
        <h2>Livros no acervo:</h2>
        <ul>
            <li v-for="book in books" :key="book.id">
                {{ book.title }} by {{ book.author }}
                <button @click="$emit('edit-book', book)" class="btn btn-warning">Editar</button>
                <button @click="deleteBook(book.id)" class="btn btn-danger">Deletar</button>
            </li>
        </ul>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                books: [],
            };
        },
        methods: {
            async fetchBooks() {
                try {
                    const response = await this.axios.get(`books/`);
                    this.books = response.data;
                } catch (error) {
                    console.error('Error fetching books:', error);
                }
            },
            async deleteBook(bookId) {
                try {
                    await this.axios.delete(`books/${bookId}/`);
                    this.fetchBooks();
                } catch (error) {
                    console.error('Error deleting book:', error);
                }
            },
        },
        mounted() {
            this.fetchBooks();
        }
    };
</script>