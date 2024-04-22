using API.DAL.Interfaces;

namespace API.DAL;

public class CidadeRepository : ICidadeRepository
{
    private readonly ConnectionContext _context = new ConnectionContext();
    
    public void Add(Cidade cidade)
    {
        _context.Cidades.Add(cidade);
        _context.SaveChanges();
    }

    public List<Cidade> Get()
    {
        return _context.Cidades.ToList();
    }
}