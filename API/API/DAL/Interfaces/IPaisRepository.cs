namespace API.DAL.Interfaces;

public interface IPaisRepository
{
    void Add(Pais pais);
    List<Pais> Get();
    Pais GetByName(string nome);
    Pais GetById(int id);
    void Update(Pais pais);
    void Remove(int id_pais);
    void Remove(Pais pais);
}