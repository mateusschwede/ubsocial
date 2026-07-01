<template>
    <button @click="deleteBook">Confirmar deleção</button>
</template>

<script>
    import axios from 'axios';

    export default {
        props: {
            bookId: Number,
        },
        methods: {
            async deleteBook() {
                try {
                    await axios.delete(`http://localhost:8000/api/books/${this.bookId}/`);
                    this.$emit('book-deleted');
                } catch (error) {
                    console.error('Error deleting book:', error);
                }
            },
        },
    };
</script>