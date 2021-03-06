USE [master]
GO
/****** Object:  Database [SL_Company_2020]    Script Date: 12/16/2021 05:48:47 ******/
CREATE DATABASE [SL_Company_2020] ON  PRIMARY 
( NAME = N'SL_Company_2020', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\SL_Company_2020.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SL_Company_2020_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\SL_Company_2020_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SL_Company_2020] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SL_Company_2020].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SL_Company_2020] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [SL_Company_2020] SET ANSI_NULLS OFF
GO
ALTER DATABASE [SL_Company_2020] SET ANSI_PADDING OFF
GO
ALTER DATABASE [SL_Company_2020] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [SL_Company_2020] SET ARITHABORT OFF
GO
ALTER DATABASE [SL_Company_2020] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [SL_Company_2020] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [SL_Company_2020] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [SL_Company_2020] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [SL_Company_2020] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [SL_Company_2020] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [SL_Company_2020] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [SL_Company_2020] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [SL_Company_2020] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [SL_Company_2020] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [SL_Company_2020] SET  DISABLE_BROKER
GO
ALTER DATABASE [SL_Company_2020] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [SL_Company_2020] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [SL_Company_2020] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [SL_Company_2020] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [SL_Company_2020] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [SL_Company_2020] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [SL_Company_2020] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [SL_Company_2020] SET  READ_WRITE
GO
ALTER DATABASE [SL_Company_2020] SET RECOVERY SIMPLE
GO
ALTER DATABASE [SL_Company_2020] SET  MULTI_USER
GO
ALTER DATABASE [SL_Company_2020] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [SL_Company_2020] SET DB_CHAINING OFF
GO
USE [SL_Company_2020]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 12/16/2021 05:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[did] [int] NOT NULL,
	[dname] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[did] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/16/2021 05:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[eid] [int] NOT NULL,
	[ename] [varchar](50) NOT NULL,
	[position] [varchar](50) NOT NULL,
	[salary] [int] NOT NULL,
	[pelnaty] [int] NOT NULL,
	[workDayForFullSalary] [int] NOT NULL,
	[did] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[eid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[totalWorkDay]    Script Date: 12/16/2021 05:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[totalWorkDay](
	[eid] [int] NOT NULL,
	[totalWorkDay] [int] NOT NULL,
 CONSTRAINT [PK_totalWorkDay] PRIMARY KEY CLUSTERED 
(
	[eid] ASC,
	[totalWorkDay] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSheets]    Script Date: 12/16/2021 05:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheets](
	[tid] [int] IDENTITY(1,1) NOT NULL,
	[eid] [int] NOT NULL,
	[date] [date] NOT NULL,
	[present] [bit] NOT NULL,
 CONSTRAINT [PK_TimeSheets] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayRoll]    Script Date: 12/16/2021 05:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayRoll](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[insuranceCost] [int] NOT NULL,
	[totalPelnaty] [int] NOT NULL,
	[payment] [decimal](18, 2) NOT NULL,
	[eid] [int] NOT NULL,
 CONSTRAINT [PK_PayRoll] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Insurance]    Script Date: 12/16/2021 05:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Insurance](
	[iid] [int] NOT NULL,
	[iname] [varchar](50) NOT NULL,
	[cost] [int] NOT NULL,
	[eid] [int] NOT NULL,
 CONSTRAINT [PK_Insurance] PRIMARY KEY CLUSTERED 
(
	[iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_Employee_Department]    Script Date: 12/16/2021 05:48:47 ******/
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([did])
REFERENCES [dbo].[Department] ([did])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
/****** Object:  ForeignKey [FK_totalWorkDay_Employee]    Script Date: 12/16/2021 05:48:47 ******/
ALTER TABLE [dbo].[totalWorkDay]  WITH CHECK ADD  CONSTRAINT [FK_totalWorkDay_Employee] FOREIGN KEY([eid])
REFERENCES [dbo].[Employee] ([eid])
GO
ALTER TABLE [dbo].[totalWorkDay] CHECK CONSTRAINT [FK_totalWorkDay_Employee]
GO
/****** Object:  ForeignKey [FK_TimeSheets_Employee]    Script Date: 12/16/2021 05:48:47 ******/
ALTER TABLE [dbo].[TimeSheets]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheets_Employee] FOREIGN KEY([eid])
REFERENCES [dbo].[Employee] ([eid])
GO
ALTER TABLE [dbo].[TimeSheets] CHECK CONSTRAINT [FK_TimeSheets_Employee]
GO
/****** Object:  ForeignKey [FK_PayRoll_Employee]    Script Date: 12/16/2021 05:48:47 ******/
ALTER TABLE [dbo].[PayRoll]  WITH CHECK ADD  CONSTRAINT [FK_PayRoll_Employee] FOREIGN KEY([eid])
REFERENCES [dbo].[Employee] ([eid])
GO
ALTER TABLE [dbo].[PayRoll] CHECK CONSTRAINT [FK_PayRoll_Employee]
GO
/****** Object:  ForeignKey [FK_Insurance_Employee]    Script Date: 12/16/2021 05:48:47 ******/
ALTER TABLE [dbo].[Insurance]  WITH CHECK ADD  CONSTRAINT [FK_Insurance_Employee] FOREIGN KEY([eid])
REFERENCES [dbo].[Employee] ([eid])
GO
ALTER TABLE [dbo].[Insurance] CHECK CONSTRAINT [FK_Insurance_Employee]
GO
