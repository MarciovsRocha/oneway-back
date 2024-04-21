namespace API.DAL;

public class HotelRepository : IHotelRepository
{
    private readonly ConnectionContext _context = new ConnectionContext();
    
    public void Add(Hotel hotel)
    {
        _context.Hoteis.Add(hotel);
        _context.SaveChanges();
    }

    public List<Hotel> Get()
    {
        return _context.Hoteis.ToList();
    }
}