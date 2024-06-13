using API.DAL;
using API.DAL.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers;

[ApiController]
[Route("api/v1/cidade")]
public class CidadeController : ControllerBase
{
    private readonly ICidadeRepository _cidadeRepository;

    public CidadeController(ICidadeRepository cidadeRepository)
    {
        _cidadeRepository = cidadeRepository;
    }

    [HttpPost]
    public IActionResult Add(Cidade cidade)
    {
        _cidadeRepository.Add(cidade);
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

    [HttpGet("id={id:int}")]
    public IActionResult Get(int id)
    {
        var cidade = _cidadeRepository.GetById(id);
        return Ok(cidade);
    }

    [HttpPut]
    public IActionResult Update(Cidade cidade)
    {
        _cidadeRepository.Update(cidade);
        return Ok();
    }
    
    [HttpDelete]
    public IActionResult Remove(Cidade cidade)
    {
        _cidadeRepository.Remove(cidade);
        return Ok();
    }

    [HttpDelete("id={id:int}")]
    public IActionResult Remove(int id)
    {
        _cidadeRepository.Remove(id);
        return Ok();
    }

    [HttpGet("produto/top={top:int}")]
    public IActionResult GetTopCidadesByProductCount(int top)
    {
        List<CidadeProdutosDTO> cidades = _cidadeRepository.GetTopCitiesByProductCount(top);
        return Ok(cidades);
    }

    [HttpGet("busca/nome={nome}")]
    public IActionResult GetLocationList(string nome)
    {
        return Ok(_cidadeRepository.GetLocationList(nome));
    }
    
}


