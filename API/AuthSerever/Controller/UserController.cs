using AuthSerever.DAL;
using AuthSerever.ViewModel;
using Microsoft.AspNetCore.Mvc;

namespace AuthSerever.Controller;

[ApiController]
[Route("api/v1/user")]
public class UserController : ControllerBase
{
    private readonly IUserRepository _userRepository = new UserRepository();

    [HttpPost]
    public IActionResult Add(UserViewModel userView)
    {
        _userRepository.Add(new User(userView.Nome, userView.Email, userView.Senha ));
        return Ok();
    }

}