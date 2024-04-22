namespace API.ViewModel;

public class CidadeViewModel
{
    public int? Id { get; set; }
    public int? Id_Estado { get; set; }
    public string? Nome { get; set; }
    public Estado? Estado { get; set; }

    public CidadeViewModel(int? idEstado, string? nome)
    {
        Id_Estado = idEstado;
        Nome = nome;
    }
}