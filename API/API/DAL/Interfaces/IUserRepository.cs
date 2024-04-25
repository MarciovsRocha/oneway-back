namespace API.DAL.Interfaces;

public interface IUserRepository
{
    void Add(User user);

    List<User> Get();

}