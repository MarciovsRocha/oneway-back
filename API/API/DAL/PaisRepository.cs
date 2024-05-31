using API.DAL.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace API.DAL;

public class PaisRepository : IPaisRepository
{
    private readonly ConnectionContext _context;

    public PaisRepository(ConnectionContext context)
    {
        _context = context;
    }

    public void Add(Pais pais)
    {
        _context.Pais.Add(pais);
        _context.SaveChanges();
    }

    public List<Pais> Get()
    {
        return _context.Pais.Include(pais => pais.Estados).ToList();
    }

    public Pais GetByName(string nome)
    {
        return _context.Pais.FirstOrDefault(p => p.Nome.Equals(nome));
    }

    public Pais GetById(int id)
    {
        return _context.Pais.FirstOrDefault(p => p.Id == id);
    }

    public void Update(Pais pais)
    {
        _context.Pais.Update(pais);
        _context.SaveChanges();
    }

    public void Remove(int id_pais)
    {
        var pais_remove = GetById(id_pais);
        _context.Pais.Remove(pais_remove);
        _context.SaveChanges();
    }

    public void Remove(Pais pais)
    {
        _context.Pais.Remove(pais);
        _context.SaveChanges();
    }
}