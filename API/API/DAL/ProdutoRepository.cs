using API.DAL.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace API.DAL;

public class ProdutoRepository : IProdutoRepository
{
    private readonly ConnectionContext _context;

    public ProdutoRepository(ConnectionContext context)
    {
        _context = context;
    }

    public void Add(Produto produto)
    {
        _context.Produto.Add(produto);
        _context.SaveChanges();
    }

    public List<Produto> Get()
    {
        return _context.Produto.Include(produto => produto.Cidade).ToList();
    }

    public Produto GetById(int id)
    {
        return _context.Produto.FirstOrDefault(h => h.Id == id);
    }

    public void Update(Produto produto)
    {
        _context.Produto.Update(produto);
        _context.SaveChanges();
    }

    public void Remove(int id_produto)
    {
        var prod_remove = GetById(id_produto);
        _context.Produto.Remove(prod_remove);
        _context.SaveChanges();
    }

    public void Remove(Produto produto)
    {
        _context.Produto.Remove(produto);
        _context.SaveChanges();
    }

    public List<Produto> GetByType(int type)
    {
        return _context.Produto
            .Where(prod => prod.Id_Tipo == type)
            .Include(produto => produto.Cidade)
            .ThenInclude(cidade => cidade.Estado)
            .ThenInclude(estado => estado.Pais)
            .ToList();
    }

    public List<ProdutoTiposDTO> GetTotalProductsByType()
    {
        return _context.Produto
            .GroupBy(p => p.Id_Tipo)
            .Select(g => new ProdutoTiposDTO
            {
                Id_Tipo = g.Key,
                Produtos_Qtd = g.Count()
            })
            .ToList();
    }
}