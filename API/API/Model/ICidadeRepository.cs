namespace API;

public interface ICidadeRepository
{
    void Add(Cidade cidade);
    List<Cidade> Get();
}