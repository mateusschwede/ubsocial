using Microsoft.EntityFrameworkCore;
using CatAPI.Models;

namespace CatAPI.Data
{
    public class AppDbContext(DbContextOptions<AppDbContext> options) : DbContext(options)
    {
        public DbSet<Cat> Cats => Set<Cat>();
    }
}