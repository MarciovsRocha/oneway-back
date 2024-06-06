-- Remover itens das tabelas
delete from Produto;
delete from Cidade;
delete from Estado;
delete from Pais;
go


-- Limpar os �ndices autogerados
DECLARE @NewId as INT  
SET @NewId =  (SELECT isnull(MAX(Id),0)  AS ID FROM Produto)
DBCC CHECKIDENT('Produto',RESEED,@NewId);
go

DECLARE @NewId as INT  
SET @NewId =  (SELECT isnull(MAX(Id),0)  AS ID FROM Cidade)
DBCC CHECKIDENT('Cidade',RESEED,@NewId);
go

DECLARE @NewId as INT  
SET @NewId =  (SELECT isnull(MAX(Id),0)  AS ID FROM Estado)
DBCC CHECKIDENT('Estado',RESEED,@NewId);
go

DECLARE @NewId as INT  
SET @NewId =  (SELECT isnull(MAX(Id),0)  AS ID FROM Pais)
DBCC CHECKIDENT('Pais',RESEED,@NewId);
go



-- Inser��o de dados
SET IDENTITY_INSERT Pais ON;
-- Pa�ses
INSERT INTO Pais (Id, Nome) VALUES (1, 'Brasil');
INSERT INTO Pais (Id, Nome) VALUES (2, 'Estados Unidos');
INSERT INTO Pais (Id, Nome) VALUES (3, 'Argentina');
INSERT INTO Pais (Id, Nome) VALUES (4, 'Alemanha');

SET IDENTITY_INSERT Pais OFF;
go

-- Estados
SET IDENTITY_INSERT Estado ON;
-- Brasil
INSERT INTO Estado (Id, Nome, Id_Pais) VALUES (1, 'S�o Paulo', 1);
INSERT INTO Estado (Id, Nome, Id_Pais) VALUES (2, 'Rio de Janeiro', 1);
INSERT INTO Estado (Id, Nome, Id_Pais) VALUES (3, 'Minas Gerais', 1);
INSERT INTO Estado (Id, Nome, Id_Pais) VALUES (4, 'Bahia', 1);
INSERT INTO Estado (Id, Nome, Id_Pais) VALUES (5, 'Paran�', 1);
INSERT INTO Estado (Id, Nome, Id_Pais) VALUES (6, 'Rio Grande do Sul', 1);

-- Estados Unidos
INSERT INTO Estado (Id, Nome, Id_Pais) VALUES (7, 'California', 2);
INSERT INTO Estado (Id, Nome, Id_Pais) VALUES (8, 'New York', 2);
INSERT INTO Estado (Id, Nome, Id_Pais) VALUES (9, 'Florida', 2);
INSERT INTO Estado (Id, Nome, Id_Pais) VALUES (10, 'Texas', 2);
INSERT INTO Estado (Id, Nome, Id_Pais) VALUES (11, 'Nevada', 2);
INSERT INTO Estado (Id, Nome, Id_Pais) VALUES (12, 'Illinois', 2);

-- Argentina
INSERT INTO Estado (Id, Nome, Id_Pais) VALUES (13, 'Buenos Aires', 3);
INSERT INTO Estado (Id, Nome, Id_Pais) VALUES (14, 'C�rdoba', 3);
INSERT INTO Estado (Id, Nome, Id_Pais) VALUES (15, 'Santa Fe', 3);
INSERT INTO Estado (Id, Nome, Id_Pais) VALUES (16, 'Mendoza', 3);
INSERT INTO Estado (Id, Nome, Id_Pais) VALUES (17, 'Salta', 3);
INSERT INTO Estado (Id, Nome, Id_Pais) VALUES (18, 'Tucum�n', 3);

-- Alemanha
INSERT INTO Estado (Id, Nome, Id_Pais) VALUES (19, 'Baviera', 4);
INSERT INTO Estado (Id, Nome, Id_Pais) VALUES (20, 'Berlim', 4);
INSERT INTO Estado (Id, Nome, Id_Pais) VALUES (21, 'Brandemburgo', 4);
INSERT INTO Estado (Id, Nome, Id_Pais) VALUES (22, 'Hamburgo', 4);
INSERT INTO Estado (Id, Nome, Id_Pais) VALUES (23, 'Hessen', 4);
INSERT INTO Estado (Id, Nome, Id_Pais) VALUES (24, 'Sax�nia', 4);

