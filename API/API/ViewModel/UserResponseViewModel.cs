namespace API.ViewModel;

public class UserResponseViewModel
{
    public string nome { get; set; }
    public string email { get; set; }
    
    public UserResponseViewModel(string nome, string email) 
    {
        this.nome = nome;
        this.email = email;
    }
}