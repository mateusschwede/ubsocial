<template>
    <ion-page>
        <ion-header>
            <ion-toolbar color="primary">
                <ion-title class="ion-text-center ">Spotify Playlist</ion-title>
            </ion-toolbar>
        </ion-header>

        <ion-content class="ion-padding">

            <ion-card v-if="!hasToken" class="ion-text-center">
                <ion-card-header>
                    <ion-card-title>Conectar ao Spotify</ion-card-title>
                    <ion-card-subtitle>Acesse suas playlists públicas</ion-card-subtitle>
                </ion-card-header>
                <ion-button expand="block" color="success" @click="loginWithSpotify">
                    Login com Spotify
                </ion-button>
            </ion-card>

            <ion-card v-if="hasToken">
                <ion-card-header>
                    <ion-card-title>Buscar Playlist</ion-card-title>
                </ion-card-header>
                <ion-card-content>
                    <ion-item>
                        <ion-label position="stacked">URL da Playlist</ion-label>
                        <ion-input v-model="url" placeholder="https://open.spotify.com/playlist/..."
                            clear-input></ion-input>
                    </ion-item>
                    <ion-button expand="block" class="ion-margin-top" :disabled="!url" @click="submit">
                        Ver Playlist
                    </ion-button>
                </ion-card-content>
            </ion-card>

            <div v-if="loading" class="ion-text-center ion-margin-top">
                <ion-spinner name="crescent" />
                <p>Carregando playlist...</p>
            </div>

            <div v-if="playlist">
                <ion-grid>
                    <ion-row class="ion-justify-content-center">
                        <ion-col size="12" size-md="6" size-lg="4">
                            <ion-card class="playlist-cover-card ion-text-center ion-padding">
                                <ion-img :src="playlist.images[0]?.url" alt="Capa da Playlist" />
                                <h1>{{ playlist.name }}</h1>
                                <p>{{ playlist.description || 'Sem descrição disponível' }}</p>
                            </ion-card>
                        </ion-col>
                    </ion-row>

                    <ion-row>
                        <ion-col v-for="item in playlist.tracks.items" :key="item.track.id" size="12" size-sm="6"
                            size-md="4" size-lg="3" class="ion-padding">
                            <ion-card class="track-card ion-text-light">
                                <ion-img :src="item.track.album.images[1]?.url || item.track.album.images[0]?.url"
                                    alt="Capa do Álbum" />
                                <ion-card-header>
                                    <ion-card-title>{{ item.track.name }}</ion-card-title>
                                    <ion-card-subtitle>{{item.track.artists.map(a => a.name).join(', ')
                                        }}</ion-card-subtitle>
                                </ion-card-header>
                                <ion-card-content class="ion-text-center">
                                    <ion-button expand="block" color="success" shape="round" fill="solid"
                                        :href="item.track.external_urls.spotify" target="_blank"
                                        rel="noopener noreferrer">
                                        Ouvir
                                        <ion-icon name="play-outline" slot="end" />
                                    </ion-button>
                                </ion-card-content>
                            </ion-card>
                        </ion-col>
                    </ion-row>
                </ion-grid>
            </div>

        </ion-content>
    </ion-page>
</template>

<script lang="ts" setup>
import { ref } from 'vue';
import axios from 'axios';
import {
    IonPage,
    IonHeader,
    IonToolbar,
    IonTitle,
    IonContent,
    IonInput,
    IonItem,
    IonButton,
    IonCard,
    IonCardHeader,
    IonCardTitle,
    IonCardSubtitle,
    IonCardContent,
    IonGrid,
    IonRow,
    IonCol,
    IonSpinner,
    IonIcon,
    IonImg
} from '@ionic/vue';

import { redirectToSpotifyLogin, getAccessToken } from '../services/auth';
import { playOutline } from 'ionicons/icons';
import { addIcons } from 'ionicons';

addIcons({ 'play-outline': playOutline });

const url = ref('');
const playlist = ref<any | null>(null);
const loading = ref(false);
const hasToken = ref(!!getAccessToken());

function loginWithSpotify() {
    redirectToSpotifyLogin();
}

async function submit() {
    const token = getAccessToken();
    if (!token) {
        alert('Você precisa estar logado no Spotify.');
        return;
    }

    const match = url.value.match(/playlist\/([a-zA-Z0-9]+)/);
    if (!match) {
        alert('URL inválida.');
        return;
    }

    const playlistId = match[1];
    loading.value = true;
    playlist.value = null;

    try {
        const { data } = await axios.get(`https://api.spotify.com/v1/playlists/${playlistId}`, {
            headers: { Authorization: `Bearer ${token}` }
        });
        playlist.value = data;
    } catch {
        alert('Erro ao buscar playlist. Verifique se a playlist é pública ou seu token está válido.');
    } finally {
        loading.value = false;
    }
}
</script>

<style scoped>
ion-card.track-card {
    border-radius: 16px;
    overflow: hidden;
    background-color: #222;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.7);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
    margin: 0 12px 20px 12px;
}

ion-card.track-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 8px 28px rgba(0, 0, 0, 0.9);
}

ion-card.track-card ion-img {
    height: 200px;
    object-fit: cover;
}

ion-card.track-card ion-card-title {
    font-size: 1.2rem;
    font-weight: 700;
    color: #fff;
}

ion-card.track-card ion-card-subtitle {
    font-size: 1rem;
    color: #bbb;
}

ion-card.playlist-cover-card {
    border-radius: 20px;
    background-color: #1e1e1e;
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.8);
    margin: 24px auto 32px auto;
    max-width: 100%;
    color: #eee;
    transition: box-shadow 0.3s ease;
}

ion-card.playlist-cover-card:hover {
    box-shadow: 0 12px 40px rgba(0, 0, 0, 1);
}

ion-card.playlist-cover-card ion-img {
    max-width: 220px;
    height: auto;
    border-radius: 24px;
    object-fit: cover;
    margin: 0 auto 20px auto;
    box-shadow: 0 6px 16px rgba(0, 0, 0, 0.7);
}

ion-card.playlist-cover-card h1 {
    font-size: 2rem;
    font-weight: 800;
    margin-bottom: 12px;
    color: #fff;
}

ion-card.playlist-cover-card p {
    font-size: 1.1rem;
    color: #ccc;
    padding: 0 12px;
    line-height: 1.4;
    user-select: text;
}
</style>