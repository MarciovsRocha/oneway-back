namespace API.DAL.Interfaces;

public interface ICidadeRepository
{
    void Add(Cidade cidade);
    List<Cidade> Get();
    Cidade GetByName(string nome);
    Cidade GetById(int id);
    void Update(Cidade cidade);
    void Remove(Cidade cidade);
    void Remove(int id_cidade);
    List<CidadeProdutosDTO> GetTopCitiesByProductCount(int top);
    List<CidadeBuscaDTO> GetLocationList(string nome);
}