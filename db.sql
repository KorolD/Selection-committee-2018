USE [master]
GO
/****** Object:  Database [EnrollmentCampaign]    Script Date: 10.01.2018 19:57:52 ******/
CREATE DATABASE [EnrollmentCampaign]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EnrollmentCampaign', FILENAME = N'E:\MS_SQL_12\MSSQL11.SQLEXPRESS\MSSQL\DATA\EnrollmentCampaign.mdf' , SIZE = 5120KB , MAXSIZE = 1024000KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EnrollmentCampaign_log', FILENAME = N'E:\MS_SQL_12\MSSQL11.SQLEXPRESS\MSSQL\DATA\EnrollmentCampaign_log.ldf' , SIZE = 1024KB , MAXSIZE = 1024000KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EnrollmentCampaign] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EnrollmentCampaign].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EnrollmentCampaign] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EnrollmentCampaign] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EnrollmentCampaign] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EnrollmentCampaign] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EnrollmentCampaign] SET ARITHABORT OFF 
GO
ALTER DATABASE [EnrollmentCampaign] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EnrollmentCampaign] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EnrollmentCampaign] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EnrollmentCampaign] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EnrollmentCampaign] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EnrollmentCampaign] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EnrollmentCampaign] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EnrollmentCampaign] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EnrollmentCampaign] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EnrollmentCampaign] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EnrollmentCampaign] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EnrollmentCampaign] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EnrollmentCampaign] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EnrollmentCampaign] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EnrollmentCampaign] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EnrollmentCampaign] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EnrollmentCampaign] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EnrollmentCampaign] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EnrollmentCampaign] SET  MULTI_USER 
GO
ALTER DATABASE [EnrollmentCampaign] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EnrollmentCampaign] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EnrollmentCampaign] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EnrollmentCampaign] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [EnrollmentCampaign]
GO
/****** Object:  User [IIS APPPOOL\DefaultAppPool]    Script Date: 10.01.2018 19:57:52 ******/
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
/****** Object:  Table [dbo].[countries_enum]    Script Date: 10.01.2018 19:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countries_enum](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_countries_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_countries_enum] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_enum]    Script Date: 10.01.2018 19:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_enum](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CT_enum] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_CT_enum] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_results]    Script Date: 10.01.2018 19:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_results](
	[enrollee_ID] [int] NOT NULL,
	[CT_ID] [int] NOT NULL,
	[result] [tinyint] NOT NULL,
 CONSTRAINT [PK_CT_results] PRIMARY KEY CLUSTERED 
(
	[enrollee_ID] ASC,
	[CT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[enrollees]    Script Date: 10.01.2018 19:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[enrollees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[patronymic] [nvarchar](50) NOT NULL,
	[town_ID] [int] NOT NULL,
	[street] [nvarchar](50) NOT NULL,
	[house] [smallint] NOT NULL,
	[block] [smallint] NULL,
	[apartment] [smallint] NULL,
	[birthdate] [date] NOT NULL,
	[passport] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_enrollees] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[faculty_enum]    Script Date: 10.01.2018 19:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[faculty_enum](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_faculty_enum] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_faculty_enum] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parents]    Script Date: 10.01.2018 19:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parents](
	[enrollee_ID] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[patronymic] [nvarchar](50) NOT NULL,
	[birthdate] [date] NOT NULL,
 CONSTRAINT [PK_parents] PRIMARY KEY CLUSTERED 
(
	[enrollee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[specialty_enum]    Script Date: 10.01.2018 19:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[specialty_enum](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[faculty_ID] [int] NOT NULL,
	[admission] [int] NOT NULL,
 CONSTRAINT [PK_specialty_enum] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_specialty_enum] UNIQUE NONCLUSTERED 
(
	[faculty_ID] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[specialty_priorities]    Script Date: 10.01.2018 19:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[specialty_priorities](
	[enrollee_ID] [int] NOT NULL,
	[specialty_ID] [int] NOT NULL,
	[priority] [tinyint] NOT NULL,
 CONSTRAINT [PK_specialty_priorities] PRIMARY KEY CLUSTERED 
(
	[enrollee_ID] ASC,
	[specialty_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_specialty_priorities] UNIQUE NONCLUSTERED 
(
	[enrollee_ID] ASC,
	[priority] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[towns_enum]    Script Date: 10.01.2018 19:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[towns_enum](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[country_ID] [int] NOT NULL,
 CONSTRAINT [PK_towns_enum] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_towns_enum] UNIQUE NONCLUSTERED 
(
	[country_ID] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tree]    Script Date: 10.01.2018 19:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tree](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[parent_ID] [int] NOT NULL,
	[value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tree] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[writing_locker]    Script Date: 10.01.2018 19:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[writing_locker](
	[enrollee_ID] [int] NOT NULL,
	[begin_time] [datetime] NOT NULL,
 CONSTRAINT [PK_writing_locker] PRIMARY KEY CLUSTERED 
(
	[enrollee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CT_results]  WITH CHECK ADD  CONSTRAINT [FK_CT_results_CT_enum] FOREIGN KEY([CT_ID])
REFERENCES [dbo].[CT_enum] ([ID])
GO
ALTER TABLE [dbo].[CT_results] CHECK CONSTRAINT [FK_CT_results_CT_enum]
GO
ALTER TABLE [dbo].[CT_results]  WITH CHECK ADD  CONSTRAINT [FK_CT_results_enrollees] FOREIGN KEY([enrollee_ID])
REFERENCES [dbo].[enrollees] ([ID])
GO
ALTER TABLE [dbo].[CT_results] CHECK CONSTRAINT [FK_CT_results_enrollees]
GO
ALTER TABLE [dbo].[enrollees]  WITH CHECK ADD  CONSTRAINT [FK_enrollees_towns_enum] FOREIGN KEY([town_ID])
REFERENCES [dbo].[towns_enum] ([ID])
GO
ALTER TABLE [dbo].[enrollees] CHECK CONSTRAINT [FK_enrollees_towns_enum]
GO
ALTER TABLE [dbo].[parents]  WITH CHECK ADD  CONSTRAINT [FK_parents_enrollees] FOREIGN KEY([enrollee_ID])
REFERENCES [dbo].[enrollees] ([ID])
GO
ALTER TABLE [dbo].[parents] CHECK CONSTRAINT [FK_parents_enrollees]
GO
ALTER TABLE [dbo].[specialty_enum]  WITH CHECK ADD  CONSTRAINT [FK_specialty_enum_faculty_enum] FOREIGN KEY([faculty_ID])
REFERENCES [dbo].[faculty_enum] ([ID])
GO
ALTER TABLE [dbo].[specialty_enum] CHECK CONSTRAINT [FK_specialty_enum_faculty_enum]
GO
ALTER TABLE [dbo].[specialty_priorities]  WITH CHECK ADD  CONSTRAINT [FK_specialty_priorities_enrollees] FOREIGN KEY([enrollee_ID])
REFERENCES [dbo].[enrollees] ([ID])
GO
ALTER TABLE [dbo].[specialty_priorities] CHECK CONSTRAINT [FK_specialty_priorities_enrollees]
GO
ALTER TABLE [dbo].[specialty_priorities]  WITH CHECK ADD  CONSTRAINT [FK_specialty_priorities_specialty_enum] FOREIGN KEY([specialty_ID])
REFERENCES [dbo].[specialty_enum] ([ID])
GO
ALTER TABLE [dbo].[specialty_priorities] CHECK CONSTRAINT [FK_specialty_priorities_specialty_enum]
GO
ALTER TABLE [dbo].[towns_enum]  WITH CHECK ADD  CONSTRAINT [FK_towns_enum_countries_enum] FOREIGN KEY([country_ID])
REFERENCES [dbo].[countries_enum] ([ID])
GO
ALTER TABLE [dbo].[towns_enum] CHECK CONSTRAINT [FK_towns_enum_countries_enum]
GO
ALTER TABLE [dbo].[Tree]  WITH CHECK ADD  CONSTRAINT [FK_Tree_Tree] FOREIGN KEY([parent_ID])
REFERENCES [dbo].[Tree] ([ID])
GO
ALTER TABLE [dbo].[Tree] CHECK CONSTRAINT [FK_Tree_Tree]
GO
ALTER TABLE [dbo].[writing_locker]  WITH CHECK ADD  CONSTRAINT [FK_writing_locker_enrollees] FOREIGN KEY([enrollee_ID])
REFERENCES [dbo].[enrollees] ([ID])
GO
ALTER TABLE [dbo].[writing_locker] CHECK CONSTRAINT [FK_writing_locker_enrollees]
GO
ALTER TABLE [dbo].[CT_results]  WITH CHECK ADD  CONSTRAINT [CK_CT_results] CHECK  (([result]>=(10) AND [result]<=(100)))
GO
ALTER TABLE [dbo].[CT_results] CHECK CONSTRAINT [CK_CT_results]
GO
ALTER TABLE [dbo].[specialty_enum]  WITH CHECK ADD  CONSTRAINT [CK_specialty_enum] CHECK  (([admission]>(0)))
GO
ALTER TABLE [dbo].[specialty_enum] CHECK CONSTRAINT [CK_specialty_enum]
GO
USE [master]
GO
ALTER DATABASE [EnrollmentCampaign] SET  READ_WRITE 
GO
