using API.DAL.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace API.DAL;

public class CidadeRepository : ICidadeRepository
{
    private readonly ConnectionContext _context = new ConnectionContext();
    
    public void Add(Cidade cidade)
    {
        _context.Cidade.Add(cidade);
        _context.SaveChanges();
    }

    public List<Cidade> Get()
    {
        return _context.Cidade.Include(cidade => cidade.Estado).ToList();
    }

    public Cidade GetByName(string nome)
    {
        return _context.Cidade.FirstOrDefault(c => c.Nome.Equals(nome));
    }

    public Cidade GetById(int id)
    {
        return _context.Cidade.FirstOrDefault(c => c.Id == id);
    }

    public void Update(Cidade cidade)
    {
        _context.Update(cidade);
        _context.SaveChanges();
    }

    public void Remove(Cidade cidade)
    {
        _context.Cidade.Remove(cidade);
        _context.SaveChanges();
    }

    public void Remove(int id_cidade)
    {
        var cidade_remove = GetById(id_cidade);
        _context.Cidade.Remove(cidade_remove);
        _context.SaveChanges();
    }
}