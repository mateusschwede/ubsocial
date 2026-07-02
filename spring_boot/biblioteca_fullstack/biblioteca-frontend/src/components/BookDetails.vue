<template>
    <div v-if="currentBook.id">
        <h4>Livro {{ currentBook.id }} - {{ currentBook.title }}</h4>
        <form @submit.prevent="updateBook">
            <div class="form-group">
                <input type="text" class="form-control" v-model="currentBook.title" placeholder="Título" required
                    id="title" name="title" />
            </div>
            <div class="form-group">
                <input type="text" class="form-control" v-model="currentBook.author" placeholder="Autor(a)" required
                    id="author" name="author" />
            </div>
            <div class="form-group">
                <label for="published_date">Publicação:</label>
                <input type="date" class="form-control" v-model="currentBook.published_date" required
                    id="published_date" name="published_date" :max="new Date().toISOString().split('T')[0]" />
            </div>
            <div class="form-group">
                <input type="text" class="form-control" v-model="currentBook.isbn" placeholder="ISBN" required id="isbn"
                    name="isbn" pattern="^\d{13}$" />
            </div>
            <div class="form-group">
                <input type="number" class="form-control" v-model="currentBook.pages" placeholder="Páginas" required
                    id="pages" name="pages" min="1" />
            </div>
            <div class="form-group">
                <input type="text" name="cover" class="form-control" v-model="currentBook.cover" placeholder="Capa"
                    required id="cover" />
            </div>
            <div class="form-group">
                <input type="text" class="form-control" v-model="currentBook.language" placeholder="Idioma" required
                    id="language" name="language" />
            </div>
            <button type="button" class="btn btn-secondary" @click="$router.push('/books')">Cancelar</button>
            <button type="submit" class="btn btn-warning">Confirmar</button>
        </form>
        <p>{{ message }}</p>
    </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import BookDataService from '@/services/BookDataService';
import Book from '@/types/Book';
import ResponseData from '@/types/ResponseData';

export default defineComponent({
    name: 'bookDetails',
    data() {
        return {
            currentBook: {} as Book,
            message: "",
        };
    },
    methods: {
        getBook(id: any) {
            BookDataService.get(id)
                .then((response: ResponseData) => {
                    this.currentBook = response.data;
                })
                .catch((e: Error) => {
                    console.error(e);
                });
        },
        updateBook() {
            BookDataService.update(this.currentBook.id, this.currentBook)
                .then((response: ResponseData) => {
                    this.$router.push({ name: "books" });
                })
                .catch((e: Error) => {
                    console.error(e);
                    this.message = "Erro ao atualizar o livro: " + e.message;
                });
        },
        deleteBook(id: number) {
            BookDataService.delete(this.currentBook.id)
                .then((response: ResponseData) => {
                    console.log(response.data);
                    this.$router.push({ name: "books" });
                })
                .catch((e: Error) => {
                    console.error(e);
                });
        },
    },
    mounted() {
        this.message = "";
        this.getBook(this.$route.params.id);
    },
});
</script>

<style></style>