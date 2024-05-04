using System.ComponentModel.Design;
using API.DAL;
using Microsoft.EntityFrameworkCore.Migrations.Operations;

namespace API;

public class Cidade
{
    public int? Id { get; set; }
    public int? Id_Estado { get; set; }
    public string? Nome { get; set; }
    // relacionamentos
    // public Estado? Estado { get; set; }

    public Cidade(int? idEstado, string? nome)
    {
        Id_Estado = idEstado;
        Nome = nome;
        // this.Estado = new EstadoRepository().Get().Where(e => e.Id.Equals(idEstado)).FirstOrDefault();
        // if (Estado == null)
        // {
        //     throw new Exception("O código de estado informado é inválido.");
        // }
    }

    // public Cidade(string? nome, Estado estado)
    // {
    //     Nome = nome;
    //     Estado = estado;
    //     this.Id_Estado = estado.Id;
    // }

    public Cidade() { }
}