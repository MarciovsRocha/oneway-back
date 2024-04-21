using Microsoft.EntityFrameworkCore.Migrations.Operations;

namespace API;

public interface IEstadoRepository
{
    void Add(Estado estado);
    List<Estado> Get();
}