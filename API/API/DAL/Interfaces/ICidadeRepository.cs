﻿namespace API.DAL.Interfaces;

public interface ICidadeRepository
{
    void Add(Cidade cidade);
    List<Cidade> Get();
}