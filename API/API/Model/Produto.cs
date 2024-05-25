using API.DAL;

namespace API;

public class Produto
{
    public int Id { get; set; }
    public string? Nome { get; set; }
    public decimal? PrecoMedioDiaria { get; set; }
    public int? Id_Cidade { get; set; }
    public string? Descricao { get; set; }
    public int Id_Tipo { get; set; }
}