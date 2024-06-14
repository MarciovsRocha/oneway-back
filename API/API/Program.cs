using System.Text.Json.Serialization;
using API.DAL;
using API.DAL.Interfaces;
using Microsoft.EntityFrameworkCore;

var origensParaCors = "_OrigensParaCors";

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddCors(options =>
    options.AddPolicy(name: origensParaCors,
        policy =>
        {
            policy.AllowAnyOrigin()
                .AllowAnyHeader()
                .AllowAnyMethod();
        })
);

builder.Services.AddControllers();

// configurando conexão com banco de dados
builder.Services.AddDbContext<IConnectionContext, ConnectionContext>(
    options => options.UseSqlServer(builder.Configuration.GetConnectionString("Production"))
);


// Configuração para ignorar ciclos dentre relacionamentos dos objetos
builder.Services.AddControllers().AddJsonOptions(
    options => options.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles);

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddTransient<IUserRepository, UserRepository>();
builder.Services.AddTransient<IEmployeeRepository, EmployeeRepository>();
builder.Services.AddTransient<IPaisRepository, PaisRepository>();
builder.Services.AddTransient<IEstadoRepository, EstadoRepository>();
builder.Services.AddTransient<ICidadeRepository, CidadeRepository>();
builder.Services.AddTransient<IProdutoRepository, ProdutoRepository>();

var app = builder.Build();

// Configure the HTTP request pipeline.
app.UseSwagger();
app.UseSwaggerUI();

app.UseCors(origensParaCors);

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
