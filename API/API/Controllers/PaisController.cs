using API.DAL;
using API.DAL.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Identity.Client;

namespace API.Controllers;

[ApiController]
[Route("api/v1/pais")]
public class PaisController : ControllerBase
{
    private readonly IPaisRepository _paisRepository;

    public PaisController(IPaisRepository paisRepository)
    {
        _paisRepository = paisRepository;
    }

    [HttpPost]
    public IActionResult Add(Pais paisViewModel)
    {
        _paisRepository.Add(paisViewModel);
        return Created();
    }

    [HttpGet]
    public IActionResult Get()
    {
        var paises = _paisRepository.Get();
        return Ok(paises);
    }

    [HttpGet("nome={nome}")]
    public IActionResult Get(string nome)
    {
        var pais = _paisRepository.GetByName(nome);
        return Ok(pais);
    }

    [HttpGet("id=i{d:int}")]
    public IActionResult Get(int id)
    {
        var pais = _paisRepository.GetById(id);
        return Ok(pais);
    }

    [HttpPut]
    public IActionResult Update(Pais pais)
    {
        _paisRepository.Update(pais);
        return Ok();
    }

    [HttpDelete]
    public IActionResult Remove(Pais pais)
    {
        _paisRepository.Remove(pais);
        return Ok();
    }

    [HttpDelete("id={id:int}")]
    public IActionResult Remove(int id)
    {
        _paisRepository.Remove(id);
        return Ok();
    }
}