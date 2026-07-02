<template>
    <h4>Lista de livros:</h4>

    <input type="text" class="form-control mb-3" placeholder="Pesquisar" v-model="searchTitle" />

    <ul>
        <li :class="{ active: index === currentIndex }" v-for="(book, index) in filteredBooks" :key="book.id">
            {{ book.title }}
            <button class="btn btn-primary btn-sm" @click="setActiveBook(book, index)">Ver</button>
            <router-link :to="'/books/' + book.id" class="btn btn-warning btn-sm">Editar</router-link>
            <button class="btn btn-danger btn-sm" @click="deleteBook(book.id)">Excluir</button>
        </li>
    </ul>

    <div v-if="currentBook.id">
        <h4>Livro {{ currentBook.id }}</h4>
        <p>Título: {{ currentBook.title }}</p>
        <p>Autor(a): {{ currentBook.author }}</p>
        <p>Publicação: {{ currentBook.published_date }}</p>
        <p>ISBN: {{ currentBook.isbn }}</p>
        <p>Páginas: {{ currentBook.pages }}</p>
        <p>Capa: {{ currentBook.cover }}</p>
        <p>Idioma: {{ currentBook.language }}</p>
        <router-link :to="'/books/' + currentBook.id" class="btn btn-warning btn-sm">Editar</router-link>
        <button @click="deleteBook(currentBook.id)" class="btn btn-danger btn-sm">Excluir</button>
    </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import BookDataService from '@/services/BookDataService';
import Book from '@/types/Book';
import ResponseData from '@/types/ResponseData';

export default defineComponent({
    name: 'books-list',
    data() {
        return {
            books: [] as Book[],
            currentBook: {} as Book,
            currentIndex: -1,
            searchTitle: "",
        };
    },
    computed: {
        filteredBooks(): Book[] {
            return this.books.filter(book =>
                book.title.toLowerCase().includes(this.searchTitle.toLowerCase())
            );
        },
    },
    methods: {
        retrieveBooks() {
            BookDataService.getAll()
                .then((response: ResponseData) => {
                    this.books = response.data;
                })
                .catch((e: Error) => {
                    console.error(e);
                });
        },
        refreshList() {
            this.retrieveBooks();
            this.currentBook = {} as Book;
            this.currentIndex = -1;
        },
        setActiveBook(book: Book, index = -1) {
            this.currentBook = book;
            this.currentIndex = index;
        },
        deleteBook(id: number) {
            BookDataService.delete(id)
                .then((response: ResponseData) => {
                    this.refreshList();
                })
                .catch((e: Error) => {
                    console.error(e);
                });
        },
    },
    mounted() {
        this.retrieveBooks();
    },
});
</script>

<style></style>