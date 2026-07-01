<script setup lang="ts">
import { useApod } from "@/composables/useApod";

const { data, loading, error } = useApod();
</script>

<template>
    <div>
        <h1>NASA - Foto do Dia</h1>

        <div v-if="loading">Carregando...</div>
        <div v-else-if="error">{{ error }}</div>

        <div v-else-if="data">
            <h2>{{ data.title }}</h2>
            <img :src="data.url" alt="NASA Image" width="500" />
            <p>{{ data.explanation }}</p>
        </div>

        <h3>JSON recebido:</h3>
        <pre v-if="data">
            {{ JSON.stringify(data, null, 2) }}
        </pre>
    </div>
</template>