using API.DAL;
using API.DAL.Interfaces;
using API.ViewModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace API.Controllers;

[ApiController]
[Route("api/v1/user")]
public class UserController : ControllerBase
{
    private readonly IUserRepository _userRepository = new UserRepository();
    

    [HttpPost]
    public IActionResult Add(UserViewModel user)
    {
        _userRepository.Add(new User(user.nome, user.email, "null", user.senha));
        return Ok();
    }

    [HttpGet]
    public IActionResult Get()
    {
        var employees = _userRepository.Get();
        return Ok(employees);
    }
}