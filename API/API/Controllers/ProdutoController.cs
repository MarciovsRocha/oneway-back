using API.DAL.Interfaces;
using API.DAL;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Query;

namespace API.Controllers;

[ApiController]
[Route("api/v1/produto")]
public class ProdutoController : ControllerBase
{
    private readonly IProdutoRepository _produtoRepository;

    public ProdutoController(IProdutoRepository produtoRepository)
    {
        _produtoRepository = produtoRepository;
    }

    [HttpPost]
    public IActionResult Add(Produto produto)
    {
        _produtoRepository.Add(produto);
        return Created();
    }

    [HttpGet]
    public IActionResult Get()
    {
        var produtos = _produtoRepository.Get();
        return Ok(produtos);
    }
    
    [HttpGet("id={id:int}")]
    public IActionResult Get(int id)
    {
        var produto = _produtoRepository.GetById(id);
        return Ok(produto);
    }

    [HttpPut]
    public IActionResult Update(Produto produto)
    {
        _produtoRepository.Update(produto);
        return Ok();
    }

    [HttpDelete]
    public IActionResult Remove(Produto produto)
    {
        _produtoRepository.Remove(produto);
        return Ok();
    }
    
    [HttpDelete("id={id:int}")]
    public IActionResult Remove(int id){
        _produtoRepository.Remove(id);
        return Ok();
    }

    [HttpGet("type={type:int}")]
    public IActionResult GetByType(int type)
    {
        var produto = _produtoRepository.GetByType(type);
        return Ok(produto);
    }
    
}