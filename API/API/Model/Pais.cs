namespace API;

public class Pais
{
    public int? Id { get; set; }
    public string? Nome { get; set; }
    // relacionamentos 
    // public ICollection<Estado>? Estados { get; set; } = new List<Estado>();

    public Pais(string? nome)
    {
        Nome = nome;
    }
}