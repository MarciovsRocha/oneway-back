namespace API;

public class Estado
{
    public int? Id { get; set; }
    public string? Nome { get; set; }
    public int? Id_Pais { get; set; }
    public Pais Pais { get; set; }
    public ICollection<Cidade> Cidades { get; set; }
}