namespace API;

public interface IHotelRepository
{
    void Add(Hotel hotel);
    List<Hotel> Get();
}