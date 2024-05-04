﻿using API.DAL.Interfaces;

namespace API.DAL;

public class CidadeRepository : ICidadeRepository
{
    private readonly ConnectionContext _context = new ConnectionContext();
    
    public void Add(Cidade cidade)
    {
        _context.Cidade.Add(cidade);
        _context.SaveChanges();
    }

    public List<Cidade> Get()
    {
        return _context.Cidade.ToList();
    }

    public Cidade GetByName(string nome)
    {
        return _context.Cidade.FirstOrDefault(c => c.Nome.Equals(nome));
    }

    public Cidade GetById(int id)
    {
        return _context.Cidade.FirstOrDefault(c => c.Id == id);
    }
}