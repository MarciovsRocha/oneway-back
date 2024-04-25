namespace API.ViewModel;

public class HotelViewModel
{
    public int? Id { get; set; }
    public string? Nome { get; set; }
    public decimal? PrecoMedioDiaria { get; set; }
    public int? Id_Cidade { get; set; }
    public Cidade? Cidade { get; set; }

    public HotelViewModel(string? nome)
    {
        Nome = nome;
    }
}