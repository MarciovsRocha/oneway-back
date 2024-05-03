using API.DAL;
using API.DAL.Interfaces;
using API.ViewModel;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers;

[ApiController]
[Route("[controller]")]
public class UserController : ControllerBase
{
    private readonly IUserRepository _userRepository = new UserRepository();


    [HttpPost]
    public async Task<IActionResult> AddAsync(UserViewModel user)
    {   
        if (user == null || string.IsNullOrEmpty(user.email) || string.IsNullOrEmpty(user.senha))
        {
            return BadRequest("Campos inválidos.");
        }
        var formattedEmail = user.email.ToLower().Trim();
        var existingUser = await _userRepository.GetUserByEmailAsync(formattedEmail);
        if (existingUser is not null)
        {
            return BadRequest("O e-mail já está em uso.");
        }
        await _userRepository.CreateAsync(new User(user.nome, formattedEmail, user.senha.Trim(), null));
        return Ok();
    }

    [HttpGet]
    public IActionResult Get()
    {
        var users = _userRepository.Get();
        return Ok(users);
    }

    [HttpPost("authenticate")]
    public async Task<IActionResult> AuthenticateAsync(AuthenticationViewModel user)
    {
        if (user != null && !string.IsNullOrEmpty(user.email) && !string.IsNullOrEmpty(user.senha))
        {
            var userFound = await _userRepository.GetUserByEmailAsync(user.email.ToLower());
            if (userFound is not null && userFound.senha == user.senha.Trim()) 
            {
                var userResponse = new UserResponseViewModel(userFound.nome, userFound.email);
                return Ok(userResponse);
            }
        }
        return BadRequest("Usuário ou senha inválidos.");
    }
}
