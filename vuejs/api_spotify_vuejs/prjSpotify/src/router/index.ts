import { createRouter, createWebHistory } from 'vue-router';
import HomeView from '../views/HomeView.vue';
import CallbackView from '../views/CallbackView.vue';

const routes = [
    {
        path: '/',
        name: 'Home',
        component: HomeView
    },
    {
        path: '/callback',
        name: 'Callback',
        component: CallbackView
    }
];

const router = createRouter({
    history: createWebHistory(),
    routes
});

export default router;