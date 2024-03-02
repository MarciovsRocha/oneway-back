using Microsoft.AspNetCore.Mvc;

namespace API.Controllers;

[ApiController]
[Route("[controller]")]
public class ProdutoController : ControllerBase
{
    public ProdutoController()
    {
    }

    [HttpGet(Name = "GetProduto")]
    public IEnumerable<Produto> Get()
    {
        return Enumerable.Range(1, 10).Select(index=> new Produto{id = Random.Shared.Next(1,100), preco = Random.Shared.NextDouble()}).ToArray();
    }
}