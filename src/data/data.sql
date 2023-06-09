USE [master]
GO
/****** Object:  Database [Disney]    Script Date: 29/5/2023 11:15:18 ******/
CREATE DATABASE [Disney]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Disney', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Disney.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Disney_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Disney_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Disney] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Disney].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Disney] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Disney] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Disney] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Disney] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Disney] SET ARITHABORT OFF 
GO
ALTER DATABASE [Disney] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Disney] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Disney] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Disney] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Disney] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Disney] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Disney] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Disney] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Disney] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Disney] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Disney] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Disney] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Disney] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Disney] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Disney] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Disney] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Disney] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Disney] SET RECOVERY FULL 
GO
ALTER DATABASE [Disney] SET  MULTI_USER 
GO
ALTER DATABASE [Disney] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Disney] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Disney] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Disney] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Disney] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Disney', N'ON'
GO
ALTER DATABASE [Disney] SET QUERY_STORE = OFF
GO
USE [Disney]
GO
/****** Object:  User [Disney]    Script Date: 29/5/2023 11:15:18 ******/
CREATE USER [Disney] FOR LOGIN [Disney] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [alumno]    Script Date: 29/5/2023 11:15:18 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Disney]
GO
/****** Object:  Table [dbo].[Peliserie]    Script Date: 29/5/2023 11:15:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peliserie](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Imagen] [varchar](999) NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[Fecha_Creacion] [date] NOT NULL,
	[Calificacion] [float] NOT NULL,
 CONSTRAINT [PK_Peliserie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personaje]    Script Date: 29/5/2023 11:15:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personaje](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Imagen] [varchar](4000) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Edad] [int] NOT NULL,
	[Peso] [float] NOT NULL,
	[Historia] [varchar](4000) NULL,
	[Id_Peliserie] [int] NOT NULL,
 CONSTRAINT [PK_Personaje] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Peliserie] ON 

INSERT [dbo].[Peliserie] ([Id], [Imagen], [Titulo], [Fecha_Creacion], [Calificacion]) VALUES (1, N'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Toy_Story.svg/220px-Toy_Story.svg.png', N'Toy story', CAST(N'1995-11-22' AS Date), 5)
INSERT [dbo].[Peliserie] ([Id], [Imagen], [Titulo], [Fecha_Creacion], [Calificacion]) VALUES (2, N'https://lumiere-a.akamaihd.net/v1/images/image_8b5ca578.jpeg', N'El rey leon', CAST(N'1994-07-07' AS Date), 4.5)
INSERT [dbo].[Peliserie] ([Id], [Imagen], [Titulo], [Fecha_Creacion], [Calificacion]) VALUES (3, N'https://cloudfront-us-east-1.images.arcpublishing.com/infobae/BCWNAG4MNRBSLHAM7COBNDWIJM.jpg', N'Monsters Inc', CAST(N'2001-11-02' AS Date), 4)
INSERT [dbo].[Peliserie] ([Id], [Imagen], [Titulo], [Fecha_Creacion], [Calificacion]) VALUES (4, N'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/4DF3C740E0B6904F7F9A5D7F2F930E38782DCF3C0B697C095014EAE8C61703FD/scale?width=1200&aspectRatio=1.78&format=jpeg', N'Los increibles', CAST(N'2004-11-05' AS Date), 4.7)
INSERT [dbo].[Peliserie] ([Id], [Imagen], [Titulo], [Fecha_Creacion], [Calificacion]) VALUES (5, N'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/2F8D58B5DF6215D6E0352AA210AC046732486F56D39EC7CBC20CC838DEB6EDC0/scale?width=1200&aspectRatio=1.78&format=jpeg', N'Cars', CAST(N'2006-06-09' AS Date), 4.6)
INSERT [dbo].[Peliserie] ([Id], [Imagen], [Titulo], [Fecha_Creacion], [Calificacion]) VALUES (6, N'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/0F6762CF619AAB6B45606AF7A107CDBDFDC30F108C03B15670B5A49578E6D259/scale?width=1200&aspectRatio=1.78&format=jpeg', N'Wall-e', CAST(N'2008-06-27' AS Date), 4.2)
INSERT [dbo].[Peliserie] ([Id], [Imagen], [Titulo], [Fecha_Creacion], [Calificacion]) VALUES (7, N'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/EAFEBBAAA31DAB1D15ECBE76668BD607B9FBD0C9C0FEAB9F44CA43F0008C2948/scale?width=1200&aspectRatio=1.78&format=jpeg', N'Buscando a nemo', CAST(N'2000-05-30' AS Date), 3.8)
INSERT [dbo].[Peliserie] ([Id], [Imagen], [Titulo], [Fecha_Creacion], [Calificacion]) VALUES (8, N'https://pics.filmaffinity.com/Shrek-903764423-large.jpg', N'Shrek', CAST(N'2001-06-22' AS Date), 5)
SET IDENTITY_INSERT [dbo].[Peliserie] OFF
GO
SET IDENTITY_INSERT [dbo].[Personaje] ON 

INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia], [Id_Peliserie]) VALUES (4, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZFMER8wfxHa06apLyhDie1sS7xmmme4kTbQ&usqp=CAU', N'Woody', 70, 1, NULL, 1)
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia], [Id_Peliserie]) VALUES (8, N'https://static.wikia.nocookie.net/doblaje/images/2/2b/-Buzz-.png/revision/latest?cb=20180322164706&path-prefix=es', N'Buzz Lightyear', 70, 2, NULL, 1)
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia], [Id_Peliserie]) VALUES (9, N'https://upload.wikimedia.org/wikipedia/en/9/94/Simba_%28_Disney_character_-_adult%29.png', N'Simba', 25, 90, NULL, 2)
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia], [Id_Peliserie]) VALUES (10, N'https://static.wikia.nocookie.net/disney/images/c/c7/Scar.png/revision/latest?cb=20121008181300&path-prefix=es', N'Scar', 47, 104, NULL, 2)
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia], [Id_Peliserie]) VALUES (12, N'https://e7.pngegg.com/pngimages/172/831/png-clipart-monster-inc-james-p-sullivan-art-monsters-inc-mike-sulley-to-the-rescue-james-p-sullivan-mike-wazowski-boo-monster-inc-snout-pixar.png', N'Sullivan', 39, 154, NULL, 3)
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia], [Id_Peliserie]) VALUES (14, N'https://files.cults3d.com/uploaders/14388486/illustration-file/dad8d89e-1902-4ae3-9d1b-33f51ba19043/Mike%20Wazowski_2.jpg', N'Mike Wazowski', 34, 53, NULL, 3)
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia], [Id_Peliserie]) VALUES (15, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZu89Z6noRcjnejM-n8MVtWSUErU_WnSGKleeFW-nqyQ&s', N'Edna Moda', 77, 45, NULL, 4)
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia], [Id_Peliserie]) VALUES (18, N'https://depor.com/resizer/oVdRDFhBY3Oo4oVd7z0Pfuvvbgk=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/L2S5EWBRARHVTBSSJFMHRJNTHQ.jpeg', N'Frozono', 33, 75, NULL, 4)
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia], [Id_Peliserie]) VALUES (19, N'https://i.ytimg.com/vi/2gRcvS2ltjE/maxresdefault.jpg', N'Rasho McQueen', 32, 225, NULL, 5)
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia], [Id_Peliserie]) VALUES (20, N'https://m.media-amazon.com/images/I/71JhK9t7FoL._AC_UF894,1000_QL80_.jpg', N'Mack', 53, 341, NULL, 5)
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia], [Id_Peliserie]) VALUES (21, N'https://hips.hearstapps.com/es.h-cdn.co/fotoes/images/peliculas/wall-e/galeria/3139610-3-esl-ES/Wall-E.jpg', N'Wall-e', 102, 30, NULL, 6)
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia], [Id_Peliserie]) VALUES (22, N'https://static.wikia.nocookie.net/doblaje/images/1/14/EVA.jpg/revision/latest?cb=20190812011049&path-prefix=es', N'Eva', 22, 27, NULL, 6)
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia], [Id_Peliserie]) VALUES (23, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJSrwsNbImPYJgEN2hhlicH6Ilqi2CR1mO4ugv6jWZpy1gjpIDzl6N7C2sWzkzzjWG-Io&usqp=CAU', N'Bruce', 64, 572, NULL, 7)
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia], [Id_Peliserie]) VALUES (24, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS95V_7C5qnB7MyVx9gmRHGO88gyyAtDIUWkcNAVLTSsg&s', N'Chiqui', 15, 12, NULL, 7)
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia], [Id_Peliserie]) VALUES (25, N'https://i.ytimg.com/vi/6Q6qHRHTTPg/maxresdefault.jpg', N'Burro', 27, 84, NULL, 8)
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia], [Id_Peliserie]) VALUES (26, N'https://i.ytimg.com/vi/8e-ULWOMU70/maxresdefault.jpg', N'Jengibre', 18, 0.5, NULL, 8)
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia], [Id_Peliserie]) VALUES (27, N'https://static.wikia.nocookie.net/toystoryland/images/2/25/Free_disney_clipart_toy_story_bullseye.jpg/revision/latest/scale-to-width-down/382?cb=20100723171110&path-prefix=es', N'Tiro al Blanco', 42, 2.5, NULL, 1)
SET IDENTITY_INSERT [dbo].[Personaje] OFF
GO
ALTER TABLE [dbo].[Personaje]  WITH CHECK ADD  CONSTRAINT [FK_Personaje_Peliserie] FOREIGN KEY([Id_Peliserie])
REFERENCES [dbo].[Peliserie] ([Id])
GO
ALTER TABLE [dbo].[Personaje] CHECK CONSTRAINT [FK_Personaje_Peliserie]
GO
/****** Object:  StoredProcedure [dbo].[deletePeliserie]    Script Date: 29/5/2023 11:15:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deletePeliserie]
	@Id int
AS
BEGIN
	DELETE FROM Personaje WHERE Id_Peliserie = @Id
	DELETE FROM Peliserie WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[deletePersonaje]    Script Date: 29/5/2023 11:15:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deletePersonaje]
	@Id int
AS
BEGIN
	DELETE FROM Personaje WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[getPeliserieAsc]    Script Date: 29/5/2023 11:15:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPeliserieAsc]
AS
BEGIN
	SELECT * FROM Peliserie ORDER BY Id ASC
END
GO
/****** Object:  StoredProcedure [dbo].[getPeliserieById]    Script Date: 29/5/2023 11:15:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPeliserieById]
	@Id int
AS
BEGIN
	SELECT * FROM Peliserie WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[getPeliserieByName]    Script Date: 29/5/2023 11:15:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPeliserieByName]
	@Titulo varchar(50)
AS
BEGIN
	SELECT * FROM Peliserie WHERE Titulo = @Titulo
END
GO
/****** Object:  StoredProcedure [dbo].[getPeliserieDesc]    Script Date: 29/5/2023 11:15:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPeliserieDesc]
AS
BEGIN
	SELECT * FROM Peliserie ORDER BY Id DESC
END
GO
/****** Object:  StoredProcedure [dbo].[getPeliseries]    Script Date: 29/5/2023 11:15:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPeliseries]
AS
BEGIN
	SELECT * FROM Peliserie
END
GO
/****** Object:  StoredProcedure [dbo].[getPersonajeByAge]    Script Date: 29/5/2023 11:15:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPersonajeByAge]
	@Edad int
AS
BEGIN
	SELECT * FROM Personaje WHERE Edad = @Edad
END
GO
/****** Object:  StoredProcedure [dbo].[getPersonajeById]    Script Date: 29/5/2023 11:15:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPersonajeById]
	@Id int
AS
BEGIN
	SELECT * FROM Personaje WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[getPersonajeByMovie]    Script Date: 29/5/2023 11:15:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPersonajeByMovie]
	@Id_Peliserie int
AS
BEGIN
	SELECT * FROM Personaje WHERE Id_Peliserie = @Id_Peliserie
END
GO
/****** Object:  StoredProcedure [dbo].[getPersonajeByName]    Script Date: 29/5/2023 11:15:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPersonajeByName]
	@Nombre varchar(50)
AS
BEGIN
	SELECT * FROM Personaje WHERE Nombre = @Nombre
END
GO
/****** Object:  StoredProcedure [dbo].[getPersonajes]    Script Date: 29/5/2023 11:15:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPersonajes]
AS
BEGIN
	SELECT * FROM Personaje
END
GO
/****** Object:  StoredProcedure [dbo].[postPeliserie]    Script Date: 29/5/2023 11:15:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[postPeliserie]
	@Imagen varchar(999),
	@Titulo varchar(50),
	@Fecha_Creacion date,
	@Calificacion float
AS
BEGIN
	INSERT INTO Peliserie VALUES (@Imagen,
	@Titulo,
	@Fecha_Creacion,
	@Calificacion)
END
GO
/****** Object:  StoredProcedure [dbo].[postPersonaje]    Script Date: 29/5/2023 11:15:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[postPersonaje]
	@Imagen varchar(4000),
	@Nombre varchar(50),
	@Edad int,
	@Peso float,
	@Historia varchar(4000),
	@Id_Peliserie int
AS
BEGIN
	INSERT INTO Personaje VALUES (@Imagen,
	@Nombre,
	@Edad,
	@Peso,
	@Historia,
	@Id_Peliserie)
END
GO
/****** Object:  StoredProcedure [dbo].[putPeliserie]    Script Date: 29/5/2023 11:15:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[putPeliserie]
	@Id int,
	@Calificacion float
AS
BEGIN
	UPDATE Peliserie SET Calificacion = @Calificacion WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[putPersonaje]    Script Date: 29/5/2023 11:15:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[putPersonaje]
	@Id int,
	@Edad int,
	@Peso float,
	@Historia varchar(4000)
AS
BEGIN
	UPDATE Personaje SET Edad = @Edad, Peso = @Peso, Historia = @Historia WHERE Id = @Id
END
GO
USE [master]
GO
ALTER DATABASE [Disney] SET  READ_WRITE 
GO
