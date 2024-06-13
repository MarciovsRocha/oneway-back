namespace API.DAL.Interfaces;

public interface IProdutoRepository
{
    void Add(Produto hotel);
    List<Produto> Get();
    Produto GetById(int id);
    void Update(Produto produto);
    void Remove(int id_produto);
    void Remove(Produto produto);
    List<Produto> GetByType(int type);
    List<ProdutoTiposDTO> GetTotalProductsByType();
}