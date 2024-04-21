using API.DAL;

namespace API;

public class Estado
{
    public int? Id { get; set; }
    public string? Nome { get; set; }
    public int? Id_Pais { get; set; }
    // relacionamentos 
    public Pais? Pais { get; set; }
    public ICollection<Cidade>? Cidades { get; set; }

    public Estado(string? nome, int? idPais)
    {
        Nome = nome;
        Id_Pais = idPais;
        Pais = new PaisRepository().Get().Where(p => p.Id == Id_Pais).FirstOrDefault();
        if (Pais == null)
        {
            throw new Exception("O código de pais informado é inálido");
        } 
    }

    public Estado(string? nome, Pais? pais)
    {
        Nome = nome;
        Pais = pais;
        Id_Pais = Pais.Id;
    }
}