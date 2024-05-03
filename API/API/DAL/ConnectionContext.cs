using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace API.DAL;

public partial class ConnectionContext : DbContext
{
    private readonly IConfiguration _configuration;
    
    public DbSet<Employee> Employees { get; set; }
    public DbSet<Pais> Pais { get; set; }
    public DbSet<Estado> Estados { get; set; }
    public DbSet<Cidade> Cidades { get; set; }
    public DbSet<Hotel> Hoteis { get; set; }
    public DbSet<User> User { get; set; }

    public ConnectionContext(IConfiguration configuration)
    {
        _configuration = configuration;
    }
    
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlServer(_configuration.GetValue<string>("ConnectionStrings:DefaultConnection"));
        base.OnConfiguring(optionsBuilder);
    }
}