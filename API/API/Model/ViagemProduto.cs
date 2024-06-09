namespace API;

public class ViagemProduto
{
    public int ViagemId { get; set; }
    public int ProdutoId { get; set; }

    public Viagem Viagem { get; set; }
    public Produto Produto { get; set; }
}