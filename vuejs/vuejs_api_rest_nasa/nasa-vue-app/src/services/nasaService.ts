import { api } from "./api";

const API_KEY = import.meta.env.VITE_NASA_API_KEY;

export const getApod = async () => {
    const response = await api.get("/planetary/apod", {
        params: { api_key: API_KEY },
    });
    return response.data;
};