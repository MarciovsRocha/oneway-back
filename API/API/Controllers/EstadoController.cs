using API.DAL;
using API.DAL.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers;

[ApiController]
[Route("api/v1/estado")]
public class EstadoController : ControllerBase
{
    private readonly IEstadoRepository _estadoRepository = new EstadoRepository();
    
    [HttpPost]
    public IActionResult Add(Estado estado)
    {
        _estadoRepository.Add(new Estado(estado.Nome, estado.Id_Pais));
        return Created();
    }

    [HttpGet]
    public IActionResult Get()
    {
        var estados = _estadoRepository.Get();
        return Ok(estados);
    }
}