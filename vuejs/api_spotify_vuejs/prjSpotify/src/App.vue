<template>
    <ion-app>
        <ion-content class="ion-padding">
            <router-view />
        </ion-content>
    </ion-app>
</template>

<script lang="ts" setup>
import { IonApp, IonContent } from '@ionic/vue';
</script>

<style scoped>
ion-content {
    --background: var(--ion-background-color);
    color: var(--ion-text-color);
}
</style>