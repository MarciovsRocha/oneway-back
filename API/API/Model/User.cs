using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace API;

public class User
{
    [Key] public int id { get; private set; }
    public string? nome { get; private set; }
    public string? email { get; private set; }
    public string? servico { get; private set; }
    public string? senha { get; private set; }

    public User(string? nome, string? email, string? servico, string? senha)
    {
        this.nome = nome;
        this.email = email;
        this.servico = servico;
        this.senha = senha;
    }
}