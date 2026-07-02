import { createWebHistory, createRouter } from "vue-router";
import { RouteRecordRaw } from "vue-router";

const routes: Array<RouteRecordRaw> = [
    {
        path: "/",
        alias: "/books",
        name: "books",
        component: () => import("./components/BooksList.vue"),
    },
    {
        path: "/books/:id",
        name: "book-details",
        component: () => import("./components/BookDetails.vue"),
    },
    {
        path: "/add",
        name: "add",
        component: () => import("./components/AddBook.vue"),
    },
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

export default router;