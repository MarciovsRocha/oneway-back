/****** Object:  Database [oneway]    Script Date: 21/04/2024 23:50:52 ******/
CREATE DATABASE [oneway]  
GO


/* PAIS */
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pais]') AND type in (N'U'))
DROP TABLE [dbo].[Pais]
GO
CREATE TABLE [dbo].[Pais](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](255) NOT NULL,
	PRIMARY KEY ([Id])
) ON [PRIMARY]
GO


/* ESTADO */
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Estado]') AND type in (N'U'))
DROP TABLE [dbo].[Estado]
GO
CREATE TABLE [dbo].[Estado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](255) NOT NULL,
	[Id_Pais] [int] NOT NULL,
	PRIMARY KEY ([Id]), 
	FOREIGN KEY([Id_Pais]) REFERENCES [dbo].[Pais] ([Id])
) ON [PRIMARY]
GO


/* CIDADE */ 
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cidade]') AND type in (N'U'))
DROP TABLE [dbo].[Cidade]
GO
CREATE TABLE [dbo].[Cidade](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NOME] [varchar](255) NOT NULL,
	[Id_Estado] [int] NOT NULL,
	PRIMARY KEY ([Id]),
	FOREIGN KEY ([Id_Estado]) REFERENCES [dbo].[Estado]([Id])
)
GO


/* TIPO ATRAÇÃO */
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoAlteracao]') AND type in (N'U'))
begin
	DROP TABLE [dbo].[TipoAtracao]
end
GO
CREATE TABLE [dbo].[TipoAtracao](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
	PRIMARY KEY ([Id])
) 
GO


/* ATRAÇÃO */
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Atracao]') AND type in (N'U'))
begin
	DROP TABLE [dbo].[Atracao]
end
GO
CREATE TABLE [dbo].[Atracao](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
	[Id_Cidade] [int] NOT NULL, 
	[Id_TipoAtracao] [int] NULL,
	[Descricao] [varchar](255) NULL,
	[Valor] [decimal](10, 2) NULL,
	PRIMARY KEY([Id]),
	FOREIGN KEY([Id_Cidade]) REFERENCES [dbo].[Cidade]([Id]),
	FOREIGN KEY([Id_TipoAtracao]) REFERENCES [dbo].[TipoAtracao]([Id])
)
GO


/* HOTEL */
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hotel]') AND type in (N'U'))
DROP TABLE [dbo].[Hotel]
GO
CREATE TABLE [dbo].[Hotel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,	
	[Id_Cidade] [int] NULL,
	PRIMARY KEY ([Id]),
	FOREIGN KEY([Id_Cidade]) REFERENCES [dbo].[Cidade] ([Id])
)
GO


/* QUARTO HOTEL */
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QuartosHotel]') AND type in (N'U'))
DROP TABLE [dbo].[QuartosHotel]
GO
CREATE TABLE [dbo].[QuartosHotel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,	
	[Descricao] [varchar](255) NULL,
	[Id_Hotel] [int] NOT NULL, 
	[Valor] decimal(10,2) NOT NULL,
	PRIMARY KEY ([Id]),
	FOREIGN KEY([Id_Hotel]) REFERENCES [dbo].[Hotel] ([Id])
)
GO


/* TIPO DE TRANSPORTE */
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoTransporte]') AND type in (N'U'))
DROP TABLE [dbo].[TipoTransporte]
GO
CREATE TABLE [dbo].[TipoTransporte](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,	
	PRIMARY KEY ([Id])
) 
GO

/* TRANSPORTE */
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Transporte]') AND type in (N'U'))
DROP TABLE [dbo].[Transporte]
GO
CREATE TABLE [dbo].[Transporte](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
	[Id_TipoTransporte] [int] NOT NULL,
	[Id_CidadeOrigem] [int]  NOT NULL,
	[Id_CidadeDestino] [int] NOT NULL,
	[DataHoraDePartida] [datetime] NULL,
	[DataHoraDeChegada] [datetime] NULL,
	[Valor] [decimal](10, 2) NULL,
	PRIMARY KEY ([Id]),
	FOREIGN KEY ([Id_TipoTransporte]) REFERENCES [dbo].[TipoTransporte]([Id]),
	FOREIGN KEY ([Id_CidadeOrigem]) REFERENCES [dbo].[Cidade]([Id]),
	FOREIGN KEY ([Id_CidadeDestino]) REFERENCES [dbo].[Cidade]([Id])
)
GO


/* USER */
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
DROP TABLE [dbo].[User]
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Servico] [varchar](200) NULL,
	[Senha] [varchar](64) NULL,
	PRIMARY KEY ([Id])
) 
GO


