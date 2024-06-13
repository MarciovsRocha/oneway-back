using API.DAL;
using API.DAL.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers;

[ApiController]
[Route("user")]
public class UserController : ControllerBase
{
    private readonly IUserRepository _userRepository;

    public UserController(IUserRepository userRepository)
    {
        _userRepository = userRepository;
    }

    [HttpPost]
    public async Task<IActionResult> AddAsync(User user)
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

    [HttpGet("total")]
    public IActionResult GetTotalUsuarios()
    {
        int totalUsuarios = _userRepository.GetTotalUsers();
        return Ok(totalUsuarios);
    }
}
