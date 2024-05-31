using API.DAL.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace API.DAL;

public class ConnectionContext : DbContext, IConnectionContext
{
    public DbSet<Employee> Employees { get; set; }
    public DbSet<Pais> Pais { get; set; }
    public DbSet<Estado> Estado { get; set; }
    public DbSet<Cidade> Cidade { get; set; }
    public DbSet<Produto> Produto { get; set; }
    public DbSet<User> User { get; set; }

    public ConnectionContext(DbContextOptions options) : base(options) { }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Employee>().HasKey(e => e.id);
        modelBuilder.Entity<Pais>()
            .HasMany(p => p.Estados)
            .WithOne(e=>e.Pais)
            .HasForeignKey(estado => estado.Id_Pais)
            .HasPrincipalKey(pais => pais.Id);
        modelBuilder.Entity<Estado>()
            .HasMany<Cidade>(estado => estado.Cidades)
            .WithOne(cidade => cidade.Estado)
            .HasForeignKey("Id_Estado")
            .HasPrincipalKey(estado => estado.Id);
        modelBuilder.Entity<Produto>()
            .HasOne(produto => produto.Cidade)
            .WithMany(cidade => cidade.Produtos)
            .HasForeignKey("Id_Cidade")
            .HasPrincipalKey(cidade => cidade.Id);
        modelBuilder.Entity<User>().HasKey(u => u.id);
        base.OnModelCreating(modelBuilder); 
    }
}