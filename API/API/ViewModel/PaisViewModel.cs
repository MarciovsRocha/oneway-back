namespace API.ViewModel;

public class PaisViewModel
{
    public string? Nome { get; set; }
    public int? Id { get; set; }

    public PaisViewModel(string? nome)
    {
        Nome = nome;
    }
}