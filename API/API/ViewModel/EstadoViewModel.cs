using Microsoft.EntityFrameworkCore.Metadata.Conventions;

namespace API.ViewModel;

public class EstadoViewModel
{
    public int? Id { get; set; }
    public string? Nome { get; set; }
    public int? Id_Pais { get; set; }
    // relacionamentos
    public Pais? Pais { get; set; }
    public ICollection<Cidade>? Cidades { get; set; }

    public EstadoViewModel(string? nome, int? idPais)
    {
        Nome = nome;
        Id_Pais = idPais;
    }
}