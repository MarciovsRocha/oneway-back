namespace API.DAL;

public class PaisRepository : IPaisRepository
{
    private readonly ConnectionContext _context = new ConnectionContext();


    public void Add(Pais pais)
    {
        _context.Pais.Add(pais);
        _context.SaveChanges();
    }

    public List<Pais> Get()
    {
        return _context.Pais.ToList();
    }
}