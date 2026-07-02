<template>
    <div v-if="book">
        <h2>Editar livro:</h2>
        <form @submit.prevent="updateBook">
            <input v-model="form.title" placeholder="Title" required />
            <input v-model="form.author" placeholder="Author" required />
            <input v-model="form.published_date" type="date" placeholder="Published date" required />
            <input v-model="form.isbn" placeholder="ISBN" required />
            <input v-model="form.pages" type="number" placeholder="Pages" required />
            <input v-model="form.cover" placeholder="Cover" />
            <input v-model="form.language" placeholder="Language" required />
            <button type="submit" class="btn btn-success">Confirmar</button>
            <button @click="$emit('cancel-edit')" class="btn btn-secondary">Cancelar</button>
        </form>
    </div>
</template>

<script>
    export default {
        props: {
            book: Object,
        },
        data() {
            return {
                form: { ...this.book },
            };
        },
        watch: {
            book(newBook) {
                this.form = { ...newBook };
            },
        },
        methods: {
            async updateBook() {
                try {
                    await this.axios.put(`books/${this.book.id}/`, this.form);
                    this.$emit('book-updated');
                } catch (error) {
                    console.error('Error updating book:', error);
                }
            },
        },
    };
</script>