USE [master]
GO
/****** Object:  Database [Corona_DB]    Script Date: 11/05/23 12:53:39 ******/
CREATE DATABASE [Corona_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Corona_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Corona_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Corona_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Corona_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Corona_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Corona_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Corona_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Corona_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Corona_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Corona_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Corona_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Corona_DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Corona_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Corona_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Corona_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Corona_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Corona_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Corona_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Corona_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Corona_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Corona_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Corona_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Corona_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Corona_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Corona_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Corona_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Corona_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Corona_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Corona_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Corona_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Corona_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Corona_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Corona_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Corona_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Corona_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Corona_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Corona_DB] SET QUERY_STORE = OFF
GO
USE [Corona_DB]
GO
/****** Object:  Table [dbo].[City_tb]    Script Date: 11/05/23 12:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City_tb](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoronaDetails_tb]    Script Date: 11/05/23 12:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoronaDetails_tb](
	[CoronaDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[vaccinationDate1] [date] NULL,
	[vaccinationDate2] [date] NULL,
	[vaccinationDate3] [date] NULL,
	[vaccinationDate4] [date] NULL,
	[manufacturerVaccineId] [int] NULL,
	[positiveResultDate] [date] NULL,
	[recoveryDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[CoronaDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image_tb]    Script Date: 11/05/23 12:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image_tb](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ImageData] [varbinary](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manufacturerVaccine_tb]    Script Date: 11/05/23 12:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manufacturerVaccine_tb](
	[manufacturerId] [int] IDENTITY(1,1) NOT NULL,
	[manufacturer] [nvarchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[manufacturerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person_tb]    Script Date: 11/05/23 12:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person_tb](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](15) NOT NULL,
	[LastName] [nvarchar](15) NOT NULL,
	[CityId] [int] NOT NULL,
	[StreetId] [int] NOT NULL,
	[HouseNumber] [smallint] NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[phone] [varchar](9) NULL,
	[MobilePhone] [varchar](10) NULL,
	[ImageId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Street_tb]    Script Date: 11/05/23 12:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Street_tb](
	[StreetId] [int] IDENTITY(1,1) NOT NULL,
	[StreetName] [nvarchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StreetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City_tb] ON 

INSERT [dbo].[City_tb] ([CityId], [CityName]) VALUES (1, N'ירושלים')
INSERT [dbo].[City_tb] ([CityId], [CityName]) VALUES (2, N'תל אביב')
INSERT [dbo].[City_tb] ([CityId], [CityName]) VALUES (3, N'רמת גן')
INSERT [dbo].[City_tb] ([CityId], [CityName]) VALUES (4, N'טבריה')
INSERT [dbo].[City_tb] ([CityId], [CityName]) VALUES (5, N'צפת')
INSERT [dbo].[City_tb] ([CityId], [CityName]) VALUES (6, N'עפולה')
INSERT [dbo].[City_tb] ([CityId], [CityName]) VALUES (7, N'רעננה')
INSERT [dbo].[City_tb] ([CityId], [CityName]) VALUES (8, N'אשדוד')
INSERT [dbo].[City_tb] ([CityId], [CityName]) VALUES (9, N'אשקלון')
SET IDENTITY_INSERT [dbo].[City_tb] OFF
GO
SET IDENTITY_INSERT [dbo].[CoronaDetails_tb] ON 

INSERT [dbo].[CoronaDetails_tb] ([CoronaDetailsId], [PersonId], [vaccinationDate1], [vaccinationDate2], [vaccinationDate3], [vaccinationDate4], [manufacturerVaccineId], [positiveResultDate], [recoveryDate]) VALUES (4, 5, CAST(N'2020-01-26' AS Date), CAST(N'2021-07-20' AS Date), CAST(N'2021-09-18' AS Date), NULL, 1, NULL, NULL)
INSERT [dbo].[CoronaDetails_tb] ([CoronaDetailsId], [PersonId], [vaccinationDate1], [vaccinationDate2], [vaccinationDate3], [vaccinationDate4], [manufacturerVaccineId], [positiveResultDate], [recoveryDate]) VALUES (5, 6, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-05-01' AS Date), CAST(N'2023-05-10' AS Date))
INSERT [dbo].[CoronaDetails_tb] ([CoronaDetailsId], [PersonId], [vaccinationDate1], [vaccinationDate2], [vaccinationDate3], [vaccinationDate4], [manufacturerVaccineId], [positiveResultDate], [recoveryDate]) VALUES (11, 6, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-05-01' AS Date), CAST(N'2023-05-10' AS Date))
INSERT [dbo].[CoronaDetails_tb] ([CoronaDetailsId], [PersonId], [vaccinationDate1], [vaccinationDate2], [vaccinationDate3], [vaccinationDate4], [manufacturerVaccineId], [positiveResultDate], [recoveryDate]) VALUES (12, 6, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-05-01' AS Date), CAST(N'2023-05-20' AS Date))
SET IDENTITY_INSERT [dbo].[CoronaDetails_tb] OFF
GO
SET IDENTITY_INSERT [dbo].[manufacturerVaccine_tb] ON 

INSERT [dbo].[manufacturerVaccine_tb] ([manufacturerId], [manufacturer]) VALUES (1, N'מודרנה')
INSERT [dbo].[manufacturerVaccine_tb] ([manufacturerId], [manufacturer]) VALUES (2, N'פייזר')
SET IDENTITY_INSERT [dbo].[manufacturerVaccine_tb] OFF
GO
SET IDENTITY_INSERT [dbo].[Person_tb] ON 

INSERT [dbo].[Person_tb] ([PersonId], [FirstName], [LastName], [CityId], [StreetId], [HouseNumber], [DateOfBirth], [phone], [MobilePhone], [ImageId]) VALUES (5, N'אלון', N'שטרית', 1, 1, 3, CAST(N'1986-07-20' AS Date), N'025712222', N'0583265963', NULL)
INSERT [dbo].[Person_tb] ([PersonId], [FirstName], [LastName], [CityId], [StreetId], [HouseNumber], [DateOfBirth], [phone], [MobilePhone], [ImageId]) VALUES (6, N'דני', N'שמש', 1, 2, 9, CAST(N'1999-03-08' AS Date), N'025864593', N'0553198642', NULL)
INSERT [dbo].[Person_tb] ([PersonId], [FirstName], [LastName], [CityId], [StreetId], [HouseNumber], [DateOfBirth], [phone], [MobilePhone], [ImageId]) VALUES (7, N'ירדן', N'כחלון', 1, 1, 30, CAST(N'1986-07-20' AS Date), N'025712222', N'0583265963', NULL)
INSERT [dbo].[Person_tb] ([PersonId], [FirstName], [LastName], [CityId], [StreetId], [HouseNumber], [DateOfBirth], [phone], [MobilePhone], [ImageId]) VALUES (8, N'ירדן', N'כחלון', 1, 1, 30, CAST(N'1986-07-20' AS Date), N'025712222', N'0583265963', NULL)
INSERT [dbo].[Person_tb] ([PersonId], [FirstName], [LastName], [CityId], [StreetId], [HouseNumber], [DateOfBirth], [phone], [MobilePhone], [ImageId]) VALUES (9, N'סיוון', N'תבור', 1, 2, 10, CAST(N'1996-08-20' AS Date), N'025712882', N'0583299963', NULL)
SET IDENTITY_INSERT [dbo].[Person_tb] OFF
GO
SET IDENTITY_INSERT [dbo].[Street_tb] ON 

INSERT [dbo].[Street_tb] ([StreetId], [StreetName]) VALUES (1, N'גולדה מאיר')
INSERT [dbo].[Street_tb] ([StreetId], [StreetName]) VALUES (2, N'הקונגרס הציוני')
INSERT [dbo].[Street_tb] ([StreetId], [StreetName]) VALUES (3, N'תל חי')
INSERT [dbo].[Street_tb] ([StreetId], [StreetName]) VALUES (4, N'תל גבורים')
INSERT [dbo].[Street_tb] ([StreetId], [StreetName]) VALUES (5, N'ניר אביב')
SET IDENTITY_INSERT [dbo].[Street_tb] OFF
GO
ALTER TABLE [dbo].[CoronaDetails_tb]  WITH CHECK ADD FOREIGN KEY([manufacturerVaccineId])
REFERENCES [dbo].[manufacturerVaccine_tb] ([manufacturerId])
GO
ALTER TABLE [dbo].[CoronaDetails_tb]  WITH CHECK ADD FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person_tb] ([PersonId])
GO
ALTER TABLE [dbo].[Person_tb]  WITH CHECK ADD FOREIGN KEY([CityId])
REFERENCES [dbo].[City_tb] ([CityId])
GO
ALTER TABLE [dbo].[Person_tb]  WITH CHECK ADD FOREIGN KEY([ImageId])
REFERENCES [dbo].[Image_tb] ([ImageID])
GO
ALTER TABLE [dbo].[Person_tb]  WITH CHECK ADD FOREIGN KEY([StreetId])
REFERENCES [dbo].[Street_tb] ([StreetId])
GO
USE [master]
GO
ALTER DATABASE [Corona_DB] SET  READ_WRITE 
GO
