using LoymarkAPI.Entities;
using Microsoft.EntityFrameworkCore;

namespace LoymarkAPI.Data
{
    public class ApiDbContext : DbContext
    {
        public DbSet<User>? Users { get; set; }
        public DbSet<Activity>? Activities { get; set; }
        public DbSet<Country>? Countries { get; set; }
        public ApiDbContext(DbContextOptions options) : base(options)
        {
        }
    }
}
