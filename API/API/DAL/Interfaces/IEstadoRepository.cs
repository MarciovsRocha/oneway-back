namespace API.DAL.Interfaces;

public interface IEstadoRepository
{
    void Add(Estado estado);
    List<Estado> Get();
}