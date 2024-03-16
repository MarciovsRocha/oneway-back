namespace AuthSerever;

public class User
{
    public User(string? nome, string? email, string? senha)
    {
        this.Nome = nome;
        this.Email = email;
        this.Senha = senha;
    }

    public int Id { get; set; }
    public string? Nome { get; set; }
    public string? Email { get; set; }
    public string? Senha { get; set; }
}