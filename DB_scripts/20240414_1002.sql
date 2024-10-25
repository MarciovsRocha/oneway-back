/****** Object:  Database [oneway]    Script Date: 14/04/2024 10:03:11 ******/
CREATE DATABASE [oneway]  (EDITION = 'GeneralPurpose', SERVICE_OBJECTIVE = 'GP_S_Gen5_1', MAXSIZE = 32 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [oneway] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [oneway] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [oneway] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [oneway] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [oneway] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [oneway] SET ARITHABORT OFF 
GO
ALTER DATABASE [oneway] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [oneway] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [oneway] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [oneway] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [oneway] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [oneway] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [oneway] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [oneway] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [oneway] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [oneway] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [oneway] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [oneway] SET  MULTI_USER 
GO
ALTER DATABASE [oneway] SET ENCRYPTION ON
GO
ALTER DATABASE [oneway] SET QUERY_STORE = ON
GO
ALTER DATABASE [oneway] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** Os scripts das configurações no escopo do banco de dados no Azure devem ser executados dentro da conexão de banco de dados de destino. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  User [api_user]    Script Date: 14/04/2024 10:03:12 ******/
CREATE USER [api_user] FOR LOGIN [api_user] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [anderson]    Script Date: 14/04/2024 10:03:12 ******/
CREATE USER [anderson] FOR LOGIN [anderson] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'api_user'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'api_user'
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'anderson'
GO
/****** Object:  Table [dbo].[Atracao]    Script Date: 14/04/2024 10:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atracao](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
	[Localizacao] [varchar](100) NULL,
	[TipoId] [int] NULL,
	[Descricao] [text] NULL,
	[PrecoIngresso] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriaHotel]    Script Date: 14/04/2024 10:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriaHotel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cidade]    Script Date: 14/04/2024 10:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cidade](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NOME] [varchar](255) NOT NULL,
	[Id_Estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 14/04/2024 10:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](255) NOT NULL,
	[Id_Pais] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 14/04/2024 10:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
	[Localizacao] [varchar](100) NULL,
	[CategoriaId] [int] NULL,
	[PrecoMedioDiaria] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 14/04/2024 10:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoAtracao]    Script Date: 14/04/2024 10:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoAtracao](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transportadora]    Script Date: 14/04/2024 10:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transportadora](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
	[TipoTransporte] [varchar](100) NULL,
	[Origem] [varchar](100) NULL,
	[Destino] [varchar](100) NULL,
	[HorarioPartida] [datetime] NULL,
	[HorarioChegada] [datetime] NULL,
	[Preco] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 14/04/2024 10:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Servico] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Atracao]  WITH CHECK ADD FOREIGN KEY([TipoId])
REFERENCES [dbo].[TipoAtracao] ([Id])
GO
ALTER TABLE [dbo].[Cidade]  WITH CHECK ADD FOREIGN KEY([Id_Estado])
REFERENCES [dbo].[Estado] ([Id])
GO
ALTER TABLE [dbo].[Estado]  WITH CHECK ADD FOREIGN KEY([Id_Pais])
REFERENCES [dbo].[Pais] ([Id])
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD FOREIGN KEY([CategoriaId])
REFERENCES [dbo].[CategoriaHotel] ([Id])
GO
ALTER DATABASE [oneway] SET  READ_WRITE 
GO
