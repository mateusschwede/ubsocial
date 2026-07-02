import http from "@/http-common";
import Book from "@/types/Book";
import ResponseData from "@/types/ResponseData";

class BookDataService {
    getAll(): Promise<ResponseData> {
        return http.get("/books");
    }

    get(id: number): Promise<ResponseData> {
        return http.get(`/books/${id}`);
    }

    create(data: Partial<Book>): Promise<ResponseData> {
        return http.post("/books", data);
    }

    update(id: number, data: Partial<Book>): Promise<ResponseData> {
        return http.put(`/books/${id}`, data);
    }

    delete(id: number): Promise<ResponseData> {
        return http.delete(`/books/${id}`);
    }
}

export default new BookDataService();