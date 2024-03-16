namespace AuthSerever.DAL;

public class UserRepository : IUserRepository
{
    private readonly ConnectionContext _context = new ConnectionContext();

    public void Add(User user)
    {
        _context.User.Add(user);
        _context.SaveChanges();
    }

    public List<User> Get()
    {
        return _context.User.ToList();
    }
}