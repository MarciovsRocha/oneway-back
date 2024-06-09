using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace API;

public class User
{
    public int id { get; private set; }
    public string? nome { get; private set; }
    public string? email { get; private set; }
//    public string? servico { get; private set; }
//    public string? senha { get; private set; }

    public IList<ViagemProduto> ViagemProdutos { get; set; }
    
    public User(string? nome, string? email)
    {
        this.nome = nome;
        this.email = email;
    }

    public User() {}
}