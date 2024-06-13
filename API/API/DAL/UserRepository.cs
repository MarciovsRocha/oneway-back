using API.DAL.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace API.DAL;

public class UserRepository : IUserRepository
{

    private readonly ConnectionContext _context;

    public UserRepository(ConnectionContext context)
    {
        _context = context;
    }

    public void Add(User user)
    {
        _context.User.Add(user);
        _context.SaveChanges();
    }

    public async Task CreateAsync(User user)
    {
        await _context.User.AddAsync(user);
        await _context.SaveChangesAsync();
    }

    public List<User> Get()
    {
        return _context.User.ToList();
    }

    public async Task<User> GetUserByEmailAsync(string email)
    {
        return await _context.User.FirstOrDefaultAsync(user => user.email == email);
    }

     public int GetTotalUsers()
    {
        return _context.User.Count();
    }
}