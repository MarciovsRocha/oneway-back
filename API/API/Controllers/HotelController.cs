using API.DAL;
using API.DAL.Interfaces;
using API.ViewModel;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers;

[ApiController]
[Route("api/v1/hotel")]
public class HotelController : ControllerBase
{
    private readonly IHotelRepository _hotelRepository = new HotelRepository();

    [HttpPost]
    public IActionResult Add(HotelViewModel hotelViewModel)
    {
        _hotelRepository.Add(new Hotel(hotelViewModel.Nome, hotelViewModel.PrecoMedioDiaria, hotelViewModel.Id_Cidade));
        return Created();
    }

    [HttpGet]
    public IActionResult Get()
    {
        var hoteis = _hotelRepository.Get();
        return Ok(hoteis);
    }
    
    [HttpGet("id={id}")]
    public IActionResult Get(int id)
    {
        var hotel = _hotelRepository.GetById(id);
        return Ok(hotel);
    }
}