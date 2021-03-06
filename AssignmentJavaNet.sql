USE [master]
GO
/****** Object:  Database [AssignmentJavaNet]    Script Date: 7/19/2018 4:41:33 PM ******/
CREATE DATABASE [AssignmentJavaNet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AssignmentJavaNet_', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\AssignmentJavaNet_.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AssignmentJavaNet__log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\AssignmentJavaNet__log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AssignmentJavaNet] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AssignmentJavaNet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AssignmentJavaNet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AssignmentJavaNet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AssignmentJavaNet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AssignmentJavaNet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AssignmentJavaNet] SET ARITHABORT OFF 
GO
ALTER DATABASE [AssignmentJavaNet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AssignmentJavaNet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AssignmentJavaNet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AssignmentJavaNet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AssignmentJavaNet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AssignmentJavaNet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AssignmentJavaNet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AssignmentJavaNet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AssignmentJavaNet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AssignmentJavaNet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AssignmentJavaNet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AssignmentJavaNet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AssignmentJavaNet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AssignmentJavaNet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AssignmentJavaNet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AssignmentJavaNet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AssignmentJavaNet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AssignmentJavaNet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AssignmentJavaNet] SET  MULTI_USER 
GO
ALTER DATABASE [AssignmentJavaNet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AssignmentJavaNet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AssignmentJavaNet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AssignmentJavaNet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AssignmentJavaNet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AssignmentJavaNet] SET QUERY_STORE = OFF
GO
USE [AssignmentJavaNet]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [AssignmentJavaNet]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/19/2018 4:41:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 7/19/2018 4:41:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[userId] [int] NOT NULL,
	[postId] [int] NOT NULL,
	[comment] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 7/19/2018 4:41:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[postId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[grade] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 7/19/2018 4:41:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[postId] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[imageUrl] [varchar](100) NOT NULL,
	[review] [nvarchar](1000) NOT NULL,
	[locations] [nvarchar](400) NOT NULL,
	[grade] [float] NOT NULL,
	[price] [int] NOT NULL,
	[categoryId] [int] NOT NULL,
	[userId] [int] NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[postId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 7/19/2018 4:41:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[pass] [varchar](50) NOT NULL,
	[authority] [bit] NOT NULL,
 CONSTRAINT [PK_UserLogin] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (1, N'bánh')
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (10, N'bún')
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (2, N'cháo')
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (6, N'cơm')
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (5, N'hủ tiếu')
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (4, N'mì')
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (3, N'phở')
SET IDENTITY_INSERT [dbo].[Category] OFF
INSERT [dbo].[Comment] ([userId], [postId], [comment]) VALUES (2, 7, N'Ngon hết xảy luôn ấy')
INSERT [dbo].[Comment] ([userId], [postId], [comment]) VALUES (5, 6, N'Chưa thấy vừa lòng lắm, hy vọng lần tới sẽ ngon hơn')
INSERT [dbo].[Comment] ([userId], [postId], [comment]) VALUES (6, 2, N'Cũng tạm được, chắc sẽ còn quay lại')
INSERT [dbo].[Comment] ([userId], [postId], [comment]) VALUES (2, 2, N'Damn, this meal is fucking delicious')
INSERT [dbo].[Comment] ([userId], [postId], [comment]) VALUES (1, 24, N'Huhu')
INSERT [dbo].[Comment] ([userId], [postId], [comment]) VALUES (5, 20, N'Đãm mị dẫn hạ')
INSERT [dbo].[Comment] ([userId], [postId], [comment]) VALUES (1, 24, N'Taị sao lại bị thế này nhỉ')
INSERT [dbo].[Comment] ([userId], [postId], [comment]) VALUES (5, 23, N'Mệt mõi quá')
INSERT [dbo].[Comment] ([userId], [postId], [comment]) VALUES (5, 20, N'Haiz quá đáng')
INSERT [dbo].[Comment] ([userId], [postId], [comment]) VALUES (1, 33, N'damne')
INSERT [dbo].[Comment] ([userId], [postId], [comment]) VALUES (1, 22, N'Ngon quá, phải thử một lần mới được')
INSERT [dbo].[Comment] ([userId], [postId], [comment]) VALUES (1, 34, N'Bánh ngon lắm nè, vị đặc biệt, nghiện món này của quán này mất rồi')
INSERT [dbo].[Comment] ([userId], [postId], [comment]) VALUES (5, 34, N'ăn tệ vl ra ')
INSERT [dbo].[Comment] ([userId], [postId], [comment]) VALUES (5, 34, N'ăn ngon lắm')
INSERT [dbo].[Comment] ([userId], [postId], [comment]) VALUES (5, 34, N'ăn ngon lắm<br/>admin: abc')
INSERT [dbo].[Comment] ([userId], [postId], [comment]) VALUES (5, 24, N'Thử cái coi sao ')
INSERT [dbo].[Comment] ([userId], [postId], [comment]) VALUES (1, 24, N'Test cái coi')
INSERT [dbo].[Comment] ([userId], [postId], [comment]) VALUES (6, 12, N'Ngon ghê ta, đến ăn lần nữa mới được')
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([postId], [title], [imageUrl], [review], [locations], [grade], [price], [categoryId], [userId]) VALUES (1, N'Bánh xèo 20 Tô Hiệu', N'image/1.jpg', N'Tại sao các bạn không đến thử, một lần và nghiện đến già', N'Tô hiệu', 0, 20000, 1, 1)
INSERT [dbo].[Post] ([postId], [title], [imageUrl], [review], [locations], [grade], [price], [categoryId], [userId]) VALUES (2, N'Bún bò Huể', N'image/2.jpg', N'Tại sao các bạn không đến thử, một lần và nghiện đến già', N'Hạm Đội', 0, 30000, 10, 2)
INSERT [dbo].[Post] ([postId], [title], [imageUrl], [review], [locations], [grade], [price], [categoryId], [userId]) VALUES (6, N'Cháo lòng 30 Bách khoa', N'image/3.jpg', N'Tại sao các bạn không đến thử, một lần và nghiện đến già', N'Bách Khoa', 0, 15000, 2, 5)
INSERT [dbo].[Post] ([postId], [title], [imageUrl], [review], [locations], [grade], [price], [categoryId], [userId]) VALUES (7, N'Hủ Tíu', N'image/4.jpg', N'Tại sao các bạn không đến thử, một lần và nghiện đến già', N'Trương Định', 0, 35000, 5, 6)
INSERT [dbo].[Post] ([postId], [title], [imageUrl], [review], [locations], [grade], [price], [categoryId], [userId]) VALUES (10, N'Cháo sườn vũ đại ', N'image/2.jpg', N'Tại sao các bạn không đến thử, một lần và nghiện đến già', N'Hà Nội', 0, 20000, 2, 5)
INSERT [dbo].[Post] ([postId], [title], [imageUrl], [review], [locations], [grade], [price], [categoryId], [userId]) VALUES (11, N'Bún Nam Yết', N'image/2.jpg', N'Thử các kiểu con đà điểu, mại dzô', N'40 Yết Kiêu Hũ', 0, 30000, 10, 2)
INSERT [dbo].[Post] ([postId], [title], [imageUrl], [review], [locations], [grade], [price], [categoryId], [userId]) VALUES (12, N'Chân Giò Hạ', N'/AssignmentJavaWeb/image/1update.jpg', N'Thử các kiểu con đà điểu, mại dzô', N'40 Hai Hạ Hủ', 0, 20000, 1, 6)
INSERT [dbo].[Post] ([postId], [title], [imageUrl], [review], [locations], [grade], [price], [categoryId], [userId]) VALUES (15, N'Bún Bò Huế', N'image/2.jpg', N'Thử các kiểu con đà điểu, mại dzô', N'23,Hạ Quảng Ninh', 0, 40000, 10, 7)
INSERT [dbo].[Post] ([postId], [title], [imageUrl], [review], [locations], [grade], [price], [categoryId], [userId]) VALUES (20, N'Bún Thang', N'image/2.jpg', N'Come on, vô thử đi rồi biết', N'Tôn Thượng Hà Nội', 0, 50000, 2, 5)
INSERT [dbo].[Post] ([postId], [title], [imageUrl], [review], [locations], [grade], [price], [categoryId], [userId]) VALUES (22, N'Bánh giò cô Béo', N'/AssignmentJavaWeb/image/211update.jpg', N'Mình ăn ở đây nhiều rồi, hôm nay mới viết review. Bánh giò ở đây có thể nói là số 1 Hà Nội. Bánh chắc nhưng vẫn mềm, thịt tươi không bị hôi. Bánh lúc nào cũng nóng hổi. Giò chả thì khỏi nói, rất chất lượng. 

Một đĩa đầy ăm ắp mà chỉ có 25k, ăn vào no lặc lè luôn. Mỗi tội đĩa đầy quá, lại cho dưa góp vào chung lổn ngổn. Nước dưa góp trộn lẫn với vị bánh ăn rất mất cảm giác. Người nào thích ăn lổn nhổn kiểu đó chứ mình không thích.', N'25 Trương Định Hoàng Mai Hà Nội', 0, 25000, 1, 1)
INSERT [dbo].[Post] ([postId], [title], [imageUrl], [review], [locations], [grade], [price], [categoryId], [userId]) VALUES (23, N'Cơm tấm Nam Ninh', N'/AssignmentJavaWeb/image/235update.jpg', N'Cơm tấm nhà làm, ngon như mẹ làm, đến và thưởng thức', N'Trương Đinh, Hoàng Mai, Hà Nội', 0, 25000, 6, 5)
INSERT [dbo].[Post] ([postId], [title], [imageUrl], [review], [locations], [grade], [price], [categoryId], [userId]) VALUES (24, N'Bún Nam Ninh', N'/AssignmentJavaWeb/image/241updateupdate.jpg', N'Bún Nam Ninh nghe danh đã lâu rồi nay mới được diện kiến, nghe mọi người nói cuối tuần đông lắm, xếp hàng chờ lâu nên thôi tranh thủ buổi trưa giữa tuần qua đây ăn.
Nước dùng ngọt ninh từ mấy chục bộ xương không biết, thịt ngan chắc, chị chủ quán cứ dùng kéo cắt xoẹt xoẹt từng miếng vuông như ô bàn cờ, miếng vừa ăn.
Bát bún 30k mà đầy đặn, nhiều thịt, nhiều măng, nhiều mọc, cả miếng tiết to nữa
Ăn trưa thì gọi thêm cốc sen nhãn dừa tươi quán bên cạnh uống cho mát cho đỡ ngấy nhé', N'Hạ Long Quảng Ninh', 0, 30000, 10, 1)
INSERT [dbo].[Post] ([postId], [title], [imageUrl], [review], [locations], [grade], [price], [categoryId], [userId]) VALUES (33, N'Phở bò Cần sa', N'/AssignmentJavaWeb/image/256update.jpg', N'Đừng bỏ lỡ, bởi đơn giản it''s miracle', N'Cần Thơ', 0, 20000, 3, 6)
INSERT [dbo].[Post] ([postId], [title], [imageUrl], [review], [locations], [grade], [price], [categoryId], [userId]) VALUES (34, N'Bánh ngọt thượng hạng', N'/AssignmentJavaWeb/image/347update.jpg', N'Bánh bông lan ngon thượng hạng đến từ miên đất viễn đông thần bí', N'Hola', 0, 24000, 1, 7)
SET IDENTITY_INSERT [dbo].[Post] OFF
SET IDENTITY_INSERT [dbo].[UserLogin] ON 

INSERT [dbo].[UserLogin] ([userId], [username], [pass], [authority]) VALUES (1, N'admin', N'12345', 1)
INSERT [dbo].[UserLogin] ([userId], [username], [pass], [authority]) VALUES (2, N'tunganh', N'12345qwert', 0)
INSERT [dbo].[UserLogin] ([userId], [username], [pass], [authority]) VALUES (5, N'tungkong', N'tungkong', 0)
INSERT [dbo].[UserLogin] ([userId], [username], [pass], [authority]) VALUES (6, N'tonthuong', N'deba', 0)
INSERT [dbo].[UserLogin] ([userId], [username], [pass], [authority]) VALUES (7, N'barathum', N'sb', 0)
SET IDENTITY_INSERT [dbo].[UserLogin] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [U_categoryName]    Script Date: 7/19/2018 4:41:34 PM ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [U_categoryName] UNIQUE NONCLUSTERED 
(
	[categoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Post__E52A1BB3DB63A297]    Script Date: 7/19/2018 4:41:34 PM ******/
ALTER TABLE [dbo].[Post] ADD  CONSTRAINT [UQ__Post__E52A1BB3DB63A297] UNIQUE NONCLUSTERED 
(
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [U_username]    Script Date: 7/19/2018 4:41:34 PM ******/
ALTER TABLE [dbo].[UserLogin] ADD  CONSTRAINT [U_username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Post] FOREIGN KEY([postId])
REFERENCES [dbo].[Post] ([postId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Post]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_UserLogin] FOREIGN KEY([userId])
REFERENCES [dbo].[UserLogin] ([userId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_UserLogin]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Post] FOREIGN KEY([postId])
REFERENCES [dbo].[Post] ([postId])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Post]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_UserLogin] FOREIGN KEY([userId])
REFERENCES [dbo].[UserLogin] ([userId])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_UserLogin]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([categoryId])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Category]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_UserLogin] FOREIGN KEY([userId])
REFERENCES [dbo].[UserLogin] ([userId])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_UserLogin]
GO
USE [master]
GO
ALTER DATABASE [AssignmentJavaNet] SET  READ_WRITE 
GO
