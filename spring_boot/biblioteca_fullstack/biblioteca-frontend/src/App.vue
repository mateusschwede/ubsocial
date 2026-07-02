<template>
    <div id="app">
        <h1>Livraria UB Social</h1>
        <router-link to="/" class="btn btn-primary">Home</router-link>
        <router-link to="/add" class="btn btn-success">Adicionar livro</router-link>
        <router-view />
    </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';

export default defineComponent({
    name: 'App',
});
</script>

<style></style>