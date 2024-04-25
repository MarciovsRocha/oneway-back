namespace API.DAL.Interfaces;

public interface IHotelRepository
{
    void Add(Hotel hotel);
    List<Hotel> Get();
    Hotel GetById(int id);
}