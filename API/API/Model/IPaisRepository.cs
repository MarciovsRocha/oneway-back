namespace API;

public interface IPaisRepository
{
    void Add(Pais pais);
    List<Pais> Get();
}