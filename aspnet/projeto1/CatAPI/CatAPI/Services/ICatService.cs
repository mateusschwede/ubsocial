using CatAPI.DTOs;

namespace CatAPI.Services
{
    public interface ICatService
    {
        Task<List<CatResponse>> GetAllCatsAsync();
        Task<CatResponse?> GetCatByIdAsync(int id);
        Task<CatResponse> AddCatAsync(CreateCatRequest cat);
        Task<bool> UpdateCatAsync(int id, UpdateCatRequest cat);
        Task<bool> DeleteCatAsync(int id);
    }
}