USE [master]
GO
/****** Object:  Database [BuyMotors]    Script Date: 5/7/2020 21:41:42 ******/
CREATE DATABASE [BuyMotors]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BuyMotors].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BuyMotors] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BuyMotors] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BuyMotors] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BuyMotors] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BuyMotors] SET ARITHABORT OFF 
GO
ALTER DATABASE [BuyMotors] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BuyMotors] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BuyMotors] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BuyMotors] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BuyMotors] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BuyMotors] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BuyMotors] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BuyMotors] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BuyMotors] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BuyMotors] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BuyMotors] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BuyMotors] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BuyMotors] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BuyMotors] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BuyMotors] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BuyMotors] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BuyMotors] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BuyMotors] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BuyMotors] SET  MULTI_USER 
GO
ALTER DATABASE [BuyMotors] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BuyMotors] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BuyMotors] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BuyMotors] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BuyMotors] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BuyMotors', N'ON'
GO
USE [BuyMotors]
GO
/****** Object:  Table [dbo].[Carrito]    Script Date: 5/7/2020 21:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrito](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[UsuarioSessionId] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Carrito] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarritoDetalle]    Script Date: 5/7/2020 21:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarritoDetalle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarritoId] [int] NOT NULL,
	[VehiculoId] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [int] NOT NULL,
 CONSTRAINT [PK_CarritoDetalle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriaVehiculo]    Script Date: 5/7/2020 21:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriaVehiculo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CategoriaVehiculo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 5/7/2020 21:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DigitoVerificador]    Script Date: 5/7/2020 21:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DigitoVerificador](
	[Tabla] [varchar](50) NOT NULL,
	[DVV] [varchar](max) NOT NULL,
 CONSTRAINT [PK_DigitoVerificador] PRIMARY KEY CLUSTERED 
(
	[Tabla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturaCabecera]    Script Date: 5/7/2020 21:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturaCabecera](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[CarritoId] [int] NOT NULL,
	[DVH] [varchar](max) NOT NULL,
 CONSTRAINT [PK_FacturaCabecera] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturaDetalle]    Script Date: 5/7/2020 21:41:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturaDetalle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FacturaCabeceraId] [int] NOT NULL,
	[VehiculoId] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [int] NOT NULL,
 CONSTRAINT [PK_FacturaDetalle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 5/7/2020 21:41:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modelo]    Script Date: 5/7/2020 21:41:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modelo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[MarcaId] [int] NOT NULL,
 CONSTRAINT [PK_Modelo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permiso]    Script Date: 5/7/2020 21:41:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permiso](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermisoPermiso]    Script Date: 5/7/2020 21:41:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermisoPermiso](
	[PermisoId] [int] NOT NULL,
	[PermisoPadreId] [int] NOT NULL,
 CONSTRAINT [PK_PermisoPermiso] PRIMARY KEY CLUSTERED 
(
	[PermisoId] ASC,
	[PermisoPadreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoVehiculo]    Script Date: 5/7/2020 21:41:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoVehiculo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoVehiculo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 5/7/2020 21:41:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[DVH] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioPermiso]    Script Date: 5/7/2020 21:41:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioPermiso](
	[UsuarioId] [int] NOT NULL,
	[PermisoId] [int] NOT NULL,
 CONSTRAINT [PK_UsuarioRol] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC,
	[PermisoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehiculo]    Script Date: 5/7/2020 21:41:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehiculo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Patente] [varchar](10) NULL,
	[TipoVehiculoId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
	[ModeloId] [int] NOT NULL,
	[Precio] [int] NOT NULL,
	[AnioFabricacion] [int] NOT NULL,
	[CategoriaVehiculoId] [int] NOT NULL,
	[ImagenNombre] [varchar](500) NULL,
	[Disponible] [bit] NOT NULL,
 CONSTRAINT [PK_Vehiculo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Carrito] ON 
GO
INSERT [dbo].[Carrito] ([Id], [FechaCreacion], [UsuarioId], [UsuarioSessionId]) VALUES (8, CAST(N'2020-04-26T22:29:01.110' AS DateTime), 2, N'e2yk41ezcga0ysliel5rf1ax')
GO
INSERT [dbo].[Carrito] ([Id], [FechaCreacion], [UsuarioId], [UsuarioSessionId]) VALUES (9, CAST(N'2020-05-05T22:07:30.573' AS DateTime), 2, N'5mcgr0yzrz4atj0mys1p45o4')
GO
INSERT [dbo].[Carrito] ([Id], [FechaCreacion], [UsuarioId], [UsuarioSessionId]) VALUES (10, CAST(N'2020-05-26T21:08:26.037' AS DateTime), 2, N'wvzbamxixfhk1z15whehazjc')
GO
INSERT [dbo].[Carrito] ([Id], [FechaCreacion], [UsuarioId], [UsuarioSessionId]) VALUES (11, CAST(N'2020-05-31T12:39:14.470' AS DateTime), 2, N'morleirq1oticz3rpqee25hn')
GO
INSERT [dbo].[Carrito] ([Id], [FechaCreacion], [UsuarioId], [UsuarioSessionId]) VALUES (12, CAST(N'2020-05-31T14:43:17.007' AS DateTime), 2, N'iw00lr51u0ms5tijwrf2n1pe')
GO
INSERT [dbo].[Carrito] ([Id], [FechaCreacion], [UsuarioId], [UsuarioSessionId]) VALUES (13, CAST(N'2020-05-31T15:08:07.700' AS DateTime), 2, N'hcmesdfnv5dphyanm0sbc4dw')
GO
INSERT [dbo].[Carrito] ([Id], [FechaCreacion], [UsuarioId], [UsuarioSessionId]) VALUES (14, CAST(N'2020-05-31T15:14:49.627' AS DateTime), 2, N'5fl1jejutcc2yg3d0eqfj3ry')
GO
INSERT [dbo].[Carrito] ([Id], [FechaCreacion], [UsuarioId], [UsuarioSessionId]) VALUES (15, CAST(N'2020-05-31T15:19:45.020' AS DateTime), 2, N'ay1r4u5ztwdjsjhucb3fiptf')
GO
INSERT [dbo].[Carrito] ([Id], [FechaCreacion], [UsuarioId], [UsuarioSessionId]) VALUES (16, CAST(N'2020-06-08T20:45:33.503' AS DateTime), 2, N'mrtygltqytg0ymjtsax4xs0h')
GO
SET IDENTITY_INSERT [dbo].[Carrito] OFF
GO
SET IDENTITY_INSERT [dbo].[CarritoDetalle] ON 
GO
INSERT [dbo].[CarritoDetalle] ([Id], [CarritoId], [VehiculoId], [Cantidad], [Precio]) VALUES (24, 8, 7, 1, 1200000)
GO
INSERT [dbo].[CarritoDetalle] ([Id], [CarritoId], [VehiculoId], [Cantidad], [Precio]) VALUES (25, 8, 8, 1, 1200000)
GO
INSERT [dbo].[CarritoDetalle] ([Id], [CarritoId], [VehiculoId], [Cantidad], [Precio]) VALUES (26, 9, 6, 1, 800000)
GO
INSERT [dbo].[CarritoDetalle] ([Id], [CarritoId], [VehiculoId], [Cantidad], [Precio]) VALUES (27, 10, 7, 1, 1200000)
GO
INSERT [dbo].[CarritoDetalle] ([Id], [CarritoId], [VehiculoId], [Cantidad], [Precio]) VALUES (28, 11, 6, 1, 800000)
GO
INSERT [dbo].[CarritoDetalle] ([Id], [CarritoId], [VehiculoId], [Cantidad], [Precio]) VALUES (29, 12, 6, 1, 800000)
GO
INSERT [dbo].[CarritoDetalle] ([Id], [CarritoId], [VehiculoId], [Cantidad], [Precio]) VALUES (30, 13, 6, 1, 800000)
GO
INSERT [dbo].[CarritoDetalle] ([Id], [CarritoId], [VehiculoId], [Cantidad], [Precio]) VALUES (31, 14, 6, 1, 800000)
GO
INSERT [dbo].[CarritoDetalle] ([Id], [CarritoId], [VehiculoId], [Cantidad], [Precio]) VALUES (32, 15, 6, 1, 800000)
GO
INSERT [dbo].[CarritoDetalle] ([Id], [CarritoId], [VehiculoId], [Cantidad], [Precio]) VALUES (42, 16, 7, 1, 1200000)
GO
INSERT [dbo].[CarritoDetalle] ([Id], [CarritoId], [VehiculoId], [Cantidad], [Precio]) VALUES (43, 16, 8, 1, 1200000)
GO
INSERT [dbo].[CarritoDetalle] ([Id], [CarritoId], [VehiculoId], [Cantidad], [Precio]) VALUES (44, 16, 9, 1, 1200000)
GO
SET IDENTITY_INSERT [dbo].[CarritoDetalle] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoriaVehiculo] ON 
GO
INSERT [dbo].[CategoriaVehiculo] ([Id], [Nombre]) VALUES (1, N'Sedan 4 puertas')
GO
INSERT [dbo].[CategoriaVehiculo] ([Id], [Nombre]) VALUES (2, N'SUV')
GO
INSERT [dbo].[CategoriaVehiculo] ([Id], [Nombre]) VALUES (3, N'4x4')
GO
INSERT [dbo].[CategoriaVehiculo] ([Id], [Nombre]) VALUES (4, N'Coupe')
GO
SET IDENTITY_INSERT [dbo].[CategoriaVehiculo] OFF
GO
SET IDENTITY_INSERT [dbo].[Color] ON 
GO
INSERT [dbo].[Color] ([Id], [Nombre]) VALUES (1, N'Negro')
GO
INSERT [dbo].[Color] ([Id], [Nombre]) VALUES (2, N'Blanco')
GO
INSERT [dbo].[Color] ([Id], [Nombre]) VALUES (3, N'Gris')
GO
INSERT [dbo].[Color] ([Id], [Nombre]) VALUES (4, N'Azul')
GO
INSERT [dbo].[Color] ([Id], [Nombre]) VALUES (5, N'Rojo')
GO
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
INSERT [dbo].[DigitoVerificador] ([Tabla], [DVV]) VALUES (N'FacturaCabecera', N'zuKWsETP/m8qC4QYHdEBzB+IYdYaZI/bHsy/KohdKfc=')
GO
INSERT [dbo].[DigitoVerificador] ([Tabla], [DVV]) VALUES (N'Usuario', N'bUgT8g8kU4dMKtRboVyZTRTpajC2hwpKbPYTxW2hZ2w=')
GO
SET IDENTITY_INSERT [dbo].[FacturaCabecera] ON 
GO
INSERT [dbo].[FacturaCabecera] ([Id], [FechaCreacion], [UsuarioId], [CarritoId], [DVH]) VALUES (1, CAST(N'2020-05-31T15:19:56.803' AS DateTime), 2, 15, N'39gaGOwjDBCvGgGzJ6eLNvCq7kXWy0mGELPCKaSQMac=')
GO
SET IDENTITY_INSERT [dbo].[FacturaCabecera] OFF
GO
SET IDENTITY_INSERT [dbo].[FacturaDetalle] ON 
GO
INSERT [dbo].[FacturaDetalle] ([Id], [FacturaCabeceraId], [VehiculoId], [Cantidad], [Precio]) VALUES (1, 1, 6, 1, 800000)
GO
SET IDENTITY_INSERT [dbo].[FacturaDetalle] OFF
GO
SET IDENTITY_INSERT [dbo].[Marca] ON 
GO
INSERT [dbo].[Marca] ([Id], [Nombre]) VALUES (1, N'Chevrolet')
GO
INSERT [dbo].[Marca] ([Id], [Nombre]) VALUES (2, N'Ford')
GO
INSERT [dbo].[Marca] ([Id], [Nombre]) VALUES (3, N'Peugeot')
GO
INSERT [dbo].[Marca] ([Id], [Nombre]) VALUES (4, N'Volkswagen')
GO
INSERT [dbo].[Marca] ([Id], [Nombre]) VALUES (5, N'Renault')
GO
SET IDENTITY_INSERT [dbo].[Marca] OFF
GO
SET IDENTITY_INSERT [dbo].[Modelo] ON 
GO
INSERT [dbo].[Modelo] ([Id], [Nombre], [MarcaId]) VALUES (1, N'Corsa', 1)
GO
INSERT [dbo].[Modelo] ([Id], [Nombre], [MarcaId]) VALUES (2, N'Spin', 1)
GO
INSERT [dbo].[Modelo] ([Id], [Nombre], [MarcaId]) VALUES (3, N'Fiesta', 2)
GO
INSERT [dbo].[Modelo] ([Id], [Nombre], [MarcaId]) VALUES (4, N'Ka', 2)
GO
INSERT [dbo].[Modelo] ([Id], [Nombre], [MarcaId]) VALUES (5, N'Ranger', 2)
GO
INSERT [dbo].[Modelo] ([Id], [Nombre], [MarcaId]) VALUES (6, N'207', 3)
GO
INSERT [dbo].[Modelo] ([Id], [Nombre], [MarcaId]) VALUES (7, N'208', 3)
GO
INSERT [dbo].[Modelo] ([Id], [Nombre], [MarcaId]) VALUES (8, N'Gol', 4)
GO
INSERT [dbo].[Modelo] ([Id], [Nombre], [MarcaId]) VALUES (9, N'Bora', 4)
GO
INSERT [dbo].[Modelo] ([Id], [Nombre], [MarcaId]) VALUES (10, N'Vento', 4)
GO
INSERT [dbo].[Modelo] ([Id], [Nombre], [MarcaId]) VALUES (11, N'Amarok', 4)
GO
INSERT [dbo].[Modelo] ([Id], [Nombre], [MarcaId]) VALUES (12, N'Captur', 5)
GO
INSERT [dbo].[Modelo] ([Id], [Nombre], [MarcaId]) VALUES (13, N'Megane', 5)
GO
SET IDENTITY_INSERT [dbo].[Modelo] OFF
GO
SET IDENTITY_INSERT [dbo].[Permiso] ON 
GO
INSERT [dbo].[Permiso] ([Id], [Nombre]) VALUES (1, N'Usuario Basico')
GO
INSERT [dbo].[Permiso] ([Id], [Nombre]) VALUES (2, N'Administrador')
GO
INSERT [dbo].[Permiso] ([Id], [Nombre]) VALUES (3, N'Web Master')
GO
INSERT [dbo].[Permiso] ([Id], [Nombre]) VALUES (4, N'Login')
GO
INSERT [dbo].[Permiso] ([Id], [Nombre]) VALUES (5, N'Chequeo DV')
GO
INSERT [dbo].[Permiso] ([Id], [Nombre]) VALUES (6, N'Backups')
GO
INSERT [dbo].[Permiso] ([Id], [Nombre]) VALUES (7, N'Bitacora')
GO
SET IDENTITY_INSERT [dbo].[Permiso] OFF
GO
INSERT [dbo].[PermisoPermiso] ([PermisoId], [PermisoPadreId]) VALUES (4, 1)
GO
INSERT [dbo].[PermisoPermiso] ([PermisoId], [PermisoPadreId]) VALUES (4, 2)
GO
INSERT [dbo].[PermisoPermiso] ([PermisoId], [PermisoPadreId]) VALUES (4, 3)
GO
INSERT [dbo].[PermisoPermiso] ([PermisoId], [PermisoPadreId]) VALUES (5, 3)
GO
INSERT [dbo].[PermisoPermiso] ([PermisoId], [PermisoPadreId]) VALUES (6, 3)
GO
INSERT [dbo].[PermisoPermiso] ([PermisoId], [PermisoPadreId]) VALUES (7, 2)
GO
INSERT [dbo].[PermisoPermiso] ([PermisoId], [PermisoPadreId]) VALUES (7, 3)
GO
SET IDENTITY_INSERT [dbo].[TipoVehiculo] ON 
GO
INSERT [dbo].[TipoVehiculo] ([Id], [Nombre]) VALUES (1, N'Auto')
GO
INSERT [dbo].[TipoVehiculo] ([Id], [Nombre]) VALUES (2, N'Moto')
GO
INSERT [dbo].[TipoVehiculo] ([Id], [Nombre]) VALUES (3, N'Camioneta')
GO
SET IDENTITY_INSERT [dbo].[TipoVehiculo] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Telefono], [Email], [Password], [DVH]) VALUES (1, N'Admin', N'Administrador', N'1149182290', N'admin@mail.com', N'hCVSu+oS1AOpATVrG+BVRWTCQAKpGx9uyA+Tl+Tg6gQ=', N'hNL4c3Z0cnvzz1HYZyqB4Vp+PrbE3aEvB+cs58uJX7s=')
GO
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Telefono], [Email], [Password], [DVH]) VALUES (2, N'Usuario', N'Basico', N'1149182291', N'usuariobasico@mail.com', N'TRgMIB/OHCpe2yH2MfYsYtgBCVO8v3JYWWo5ivJVaac=', N'EJDAIdUAOX4in41CILQ/X25binZyKF/9LL7qx2/ZSKI=')
GO
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Telefono], [Email], [Password], [DVH]) VALUES (3, N'Web', N'Master', N'1149182292', N'webmaster@mail.com', N'0HoKhyeCMio3BB5aHPABLUATZJWHqPfitHIv6FUsbjk=', N'g0HaUus/ZOGSZzPLoyeNeYNFx6KORpetI7eDVwKzSYI=')
GO
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Telefono], [Email], [Password], [DVH]) VALUES (4, N'Usuario', N'Nuevo', N'123456', N'usuarionuevo1@mail.com', N'gAcZfAF71+wa2+skN10ImLt1ZfwSmq04zD9h9qjdfYY=', N'/ofFSOVafF6G7BIX+Vyj/rUmuFtxaxaeFF3I+cfmwB8=')
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
INSERT [dbo].[UsuarioPermiso] ([UsuarioId], [PermisoId]) VALUES (1, 2)
GO
INSERT [dbo].[UsuarioPermiso] ([UsuarioId], [PermisoId]) VALUES (2, 1)
GO
INSERT [dbo].[UsuarioPermiso] ([UsuarioId], [PermisoId]) VALUES (3, 3)
GO
INSERT [dbo].[UsuarioPermiso] ([UsuarioId], [PermisoId]) VALUES (4, 1)
GO
SET IDENTITY_INSERT [dbo].[Vehiculo] ON 
GO
INSERT [dbo].[Vehiculo] ([Id], [Patente], [TipoVehiculoId], [ColorId], [ModeloId], [Precio], [AnioFabricacion], [CategoriaVehiculoId], [ImagenNombre], [Disponible]) VALUES (6, N'AA41ES', 1, 1, 1, 800000, 2020, 1, N'corsa.jpg', 0)
GO
INSERT [dbo].[Vehiculo] ([Id], [Patente], [TipoVehiculoId], [ColorId], [ModeloId], [Precio], [AnioFabricacion], [CategoriaVehiculoId], [ImagenNombre], [Disponible]) VALUES (7, N'BB56YW', 1, 2, 2, 1200000, 2019, 1, N'spin.jpg', 1)
GO
INSERT [dbo].[Vehiculo] ([Id], [Patente], [TipoVehiculoId], [ColorId], [ModeloId], [Precio], [AnioFabricacion], [CategoriaVehiculoId], [ImagenNombre], [Disponible]) VALUES (8, N'CC23TR', 1, 2, 3, 1200000, 2017, 1, N'fiesta.jpg', 1)
GO
INSERT [dbo].[Vehiculo] ([Id], [Patente], [TipoVehiculoId], [ColorId], [ModeloId], [Precio], [AnioFabricacion], [CategoriaVehiculoId], [ImagenNombre], [Disponible]) VALUES (9, N'DD54HJ', 1, 2, 4, 1200000, 2018, 1, N'ka.jpg', 1)
GO
INSERT [dbo].[Vehiculo] ([Id], [Patente], [TipoVehiculoId], [ColorId], [ModeloId], [Precio], [AnioFabricacion], [CategoriaVehiculoId], [ImagenNombre], [Disponible]) VALUES (10, N'EE99CV', 3, 2, 5, 1200000, 2019, 3, N'ranger.jpg', 1)
GO
INSERT [dbo].[Vehiculo] ([Id], [Patente], [TipoVehiculoId], [ColorId], [ModeloId], [Precio], [AnioFabricacion], [CategoriaVehiculoId], [ImagenNombre], [Disponible]) VALUES (11, N'FF88ZU', 1, 1, 6, 1800000, 2016, 1, N'207.jpg', 1)
GO
INSERT [dbo].[Vehiculo] ([Id], [Patente], [TipoVehiculoId], [ColorId], [ModeloId], [Precio], [AnioFabricacion], [CategoriaVehiculoId], [ImagenNombre], [Disponible]) VALUES (12, N'GG33YT', 1, 2, 7, 1900000, 2017, 1, N'208.jpg', 1)
GO
INSERT [dbo].[Vehiculo] ([Id], [Patente], [TipoVehiculoId], [ColorId], [ModeloId], [Precio], [AnioFabricacion], [CategoriaVehiculoId], [ImagenNombre], [Disponible]) VALUES (13, N'HH22XC', 1, 3, 8, 1300000, 2018, 1, N'gol.jpg', 1)
GO
INSERT [dbo].[Vehiculo] ([Id], [Patente], [TipoVehiculoId], [ColorId], [ModeloId], [Precio], [AnioFabricacion], [CategoriaVehiculoId], [ImagenNombre], [Disponible]) VALUES (14, N'II55BB', 1, 2, 9, 1500000, 2019, 1, N'bora.jpg', 1)
GO
INSERT [dbo].[Vehiculo] ([Id], [Patente], [TipoVehiculoId], [ColorId], [ModeloId], [Precio], [AnioFabricacion], [CategoriaVehiculoId], [ImagenNombre], [Disponible]) VALUES (15, N'JJ34SS', 1, 2, 10, 1200000, 2020, 1, N'vento.jpg', 1)
GO
INSERT [dbo].[Vehiculo] ([Id], [Patente], [TipoVehiculoId], [ColorId], [ModeloId], [Precio], [AnioFabricacion], [CategoriaVehiculoId], [ImagenNombre], [Disponible]) VALUES (16, N'KK87HJ', 3, 4, 11, 2000000, 2020, 3, N'amarok.png', 1)
GO
INSERT [dbo].[Vehiculo] ([Id], [Patente], [TipoVehiculoId], [ColorId], [ModeloId], [Precio], [AnioFabricacion], [CategoriaVehiculoId], [ImagenNombre], [Disponible]) VALUES (17, N'EM61RT', 3, 2, 12, 2000000, 2020, 3, N'captur.jpg', 1)
GO
INSERT [dbo].[Vehiculo] ([Id], [Patente], [TipoVehiculoId], [ColorId], [ModeloId], [Precio], [AnioFabricacion], [CategoriaVehiculoId], [ImagenNombre], [Disponible]) VALUES (18, N'LK09RE', 1, 5, 13, 1700000, 2018, 1, N'megane.png', 1)
GO
SET IDENTITY_INSERT [dbo].[Vehiculo] OFF
GO
ALTER TABLE [dbo].[Vehiculo] ADD  CONSTRAINT [DF_Vehiculo_Disponible]  DEFAULT ((1)) FOR [Disponible]
GO
ALTER TABLE [dbo].[Carrito]  WITH CHECK ADD  CONSTRAINT [FK_Carrito_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Carrito] CHECK CONSTRAINT [FK_Carrito_Usuario]
GO
ALTER TABLE [dbo].[CarritoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_CarritoDetalle_Carrito1] FOREIGN KEY([CarritoId])
REFERENCES [dbo].[Carrito] ([Id])
GO
ALTER TABLE [dbo].[CarritoDetalle] CHECK CONSTRAINT [FK_CarritoDetalle_Carrito1]
GO
ALTER TABLE [dbo].[CarritoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_CarritoDetalle_Vehiculo] FOREIGN KEY([VehiculoId])
REFERENCES [dbo].[Vehiculo] ([Id])
GO
ALTER TABLE [dbo].[CarritoDetalle] CHECK CONSTRAINT [FK_CarritoDetalle_Vehiculo]
GO
ALTER TABLE [dbo].[FacturaCabecera]  WITH CHECK ADD  CONSTRAINT [FK_FacturaCabecera_Carrito] FOREIGN KEY([CarritoId])
REFERENCES [dbo].[Carrito] ([Id])
GO
ALTER TABLE [dbo].[FacturaCabecera] CHECK CONSTRAINT [FK_FacturaCabecera_Carrito]
GO
ALTER TABLE [dbo].[FacturaCabecera]  WITH CHECK ADD  CONSTRAINT [FK_FacturaCabecera_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[FacturaCabecera] CHECK CONSTRAINT [FK_FacturaCabecera_Usuario]
GO
ALTER TABLE [dbo].[FacturaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_FacturaDetalle_FacturaCabecera] FOREIGN KEY([FacturaCabeceraId])
REFERENCES [dbo].[FacturaCabecera] ([Id])
GO
ALTER TABLE [dbo].[FacturaDetalle] CHECK CONSTRAINT [FK_FacturaDetalle_FacturaCabecera]
GO
ALTER TABLE [dbo].[FacturaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_FacturaDetalle_Vehiculo] FOREIGN KEY([VehiculoId])
REFERENCES [dbo].[Vehiculo] ([Id])
GO
ALTER TABLE [dbo].[FacturaDetalle] CHECK CONSTRAINT [FK_FacturaDetalle_Vehiculo]
GO
ALTER TABLE [dbo].[Modelo]  WITH CHECK ADD  CONSTRAINT [FK_Modelo_Marca] FOREIGN KEY([MarcaId])
REFERENCES [dbo].[Marca] ([Id])
GO
ALTER TABLE [dbo].[Modelo] CHECK CONSTRAINT [FK_Modelo_Marca]
GO
ALTER TABLE [dbo].[PermisoPermiso]  WITH CHECK ADD  CONSTRAINT [FK_PermisoPermiso_Permiso] FOREIGN KEY([PermisoId])
REFERENCES [dbo].[Permiso] ([Id])
GO
ALTER TABLE [dbo].[PermisoPermiso] CHECK CONSTRAINT [FK_PermisoPermiso_Permiso]
GO
ALTER TABLE [dbo].[PermisoPermiso]  WITH CHECK ADD  CONSTRAINT [FK_PermisoPermiso_Permiso1] FOREIGN KEY([PermisoPadreId])
REFERENCES [dbo].[Permiso] ([Id])
GO
ALTER TABLE [dbo].[PermisoPermiso] CHECK CONSTRAINT [FK_PermisoPermiso_Permiso1]
GO
ALTER TABLE [dbo].[UsuarioPermiso]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioRol_Rol] FOREIGN KEY([PermisoId])
REFERENCES [dbo].[Permiso] ([Id])
GO
ALTER TABLE [dbo].[UsuarioPermiso] CHECK CONSTRAINT [FK_UsuarioRol_Rol]
GO
ALTER TABLE [dbo].[UsuarioPermiso]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioRol_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[UsuarioPermiso] CHECK CONSTRAINT [FK_UsuarioRol_Usuario]
GO
ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculo_CategoriaVehiculo] FOREIGN KEY([CategoriaVehiculoId])
REFERENCES [dbo].[CategoriaVehiculo] ([Id])
GO
ALTER TABLE [dbo].[Vehiculo] CHECK CONSTRAINT [FK_Vehiculo_CategoriaVehiculo]
GO
ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculo_Color] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Color] ([Id])
GO
ALTER TABLE [dbo].[Vehiculo] CHECK CONSTRAINT [FK_Vehiculo_Color]
GO
ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculo_Modelo] FOREIGN KEY([ModeloId])
REFERENCES [dbo].[Modelo] ([Id])
GO
ALTER TABLE [dbo].[Vehiculo] CHECK CONSTRAINT [FK_Vehiculo_Modelo]
GO
ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculo_TipoVehiculo] FOREIGN KEY([TipoVehiculoId])
REFERENCES [dbo].[TipoVehiculo] ([Id])
GO
ALTER TABLE [dbo].[Vehiculo] CHECK CONSTRAINT [FK_Vehiculo_TipoVehiculo]
GO
USE [master]
GO
ALTER DATABASE [BuyMotors] SET  READ_WRITE 
GO
