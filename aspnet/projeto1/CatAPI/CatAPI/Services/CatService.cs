using Microsoft.EntityFrameworkCore;
using CatAPI.Data;
using CatAPI.DTOs;
using CatAPI.Models;

namespace CatAPI.Services
{
    public class CatService(AppDbContext context) : ICatService
    {
        public async Task<CatResponse> AddCatAsync(CreateCatRequest cat)
        {
            var newCat = new Cat
            {
                Name = cat.Name,
                Breed = cat.Breed
            };

            context.Cats.Add(newCat);
            await context.SaveChangesAsync();
            return new CatResponse
            {
                Id = newCat.Id,
                Name = newCat.Name,
                Breed = newCat.Breed
            };
        }

        public async Task<bool> DeleteCatAsync(int id)
        {
            var catToDelete = await context.Cats.FindAsync(id);
            if (catToDelete is null)
                return false;

            context.Cats.Remove(catToDelete);
            await context.SaveChangesAsync();
            return true;
        }

        public async Task<List<CatResponse>> GetAllCatsAsync()
            => await context.Cats.Select(c => new CatResponse
            {
                Id = c.Id,
                Name = c.Name,
                Breed = c.Breed
            }).ToListAsync();

        public async Task<CatResponse?> GetCatByIdAsync(int id)
        {
            var result = await context.Cats
                .Where(c => c.Id == id)
                .Select(c => new CatResponse
                {
                    Id = c.Id,
                    Name = c.Name,
                    Breed = c.Breed
                })
                .FirstOrDefaultAsync();

            return result;
        }

        public async Task<bool> UpdateCatAsync(int id, UpdateCatRequest cat)
        {
            var existingCat = await context.Cats.FindAsync(id);
            if (existingCat is null)
                return false;

            existingCat.Name = cat.Name;
            existingCat.Breed = cat.Breed;

            await context.SaveChangesAsync();
            return true;
        }
    }
}