<template>
    <router-view />
    
    <h3>JSON recebido</h3>
</template>

<script setup lang="ts">
import { useApod } from "@/composables/useApod";

const { data, loading, error } = useApod();

console.log(data.value); // 👈 correto
</script>