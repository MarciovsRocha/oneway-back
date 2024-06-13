using API.DAL.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace API.DAL;

public class CidadeRepository : ICidadeRepository
{
    private readonly ConnectionContext _context;

    public CidadeRepository(ConnectionContext context)
    {
        _context = context;
    }

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

    public List<CidadeProdutosDTO> GetTopCitiesByProductCount(int top)
    {
        return _context.Cidade
            .Include(c => c.Produtos)
            .OrderByDescending(c => c.Produtos.Count)
            .Take(top)
            .Select(c => new CidadeProdutosDTO
            {
                Id = c.Id.Value,
                Nome = c.Nome,
                Produto_Qtd = c.Produtos.Count
            })
            .ToList();
    }

    public List<CidadeBuscaDTO> GetLocationList(string nome)
    {   
        return _context.Cidade
            .AsNoTracking() 
            .Where(cidade => cidade.Nome != null && cidade.Nome.ToLower().Trim().Contains(nome.Trim().ToLower()))
            .Select(cidade => new CidadeBuscaDTO
            {
                Value = $"{cidade.Nome}, {cidade.Estado.Nome}, {cidade.Estado.Pais.Nome}",
                Id_Cidade = cidade.Id
            })
            .ToList();
    }
}