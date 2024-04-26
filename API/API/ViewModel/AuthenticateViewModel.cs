namespace API.ViewModel;

public class  AuthenticationViewModel
{
    public string? email { get; private set; }
    public string? senha { get; private set; }

    
    public AuthenticationViewModel(string? email,  string? senha)
    {
        this.email = email;
        this.senha = senha;
    }
}