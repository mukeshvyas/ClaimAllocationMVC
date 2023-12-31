USE [master]
GO
/****** Object:  Database [AlgoZy]    Script Date: 07/27/2023 18:18:24 ******/
CREATE DATABASE [AlgoZy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AlgoZy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AlgoZy.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AlgoZy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AlgoZy_log.ldf' , SIZE = 35840KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AlgoZy] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AlgoZy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AlgoZy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AlgoZy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AlgoZy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AlgoZy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AlgoZy] SET ARITHABORT OFF 
GO
ALTER DATABASE [AlgoZy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AlgoZy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AlgoZy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AlgoZy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AlgoZy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AlgoZy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AlgoZy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AlgoZy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AlgoZy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AlgoZy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AlgoZy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AlgoZy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AlgoZy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AlgoZy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AlgoZy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AlgoZy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AlgoZy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AlgoZy] SET RECOVERY FULL 
GO
ALTER DATABASE [AlgoZy] SET  MULTI_USER 
GO
ALTER DATABASE [AlgoZy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AlgoZy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AlgoZy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AlgoZy] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AlgoZy] SET DELAYED_DURABILITY = DISABLED 
GO
USE [AlgoZy]
GO
/****** Object:  Table [dbo].[Claim]    Script Date: 07/27/2023 18:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claim](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PatientName] [nvarchar](250) NULL,
	[ProviderName] [nvarchar](250) NULL,
	[ClaimAmount] [numeric](18, 2) NULL,
	[AllowedAmount] [numeric](18, 2) NULL,
	[PaidAmount] [numeric](18, 2) NULL,
	[ClaimStatusId] [int] NULL,
	[LastComment] [nvarchar](max) NULL,
	[ClientId] [bigint] NULL,
	[ClaimNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Claim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClaimCommentHistory]    Script Date: 07/27/2023 18:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaimCommentHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[CommentedBy] [bigint] NULL,
	[ClaimId] [bigint] NULL,
 CONSTRAINT [PK_ClaimCommentHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClaimDetail]    Script Date: 07/27/2023 18:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaimDetail](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ClaimId] [bigint] NULL,
	[CPTHCPC] [nvarchar](100) NULL,
	[AllowedAmount] [numeric](18, 2) NULL,
	[PaidAmount] [numeric](18, 2) NULL,
 CONSTRAINT [PK_ClaimDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClaimStatus]    Script Date: 07/27/2023 18:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaimStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimStatus] [nvarchar](100) NULL,
 CONSTRAINT [PK_ClaimStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClaimWorkflow]    Script Date: 07/27/2023 18:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaimWorkflow](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ClaimId] [bigint] NULL,
	[AssignerId] [bigint] NULL,
	[AssigneeId] [bigint] NULL,
	[ClaimStatusId] [int] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_ClaimWorkflow] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Client]    Script Date: 07/27/2023 18:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
	[DateOfCreation] [datetime] NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 07/27/2023 18:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 07/27/2023 18:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](500) NULL,
	[FirstName] [nvarchar](250) NULL,
	[LastName] [nvarchar](250) NULL,
	[Password] [nvarchar](250) NULL,
	[IsActive] [bit] NULL,
	[DateOfCreation] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 07/27/2023 18:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[RoleId] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[GetClaimlist]    Script Date: 07/27/2023 18:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetClaimlist]
	
AS
BEGIN
	Select FullName As ClientName,ClaimNo,PatientName,ProviderName,claimstatus.ClaimStatus,AllowedAmount,PaidAmount,LastComment,[User].UserName as AssignedTo 
	from Claim 
	Inner join client on Claim.ClientId=Client.id
	Inner join claimstatus on claimstatus.id =Claim.ClaimStatusId
	Left join (select Max(ID) As MaxID,claimID from [ClaimWorkflow] group by claimid) as MaxClaimStatus on MaxClaimStatus.claimID=Claim.ID
	Left join [ClaimWorkflow] on [ClaimWorkflow].Id =MaxClaimStatus.MaxID
	Left join [User] on [User].Id =[ClaimWorkflow].AssigneeId 
	order by [ClaimWorkflow].CreatedDate
END

GO
USE [master]
GO
ALTER DATABASE [AlgoZy] SET  READ_WRITE 
GO
