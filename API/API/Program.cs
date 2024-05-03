using API;
using API.DAL;
using API.DAL.Interfaces;
using Microsoft.EntityFrameworkCore;

var OrigensParaCors = "_OrigensParaCors";

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddCors(options =>
    options.AddPolicy(name: OrigensParaCors,
        policy =>
        {
            policy.WithOrigins(
                "http://localhost:4200"
                , "http://127.0.0.1:4200"
                )
                .AllowAnyHeader()
                .AllowAnyMethod();
        })
);

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddTransient<IUserRepository, UserRepository>();
builder.Services.AddTransient<IEmployeeRepository, EmployeeRepository>();
builder.Services.AddTransient<IPaisRepository, PaisRepository>();
builder.Services.AddTransient<IEstadoRepository, EstadoRepository>();
builder.Services.AddTransient<ICidadeRepository, CidadeRepository>();
builder.Services.AddTransient<IHotelRepository, HotelRepository>();

var clientSecret = builder.Configuration.GetValue<string>("ConnectionStrings:DefaultConnection");

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors(OrigensParaCors);

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
