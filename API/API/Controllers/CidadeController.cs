using API.DAL;
using API.DAL.Interfaces;
using API.ViewModel;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers;

[ApiController]
[Route("api/v1/cidade")]
public class CidadeController : ControllerBase
{
    private readonly ICidadeRepository _cidadeRepository = new CidadeRepository();

    [HttpPost]
    public IActionResult Add(Cidade cidade)
    {
        _cidadeRepository.Add(new Cidade(cidade.Id_Estado, cidade.Nome));
        return Created();
    }

    [HttpGet]
    public IActionResult Get()
    {
        var cidades = _cidadeRepository.Get();
        return Ok(cidades);
    }
    
    [HttpGet("nome={nome}")]
    public IActionResult Get(string nome)
    {
        var cidades = _cidadeRepository.GetByName(nome);
        return Ok(cidades);
    }
    
}


