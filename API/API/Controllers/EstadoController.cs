using API.DAL;
using API.DAL.Interfaces;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers;

[ApiController]
[Route("api/v1/estado")]
public class EstadoController : ControllerBase
{
    private readonly IEstadoRepository _estadoRepository;

    public EstadoController(IEstadoRepository estadoRepository)
    {
        _estadoRepository = estadoRepository;
    }

    [HttpPost]
    public IActionResult Add(Estado estado)
    {
        _estadoRepository.Add(estado);
        return Created();
    }

    [HttpGet]
    public IActionResult Get()
    {
        var estados = _estadoRepository.Get();
        return Ok(estados);
    }

    [HttpGet("id={id:int}")]
    public IActionResult Get(int id)
    {
        var estado = _estadoRepository.GetById(id);
        return Ok(estado);
    }

    [HttpPut]
    public IActionResult Update(Estado estado)
    {
        _estadoRepository.Update(estado);
        return Ok();
    }

    [HttpDelete]
    public IActionResult Remove(Estado estado)
    {
        _estadoRepository.Remove(estado);
        return Ok();
    }

    [HttpDelete("id={id:int}")]
    public IActionResult Remove(int id)
    {
        _estadoRepository.Remove(id);
        return Ok();
    }
}