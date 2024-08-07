
/****** Object:  Database [iter2]    Script Date: 7/4/2024 8:11:42 PM ******/
USE [iter2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'iter2_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\iter2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'iter2_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\iter2.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [iter2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [iter2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [iter2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [iter2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [iter2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [iter2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [iter2] SET ARITHABORT OFF 
GO
ALTER DATABASE [iter2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [iter2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [iter2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [iter2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [iter2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [iter2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [iter2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [iter2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [iter2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [iter2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [iter2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [iter2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [iter2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [iter2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [iter2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [iter2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [iter2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [iter2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [iter2] SET  MULTI_USER 
GO
ALTER DATABASE [iter2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [iter2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [iter2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [iter2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [iter2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [iter2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'iter2', N'ON'
GO
ALTER DATABASE [iter2] SET QUERY_STORE = ON
GO
ALTER DATABASE [iter2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [iter2]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/4/2024 8:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](500) NOT NULL,
	[create_at] [date] NOT NULL,
	[update_at] [date] NOT NULL,
	[active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 7/4/2024 8:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[content] [nvarchar](max) NOT NULL,
	[user_id] [int] NOT NULL,
	[Comment_id] [int] IDENTITY(1,1) NOT NULL,
	[discussion_id] [int] NOT NULL,
	[create_at] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 7/4/2024 8:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[course_name] [nvarchar](500) NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[create_at] [date] NOT NULL,
	[update_at] [date] NOT NULL,
	[active] [bit] NOT NULL,
	[created_by] [int] NOT NULL,
	[category_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discussion]    Script Date: 7/4/2024 8:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discussion](
	[title] [nvarchar](500) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[create_at] [date] NOT NULL,
	[update_at] [date] NOT NULL,
	[active] [bit] NOT NULL,
	[user_id] [int] NOT NULL,
	[discussion_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[discussion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscussionCategory]    Script Date: 7/4/2024 8:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscussionCategory](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](500) NOT NULL,
	[create_at] [date] NOT NULL,
	[update_at] [date] NOT NULL,
	[active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[flashcard]    Script Date: 7/4/2024 8:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flashcard](
	[flashcard_id] [int] IDENTITY(1,1) NOT NULL,
	[question] [nvarchar](500) NOT NULL,
	[answer] [nvarchar](500) NOT NULL,
	[create_at] [date] NOT NULL,
	[update_at] [date] NOT NULL,
	[active] [bit] NOT NULL,
	[Category_id] [int] NOT NULL,
	[image] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[flashcard_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Premium]    Script Date: 7/4/2024 8:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Premium](
	[premium_id] [int] IDENTITY(1,1) NOT NULL,
	[premium_name] [nvarchar](500) NOT NULL,
	[premium_price] [real] NOT NULL,
	[premium_discount] [real] NOT NULL,
	[active] [bit] NOT NULL,
	[dayActive] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[premium_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 7/4/2024 8:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[course_id] [int] NOT NULL,
	[flashcard_id] [int] NOT NULL,
	[quiz_id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[quiz_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Result_Detail]    Script Date: 7/4/2024 8:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result_Detail](
	[result] [real] NOT NULL,
	[user_practice_id] [int] NOT NULL,
	[time] [int] NOT NULL,
	[RD_id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RD_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type_Of_Practice]    Script Date: 7/4/2024 8:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_Of_Practice](
	[TOP_id] [int] IDENTITY(1,1) NOT NULL,
	[TOP_name] [nvarchar](500) NOT NULL,
	[active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TOP_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/4/2024 8:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[role] [int] NOT NULL,
	[active] [bit] NOT NULL,
	[create_at] [date] NOT NULL,
	[gender] [bit] NULL,
	[dob] [date] NULL,
	[phone] [nvarchar](20) NULL,
	[image] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Enroll_Course]    Script Date: 7/4/2024 8:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Enroll_Course](
	[user_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Have_Premium]    Script Date: 7/4/2024 8:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Have_Premium](
	[UHP_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[premium_id] [int] NOT NULL,
	[create_at] [date] NOT NULL,
	[end_at] [date] NOT NULL,
	[actual_price] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[UHP_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Practice]    Script Date: 7/4/2024 8:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Practice](
	[user_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[TOP_id] [int] NOT NULL,
	[user_practice_id] [int] IDENTITY(1,1) NOT NULL,
	[times] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_practice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [category_name], [create_at], [update_at], [active]) VALUES (1, N'Cơ thể con người', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-25' AS Date), 0)
INSERT [dbo].[Category] ([category_id], [category_name], [create_at], [update_at], [active]) VALUES (2, N'Quần áo', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1)
INSERT [dbo].[Category] ([category_id], [category_name], [create_at], [update_at], [active]) VALUES (3, N'Ẩm thực', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1)
INSERT [dbo].[Category] ([category_id], [category_name], [create_at], [update_at], [active]) VALUES (4, N'Động vật', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1)
INSERT [dbo].[Category] ([category_id], [category_name], [create_at], [update_at], [active]) VALUES (5, N'Thiên nhiên', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1)
INSERT [dbo].[Category] ([category_id], [category_name], [create_at], [update_at], [active]) VALUES (6, N'Màu sắc của năm', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-25' AS Date), 1)
INSERT [dbo].[Category] ([category_id], [category_name], [create_at], [update_at], [active]) VALUES (9, N'     ', CAST(N'2024-06-25' AS Date), CAST(N'2024-06-25' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([content], [user_id], [Comment_id], [discussion_id], [create_at]) VALUES (N'<p><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">Through the 1960s, the U.S. Army and&nbsp;</span><a href="https://en.wikipedia.org/wiki/Bundeswehr" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Bundeswehr</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;had collaborated on a single design that would replace both the&nbsp;</span><a href="https://en.wikipedia.org/wiki/M60_tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">M60 tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;and the&nbsp;</span><a href="https://en.wikipedia.org/wiki/Leopard_1" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Leopard 1</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">. The overall goal was to have a single new design with improved firepower to handle new Soviet tanks like the&nbsp;</span><a href="https://en.wikipedia.org/wiki/T-62" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">T-62</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">, while providing improved protection against the T-62''s new 115&nbsp;mm&nbsp;</span><a href="https://en.wikipedia.org/wiki/Smoothbore" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">smoothbore</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;gun and especially&nbsp;</span><a href="https://en.wikipedia.org/wiki/High-explosive_anti-tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">high-explosive anti-tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;(HEAT) rounds.</span><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">[</sup><a href="https://en.wikipedia.org/wiki/Wikipedia:Citation_needed" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup><em>citation needed</em></sup></a><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">]</sup></p>', 21, 1, 1, CAST(N'2024-06-24' AS Date))
INSERT [dbo].[Comment] ([content], [user_id], [Comment_id], [discussion_id], [create_at]) VALUES (N'<p><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">Through the 1960s, the U.S. Army and&nbsp;</span><a href="https://en.wikipedia.org/wiki/Bundeswehr" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Bundeswehr</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;had collaborated on a single design that would replace both the&nbsp;</span><a href="https://en.wikipedia.org/wiki/M60_tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">M60 tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;and the&nbsp;</span><a href="https://en.wikipedia.org/wiki/Leopard_1" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Leopard 1</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">. The overall goal was to have a single new design with improved firepower to handle new Soviet tanks like the&nbsp;</span><a href="https://en.wikipedia.org/wiki/T-62" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">T-62</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">, while providing improved protection against the T-62''s new 115&nbsp;mm&nbsp;</span><a href="https://en.wikipedia.org/wiki/Smoothbore" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">smoothbore</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;gun and especially&nbsp;</span><a href="https://en.wikipedia.org/wiki/High-explosive_anti-tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">high-explosive anti-tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;(HEAT) rounds.</span><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">[</sup><a href="https://en.wikipedia.org/wiki/Wikipedia:Citation_needed" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup><em>citation needed</em></sup></a><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">]</sup></p>', 22, 2, 1, CAST(N'2024-06-24' AS Date))
INSERT [dbo].[Comment] ([content], [user_id], [Comment_id], [discussion_id], [create_at]) VALUES (N'<p><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">Through the 1960s, the U.S. Army and&nbsp;</span><a href="https://en.wikipedia.org/wiki/Bundeswehr" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Bundeswehr</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;had collaborated on a single design that would replace both the&nbsp;</span><a href="https://en.wikipedia.org/wiki/M60_tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">M60 tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;and the&nbsp;</span><a href="https://en.wikipedia.org/wiki/Leopard_1" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Leopard 1</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">. The overall goal was to have a single new design with improved firepower to handle new Soviet tanks like the&nbsp;</span><a href="https://en.wikipedia.org/wiki/T-62" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">T-62</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">, while providing improved protection against the T-62''s new 115&nbsp;mm&nbsp;</span><a href="https://en.wikipedia.org/wiki/Smoothbore" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">smoothbore</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;gun and especially&nbsp;</span><a href="https://en.wikipedia.org/wiki/High-explosive_anti-tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">high-explosive anti-tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;(HEAT) rounds.</span><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">[</sup><a href="https://en.wikipedia.org/wiki/Wikipedia:Citation_needed" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup><em>citation needed</em></sup></a><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">]</sup></p>', 23, 3, 1, CAST(N'2024-06-24' AS Date))
INSERT [dbo].[Comment] ([content], [user_id], [Comment_id], [discussion_id], [create_at]) VALUES (N'<p><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">Through the 1960s, the U.S. Army and&nbsp;</span><a href="https://en.wikipedia.org/wiki/Bundeswehr" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Bundeswehr</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;had collaborated on a single design that would replace both the&nbsp;</span><a href="https://en.wikipedia.org/wiki/M60_tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">M60 tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;and the&nbsp;</span><a href="https://en.wikipedia.org/wiki/Leopard_1" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Leopard 1</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">. The overall goal was to have a single new design with improved firepower to handle new Soviet tanks like the&nbsp;</span><a href="https://en.wikipedia.org/wiki/T-62" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">T-62</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">, while providing improved protection against the T-62''s new 115&nbsp;mm&nbsp;</span><a href="https://en.wikipedia.org/wiki/Smoothbore" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">smoothbore</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;gun and especially&nbsp;</span><a href="https://en.wikipedia.org/wiki/High-explosive_anti-tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">high-explosive anti-tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;(HEAT) rounds.</span><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">[</sup><a href="https://en.wikipedia.org/wiki/Wikipedia:Citation_needed" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup><em>citation needed</em></sup></a><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">]</sup></p>', 24, 4, 1, CAST(N'2024-06-24' AS Date))
INSERT [dbo].[Comment] ([content], [user_id], [Comment_id], [discussion_id], [create_at]) VALUES (N'<p><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">Through the 1960s, the U.S. Army and&nbsp;</span><a href="https://en.wikipedia.org/wiki/Bundeswehr" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Bundeswehr</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;had collaborated on a single design that would replace both the&nbsp;</span><a href="https://en.wikipedia.org/wiki/M60_tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">M60 tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;and the&nbsp;</span><a href="https://en.wikipedia.org/wiki/Leopard_1" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Leopard 1</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">. The overall goal was to have a single new design with improved firepower to handle new Soviet tanks like the&nbsp;</span><a href="https://en.wikipedia.org/wiki/T-62" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">T-62</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">, while providing improved protection against the T-62''s new 115&nbsp;mm&nbsp;</span><a href="https://en.wikipedia.org/wiki/Smoothbore" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">smoothbore</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;gun and especially&nbsp;</span><a href="https://en.wikipedia.org/wiki/High-explosive_anti-tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">high-explosive anti-tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;(HEAT) rounds.</span><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">[</sup><a href="https://en.wikipedia.org/wiki/Wikipedia:Citation_needed" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup><em>citation needed</em></sup></a><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">]</sup></p>', 25, 5, 1, CAST(N'2024-06-24' AS Date))
INSERT [dbo].[Comment] ([content], [user_id], [Comment_id], [discussion_id], [create_at]) VALUES (N'<p><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">Through the 1960s, the U.S. Army and&nbsp;</span><a href="https://en.wikipedia.org/wiki/Bundeswehr" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Bundeswehr</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;had collaborated on a single design that would replace both the&nbsp;</span><a href="https://en.wikipedia.org/wiki/M60_tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">M60 tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;and the&nbsp;</span><a href="https://en.wikipedia.org/wiki/Leopard_1" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Leopard 1</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">. The overall goal was to have a single new design with improved firepower to handle new Soviet tanks like the&nbsp;</span><a href="https://en.wikipedia.org/wiki/T-62" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">T-62</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">, while providing improved protection against the T-62''s new 115&nbsp;mm&nbsp;</span><a href="https://en.wikipedia.org/wiki/Smoothbore" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">smoothbore</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;gun and especially&nbsp;</span><a href="https://en.wikipedia.org/wiki/High-explosive_anti-tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">high-explosive anti-tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;(HEAT) rounds.</span><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">[</sup><a href="https://en.wikipedia.org/wiki/Wikipedia:Citation_needed" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup><em>citation needed</em></sup></a><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">]</sup></p>', 21, 6, 2, CAST(N'2024-06-24' AS Date))
INSERT [dbo].[Comment] ([content], [user_id], [Comment_id], [discussion_id], [create_at]) VALUES (N'<p><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">Through the 1960s, the U.S. Army and&nbsp;</span><a href="https://en.wikipedia.org/wiki/Bundeswehr" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Bundeswehr</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;had collaborated on a single design that would replace both the&nbsp;</span><a href="https://en.wikipedia.org/wiki/M60_tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">M60 tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;and the&nbsp;</span><a href="https://en.wikipedia.org/wiki/Leopard_1" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Leopard 1</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">. The overall goal was to have a single new design with improved firepower to handle new Soviet tanks like the&nbsp;</span><a href="https://en.wikipedia.org/wiki/T-62" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">T-62</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">, while providing improved protection against the T-62''s new 115&nbsp;mm&nbsp;</span><a href="https://en.wikipedia.org/wiki/Smoothbore" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">smoothbore</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;gun and especially&nbsp;</span><a href="https://en.wikipedia.org/wiki/High-explosive_anti-tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">high-explosive anti-tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;(HEAT) rounds.</span><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">[</sup><a href="https://en.wikipedia.org/wiki/Wikipedia:Citation_needed" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup><em>citation needed</em></sup></a><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">]</sup></p>', 22, 7, 2, CAST(N'2024-06-24' AS Date))
INSERT [dbo].[Comment] ([content], [user_id], [Comment_id], [discussion_id], [create_at]) VALUES (N'<p><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">Through the 1960s, the U.S. Army and&nbsp;</span><a href="https://en.wikipedia.org/wiki/Bundeswehr" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Bundeswehr</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;had collaborated on a single design that would replace both the&nbsp;</span><a href="https://en.wikipedia.org/wiki/M60_tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">M60 tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;and the&nbsp;</span><a href="https://en.wikipedia.org/wiki/Leopard_1" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Leopard 1</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">. The overall goal was to have a single new design with improved firepower to handle new Soviet tanks like the&nbsp;</span><a href="https://en.wikipedia.org/wiki/T-62" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">T-62</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">, while providing improved protection against the T-62''s new 115&nbsp;mm&nbsp;</span><a href="https://en.wikipedia.org/wiki/Smoothbore" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">smoothbore</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;gun and especially&nbsp;</span><a href="https://en.wikipedia.org/wiki/High-explosive_anti-tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">high-explosive anti-tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;(HEAT) rounds.</span><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">[</sup><a href="https://en.wikipedia.org/wiki/Wikipedia:Citation_needed" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup><em>citation needed</em></sup></a><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">]</sup></p>', 23, 8, 2, CAST(N'2024-06-24' AS Date))
INSERT [dbo].[Comment] ([content], [user_id], [Comment_id], [discussion_id], [create_at]) VALUES (N'<p><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">Through the 1960s, the U.S. Army and&nbsp;</span><a href="https://en.wikipedia.org/wiki/Bundeswehr" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Bundeswehr</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;had collaborated on a single design that would replace both the&nbsp;</span><a href="https://en.wikipedia.org/wiki/M60_tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">M60 tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;and the&nbsp;</span><a href="https://en.wikipedia.org/wiki/Leopard_1" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Leopard 1</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">. The overall goal was to have a single new design with improved firepower to handle new Soviet tanks like the&nbsp;</span><a href="https://en.wikipedia.org/wiki/T-62" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">T-62</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">, while providing improved protection against the T-62''s new 115&nbsp;mm&nbsp;</span><a href="https://en.wikipedia.org/wiki/Smoothbore" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">smoothbore</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;gun and especially&nbsp;</span><a href="https://en.wikipedia.org/wiki/High-explosive_anti-tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">high-explosive anti-tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;(HEAT) rounds.</span><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">[</sup><a href="https://en.wikipedia.org/wiki/Wikipedia:Citation_needed" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup><em>citation needed</em></sup></a><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">]</sup></p>', 24, 9, 2, CAST(N'2024-06-24' AS Date))
INSERT [dbo].[Comment] ([content], [user_id], [Comment_id], [discussion_id], [create_at]) VALUES (N'<p><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">Through the 1960s, the U.S. Army and&nbsp;</span><a href="https://en.wikipedia.org/wiki/Bundeswehr" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Bundeswehr</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;had collaborated on a single design that would replace both the&nbsp;</span><a href="https://en.wikipedia.org/wiki/M60_tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">M60 tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;and the&nbsp;</span><a href="https://en.wikipedia.org/wiki/Leopard_1" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Leopard 1</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">. The overall goal was to have a single new design with improved firepower to handle new Soviet tanks like the&nbsp;</span><a href="https://en.wikipedia.org/wiki/T-62" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">T-62</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">, while providing improved protection against the T-62''s new 115&nbsp;mm&nbsp;</span><a href="https://en.wikipedia.org/wiki/Smoothbore" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">smoothbore</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;gun and especially&nbsp;</span><a href="https://en.wikipedia.org/wiki/High-explosive_anti-tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">high-explosive anti-tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;(HEAT) rounds.</span><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">[</sup><a href="https://en.wikipedia.org/wiki/Wikipedia:Citation_needed" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup><em>citation needed</em></sup></a><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">]</sup></p>', 25, 10, 2, CAST(N'2024-06-24' AS Date))
INSERT [dbo].[Comment] ([content], [user_id], [Comment_id], [discussion_id], [create_at]) VALUES (N'<p><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">Through the 1960s, the U.S. Army and&nbsp;</span><a href="https://en.wikipedia.org/wiki/Bundeswehr" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Bundeswehr</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;had collaborated on a single design that would replace both the&nbsp;</span><a href="https://en.wikipedia.org/wiki/M60_tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">M60 tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;and the&nbsp;</span><a href="https://en.wikipedia.org/wiki/Leopard_1" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Leopard 1</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">. The overall goal was to have a single new design with improved firepower to handle new Soviet tanks like the&nbsp;</span><a href="https://en.wikipedia.org/wiki/T-62" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">T-62</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">, while providing improved protection against the T-62''s new 115&nbsp;mm&nbsp;</span><a href="https://en.wikipedia.org/wiki/Smoothbore" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">smoothbore</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;gun and especially&nbsp;</span><a href="https://en.wikipedia.org/wiki/High-explosive_anti-tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">high-explosive anti-tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;(HEAT) rounds.</span><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">[</sup><a href="https://en.wikipedia.org/wiki/Wikipedia:Citation_needed" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup><em>citation needed</em></sup></a><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">]</sup></p>', 21, 11, 3, CAST(N'2024-06-24' AS Date))
INSERT [dbo].[Comment] ([content], [user_id], [Comment_id], [discussion_id], [create_at]) VALUES (N'<p><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">Through the 1960s, the U.S. Army and&nbsp;</span><a href="https://en.wikipedia.org/wiki/Bundeswehr" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Bundeswehr</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;had collaborated on a single design that would replace both the&nbsp;</span><a href="https://en.wikipedia.org/wiki/M60_tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">M60 tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;and the&nbsp;</span><a href="https://en.wikipedia.org/wiki/Leopard_1" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Leopard 1</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">. The overall goal was to have a single new design with improved firepower to handle new Soviet tanks like the&nbsp;</span><a href="https://en.wikipedia.org/wiki/T-62" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">T-62</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">, while providing improved protection against the T-62''s new 115&nbsp;mm&nbsp;</span><a href="https://en.wikipedia.org/wiki/Smoothbore" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">smoothbore</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;gun and especially&nbsp;</span><a href="https://en.wikipedia.org/wiki/High-explosive_anti-tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">high-explosive anti-tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;(HEAT) rounds.</span><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">[</sup><a href="https://en.wikipedia.org/wiki/Wikipedia:Citation_needed" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup><em>citation needed</em></sup></a><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">]</sup></p>', 22, 12, 3, CAST(N'2024-06-24' AS Date))
INSERT [dbo].[Comment] ([content], [user_id], [Comment_id], [discussion_id], [create_at]) VALUES (N'<p><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">Through the 1960s, the U.S. Army and&nbsp;</span><a href="https://en.wikipedia.org/wiki/Bundeswehr" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Bundeswehr</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;had collaborated on a single design that would replace both the&nbsp;</span><a href="https://en.wikipedia.org/wiki/M60_tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">M60 tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;and the&nbsp;</span><a href="https://en.wikipedia.org/wiki/Leopard_1" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Leopard 1</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">. The overall goal was to have a single new design with improved firepower to handle new Soviet tanks like the&nbsp;</span><a href="https://en.wikipedia.org/wiki/T-62" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">T-62</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">, while providing improved protection against the T-62''s new 115&nbsp;mm&nbsp;</span><a href="https://en.wikipedia.org/wiki/Smoothbore" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">smoothbore</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;gun and especially&nbsp;</span><a href="https://en.wikipedia.org/wiki/High-explosive_anti-tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">high-explosive anti-tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;(HEAT) rounds.</span><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">[</sup><a href="https://en.wikipedia.org/wiki/Wikipedia:Citation_needed" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup><em>citation needed</em></sup></a><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">]</sup></p>', 23, 13, 3, CAST(N'2024-06-24' AS Date))
INSERT [dbo].[Comment] ([content], [user_id], [Comment_id], [discussion_id], [create_at]) VALUES (N'<p><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">Through the 1960s, the U.S. Army and&nbsp;</span><a href="https://en.wikipedia.org/wiki/Bundeswehr" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Bundeswehr</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;had collaborated on a single design that would replace both the&nbsp;</span><a href="https://en.wikipedia.org/wiki/M60_tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">M60 tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;and the&nbsp;</span><a href="https://en.wikipedia.org/wiki/Leopard_1" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Leopard 1</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">. The overall goal was to have a single new design with improved firepower to handle new Soviet tanks like the&nbsp;</span><a href="https://en.wikipedia.org/wiki/T-62" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">T-62</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">, while providing improved protection against the T-62''s new 115&nbsp;mm&nbsp;</span><a href="https://en.wikipedia.org/wiki/Smoothbore" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">smoothbore</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;gun and especially&nbsp;</span><a href="https://en.wikipedia.org/wiki/High-explosive_anti-tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">high-explosive anti-tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;(HEAT) rounds.</span><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">[</sup><a href="https://en.wikipedia.org/wiki/Wikipedia:Citation_needed" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup><em>citation needed</em></sup></a><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">]</sup></p>', 24, 14, 3, CAST(N'2024-06-24' AS Date))
INSERT [dbo].[Comment] ([content], [user_id], [Comment_id], [discussion_id], [create_at]) VALUES (N'<p><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">Through the 1960s, the U.S. Army and&nbsp;</span><a href="https://en.wikipedia.org/wiki/Bundeswehr" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Bundeswehr</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;had collaborated on a single design that would replace both the&nbsp;</span><a href="https://en.wikipedia.org/wiki/M60_tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">M60 tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;and the&nbsp;</span><a href="https://en.wikipedia.org/wiki/Leopard_1" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Leopard 1</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">. The overall goal was to have a single new design with improved firepower to handle new Soviet tanks like the&nbsp;</span><a href="https://en.wikipedia.org/wiki/T-62" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">T-62</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">, while providing improved protection against the T-62''s new 115&nbsp;mm&nbsp;</span><a href="https://en.wikipedia.org/wiki/Smoothbore" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">smoothbore</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;gun and especially&nbsp;</span><a href="https://en.wikipedia.org/wiki/High-explosive_anti-tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">high-explosive anti-tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;(HEAT) rounds.</span><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">[</sup><a href="https://en.wikipedia.org/wiki/Wikipedia:Citation_needed" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup><em>citation needed</em></sup></a><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">]</sup></p>', 25, 15, 3, CAST(N'2024-06-24' AS Date))
INSERT [dbo].[Comment] ([content], [user_id], [Comment_id], [discussion_id], [create_at]) VALUES (N'<p><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">Through the 1960s, the U.S. Army and&nbsp;</span><a href="https://en.wikipedia.org/wiki/Bundeswehr" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Bundeswehr</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;had collaborated on a single design that would replace both the&nbsp;</span><a href="https://en.wikipedia.org/wiki/M60_tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">M60 tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;and the&nbsp;</span><a href="https://en.wikipedia.org/wiki/Leopard_1" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Leopard 1</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">. The overall goal was to have a single new design with improved firepower to handle new Soviet tanks like the&nbsp;</span><a href="https://en.wikipedia.org/wiki/T-62" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">T-62</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">, while providing improved protection against the T-62''s new 115&nbsp;mm&nbsp;</span><a href="https://en.wikipedia.org/wiki/Smoothbore" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">smoothbore</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;gun and especially&nbsp;</span><a href="https://en.wikipedia.org/wiki/High-explosive_anti-tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">high-explosive anti-tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;(HEAT) rounds.</span><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">[</sup><a href="https://en.wikipedia.org/wiki/Wikipedia:Citation_needed" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup><em>citation needed</em></sup></a><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">]</sup></p>', 21, 16, 4, CAST(N'2024-06-24' AS Date))
INSERT [dbo].[Comment] ([content], [user_id], [Comment_id], [discussion_id], [create_at]) VALUES (N'<p><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">Through the 1960s, the U.S. Army and&nbsp;</span><a href="https://en.wikipedia.org/wiki/Bundeswehr" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Bundeswehr</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;had collaborated on a single design that would replace both the&nbsp;</span><a href="https://en.wikipedia.org/wiki/M60_tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">M60 tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;and the&nbsp;</span><a href="https://en.wikipedia.org/wiki/Leopard_1" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Leopard 1</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">. The overall goal was to have a single new design with improved firepower to handle new Soviet tanks like the&nbsp;</span><a href="https://en.wikipedia.org/wiki/T-62" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">T-62</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">, while providing improved protection against the T-62''s new 115&nbsp;mm&nbsp;</span><a href="https://en.wikipedia.org/wiki/Smoothbore" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">smoothbore</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;gun and especially&nbsp;</span><a href="https://en.wikipedia.org/wiki/High-explosive_anti-tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">high-explosive anti-tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;(HEAT) rounds.</span><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">[</sup><a href="https://en.wikipedia.org/wiki/Wikipedia:Citation_needed" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup><em>citation needed</em></sup></a><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">]</sup></p>', 22, 17, 4, CAST(N'2024-06-24' AS Date))
INSERT [dbo].[Comment] ([content], [user_id], [Comment_id], [discussion_id], [create_at]) VALUES (N'<p><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">Through the 1960s, the U.S. Army and&nbsp;</span><a href="https://en.wikipedia.org/wiki/Bundeswehr" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Bundeswehr</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;had collaborated on a single design that would replace both the&nbsp;</span><a href="https://en.wikipedia.org/wiki/M60_tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">M60 tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;and the&nbsp;</span><a href="https://en.wikipedia.org/wiki/Leopard_1" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Leopard 1</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">. The overall goal was to have a single new design with improved firepower to handle new Soviet tanks like the&nbsp;</span><a href="https://en.wikipedia.org/wiki/T-62" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">T-62</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">, while providing improved protection against the T-62''s new 115&nbsp;mm&nbsp;</span><a href="https://en.wikipedia.org/wiki/Smoothbore" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">smoothbore</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;gun and especially&nbsp;</span><a href="https://en.wikipedia.org/wiki/High-explosive_anti-tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">high-explosive anti-tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;(HEAT) rounds.</span><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">[</sup><a href="https://en.wikipedia.org/wiki/Wikipedia:Citation_needed" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup><em>citation needed</em></sup></a><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">]</sup></p>', 23, 18, 4, CAST(N'2024-06-24' AS Date))
INSERT [dbo].[Comment] ([content], [user_id], [Comment_id], [discussion_id], [create_at]) VALUES (N'<p><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">Through the 1960s, the U.S. Army and&nbsp;</span><a href="https://en.wikipedia.org/wiki/Bundeswehr" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Bundeswehr</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;had collaborated on a single design that would replace both the&nbsp;</span><a href="https://en.wikipedia.org/wiki/M60_tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">M60 tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;and the&nbsp;</span><a href="https://en.wikipedia.org/wiki/Leopard_1" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Leopard 1</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">. The overall goal was to have a single new design with improved firepower to handle new Soviet tanks like the&nbsp;</span><a href="https://en.wikipedia.org/wiki/T-62" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">T-62</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">, while providing improved protection against the T-62''s new 115&nbsp;mm&nbsp;</span><a href="https://en.wikipedia.org/wiki/Smoothbore" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">smoothbore</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;gun and especially&nbsp;</span><a href="https://en.wikipedia.org/wiki/High-explosive_anti-tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">high-explosive anti-tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;(HEAT) rounds.</span><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">[</sup><a href="https://en.wikipedia.org/wiki/Wikipedia:Citation_needed" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup><em>citation needed</em></sup></a><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">]</sup></p>', 24, 19, 4, CAST(N'2024-06-24' AS Date))
INSERT [dbo].[Comment] ([content], [user_id], [Comment_id], [discussion_id], [create_at]) VALUES (N'<p><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">Through the 1960s, the U.S. Army and&nbsp;</span><a href="https://en.wikipedia.org/wiki/Bundeswehr" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Bundeswehr</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;had collaborated on a single design that would replace both the&nbsp;</span><a href="https://en.wikipedia.org/wiki/M60_tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">M60 tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;and the&nbsp;</span><a href="https://en.wikipedia.org/wiki/Leopard_1" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Leopard 1</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">. The overall goal was to have a single new design with improved firepower to handle new Soviet tanks like the&nbsp;</span><a href="https://en.wikipedia.org/wiki/T-62" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">T-62</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">, while providing improved protection against the T-62''s new 115&nbsp;mm&nbsp;</span><a href="https://en.wikipedia.org/wiki/Smoothbore" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">smoothbore</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;gun and especially&nbsp;</span><a href="https://en.wikipedia.org/wiki/High-explosive_anti-tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">high-explosive anti-tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;(HEAT) rounds.</span><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">[</sup><a href="https://en.wikipedia.org/wiki/Wikipedia:Citation_needed" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup><em>citation needed</em></sup></a><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">]</sup></p>', 25, 20, 4, CAST(N'2024-06-24' AS Date))
INSERT [dbo].[Comment] ([content], [user_id], [Comment_id], [discussion_id], [create_at]) VALUES (N'<p><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">Through the 1960s, the U.S. Army and&nbsp;</span><a href="https://en.wikipedia.org/wiki/Bundeswehr" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Bundeswehr</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;had collaborated on a single design that would replace both the&nbsp;</span><a href="https://en.wikipedia.org/wiki/M60_tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">M60 tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;and the&nbsp;</span><a href="https://en.wikipedia.org/wiki/Leopard_1" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">Leopard 1</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">. The overall goal was to have a single new design with improved firepower to handle new Soviet tanks like the&nbsp;</span><a href="https://en.wikipedia.org/wiki/T-62" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">T-62</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">, while providing improved protection against the T-62''s new 115&nbsp;mm&nbsp;</span><a href="https://en.wikipedia.org/wiki/Smoothbore" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">smoothbore</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;gun and especially&nbsp;</span><a href="https://en.wikipedia.org/wiki/High-explosive_anti-tank" target="_blank" style="background-color: rgb(255, 255, 255); color: var(--color-progressive,#36c);">high-explosive anti-tank</a><span style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">&nbsp;(HEAT) rounds.</span><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">[</sup><a href="https://en.wikipedia.org/wiki/Wikipedia:Citation_needed" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup><em>citation needed</em></sup></a><sup style="background-color: rgb(255, 255, 255); color: rgb(32, 33, 34);">]</sup></p>', 21, 21, 5, CAST(N'2024-06-24' AS Date))
INSERT [dbo].[Comment] ([content], [user_id], [Comment_id], [discussion_id], [create_at]) VALUES (N'<p>Thank you</p>', 28, 22, 5, CAST(N'2024-06-25' AS Date))
INSERT [dbo].[Comment] ([content], [user_id], [Comment_id], [discussion_id], [create_at]) VALUES (N'<p>hello</p><p><br></p>', 28, 23, 5, CAST(N'2024-06-25' AS Date))
INSERT [dbo].[Comment] ([content], [user_id], [Comment_id], [discussion_id], [create_at]) VALUES (N'<p>       </p>', 30, 24, 1, CAST(N'2024-06-25' AS Date))
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([course_id], [course_name], [description], [create_at], [update_at], [active], [created_by], [category_id]) VALUES (1, N'Ẩm thực bài 1', N'Khóa học gồm 9 câu hỏi', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 22, 3)
INSERT [dbo].[Course] ([course_id], [course_name], [description], [create_at], [update_at], [active], [created_by], [category_id]) VALUES (2, N'Món ăn 2', N'gồm 9 khóa học mới', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 22, 3)
INSERT [dbo].[Course] ([course_id], [course_name], [description], [create_at], [update_at], [active], [created_by], [category_id]) VALUES (3, N'Món ăn 3', N'Gồm 12 món ăn', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 22, 3)
INSERT [dbo].[Course] ([course_id], [course_name], [description], [create_at], [update_at], [active], [created_by], [category_id]) VALUES (4, N'Món ăn 4', N'Các món ăn bài 4', CAST(N'2024-06-25' AS Date), CAST(N'2024-06-25' AS Date), 1, 22, 3)
INSERT [dbo].[Course] ([course_id], [course_name], [description], [create_at], [update_at], [active], [created_by], [category_id]) VALUES (5, N'Món ăn 5', N'Các món ăn bài 5', CAST(N'2024-06-25' AS Date), CAST(N'2024-06-25' AS Date), 1, 22, 3)
INSERT [dbo].[Course] ([course_id], [course_name], [description], [create_at], [update_at], [active], [created_by], [category_id]) VALUES (6, N'Món ăn 6', N'Các món ăn bài 6', CAST(N'2024-06-25' AS Date), CAST(N'2024-06-25' AS Date), 1, 22, 3)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Discussion] ON 

INSERT [dbo].[Discussion] ([title], [content], [create_at], [update_at], [active], [user_id], [discussion_id], [category_id]) VALUES (N'Grumman F-14 Tomcat', N'<p>The&nbsp;<strong>Grumman F-14 Tomcat</strong>&nbsp;is an American carrier-capable&nbsp;<a href="https://en.wikipedia.org/wiki/Supersonic_aircraft" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">supersonic</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Twinjet" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">twin-engine</a>, two-seat, twin-tail, all-weather-capable&nbsp;<a href="https://en.wikipedia.org/wiki/Variable-sweep_wing" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">variable-sweep wing</a>&nbsp;<a href="https://en.wikipedia.org/wiki/Fighter_aircraft" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">fighter aircraft</a>. The Tomcat was developed for the&nbsp;<a href="https://en.wikipedia.org/wiki/United_States_Navy" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">United States Navy</a>''s Naval Fighter Experimental (VFX) program after the collapse of the&nbsp;<a href="https://en.wikipedia.org/wiki/General_Dynamics%E2%80%93Grumman_F-111B" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">General Dynamics-Grumman F-111B</a>&nbsp;project. A large and well-equipped fighter, the F-14 was the first of the American&nbsp;<a href="https://en.wikipedia.org/wiki/Teen_Series" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Teen Series</a>&nbsp;fighters, which were designed incorporating&nbsp;<a href="https://en.wikipedia.org/wiki/Aerial_warfare" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">air combat</a>&nbsp;experience against&nbsp;<a href="https://en.wikipedia.org/wiki/List_of_Mikoyan_and_MiG_aircraft" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">MiG fighters</a>&nbsp;during the&nbsp;<a href="https://en.wikipedia.org/wiki/Vietnam_War" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Vietnam War</a>.</p><p>The F-14 first flew on 21 December 1970 and made its first deployment in 1974 with the U.S. Navy aboard&nbsp;<a href="https://en.wikipedia.org/wiki/USS_Enterprise_(CVN-65)" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">USS&nbsp;<em>Enterprise</em>&nbsp;(CVN-65)</a>, replacing the&nbsp;<a href="https://en.wikipedia.org/wiki/McDonnell_Douglas_F-4_Phantom_II" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">McDonnell Douglas F-4 Phantom II</a>. The F-14 served as the U.S. Navy''s primary maritime&nbsp;<a href="https://en.wikipedia.org/wiki/Air_superiority_fighter" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">air superiority fighter</a>, fleet defense&nbsp;<a href="https://en.wikipedia.org/wiki/Interceptor_aircraft" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">interceptor</a>, and tactical&nbsp;<a href="https://en.wikipedia.org/wiki/Aerial_reconnaissance" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">aerial reconnaissance</a>&nbsp;platform into the 2000s. The Low Altitude Navigation and Targeting Infrared for Night (<a href="https://en.wikipedia.org/wiki/LANTIRN" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">LANTIRN</a>) pod system was added in the 1990s and the Tomcat began performing precision ground-attack missions.<a href="https://en.wikipedia.org/wiki/Grumman_F-14_Tomcat#cite_note-USN_FF-1" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup>[1]</sup></a></p><p>The Tomcat was retired by U.S. Navy on 22 September 2006, supplanted by the&nbsp;<a href="https://en.wikipedia.org/wiki/Boeing_F/A-18E/F_Super_Hornet" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Boeing F/A-18E/F Super Hornet</a>. Several retired F-14s have been put on display across the US.</p><p>Having been exported to&nbsp;<a href="https://en.wikipedia.org/wiki/Pahlavi_Iran" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Pahlavi Iran</a>&nbsp;under the&nbsp;<a href="https://en.wikipedia.org/wiki/Western_Bloc" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Western-aligned</a>&nbsp;Shah&nbsp;<a href="https://en.wikipedia.org/wiki/Mohammad_Reza_Pahlavi" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Mohammad Reza Pahlavi</a>&nbsp;in 1976, F-14s were used as land-based interceptors by the&nbsp;<a href="https://en.wikipedia.org/wiki/Air_force_history_of_Iran#Imperial_era" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Imperial Iranian Air Force</a>. Following the&nbsp;<a href="https://en.wikipedia.org/wiki/Iranian_Revolution" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Iranian Revolution</a>&nbsp;in 1979, the&nbsp;<a href="https://en.wikipedia.org/wiki/Islamic_Republic_of_Iran_Air_Force" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Islamic Republic of Iran Air Force</a>&nbsp;used them during the&nbsp;<a href="https://en.wikipedia.org/wiki/Iran%E2%80%93Iraq_War" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Iran–Iraq War</a>. Iran claimed their F-14s shot down at least 160 Iraqi aircraft during the war (only 55 of these confirmed, according to historian Tom Cooper),<a href="https://en.wikipedia.org/wiki/Grumman_F-14_Tomcat#cite_note-Persian_Cats-2" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup>[2]</sup></a>&nbsp;while 16 Tomcats were lost, including seven losses to accidents.<a href="https://en.wikipedia.org/wiki/Grumman_F-14_Tomcat#cite_note-Persian_Cats-2" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup>[2]</sup></a><a href="https://en.wikipedia.org/wiki/Grumman_F-14_Tomcat#cite_note-3" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup>[3]</sup></a>&nbsp;As of 2022, the F-14 remains in service with Iran''s air force, though in low numbers of combat-ready aircraft due to a lack of spare parts</p>', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 21, 1, 1)
INSERT [dbo].[Discussion] ([title], [content], [create_at], [update_at], [active], [user_id], [discussion_id], [category_id]) VALUES (N'Sukhoi Su-27', N'<p><strong>Sukhoi Su-27</strong>&nbsp;(<a href="https://vi.wikipedia.org/wiki/Ti%E1%BA%BFng_Nga" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">tiếng Nga</a>:&nbsp;Сухой Су-27;&nbsp;<a href="https://vi.wikipedia.org/wiki/T%C3%AAn_k%C3%BD_hi%E1%BB%87u_c%E1%BB%A7a_NATO" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">tên ký hiệu của NATO</a>:&nbsp;<strong>Flanker</strong>) là một&nbsp;<a href="https://vi.wikipedia.org/wiki/M%C3%A1y_bay_ti%C3%AAm_k%C3%ADch" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">máy bay tiêm kích</a>&nbsp;phản lực độc đáo của&nbsp;<a href="https://vi.wikipedia.org/wiki/Li%C3%AAn_X%C3%B4" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Liên Xô</a>&nbsp;được thiết kế bởi&nbsp;<a href="https://vi.wikipedia.org/wiki/OKB" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Phòng thiết kế</a>&nbsp;<a href="https://vi.wikipedia.org/wiki/Sukhoi" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Sukhoi</a>&nbsp;(SDB) và được sản xuất năm 1977. Nó là đối thủ trực tiếp của những loại&nbsp;<a href="https://vi.wikipedia.org/wiki/M%C3%A1y_bay_ti%C3%AAm_k%C3%ADch_ph%E1%BA%A3n_l%E1%BB%B1c_th%E1%BA%BF_h%E1%BB%87_th%E1%BB%A9_t%C6%B0" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">máy bay chiến đấu thế hệ thứ tư</a>&nbsp;của&nbsp;<a href="https://vi.wikipedia.org/wiki/Hoa_K%E1%BB%B3" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Hoa Kỳ</a>&nbsp;(gồm&nbsp;<a href="https://vi.wikipedia.org/wiki/Grumman_F-14_Tomcat" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">F-14 Tomcat</a>,&nbsp;<a href="https://vi.wikipedia.org/wiki/McDonnell_Douglas_F-15_Eagle" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">F-15 Eagle</a>,&nbsp;<a href="https://vi.wikipedia.org/wiki/General_Dynamics_F-16_Fighting_Falcon" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">F-16 Fighting Falcon</a>&nbsp;và&nbsp;<a href="https://vi.wikipedia.org/wiki/McDonnell_Douglas_F/A-18_Hornet" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">F/A-18 Hornet</a>). Su-27 có tầm hoạt động lớn, trang bị vũ khí hạng nặng, và cực kỳ cơ động nhanh nhẹn linh hoạt. Nhiệm vụ chính của Su-27 là thực hiện các chuyến bay trong các nhiệm vụ chiếm ưu thế trên không, nhưng nó cũng có thể thực hiện gần như mọi nhiệm vụ chiến đấu.</p><p>Từ thiết kế cơ bản của Su-27, nhiều phiên bản khác đã được chế tạo và nâng cấp liên tục nhằm thực hiện những nhiệm vụ khác nhau:</p><ul><li><a href="https://vi.wikipedia.org/wiki/Sukhoi_Su-30" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Su-30</a>&nbsp;là một mẫu máy bay tiêm kích đa nhiệm hai chỗ ngồi, bay trong mọi thời tiết, chuyên thực hiện các nhiệm vụ không chiến và đánh chặn từ xa.</li><li><a href="https://vi.wikipedia.org/wiki/Sukhoi_Su-33" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Su-33 ''Flanker-D''</a>&nbsp;là một mẫu máy bay tiêm kích đánh chặn phòng thủ hạm đội được phát triển từ thiết kế của Su-27 và được trang bị trên các&nbsp;<a href="https://vi.wikipedia.org/wiki/T%C3%A0u_s%C3%A2n_bay" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">tàu sân bay</a>. Sự khác nhau chính bao gồm móc hãm ở đuôi và&nbsp;<a href="https://vi.wikipedia.org/wiki/C%C3%A1nh_m%C5%A9i" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">cánh mũi</a>.</li><li><a href="https://vi.wikipedia.org/wiki/Sukhoi_Su-34" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Su-34 ''Fullback''</a>&nbsp;là phiên bản thiên về ném bom chống các mục tiêu mặt đất và mặt biển, được trang bị vỏ giáp mạnh, buồng lái mở rộng và tải trọng vũ khí được tăng cường</li><li><a href="https://vi.wikipedia.org/wiki/Sukhoi_Su-35" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Su-35 ''Flanker-E''</a>&nbsp;và&nbsp;<a href="https://vi.wikipedia.org/wiki/Sukhoi_Su-37" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Su-37 ''Flanker-F''</a>&nbsp;là các phiên bản tiêm kích phòng thủ trên không cải tiến có những tính năng vượt trội trong mọi mặt như động cơ chỉnh hướng phụt 3D, radar đối không mạnh,&nbsp;<a href="https://vi.wikipedia.org/wiki/T%C3%AAn_l%E1%BB%ADa_kh%C3%B4ng_%C4%91%E1%BB%91i_kh%C3%B4ng" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">tên lửa không-đối-không</a>&nbsp;tầm siêu xa.</li></ul><p>Tính đến tháng 5/2016, đã có khoảng 1.850 chiếc Su-27 và các phiên bản phát triển từ nó được sản xuất, nhiều hơn cả số lượng tiêm kích đối thủ&nbsp;<a href="https://vi.wikipedia.org/wiki/McDonnell_Douglas_F-15_Eagle" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">F-15 Eagle</a>&nbsp;được Mỹ sản xuất (1.712 chiếc). Số lượng các phiên bản của Su-27 được sản xuất sẽ tiếp tục gia tăng trong tương lai nhờ những đơn hàng mới, trong khi&nbsp;<a href="https://vi.wikipedia.org/wiki/McDonnell_Douglas_F-15_Eagle" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">F-15 Eagle</a>&nbsp;thì đã ngừng sản xuất.</p>', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 21, 2, 2)
INSERT [dbo].[Discussion] ([title], [content], [create_at], [update_at], [active], [user_id], [discussion_id], [category_id]) VALUES (N'Tổ hợp tên lửa Pantsir', N'<p><strong>Pantsir-S1</strong>&nbsp;(<a href="https://vi.wikipedia.org/wiki/Ti%E1%BA%BFng_Nga" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">tiếng Nga</a>:&nbsp;Панцирь-С1,&nbsp;<a href="https://vi.wikipedia.org/wiki/T%C3%AAn_k%C3%BD_hi%E1%BB%87u_c%E1%BB%A7a_NATO" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">tên ký hiệu NATO</a>&nbsp;<strong>SA-22 Greyhound</strong>) là một tổ hợp&nbsp;<a href="https://vi.wikipedia.org/wiki/T%C3%AAn_l%E1%BB%ADa_%C4%91%E1%BA%A5t_%C4%91%E1%BB%91i_kh%C3%B4ng" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">tên lửa</a>&nbsp;-&nbsp;<a href="https://vi.wikipedia.org/wiki/Ph%C3%A1o" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">pháo</a>&nbsp;phòng không, tổ hợp này có thể tiêu diệt các mục tiêu trong tầm thấp hoặc cự ly gần (bằng pháo phòng không và tên lửa) lẫn cả tầm trung (bằng tên lửa). Đây là một sản phẩm của&nbsp;<a href="https://vi.wikipedia.org/wiki/Ph%C3%B2ng_thi%E1%BA%BFt_k%E1%BA%BF_ch%E1%BA%BF_t%E1%BA%A1o_kh%C3%AD_c%E1%BB%A5_th%C3%A0nh_ph%E1%BB%91_Tula" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">KBP</a>&nbsp;ở&nbsp;<a href="https://vi.wikipedia.org/wiki/Tula,_Nga" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Tula</a>,&nbsp;<a href="https://vi.wikipedia.org/wiki/Nga" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Nga</a>. Tổ hợp này có thể được đặt trên khung gầm xe bánh xích hoặc bánh lốp, hoặc đặt trên các bệ, trụ cố định. Đây là một sự phát triển hơn nữa của tổ hợp&nbsp;<a href="https://vi.wikipedia.org/wiki/9K22_Tunguska" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><strong>9M311 Tunguska</strong>&nbsp;<em>SA-19</em>/<em>SA-N-11</em></a>.</p><h2>Thiết kế<span style="color: var(--color-subtle,#54595d);">[</span><a href="https://vi.wikipedia.org/w/index.php?title=T%E1%BB%95_h%E1%BB%A3p_t%C3%AAn_l%E1%BB%ADa_Pantsir&amp;veaction=edit&amp;section=1" target="_blank" style="color: var(--color-progressive,#36c); background-color: initial;">sửa</a><span style="color: rgb(84, 89, 93);">&nbsp;|&nbsp;</span><a href="https://vi.wikipedia.org/w/index.php?title=T%E1%BB%95_h%E1%BB%A3p_t%C3%AAn_l%E1%BB%ADa_Pantsir&amp;action=edit&amp;section=1" target="_blank" style="color: var(--color-progressive,#36c); background-color: initial;">sửa mã nguồn</a><span style="color: var(--color-subtle,#54595d);">]</span></h2><p>- Đây là tổ hợp phòng không có tầm tác chiến từ ngắn tới trung bình, đặt trên khung gầm xe bánh xích, bánh lốp hoặc các trụ, bệ đỡ cố định, tổ hợp này có kíp chiến đầu gồm 2 đến 3 người. Tổ hợp phòng không này gồm các khẩu&nbsp;<a href="https://vi.wikipedia.org/w/index.php?title=Ph%C3%A1o_ph%C3%B2ng_kh%C3%B4ng&amp;action=edit&amp;redlink=1" target="_blank" style="background-color: initial; color: var(--color-link-red,#d73333);">pháo phòng không</a>&nbsp;tự động và các&nbsp;<a href="https://vi.wikipedia.org/wiki/T%C3%AAn_l%E1%BB%ADa_%C4%91%E1%BA%A5t_%C4%91%E1%BB%91i_kh%C3%B4ng" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">tên lửa đất đối không</a>, cùng với radar hoặc thiết bị quang học theo dõi mục tiêu và đài chỉ huy vô tuyến. Hiện tại đây được xem là tổ hợp pháo phòng không kết hợp với tên lửa bán chạy nhất thế giới và không có đối thủ trên thị trường vũ khí.</p><p>- Tổ hợp tên lửa - pháo phòng không này được sử dụng để bảo vệ các khu vực mục tiêu trọng yếu, các điểm dân cư và quân sự, đội hình đơn vị chiến đấu đang cơ động lên tới cỡ&nbsp;<a href="https://vi.wikipedia.org/wiki/Trung_%C4%91o%C3%A0n" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">trung đoàn</a>&nbsp;hoặc các tổ hợp phòng không khác như&nbsp;<a href="https://vi.wikipedia.org/wiki/T%E1%BB%95_h%E1%BB%A3p_t%C3%AAn_l%E1%BB%ADa_S-300" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">S-300</a>/<a href="https://vi.wikipedia.org/wiki/T%E1%BB%95_h%E1%BB%A3p_t%C3%AAn_l%E1%BB%ADa_S-400" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">S-400</a>. Các mục tiêu trên không mà tổ hợp này có thể tiêu diệt là các loại&nbsp;<a href="https://vi.wikipedia.org/wiki/M%C3%A1y_bay" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">máy bay</a>,&nbsp;<a href="https://vi.wikipedia.org/wiki/M%C3%A1y_bay_tr%E1%BB%B1c_th%C4%83ng" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">trực thăng</a>,&nbsp;<a href="https://vi.wikipedia.org/wiki/M%C3%A1y_bay_kh%C3%B4ng_ng%C6%B0%E1%BB%9Di_l%C3%A1i" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">máy bay không người lái</a>,&nbsp;<a href="https://vi.wikipedia.org/wiki/T%C3%AAn_l%E1%BB%ADa_h%C3%A0nh_tr%C3%ACnh" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">tên lửa hành trình</a>&nbsp;và vũ khí dẫn đường chính xác không đối đất, với diện tích phản xạ radar nhỏ nhất là 2&nbsp;cm² tới 3&nbsp;cm², và tốc độ lớn nhất lên tới 1300&nbsp;m/s, tổ hợp này có tầm bắn tối đa là 20&nbsp;km và đạt trần bắn là 15&nbsp;km ngay cả khi hệ thống đang di chuyển đây là cải tiến vượt trội so với hệ thống&nbsp;<a href="https://vi.wikipedia.org/wiki/9K22_Tunguska" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><strong>9M311 Tunguska</strong>&nbsp;<em>SA-19</em>/<em>SA-N-11</em></a>. Theo tuyên bố của nhà sản xuất KBP, tổ hợp này có thể tiêu diệt được cả máy bay tàng hình.<a href="https://vi.wikipedia.org/wiki/T%E1%BB%95_h%E1%BB%A3p_t%C3%AAn_l%E1%BB%ADa_Pantsir#cite_note-4" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup>[4]</sup></a></p>', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 21, 3, 3)
INSERT [dbo].[Discussion] ([title], [content], [create_at], [update_at], [active], [user_id], [discussion_id], [category_id]) VALUES (N'Sukhoi Su-25', N'<p>From Wikipedia, the free encyclopedia</p><p><br></p><p>Su-25<a href="https://en.wikipedia.org/wiki/File:Sukhoi_Su-25_of_the_Russian_Air_Force_landing_at_Vladivostok_(8683076150).jpg" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><strong><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Sukhoi_Su-25_of_the_Russian_Air_Force_landing_at_Vladivostok_%288683076150%29.jpg/300px-Sukhoi_Su-25_of_the_Russian_Air_Force_landing_at_Vladivostok_%288683076150%29.jpg" height="195" width="300"></strong></a>A&nbsp;<a href="https://en.wikipedia.org/wiki/Russian_Air_Force" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Russian Air Force</a>&nbsp;Su-25Role<a href="https://en.wikipedia.org/wiki/Close_air_support" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Close air support</a>National originSoviet Union / Russia /&nbsp;<a href="https://en.wikipedia.org/wiki/Georgia_(country)" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Georgia</a>Design group<a href="https://en.wikipedia.org/wiki/Sukhoi" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Sukhoi</a>Built by<a href="https://en.wikipedia.org/wiki/TAM_Management" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">TAM Management</a></p><p><a href="https://en.wikipedia.org/wiki/Tbilisi_Aircraft_Manufacturing" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Tbilisi Aircraft Manufacturing</a></p><p><a href="https://en.wikipedia.org/wiki/Ulan-Ude_Aviation_Plant" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Ulan-Ude Aviation Plant</a>First flight22&nbsp;February 1975; 49 years agoIntroduction19 July 1981StatusIn servicePrimary&nbsp;users<a href="https://en.wikipedia.org/wiki/Russian_Aerospace_Forces" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Russian Aerospace Forces</a></p><p><a href="https://en.wikipedia.org/wiki/Ukrainian_Air_Force" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Ukrainian Air Force</a></p><p><a href="https://en.wikipedia.org/wiki/Korean_People%27s_Army_Air_Force" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Korean People''s Army Air Force</a></p><p><a href="https://en.wikipedia.org/wiki/Peruvian_Air_Force" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Peruvian Air Force</a></p><p><strong>See&nbsp;</strong><a href="https://en.wikipedia.org/wiki/Sukhoi_Su-25#Operators" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><em>Operators</em></a>&nbsp;for othersProduced1978–2017Number builtOver 1,000Variants<a href="https://en.wikipedia.org/wiki/Sukhoi_Su-28" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Sukhoi Su-28</a></p><p><strong>The&nbsp;Sukhoi Su-25&nbsp;<em>Grach</em></strong>&nbsp;(<a href="https://en.wikipedia.org/wiki/Russian_language" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Russian</a>:&nbsp;Грач&nbsp;(<a href="https://en.wikipedia.org/wiki/Rook_(bird)" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><em>rook</em></a>);&nbsp;<a href="https://en.wikipedia.org/wiki/NATO_reporting_name" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">NATO reporting name</a>:&nbsp;<strong>Frogfoot</strong>) is a&nbsp;<a href="https://en.wikipedia.org/wiki/Subsonic_aircraft" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">subsonic</a>, single-seat, twin-engine&nbsp;<a href="https://en.wikipedia.org/wiki/Jet_aircraft" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">jet aircraft</a>&nbsp;developed in the&nbsp;<a href="https://en.wikipedia.org/wiki/Soviet_Union" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Soviet Union</a>&nbsp;by&nbsp;<a href="https://en.wikipedia.org/wiki/Sukhoi" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Sukhoi</a>. It was designed to provide&nbsp;<a href="https://en.wikipedia.org/wiki/Close_air_support" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">close air support</a>&nbsp;for&nbsp;<a href="https://en.wikipedia.org/wiki/Soviet_Ground_Forces" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Soviet Ground Forces</a>. The first prototype made its&nbsp;<a href="https://en.wikipedia.org/wiki/Maiden_flight" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">maiden flight</a>&nbsp;on 22 February 1975. After testing, the aircraft went into&nbsp;<a href="https://en.wikipedia.org/wiki/Series_production" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">series production</a>&nbsp;in 1978 in&nbsp;<a href="https://en.wikipedia.org/wiki/Tbilisi" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Tbilisi</a>&nbsp;in the&nbsp;<a href="https://en.wikipedia.org/wiki/Georgian_Soviet_Socialist_Republic" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Georgian Soviet Socialist Republic</a>.</p><p>Early variants included the Su-25UB two-seat&nbsp;<a href="https://en.wikipedia.org/wiki/Trainer_aircraft" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">trainer</a>, the Su-25BM for&nbsp;<a href="https://en.wikipedia.org/wiki/Target_tug" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">target-towing</a>, and the Su-25K for export customers. Some aircraft were upgraded to the Su-25SM standard in 2012. The Su-25T and the Su-25TM (also known as the Su-39) were further developments, not produced in significant numbers. The Su-25, and the&nbsp;<a href="https://en.wikipedia.org/wiki/Sukhoi_Su-34" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Su-34</a>, were the only armoured,&nbsp;<a href="https://en.wikipedia.org/wiki/Fixed-wing_aircraft" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">fixed-wing</a>&nbsp;aircraft in production in 2007.<a href="https://en.wikipedia.org/wiki/Sukhoi_Su-25#cite_note-gordondawes-1" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup>[1]</sup></a>&nbsp;Su-25s are in service with Russia, other&nbsp;<a href="https://en.wikipedia.org/wiki/Commonwealth_of_Independent_States" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">CIS</a>&nbsp;members, and export customers. Production of the Su-25 ended in 2017 in Russia<a href="https://en.wikipedia.org/wiki/Sukhoi_Su-25#cite_note-2" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup>[2]</sup></a>&nbsp;and 2010 in Georgia.<a href="https://en.wikipedia.org/wiki/Sukhoi_Su-25#cite_note-3" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup>[3]</sup></a>&nbsp;Attempts continue to be made to restart production in Georgia using partially completed airframes,<a href="https://en.wikipedia.org/wiki/Sukhoi_Su-25#cite_note-4" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup>[4]</sup></a>&nbsp;but as of June 2022 no new deliveries have been reported.</p><p>Since entering service more than 42 years ago, the Su-25 has seen combat in several conflicts. The type was heavily involved in the&nbsp;<a href="https://en.wikipedia.org/wiki/Soviet%E2%80%93Afghan_War" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Soviet–Afghan War</a>, flying&nbsp;<a href="https://en.wikipedia.org/wiki/Counter-insurgency" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">counter-insurgency</a>&nbsp;missions against the Afghan&nbsp;<a href="https://en.wikipedia.org/wiki/Mujahideen" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Mujahideen</a>. The&nbsp;<a href="https://en.wikipedia.org/wiki/Iraqi_Air_Force" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Iraqi Air Force</a>&nbsp;employed it against Iran during the 1980–88&nbsp;<a href="https://en.wikipedia.org/wiki/Iran%E2%80%93Iraq_War" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Iran–Iraq War</a>. Most Iraqi examples were later destroyed or flown to Iran in the 1991&nbsp;<a href="https://en.wikipedia.org/wiki/Gulf_War" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Persian Gulf War</a>. The&nbsp;<a href="https://en.wikipedia.org/wiki/Georgian_Air_Force" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Georgian Air Force</a>&nbsp;used Su-25s during the&nbsp;<a href="https://en.wikipedia.org/wiki/War_in_Abkhazia_(1992%E2%80%931993)" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Abkhazian war</a>&nbsp;from 1992 to 1993. The&nbsp;<a href="https://en.wikipedia.org/wiki/Military_of_the_Republic_of_Macedonia" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Macedonian Air Force</a>&nbsp;used Su-25s against&nbsp;<a href="https://en.wikipedia.org/wiki/Albanians" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Albanian</a>&nbsp;insurgents in the&nbsp;<a href="https://en.wikipedia.org/wiki/2001_insurgency_in_Macedonia" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">2001 Macedonian conflict</a>&nbsp;and, in 2008,&nbsp;<a href="https://en.wikipedia.org/wiki/Georgia_(country)" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Georgia</a>&nbsp;and Russia both used Su-25s in the&nbsp;<a href="https://en.wikipedia.org/wiki/Russo-Georgian_War" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Russo-Georgian War</a>. African states, including the&nbsp;<a href="https://en.wikipedia.org/wiki/Ivory_Coast" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Ivory Coast</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Chad" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Chad</a>, and&nbsp;<a href="https://en.wikipedia.org/wiki/Sudan" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Sudan</a>&nbsp;have used the Su-25 in local insurgencies and civil wars. Recently, the Su-25 has seen service in the&nbsp;<a href="https://en.wikipedia.org/wiki/Russian_military_intervention_in_the_Syrian_civil_war" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Russian intervention in the Syrian Civil War</a>, the clashes of the&nbsp;<a href="https://en.wikipedia.org/wiki/2020_Nagorno-Karabakh_War" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">2020 Nagorno-Karabakh War</a>, and on both sides in the&nbsp;<a href="https://en.wikipedia.org/wiki/2022_Russian_invasion_of_Ukraine" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">2022 Russian invasion of Ukraine</a>.<a href="https://en.wikipedia.org/wiki/Sukhoi_Su-25#cite_note-Moscow_Times_2022-5" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup>[5]</sup></a></p>', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 21, 4, 4)
INSERT [dbo].[Discussion] ([title], [content], [create_at], [update_at], [active], [user_id], [discussion_id], [category_id]) VALUES (N'M1 Abrams', N'<p>The&nbsp;<strong>M1 Abrams</strong>&nbsp;(<a href="https://en.wikipedia.org/wiki/Help:IPA/English" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">/ˈeɪbrəmz/</a>)<a href="https://en.wikipedia.org/wiki/M1_Abrams#cite_note-10" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup>[10]</sup></a>&nbsp;is a&nbsp;<a href="https://en.wikipedia.org/wiki/List_of_main_battle_tanks_by_generation" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">third-generation</a>&nbsp;American&nbsp;<a href="https://en.wikipedia.org/wiki/Main_battle_tank" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">main battle tank</a>&nbsp;designed by&nbsp;<a href="https://en.wikipedia.org/wiki/Chrysler_Defense" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Chrysler Defense</a>&nbsp;(now&nbsp;<a href="https://en.wikipedia.org/wiki/General_Dynamics_Land_Systems" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">General Dynamics Land Systems</a>) and named for General&nbsp;<a href="https://en.wikipedia.org/wiki/Creighton_Abrams" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Creighton Abrams</a>. Conceived for modern&nbsp;<a href="https://en.wikipedia.org/wiki/Armoured_warfare" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">armored ground warfare</a>, it is one of the heaviest tanks in service at nearly 73.6&nbsp;<a href="https://en.wikipedia.org/wiki/Short_ton" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">short tons</a>&nbsp;(66.8&nbsp;<a href="https://en.wikipedia.org/wiki/Tonne" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">metric tons</a>). It introduced several modern technologies to United States armored forces, including a&nbsp;<a href="https://en.wikipedia.org/wiki/Multifuel" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">multifuel</a>&nbsp;<a href="https://en.wikipedia.org/wiki/Gas_turbine" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">turbine engine</a>, sophisticated&nbsp;<a href="https://en.wikipedia.org/wiki/Chobham_armour" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Chobham</a>&nbsp;<a href="https://en.wikipedia.org/wiki/Composite_armor" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">composite armor</a>, a computer fire control system, separate ammunition storage in a&nbsp;<a href="https://en.wikipedia.org/wiki/Blowout_panel" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">blowout compartment</a>, and&nbsp;<a href="https://en.wikipedia.org/wiki/CBRN_defense" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">NBC protection</a>&nbsp;for crew safety. Initial models of the M1 were armed with a&nbsp;<a href="https://en.wikipedia.org/wiki/105_mm_calibre" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">105&nbsp;mm</a>&nbsp;<a href="https://en.wikipedia.org/wiki/M68_(tank_gun)" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">M68</a>&nbsp;gun, while later variants feature a license-produced&nbsp;<a href="https://en.wikipedia.org/wiki/Rheinmetall_Rh-120" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Rheinmetall 120&nbsp;mm L/44</a>&nbsp;designated&nbsp;<a href="https://en.wikipedia.org/wiki/M256_(tank_gun)" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">M256</a>.</p><p>The M1 Abrams was developed from the failed joint American-<a href="https://en.wikipedia.org/wiki/West_Germany" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">West German</a>&nbsp;<a href="https://en.wikipedia.org/wiki/MBT-70" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">MBT-70</a>&nbsp;project that intended to replace the obsolete&nbsp;<a href="https://en.wikipedia.org/wiki/M60_tank" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">M60 tank</a>. There are three main operational Abrams versions: the M1,&nbsp;<strong>M1A1</strong>, and&nbsp;<strong>M1A2</strong>, with each new iteration seeing improvements in armament, protection, and electronics.<a href="https://en.wikipedia.org/wiki/M1_Abrams#cite_note-11" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);"><sup>[11]</sup></a></p><p>The Abrams was to be replaced in U.S. Army service by the&nbsp;<a href="https://en.wikipedia.org/wiki/Future_Combat_Systems_Manned_Ground_Vehicles#Mounted_Combat_System" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">XM1202 Mounted Combat System</a>, but because that project was canceled, the Army has opted to continue maintaining and operating the M1 series for the foreseeable future by upgrading optics, armor, and firepower.</p><p>The M1 Abrams entered service in 1980 and serves as the main battle tank of the&nbsp;<a href="https://en.wikipedia.org/wiki/United_States_Army" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">United States Army</a>&nbsp;and formerly of the&nbsp;<a href="https://en.wikipedia.org/wiki/United_States_Marine_Corps" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">United States Marine Corps</a>&nbsp;(USMC) until the decommissioning of all USMC tank battalions in 2021. The export modification is used by the armed forces of&nbsp;<a href="https://en.wikipedia.org/wiki/Egyptian_Army" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Egypt</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Kuwait_Army" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Kuwait</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Saudi_Arabian_Army" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Saudi Arabia</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Australian_Army" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Australia</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Polish_Land_Forces" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Poland</a>&nbsp;and&nbsp;<a href="https://en.wikipedia.org/wiki/Iraqi_Army" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Iraq</a>. The Abrams was first used in combat by the U.S. in the&nbsp;<a href="https://en.wikipedia.org/wiki/Gulf_War" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Gulf War</a>. It was later deployed by the U.S. in the&nbsp;<a href="https://en.wikipedia.org/wiki/War_in_Afghanistan_(2001%E2%80%932021)" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">War in Afghanistan</a>&nbsp;and the&nbsp;<a href="https://en.wikipedia.org/wiki/Iraq_War" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Iraq War</a>, as well as by Iraq in the&nbsp;<a href="https://en.wikipedia.org/wiki/War_in_Iraq_(2013%E2%80%932017)" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">war against the Islamic State</a>, Saudi Arabia in the&nbsp;<a href="https://en.wikipedia.org/wiki/Yemeni_Civil_War_(2014%E2%80%93present)" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Yemeni Civil War</a>, and&nbsp;<a href="https://en.wikipedia.org/wiki/Ukraine" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Ukraine</a>&nbsp;in the&nbsp;<a href="https://en.wikipedia.org/wiki/Russian_invasion_of_Ukraine" target="_blank" style="background-color: initial; color: var(--color-progressive,#36c);">Russian invasion of Ukraine</a>.</p>', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 21, 5, 5)
SET IDENTITY_INSERT [dbo].[Discussion] OFF
GO
SET IDENTITY_INSERT [dbo].[DiscussionCategory] ON 

INSERT [dbo].[DiscussionCategory] ([category_id], [category_name], [create_at], [update_at], [active]) VALUES (1, N'Câu hỏi về cơ thể', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1)
INSERT [dbo].[DiscussionCategory] ([category_id], [category_name], [create_at], [update_at], [active]) VALUES (2, N'Câu hỏi về quần áo', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1)
INSERT [dbo].[DiscussionCategory] ([category_id], [category_name], [create_at], [update_at], [active]) VALUES (3, N'Câu hỏi về ẩm thực', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1)
INSERT [dbo].[DiscussionCategory] ([category_id], [category_name], [create_at], [update_at], [active]) VALUES (4, N'Câu hỏi về động vật', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1)
INSERT [dbo].[DiscussionCategory] ([category_id], [category_name], [create_at], [update_at], [active]) VALUES (5, N'Câu hỏi về thiên nhiên', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1)
SET IDENTITY_INSERT [dbo].[DiscussionCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[flashcard] ON 

INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (1, N'Rice', N'Cơm (com)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (2, N'Noodles', N'Mì (mi)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (3, N'Pho', N'Phở (pho)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (4, N'Bun Bo Hue', N'Bún bò Huế (bun bo hue)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (5, N'Bun Cha', N'Bún chả (bun cha)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (6, N'Banh Mi', N'Bánh mì (banh mi)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (7, N'Meat', N'Thịt (thit)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (8, N'Chicken', N'Gà (ga)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (9, N'Beef', N'Thịt bò (thit bo)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (10, N'Pork', N'Thịt lợn (thit lon)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (11, N'Fish', N'Cá (ca)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (12, N'Vegetables', N'Rau (rau)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (13, N'Soup', N'Canh (canh)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (14, N'Spring Rolls', N'Nem rán (nem ran)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (15, N'Fried Rice', N'Cơm chiên (com chien)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (16, N'Noodles with vegetables', N'Mì xào rau (mi xào rau)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (17, N'Fruit', N'Trái cây (trai cay)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (18, N'Egg', N'Trứng (trung)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (19, N'Spices', N'Gia vị (gia vi)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (20, N'Salt', N'Muối (muoi)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (21, N'Pepper', N'Hồ tiêu (ho tieu)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (22, N'Sugar', N'Đường (duong)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (23, N'Milk', N'Sữa (sua)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (24, N'Water', N'Nước (nuoc)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (25, N'Juice', N'Nước ép (nuoc ep)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (26, N'Coffee', N'Cà phê (ca phe)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (27, N'Beer', N'Bia (bia)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (28, N'Wine', N'Rượu (ruou)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (29, N'Restaurant', N'Quán ăn (quan an)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
INSERT [dbo].[flashcard] ([flashcard_id], [question], [answer], [create_at], [update_at], [active], [Category_id], [image]) VALUES (30, N'Market', N'Chợ (cho)', CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, 3, NULL)
SET IDENTITY_INSERT [dbo].[flashcard] OFF
GO
SET IDENTITY_INSERT [dbo].[Premium] ON 

INSERT [dbo].[Premium] ([premium_id], [premium_name], [premium_price], [premium_discount], [active], [dayActive]) VALUES (1, N'30 ngày', 25000, 0, 1, 30)
INSERT [dbo].[Premium] ([premium_id], [premium_name], [premium_price], [premium_discount], [active], [dayActive]) VALUES (2, N'180 ngày', 100000, 0, 1, 180)
INSERT [dbo].[Premium] ([premium_id], [premium_name], [premium_price], [premium_discount], [active], [dayActive]) VALUES (3, N'360 ngày', 150000, 0, 1, 360)
SET IDENTITY_INSERT [dbo].[Premium] OFF
GO
SET IDENTITY_INSERT [dbo].[Quiz] ON 

INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (1, 29, 2)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (1, 29, 3)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (1, 26, 4)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (1, 26, 5)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (1, 25, 6)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (1, 25, 7)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (1, 3, 8)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (1, 8, 9)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (1, 2, 11)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (1, 9, 12)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (1, 15, 13)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (1, 18, 14)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (2, 1, 15)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (2, 21, 16)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (2, 5, 17)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (2, 11, 18)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (2, 26, 19)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (2, 2, 20)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (2, 29, 21)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (2, 19, 22)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (2, 14, 23)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (3, 20, 24)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (3, 23, 25)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (3, 26, 26)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (3, 12, 27)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (3, 18, 28)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (3, 30, 29)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (3, 3, 30)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (3, 29, 31)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (3, 22, 32)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (3, 28, 33)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (3, 24, 34)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (3, 9, 35)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (4, 11, 36)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (4, 16, 37)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (4, 22, 38)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (4, 10, 39)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (4, 27, 40)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (4, 15, 41)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (4, 6, 42)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (4, 25, 43)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (4, 8, 44)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (4, 4, 45)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (4, 7, 46)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (4, 14, 47)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (5, 17, 48)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (5, 27, 49)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (5, 7, 50)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (5, 16, 51)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (5, 9, 52)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (5, 22, 53)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (5, 3, 54)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (5, 15, 55)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (5, 8, 56)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (5, 20, 57)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (5, 29, 58)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (5, 25, 59)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (6, 16, 60)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (6, 18, 61)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (6, 9, 62)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (6, 13, 63)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (6, 19, 64)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (6, 21, 65)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (6, 8, 66)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (6, 23, 67)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (6, 27, 68)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (6, 2, 69)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (6, 15, 70)
INSERT [dbo].[Quiz] ([course_id], [flashcard_id], [quiz_id]) VALUES (6, 11, 71)
SET IDENTITY_INSERT [dbo].[Quiz] OFF
GO
SET IDENTITY_INSERT [dbo].[Result_Detail] ON 

INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (5, 2, 10, 1)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (0, 3, 0, 2)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (0, 4, 0, 3)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (2, 5, 13, 4)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (9, 6, 50, 5)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (0, 7, 0, 6)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (3, 8, 11, 7)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (9, 9, 113, 8)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (8, 10, 30, 9)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (2, 11, 13, 10)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (0, 12, 0, 11)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (0, 13, 0, 12)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (0, 14, 0, 13)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (0, 15, 0, 14)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (0, 16, 0, 15)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (0, 17, 0, 16)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (0, 18, 0, 17)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (0, 19, 0, 18)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (0, 20, 0, 19)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (10, 21, 163, 20)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (0, 22, 0, 21)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (5, 23, 73, 22)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (5, 24, 94, 23)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (5, 25, 48, 24)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (0, 26, 0, 25)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (0, 27, 0, 26)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (0, 28, 0, 27)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (0, 29, 0, 28)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (0, 30, 0, 29)
INSERT [dbo].[Result_Detail] ([result], [user_practice_id], [time], [RD_id]) VALUES (0, 31, 0, 30)
SET IDENTITY_INSERT [dbo].[Result_Detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Type_Of_Practice] ON 

INSERT [dbo].[Type_Of_Practice] ([TOP_id], [TOP_name], [active]) VALUES (1, N'Trắc nghiệm', 1)
INSERT [dbo].[Type_Of_Practice] ([TOP_id], [TOP_name], [active]) VALUES (2, N'Điền chữ', 1)
INSERT [dbo].[Type_Of_Practice] ([TOP_id], [TOP_name], [active]) VALUES (3, N'Nối thẻ', 1)
SET IDENTITY_INSERT [dbo].[Type_Of_Practice] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (1, N'user 1', N'user1@gmail.com', N'123456', 3, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (2, N'user 2', N'user2@gmail.com', N'123456', 3, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (3, N'user 3', N'user3@gmail.com', N'123456', 3, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (4, N'user 4', N'user4@gmail.com', N'123456', 3, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (5, N'user 5', N'user5@gmail.com', N'123456', 3, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (6, N'user 6', N'user6@gmail.com', N'123456', 3, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (7, N'user 7', N'user7@gmail.com', N'123456', 3, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (8, N'user 8', N'user8@gmail.com', N'123456', 3, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (9, N'user 9', N'user9@gmail.com', N'123456', 3, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (10, N'user 10', N'user10@gmail.com', N'123456', 3, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (11, N'user 11', N'user11@gmail.com', N'123456', 3, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (12, N'user 12', N'user12@gmail.com', N'123456', 3, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (13, N'user 13', N'user13@gmail.com', N'123456', 3, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (14, N'user 14', N'user14@gmail.com', N'123456', 3, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (15, N'user 15', N'user15@gmail.com', N'123456', 3, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (16, N'user 16', N'user16@gmail.com', N'123456', 3, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (17, N'user 17', N'user17@gmail.com', N'123456', 3, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (18, N'user 18', N'user18@gmail.com', N'123456', 3, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (19, N'user 19', N'user19@gmail.com', N'123456', 3, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (20, N'user 20', N'user20@gmail.com', N'123456', 3, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (21, N'mentor 21', N'mentor21@gmail.com', N'123456', 2, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (22, N'mentor 22', N'mentor22@gmail.com', N'123456', 2, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (23, N'mentor 23', N'mentor23@gmail.com', N'123456', 2, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (24, N'mentor 24', N'mentor24@gmail.com', N'123456', 2, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (25, N'mentor 25', N'mentor25@gmail.com', N'123456', 2, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (26, N'admin', N'admin@gmail.com', N'123456', 1, 1, CAST(N'2024-06-24' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (27, N'DinhDuc', N'ductdhe176150@fpt.edu.vn', N'184e638edbf5947e5342e81173a939a6', 3, 1, CAST(N'2024-06-24' AS Date), 1, CAST(N'2003-02-15' AS Date), N'0979846466', NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (28, N'TranDinhDuc', N'ductd2003@gmail.com', N'0cc57d602bd6d205e27f860324cb38cb', 3, 1, CAST(N'2024-06-24' AS Date), 1, CAST(N'2003-01-11' AS Date), N'0979846466', NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (29, N'ToanLV', N'toanlvhe173348@fpt.edu.vn', N'27ef93325e3355c4cce439ad5ed62dc8', 3, 1, CAST(N'2024-06-25' AS Date), 1, CAST(N'2002-01-24' AS Date), N'0979846466', NULL)
INSERT [dbo].[User] ([user_id], [name], [email], [password], [role], [active], [create_at], [gender], [dob], [phone], [image]) VALUES (30, N'dat', N'anhduc18c@gmail.com', N'0cc57d602bd6d205e27f860324cb38cb', 3, 1, CAST(N'2024-06-25' AS Date), 0, CAST(N'2002-02-24' AS Date), N'0979846466', NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[User_Enroll_Course] ([user_id], [course_id], [status]) VALUES (27, 1, 1)
INSERT [dbo].[User_Enroll_Course] ([user_id], [course_id], [status]) VALUES (27, 2, 1)
INSERT [dbo].[User_Enroll_Course] ([user_id], [course_id], [status]) VALUES (27, 3, 1)
INSERT [dbo].[User_Enroll_Course] ([user_id], [course_id], [status]) VALUES (28, 1, 1)
INSERT [dbo].[User_Enroll_Course] ([user_id], [course_id], [status]) VALUES (28, 2, 1)
INSERT [dbo].[User_Enroll_Course] ([user_id], [course_id], [status]) VALUES (28, 3, 1)
INSERT [dbo].[User_Enroll_Course] ([user_id], [course_id], [status]) VALUES (28, 6, 1)
INSERT [dbo].[User_Enroll_Course] ([user_id], [course_id], [status]) VALUES (30, 1, 1)
INSERT [dbo].[User_Enroll_Course] ([user_id], [course_id], [status]) VALUES (30, 2, 1)
INSERT [dbo].[User_Enroll_Course] ([user_id], [course_id], [status]) VALUES (30, 3, 1)
INSERT [dbo].[User_Enroll_Course] ([user_id], [course_id], [status]) VALUES (30, 6, 1)
GO
SET IDENTITY_INSERT [dbo].[User_Have_Premium] ON 

INSERT [dbo].[User_Have_Premium] ([UHP_id], [user_id], [premium_id], [create_at], [end_at], [actual_price]) VALUES (1, 28, 1, CAST(N'2024-06-25' AS Date), CAST(N'2025-05-20' AS Date), 275000)
INSERT [dbo].[User_Have_Premium] ([UHP_id], [user_id], [premium_id], [create_at], [end_at], [actual_price]) VALUES (2, 30, 1, CAST(N'2024-06-25' AS Date), CAST(N'2025-01-21' AS Date), 125000)
SET IDENTITY_INSERT [dbo].[User_Have_Premium] OFF
GO 
SET IDENTITY_INSERT [dbo].[User_Practice] ON 

INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (27, 2, 1, 2, 1)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (27, 2, 2, 3, 3)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (27, 2, 3, 4, 3)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (27, 3, 1, 5, 0)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (27, 3, 2, 6, 2)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (27, 3, 3, 7, 3)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (28, 2, 1, 8, -1)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (28, 2, 2, 9, -1)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (28, 2, 3, 10, -1)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (28, 3, 1, 11, -1)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (28, 3, 2, 12, -1)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (28, 3, 3, 13, -1)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (28, 1, 1, 14, -1)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (28, 1, 2, 15, -1)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (28, 1, 3, 16, -1)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (28, 6, 1, 17, -1)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (28, 6, 2, 18, -1)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (28, 6, 3, 19, -1)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (30, 6, 1, 20, -1)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (30, 6, 2, 21, -1)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (30, 6, 3, 22, -1)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (30, 3, 1, 23, -1)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (30, 3, 2, 24, -1)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (30, 3, 3, 25, -1)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (30, 2, 1, 26, -1)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (30, 2, 2, 27, -1)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (30, 2, 3, 28, -1)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (30, 1, 1, 29, -1)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (30, 1, 2, 30, -1)
INSERT [dbo].[User_Practice] ([user_id], [course_id], [TOP_id], [user_practice_id], [times]) VALUES (30, 1, 3, 31, -1)
SET IDENTITY_INSERT [dbo].[User_Practice] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Category__5189E255C63FAD40]    Script Date: 7/4/2024 8:11:42 PM ******/
ALTER TABLE [dbo].[Category] ADD UNIQUE NONCLUSTERED 
(
	[category_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Course__B5B2A66A6BB21AF1]    Script Date: 7/4/2024 8:11:42 PM ******/
ALTER TABLE [dbo].[Course] ADD UNIQUE NONCLUSTERED 
(
	[course_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Discussi__5189E255EDE61162]    Script Date: 7/4/2024 8:11:42 PM ******/
ALTER TABLE [dbo].[DiscussionCategory] ADD UNIQUE NONCLUSTERED 
(
	[category_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Premium__BA95D3121C8C17A4]    Script Date: 7/4/2024 8:11:42 PM ******/
ALTER TABLE [dbo].[Premium] ADD UNIQUE NONCLUSTERED 
(
	[premium_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__AB6E6164C6578CBE]    Script Date: 7/4/2024 8:11:42 PM ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[User_Practice] ADD  DEFAULT ((5)) FOR [times]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FKCommentDiscuss] FOREIGN KEY([discussion_id])
REFERENCES [dbo].[Discussion] ([discussion_id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FKCommentDiscuss]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FKCommentUser] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FKCommentUser]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FKCourse13033] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FKCourse13033]
GO
ALTER TABLE [dbo].[Discussion]  WITH CHECK ADD  CONSTRAINT [FKDiscussi292579] FOREIGN KEY([category_id])
REFERENCES [dbo].[DiscussionCategory] ([category_id])
GO
ALTER TABLE [dbo].[Discussion] CHECK CONSTRAINT [FKDiscussi292579]
GO
ALTER TABLE [dbo].[Discussion]  WITH CHECK ADD  CONSTRAINT [FKDiscussi982579] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Discussion] CHECK CONSTRAINT [FKDiscussi982579]
GO
ALTER TABLE [dbo].[flashcard]  WITH CHECK ADD  CONSTRAINT [FKflashcard200337] FOREIGN KEY([Category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[flashcard] CHECK CONSTRAINT [FKflashcard200337]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FKQuiz491781] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([course_id])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FKQuiz491781]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FKQuiz898896] FOREIGN KEY([flashcard_id])
REFERENCES [dbo].[flashcard] ([flashcard_id])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FKQuiz898896]
GO
ALTER TABLE [dbo].[Result_Detail]  WITH CHECK ADD  CONSTRAINT [FKResult_Det440593] FOREIGN KEY([user_practice_id])
REFERENCES [dbo].[User_Practice] ([user_practice_id])
GO
ALTER TABLE [dbo].[Result_Detail] CHECK CONSTRAINT [FKResult_Det440593]
GO
ALTER TABLE [dbo].[User_Enroll_Course]  WITH CHECK ADD  CONSTRAINT [FKUser_Enrol369795] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([course_id])
GO
ALTER TABLE [dbo].[User_Enroll_Course] CHECK CONSTRAINT [FKUser_Enrol369795]
GO
ALTER TABLE [dbo].[User_Enroll_Course]  WITH CHECK ADD  CONSTRAINT [FKUser_Enrol952811] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[User_Enroll_Course] CHECK CONSTRAINT [FKUser_Enrol952811]
GO
ALTER TABLE [dbo].[User_Have_Premium]  WITH CHECK ADD  CONSTRAINT [FKU_P] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[User_Have_Premium] CHECK CONSTRAINT [FKU_P]
GO
ALTER TABLE [dbo].[User_Have_Premium]  WITH CHECK ADD  CONSTRAINT [FKU_P1] FOREIGN KEY([premium_id])
REFERENCES [dbo].[Premium] ([premium_id])
GO
ALTER TABLE [dbo].[User_Have_Premium] CHECK CONSTRAINT [FKU_P1]
GO
ALTER TABLE [dbo].[User_Practice]  WITH CHECK ADD  CONSTRAINT [FKUser_Pract601937] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([course_id])
GO
ALTER TABLE [dbo].[User_Practice] CHECK CONSTRAINT [FKUser_Pract601937]
GO
ALTER TABLE [dbo].[User_Practice]  WITH CHECK ADD  CONSTRAINT [FKUser_Pract87055] FOREIGN KEY([TOP_id])
REFERENCES [dbo].[Type_Of_Practice] ([TOP_id])
GO
ALTER TABLE [dbo].[User_Practice] CHECK CONSTRAINT [FKUser_Pract87055]
GO
ALTER TABLE [dbo].[User_Practice]  WITH CHECK ADD  CONSTRAINT [FKUser_Pract981078] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[User_Practice] CHECK CONSTRAINT [FKUser_Pract981078]
GO
USE [master]
GO
ALTER DATABASE [iter2] SET  READ_WRITE 
GO
