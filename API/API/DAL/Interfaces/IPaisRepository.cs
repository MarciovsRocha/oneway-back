namespace API.DAL.Interfaces;

public interface IPaisRepository
{
    void Add(Pais pais);
    List<Pais> Get();
    Pais GetByName(string nome);
}