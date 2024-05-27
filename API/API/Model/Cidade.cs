namespace API;

public class Cidade
{
    public int? Id { get; set; }
    public int? Id_Estado { get; set; }
    public string? Nome { get; set; }
    public Estado Estado { get; set; }
    public ICollection<Produto> Produtos { get; set; }
}