SET IDENTITY_INSERT Estado OFF;
go

-- Cidades
SET IDENTITY_INSERT Cidade ON;
-- S�o Paulo, Brasil
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (1, 'S�o Paulo', 1);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (2, 'Campinas', 1);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (3, 'Santos', 1);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (4, 'Sorocaba', 1);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (5, 'S�o Jos� dos Campos', 1);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (6, 'Ribeir�o Preto', 1);

-- Rio de Janeiro, Brasil
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (7, 'Rio de Janeiro', 2);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (8, 'Niter�i', 2);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (9, 'Petr�polis', 2);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (10, 'Volta Redonda', 2);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (11, 'Maca�', 2);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (12, 'Cabo Frio', 2);

-- Minas Gerais, Brasil
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (13, 'Belo Horizonte', 3);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (14, 'Uberl�ndia', 3);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (15, 'Contagem', 3);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (16, 'Juiz de Fora', 3);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (17, 'Betim', 3);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (18, 'Montes Claros', 3);

-- Bahia, Brasil
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (19, 'Salvador', 4);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (20, 'Feira de Santana', 4);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (21, 'Vit�ria da Conquista', 4);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (22, 'Cama�ari', 4);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (23, 'Itabuna', 4);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (24, 'Ilh�us', 4);

-- Paran�, Brasil
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (25, 'Curitiba', 5);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (26, 'Londrina', 5);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (27, 'Maring�', 5);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (28, 'Ponta Grossa', 5);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (29, 'Cascavel', 5);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (30, 'S�o Jos� dos Pinhais', 5);

-- Rio Grande do Sul, Brasil
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (31, 'Porto Alegre', 6);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (32, 'Caxias do Sul', 6);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (33, 'Pelotas', 6);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (34, 'Santa Maria', 6);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (35, 'Gravata�', 6);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (36, 'Viam�o', 6);

-- California, Estados Unidos
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (37, 'Los Angeles', 7);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (38, 'San Francisco', 7);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (39, 'San Diego', 7);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (40, 'Sacramento', 7);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (41, 'San Jose', 7);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (42, 'Fresno', 7);

-- New York, Estados Unidos
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (43, 'New York City', 8);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (44, 'Buffalo', 8);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (45, 'Rochester', 8);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (46, 'Yonkers', 8);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (47, 'Syracuse', 8);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (48, 'Albany', 8);

-- Florida, Estados Unidos
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (49, 'Miami', 9);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (50, 'Orlando', 9);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (51, 'Tampa', 9);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (52, 'Jacksonville', 9);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (53, 'Fort Lauderdale', 9);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (54, 'Tallahassee', 9);

-- Texas, Estados Unidos
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (55, 'Houston', 10);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (56, 'Dallas', 10);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (57, 'Austin', 10);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (58, 'San Antonio', 10);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (59, 'Fort Worth', 10);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (60, 'El Paso', 10);

-- Nevada, Estados Unidos
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (61, 'Las Vegas', 11);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (62, 'Reno', 11);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (63, 'Henderson', 11);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (64, 'North Las Vegas', 11);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (65, 'Sparks', 11);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (66, 'Carson City', 11);

-- Illinois, Estados Unidos
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (67, 'Chicago', 12);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (68, 'Aurora', 12);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (69, 'Naperville', 12);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (70, 'Joliet', 12);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (71, 'Rockford', 12);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (72, 'Springfield', 12);

-- Buenos Aires, Argentina
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (73, 'Buenos Aires', 13);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (74, 'La Plata', 13);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (75, 'Mar del Plata', 13);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (76, 'Bah�a Blanca', 13);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (77, 'Tandil', 13);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (78, 'Quilmes', 13);

-- C�rdoba, Argentina
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (79, 'C�rdoba', 14);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (80, 'Villa Carlos Paz', 14);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (81, 'Villa Mar�a', 14);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (82, 'R�o Cuarto', 14);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (83, 'Alta Gracia', 14);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (84, 'San Francisco', 14);

-- Santa Fe, Argentina
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (85, 'Santa Fe', 15);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (86, 'Ros�rio', 15);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (87, 'Rafaela', 15);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (88, 'Reconquista', 15);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (89, 'Venado Tuerto', 15);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (90, 'Esperanza', 15);

