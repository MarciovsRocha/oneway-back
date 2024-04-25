using Microsoft.EntityFrameworkCore;

namespace API.DAL;

public partial class ConnectionContext : DbContext
{
    public DbSet<Employee> Employees { get; set; }
    public DbSet<Pais> Pais { get; set; }
    public DbSet<Estado> Estados { get; set; }
    public DbSet<Cidade> Cidades { get; set; }
    public DbSet<Hotel> Hoteis { get; set; }
    public DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlServer("Server=mvsr-oneway.database.windows.net;Database=oneway;User=api_user;Password=bHoiwym4oUGArVGh");
        base.OnConfiguring(optionsBuilder);
    }
}