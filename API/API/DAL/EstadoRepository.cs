using API.DAL.Interfaces;

namespace API.DAL;

public class EstadoRepository : IEstadoRepository
{
    private readonly ConnectionContext _context = new ConnectionContext();
    
    public void Add(Estado estado)
    {
        _context.Estado.Add(estado);
        _context.SaveChanges();
    }

    public List<Estado> Get()
    {
        return _context.Estado.ToList();
    }

    public Estado GetById(int id)
    {
        return _context.Estado.FirstOrDefault(e => e.Id == id);
    }

    public void Update(Estado estado)
    {
        _context.Estado.Update(estado);
        _context.SaveChanges();
    }

    public void Remove(Estado estado)
    {
        _context.Remove(estado);
        _context.SaveChanges();
    }

    public void Remove(int id_estado)
    {
        var estado_remove = GetById(id_estado);
        _context.Estado.Remove(estado_remove);
        _context.SaveChanges();
    }
}