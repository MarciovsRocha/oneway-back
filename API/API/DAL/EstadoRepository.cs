namespace API.DAL;

public class EstadoRepository : IEstadoRepository
{
    private readonly ConnectionContext _context = new ConnectionContext();
    
    public void Add(Estado estado)
    {
        _context.Estados.Add(estado);
        _context.SaveChanges();
    }

    public List<Estado> Get()
    {
        return _context.Estados.ToList();
    }
}