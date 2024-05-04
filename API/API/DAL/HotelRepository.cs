using API.DAL.Interfaces;

namespace API.DAL;

public class HotelRepository : IHotelRepository
{
    private readonly ConnectionContext _context = new ConnectionContext();
    
    public void Add(Hotel hotel)
    {
        _context.Hotel.Add(hotel);
        _context.SaveChanges();
    }

    public List<Hotel> Get()
    {
        return _context.Hotel.ToList();
    }

    public Hotel GetById(int id)
    {
        return _context.Hotel.FirstOrDefault(h => h.Id == id);
    }
}