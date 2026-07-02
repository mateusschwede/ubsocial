<template>
    <ion-page>
        <ion-header>
            <ion-toolbar>
                <ion-title>Autenticando...</ion-title>
            </ion-toolbar>
        </ion-header>

        <ion-content class="ion-padding">
            <ion-spinner name="crescent" />
            <p>Autenticando com Spotify...</p>
        </ion-content>
    </ion-page>
</template>

<script lang="ts" setup>
import { onMounted } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import { fetchAccessToken } from '../services/auth';

const route = useRoute();
const router = useRouter();

onMounted(async () => {
    const code = route.query.code as string;
    const verifier = route.query.state as string; // ← novo

    if (!code || !verifier) {
        alert('Código de autorização ou estado ausente.');
        router.replace('/');
        return;
    }

    try {
        console.log('Código recebido na URL:', code);
        console.log('Verifier recebido via state:', verifier);
        const token = await fetchAccessToken(code, verifier);
        console.log('Token recebido com sucesso:', token);
    } catch (error) {
        console.error('Erro ao obter access_token:', error);
        alert('Erro ao autenticar com o Spotify.');
    } finally {
        router.replace('/');
    }
});
</script>