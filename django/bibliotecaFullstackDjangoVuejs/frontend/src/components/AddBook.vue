<template>
    <div>
        <h2>Adicionar livro:</h2>
        <form @submit.prevent="addBook">
            <input v-model="form.title" placeholder="Title" required />
            <input v-model="form.author" placeholder="Author" required />
            <input v-model="form.published_date" type="date" placeholder="Published date" required />
            <input v-model="form.isbn" placeholder="ISBN" required />
            <input v-model="form.pages" type="number" placeholder="Pages" required />
            <input v-model="form.cover" placeholder="Cover" />
            <input v-model="form.language" placeholder="Language" required />
            <button type="submit" class="btn btn-success">Confirmar</button>
        </form>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                form: {
                    title: '',
                    author: '',
                    published_date: '',
                    isbn: '',
                    pages: '',
                    cover: '',
                    language: '',
                },
            };
        },
        methods: {
            async addBook() {
                try {
                    await this.axios.post(`books/`, this.form);
                    this.$emit('book-added');
                    this.resetForm();
                } catch (error) {
                    console.error('Error adding book:', error);
                }
            },
            resetForm() {
                this.form = {
                    title: '',
                    author: '',
                    published_date: '',
                    isbn: '',
                    pages: '',
                    cover: '',
                    language: '',
                };
            },
        },
    };
</script>