-- Mendoza, Argentina
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (91, 'Mendoza', 16);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (92, 'San Rafael', 16);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (93, 'Godoy Cruz', 16);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (94, 'Luj�n de Cuyo', 16);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (95, 'Maip�', 16);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (96, 'Las Heras', 16);

-- Salta, Argentina
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (97, 'Salta', 17);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (98, 'San Ram�n de la Nueva Or�n', 17);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (99, 'Tartagal', 17);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (100, 'Cafayate', 17);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (101, 'General G�emes', 17);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (102, 'Rosario de la Frontera', 17);

-- Tucum�n, Argentina
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (103, 'San Miguel de Tucum�n', 18);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (104, 'Concepci�n', 18);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (105, 'Taf� Viejo', 18);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (106, 'Yerba Buena', 18);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (107, 'Monteros', 18);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (108, 'Aguilares', 18);

-- Baviera, Alemanha
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (109, 'Munique', 19);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (110, 'Nuremberg', 19);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (111, 'Augsburgo', 19);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (112, 'W�rzburg', 19);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (113, 'Regensburg', 19);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (114, 'Ingolstadt', 19);

-- Berlim, Alemanha
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (115, 'Berlim', 20);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (116, 'Spandau', 20);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (117, 'Pankow', 20);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (118, 'Charlottenburg', 20);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (119, 'Kreuzberg', 20);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (120, 'Neuk�lln', 20);

-- Brandemburgo, Alemanha
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (121, 'Potsdam', 21);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (122, 'Cottbus', 21);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (123, 'Brandenburg an der Havel', 21);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (124, 'Frankfurt (Oder)', 21);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (125, 'Oranienburg', 21);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (126, 'Eberswalde', 21);

-- Hamburgo, Alemanha
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (127, 'Hamburgo', 22);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (128, 'Altona', 22);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (129, 'Eimsb�ttel', 22);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (130, 'Wandsbek', 22);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (131, 'Bergedorf', 22);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (132, 'Harburg', 22);

-- Hessen, Alemanha
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (133, 'Frankfurt', 23);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (134, 'Wiesbaden', 23);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (135, 'Darmstadt', 23);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (136, 'Kassel', 23);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (137, 'Offenbach', 23);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (138, 'Hanau', 23);

-- Sax�nia, Alemanha
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (139, 'Dresden', 24);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (140, 'Leipzig', 24);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (141, 'Chemnitz', 24);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (142, 'Zwickau', 24);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (143, 'Plauen', 24);
INSERT INTO Cidade (Id, Nome, Id_Estado) VALUES (144, 'G�rlitz', 24);
SET IDENTITY_INSERT Cidade OFF;
go

-- Produtos
SET IDENTITY_INSERT Produto ON;
-- Tipo 1: Hot�is
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (1, 'Hotel Luxor', 350.00, 1, 'Hotel de luxo com vista para a cidade.', 1);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (2, 'Hotel Royal', 250.00, 2, 'Hotel confort�vel com excelentes comodidades.', 1);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (3, 'Hotel Mar�timo', 300.00, 3, 'Hotel � beira-mar com vistas deslumbrantes.', 1);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (4, 'Hotel Central', 200.00, 4, 'Hotel localizado no centro da cidade.', 1);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (5, 'Hotel Jardim', 180.00, 5, 'Hotel com belos jardins e �reas verdes.', 1);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (6, 'Hotel Boutique', 400.00, 6, 'Hotel exclusivo com design diferenciado.', 1);

-- Adicionar mais produtos do tipo 1
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (7, 'Hotel Estrela', 220.00, 7, 'Hotel charmoso com atendimento personalizado.', 1);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (8, 'Hotel Palace', 500.00, 8, 'Hotel de alto padr�o com servi�os exclusivos.', 1);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (9, 'Hotel Vista Mar', 280.00, 9, 'Hotel com vista para o mar e acesso � praia.', 1);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (10, 'Hotel Fazenda', 150.00, 10, 'Hotel r�stico em �rea rural.', 1);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (11, 'Hotel Urbano', 300.00, 11, 'Hotel moderno em �rea urbana.', 1);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (12, 'Hotel Ref�gio', 180.00, 12, 'Hotel tranquilo e isolado.', 1);
go

