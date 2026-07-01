import { ref, onMounted } from "vue";
import { getApod } from "@/services/nasaService";
import type { Apod } from "@/types/Apod";

export function useApod() {
    const data = ref<Apod | null>(null);
    const loading = ref(true);
    const error = ref<string | null>(null);

    const fetchApod = async () => {
        try {
            data.value = await getApod();
        } catch (err) {
            error.value = "Erro ao carregar dados";
        } finally {
            loading.value = false;
        }
    };

    onMounted(fetchApod);
    return { data, loading, error };
}