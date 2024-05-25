namespace API.DAL.Interfaces;

public interface IEstadoRepository
{
    void Add(Estado estado);
    List<Estado> Get();
    Estado GetById(int id);
    void Update(Estado estado);
    void Remove(Estado estado);
    void Remove(int id_estado);
}