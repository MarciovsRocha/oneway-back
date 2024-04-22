namespace API.ViewModel;

public class HotelViewModel
{
    public int? Id { get; set; }
    public string? Nome { get; set; }

    public HotelViewModel(string? nome)
    {
        Nome = nome;
    }
}