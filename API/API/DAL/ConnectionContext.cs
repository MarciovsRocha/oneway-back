using Microsoft.EntityFrameworkCore;

namespace API.DAL;

public partial class ConnectionContext : DbContext
{
    public DbSet<Employee> Employees { get; set; }
    public DbSet<Pais> Pais { get; set; }
    public DbSet<Estado> Estado { get; set; }
    public DbSet<Cidade> Cidade { get; set; }
    public DbSet<Hotel> Hotel { get; set; }
    public DbSet<User> User { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlServer("Server=mvsr-oneway.database.windows.net;Database=oneway;User=api_user;Password=bHoiwym4oUGArVGh");
        base.OnConfiguring(optionsBuilder);
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        // Configura model de Pais
        // modelBuilder.Entity<Pais>()
        //     .HasMany(p => p.Estados)
        //     .WithOne(e => e.Pais)
        //     .HasForeignKey(e => e.Id_Pais)
        //     .HasPrincipalKey(e => e.Id);
        
        // Configura model de Pais
        // modelBuilder.Entity<Estado>()
        //     .HasMany(p => p.Cidades)
        //     .WithOne(e => e.Estado)
        //     .HasForeignKey(e => e.Id_Estado)
        //     .HasPrincipalKey(e => e.Id);
        
        
    }

}