-- Tipo 2: Transportes
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (13, 'Aluguel de Carros Luxo', 150.00, 1, 'Aluguel de carros de luxo para todas as ocasi�es.', 2);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (14, 'Aluguel de Bicicletas', 30.00, 2, 'Aluguel de bicicletas para passeios pela cidade.', 2);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (15, 'Servi�o de T�xi', 50.00, 3, 'Servi�o de t�xi dispon�vel 24 horas.', 2);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (16, 'Transfer Aeroporto', 100.00, 4, 'Servi�o de transfer do aeroporto para o hotel.', 2);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (17, 'Aluguel de Motos', 70.00, 5, 'Aluguel de motos para passeios e aventuras.', 2);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (18, 'Servi�o de Limusine', 200.00, 6, 'Servi�o de limusine para eventos especiais.', 2);

-- Adicionar mais produtos do tipo 2
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (19, 'Aluguel de Vans', 120.00, 7, 'Aluguel de vans para grupos e excurs�es.', 2);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (20, 'Passeios de Barco', 180.00, 8, 'Passeios de barco pelos principais pontos tur�sticos.', 2);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (21, 'Aluguel de Scooters', 50.00, 9, 'Aluguel de scooters para mobilidade na cidade.', 2);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (22, 'Servi�o de Uber', 60.00, 10, 'Servi�o de Uber dispon�vel 24 horas.', 2);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (23, 'Aluguel de Jet Skis', 250.00, 11, 'Aluguel de jet skis para divers�o na �gua.', 2);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (24, 'Transfer Hotel', 80.00, 12, 'Servi�o de transfer do hotel para o aeroporto.', 2);
go

-- Tipo 3: Atra��es Tur�sticas
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (25, 'Museu de Arte', 20.00, 1, 'Entrada para o museu de arte da cidade.', 3);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (26, 'Parque de Divers�es', 50.00, 2, 'Entrada para o parque de divers�es.', 3);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (27, 'Tour Hist�rico', 30.00, 3, 'Passeio guiado pelos pontos hist�ricos da cidade.', 3);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (28, 'Show de M�sica', 40.00, 4, 'Ingressos para show de m�sica ao vivo.', 3);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (29, 'Passeio de Bal�o', 200.00, 5, 'Passeio de bal�o com vista panor�mica.', 3);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (30, 'Aqu�rio', 25.00, 6, 'Visita ao aqu�rio com diversas esp�cies marinhas.', 3);

-- Adicionar mais produtos do tipo 3
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (31, 'Zool�gico', 30.00, 7, 'Visita ao zool�gico com diversas esp�cies animais.', 3);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (32, 'Teatro', 60.00, 8, 'Ingressos para pe�a de teatro.', 3);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (33, 'Passeio de Trem', 45.00, 9, 'Passeio de trem pelas montanhas.', 3);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (34, 'Jardim Bot�nico', 15.00, 10, 'Visita ao jardim bot�nico.', 3);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (35, 'Passeio de Helic�ptero', 250.00, 11, 'Passeio de helic�ptero com vista a�rea.', 3);
INSERT INTO Produto (Id, Nome, PrecoMedioDiaria, Id_Cidade, Descricao, Id_Tipo) VALUES (36, 'Planet�rio', 20.00, 12, 'Visita ao planet�rio.', 3);

SET IDENTITY_INSERT Produto OFF;
go



-- Limpar os �ndices autogerados
DECLARE @NewId as INT  
SET @NewId =  (SELECT isnull(MAX(Id),0)  AS ID FROM Produto)
DBCC CHECKIDENT('Produto',RESEED,@NewId);
go

DECLARE @NewId as INT  
SET @NewId =  (SELECT isnull(MAX(Id),0)  AS ID FROM Cidade)
DBCC CHECKIDENT('Cidade',RESEED,@NewId);
go

DECLARE @NewId as INT  
SET @NewId =  (SELECT isnull(MAX(Id),0)  AS ID FROM Estado)
DBCC CHECKIDENT('Estado',RESEED,@NewId);
go

DECLARE @NewId as INT  
SET @NewId =  (SELECT isnull(MAX(Id),0)  AS ID FROM Pais)
DBCC CHECKIDENT('Pais',RESEED,@NewId);
go

