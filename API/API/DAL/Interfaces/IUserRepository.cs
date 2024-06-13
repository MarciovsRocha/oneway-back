using Microsoft.AspNetCore.Mvc;

namespace API.DAL.Interfaces;

public interface IUserRepository
{
    void Add(User user);
    Task CreateAsync(User user);
    List<User> Get();
    Task<User> GetUserByEmailAsync(string email);
    int GetTotalUsers();
}