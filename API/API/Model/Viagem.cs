using System.ComponentModel;

namespace API;

public class Viagem
{
    public int Id { get; set; }
    public DateTime DataCompra { get; set; }
    public decimal Total { get; set; }
    public string? Nome { get; set; }
    public IList<ViagemProduto> ViagemProdutos { get; set; }
}