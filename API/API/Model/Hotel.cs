using API.DAL;

namespace API;

public class Hotel
{
    public int? Id { get; set; }
    public string? Nome { get; set; }
//    public int? CategoriaId { get; set; }
    public decimal? PrecoMedioDiaria { get; set; }
    public int? Id_Cidade { get; set; }
    public Cidade? Cidade { get; set; }


    public Hotel(string? nome, decimal? precoMedioDiaria, Cidade? cidade)
    {
        Nome = nome;
        PrecoMedioDiaria = precoMedioDiaria;
        Cidade = cidade;
        Id_Cidade = Cidade.Id;
    }

    public Hotel(string? nome, decimal? precoMedioDiaria, int? idCidade)
    {
        Nome = nome;
        PrecoMedioDiaria = precoMedioDiaria;
        Id_Cidade = idCidade;
        Cidade = new CidadeRepository().Get().Where(c => c.Id == Id_Cidade).FirstOrDefault();
        if (Cidade == null)
        {
            throw new Exception("O código informado de cidade é inválido");
        }
    }
}