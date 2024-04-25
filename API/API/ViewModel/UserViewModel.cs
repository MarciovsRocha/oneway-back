namespace API.ViewModel;

public class UserViewModel
{
    public string? nome { get; private set; }
    public string? email { get; private set; }
    public string? servico { get; private set; }
    public string? senha { get; private set; }

    
    public UserViewModel(string? nome, string? email, string? servico, string? senha)
    {
        this.nome = nome;
        this.email = email;
        this.servico = servico;
        this.senha = senha;
    }
}