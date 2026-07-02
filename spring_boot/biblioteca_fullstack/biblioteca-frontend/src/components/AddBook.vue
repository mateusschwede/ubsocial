<template>
    <h3>Novo livro:</h3>
    <form @submit.prevent="saveBook">
        <div class="form-group">
            <input type="text" class="form-control" v-model="book.title" placeholder="Título" required id="title"
                name="title" />
        </div>
        <div class="form-group">
            <input type="text" class="form-control" v-model="book.author" placeholder="Autor(a)" required id="author"
                name="author" />
        </div>
        <div class="form-group">
            <label for="published_date">Publicação:</label>
            <input type="date" class="form-control" v-model="book.published_date" required id="published_date"
                name="published_date" :max="new Date().toISOString().split('T')[0]" />
        </div>
        <div class="form-group">
            <input type="text" class="form-control" v-model="book.isbn" placeholder="ISBN" required id="isbn"
                name="isbn" pattern="^\d{13}$" />
        </div>
        <div class="form-group">
            <input type="number" class="form-control" v-model="book.pages" placeholder="Páginas" required id="pages"
                name="pages" min="1" />
        </div>
        <div class="form-group">
            <input type="text" name="cover" class="form-control" v-model="book.cover" placeholder="Capa" required
                id="cover" />
        </div>
        <div class="form-group">
            <input type="text" class="form-control" v-model="book.language" placeholder="Idioma" required id="language"
                name="language" />
        </div>
        <button type="button" class="btn btn-secondary" @click="$router.push('/books')">Cancelar</button>
        <button type="submit" class="btn btn-success">Adicionar</button>
    </form>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import BookDataService from '@/services/BookDataService';
import Book from '@/types/Book';
import ResponseData from '@/types/ResponseData';

export default defineComponent({
    name: 'add-book',
    data() {
        return {
            book: {
                title: '',
                author: '',
                published_date: new Date(),
                isbn: '',
                pages: 0,
                cover: '',
                language: ''
            } as Book,
        };
    },
    methods: {
        saveBook() {
            let data = {
                title: this.book.title,
                author: this.book.author,
                published_date: this.book.published_date,
                isbn: this.book.isbn,
                pages: this.book.pages,
                cover: this.book.cover,
                language: this.book.language,
            };

            BookDataService.create(data)
                .then((response: ResponseData) => {
                    this.book.id = response.data.id;
                    this.$router.push({ name: "books" });
                })
                .catch((e: Error) => {
                    console.error(e);
                });
        },
    },
});
</script>

<style></style>