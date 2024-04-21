using API.DAL;
using API.ViewModel;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers;

[ApiController]
[Route("api/v1/pais")]
public class PaisController : ControllerBase
{
    private readonly IPaisRepository _paisRepository = new PaisRepository();
    
    [HttpPost]
    public IActionResult Add(PaisViewModel paisViewModel)
    {
        _paisRepository.Add(new Pais(paisViewModel.Nome));
        return Ok();
    }

    [HttpGet]
    public IActionResult Get()
    {
        var paises = _paisRepository.Get();
        return Ok(paises);
    }
}