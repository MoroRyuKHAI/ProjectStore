using System.Data.Entity;

namespace Chain_of_Stores
{
    public class EFDbContext : DbContext
    {
        public DbSet<Stores> Storeses { get; set; }
    }
}