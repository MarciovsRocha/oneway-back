using Microsoft.EntityFrameworkCore;

namespace AuthSerever.DAL;

public class ConnectionContext : DbContext
{
    public DbSet<User> User { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlServer("Server=oneway2.database.windows.net;Database=oneway;User=api_user;Password=bHoiwym4oUGArVGh");
        base.OnConfiguring(optionsBuilder);
    }
}