namespace AuthSerever;

public interface IUserRepository
{
    void Add(User user);
    List<User> Get();
}