USE [master]
GO
/****** Object:  Database [FashionShop]    Script Date: 3/13/2025 1:52:17 AM ******/
CREATE DATABASE [FashionShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FashionShop', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FashionShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FashionShop_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FashionShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FashionShop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FashionShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FashionShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FashionShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FashionShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FashionShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FashionShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [FashionShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FashionShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FashionShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FashionShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FashionShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FashionShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FashionShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FashionShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FashionShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FashionShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FashionShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FashionShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FashionShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FashionShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FashionShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FashionShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FashionShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FashionShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FashionShop] SET  MULTI_USER 
GO
ALTER DATABASE [FashionShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FashionShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FashionShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FashionShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FashionShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FashionShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FashionShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [FashionShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FashionShop]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/13/2025 1:52:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 3/13/2025 1:52:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[total_price]  AS ([quantity]*[price]) PERSISTED,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/13/2025 1:52:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[total_price] [decimal](10, 2) NOT NULL,
	[status] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/13/2025 1:52:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[stock] [int] NOT NULL,
	[category_id] [int] NULL,
	[image] [varchar](255) NULL,
	[category_type] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shopping_Cart]    Script Date: 3/13/2025 1:52:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shopping_Cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[statusCart] [int] NULL,
 CONSTRAINT [PK__Shopping__3213E83FA75B3044] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/13/2025 1:52:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[phone] [varchar](15) NULL,
	[dob] [date] NULL,
	[address] [text] NULL,
	[role] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([id], [name]) VALUES (4, N'jacket')
INSERT [dbo].[Categories] ([id], [name]) VALUES (2, N'jean')
INSERT [dbo].[Categories] ([id], [name]) VALUES (1, N'shirt')
INSERT [dbo].[Categories] ([id], [name]) VALUES (5, N'shoes')
INSERT [dbo].[Categories] ([id], [name]) VALUES (3, N'sport')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Detail] ON 

INSERT [dbo].[Order_Detail] ([id], [order_id], [product_id], [quantity], [price]) VALUES (1, 18, 5, 1, CAST(100000.00 AS Decimal(10, 2)))
INSERT [dbo].[Order_Detail] ([id], [order_id], [product_id], [quantity], [price]) VALUES (2, 18, 2, 1, CAST(100000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Order_Detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [user_id], [total_price], [status]) VALUES (18, 2, CAST(200000.00 AS Decimal(10, 2)), N'processing')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (2, N'Women''s Formal Shirt', CAST(100000.00 AS Decimal(10, 2)), 9, 1, N'https://lozuri.com/cdn/shop/files/processed-e24a63391e698e5f5840b9e3d92f8e4664c56f005aebc4cd7c966f19015b47de-1714482956646.jpg?v=1714482967&width=5000', N'women')
INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (3, N'Baby Cotton Shirt', CAST(100000.00 AS Decimal(10, 2)), 10, 1, N'https://www.vertbaudet.co.uk/fstrz/r/s/media.vertbaudet.co.uk/Pictures/vertbaudet/385611/pack-of-2-short-sleeve-organic-cotton-t-shirts-for-newborn-babies.jpg?width=457?width=1320', N'baby')
INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (4, N'Men''s Striped Shirt', CAST(100000.00 AS Decimal(10, 2)), 10, 1, N'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRAAYQtVHvEAk_k-w1k5PO670HFw-p2NS1_8AqJDpwTgHfdywGc0fVuROuOIdkFmeXQgQTFrMxlcU2xHYdjsdupHNiHJ_NRupTdUyP0CDfvJs-naz2vv-bm&usqp=CAE', N'men')
INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (5, N'Women''s Summer Shirt', CAST(100000.00 AS Decimal(10, 2)), 9, 1, N'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSBGL-8Dbzda1wzt6XIKgzLck5QEc22h_chT1K307LfWkABoGvX1JFvO_1SMrOffaL9KMj5WSn2MiO61FFAJRF-hO8Tv046Ks2o7KRp4Ycdnu8gn5ZwcX6e8w&usqp=CAE', N'women')
INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (6, N'Men''s Slim Fit Jeans', CAST(100000.00 AS Decimal(10, 2)), 10, 2, N'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSmaAS2VlMWaLiFKiprySosatmeGjKZhdH8OZyME393pQB0eSNC7_lRFt3uT2P_8pikOHHqJ4fshd-7FYH2FxvUX9_WzDp55oBc8dUHndQcrdyQB6idu4T8cw&usqp=CAE', N'men')
INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (7, N'Women''s High-Waist Jeans', CAST(100000.00 AS Decimal(10, 2)), 10, 2, N'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTMA92vR8v_cZRBIoIsnHe00HQnqD4227_b-a28ZFPUalN41Rk1Wu-EcH4O9ESYoAeoAC3Diw0zoAMvDdc7TzMA_cgvU2eBYQ0TxNIolhF-CVSomfoYuzWi&usqp=CAE', N'women')
INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (8, N'Baby Stretch Jeans', CAST(100000.00 AS Decimal(10, 2)), 10, 2, N'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRT8MCtwwlXrpZ5YxdKnxAt3iMbe5pMJ3XxL1h_IlUd2URfIgV86Z95_atcgdGPjBlGOzbqgjzO6eEm8yJ8eCDaE6GCrGkvPqOPMx0iVDzG&usqp=CAE', N'baby')
INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (9, N'Men''s Relaxed Fit Jeans', CAST(100000.00 AS Decimal(10, 2)), 10, 2, N'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQw2Kg0LNnvAKU2Z57CzeFp9vEq13LLODtZAQSiwtrVg7bnmwdkW95zizYOb4lE9E8Bu3Rc_QDVJTuwnOlp3iJVQ9h3JZC23rMtf103dz1OgM1Z_RuCHB6v&usqp=CAE', N'men')
INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (10, N'Women''s Skinny Jeans', CAST(100000.00 AS Decimal(10, 2)), 10, 2, N'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcS5EJUrwEF5zSGDXusqTnHsZ1elTwjM2pteu2szHmXCJI-ADpnsmMsa3AaNtzHtdDb5XdSGGiYtOyA4I0RGdzhuqMvQx-6LbS9VDZ-9kF3K9KzPNRWiELhHCA&usqp=CAE', N'women')
INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (11, N'Men''s Running Shoes', CAST(100000.00 AS Decimal(10, 2)), 10, 3, N'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSczCHrB3snFKeUQVZxevOYLuQqOTtSPq3QEHrrz89Kx_qtN9Sg5gDAT_2IsrVqp6ZG9PogCijbewqbjSRVzD16PoDFo2VuKPBziPo28Vty6xdcofc7tsstpg&usqp=CAE', N'men')
INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (12, N'Women''s Yoga Pants', CAST(100000.00 AS Decimal(10, 2)), 10, 3, N'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSDvvGqNJcn5SMYfAAIhf1m9xAJkbQ03mqS4dFTHfSd0mATB5Drm5Q2ZAAcloGHjzPOZ962QM7pm_-lQVfRqH6bJ2MeIBtc&usqp=CAE', N'women')
INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (13, N'Baby Sports T-Shirt', CAST(100000.00 AS Decimal(10, 2)), 10, 3, N'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRn7zJlaDVG9CilRaWvHRA6ieu2Nj5cQ0rzUQ-ZooN_hqzJ6gEoF_4S1DF1XPIX5OlHvMOQzUs0QPXYDCg4YKZxvBPhIDc0osNqVjJONJG9&usqp=CAE', N'baby')
INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (14, N'Men''s Gym Shorts', CAST(100000.00 AS Decimal(10, 2)), 10, 3, N'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTnoSPzJ7dwbf8dW6OBZdpAyHjeAVoPgq1J5rWcS6YDeJq6mjO6qcIe8w8ikUbdi6UjHbZLX6arAI94AvusFwVXFPeLfQ6TqPU9egb8jFg&usqp=CAE', N'men')
INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (15, N'Women''s Sports Bra', CAST(100000.00 AS Decimal(10, 2)), 10, 3, N'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRxhzBey0atB_kILkP0_nSXt-I1bguHX6Ka_XFxJF8DoYY0HgI-khZXM7Mr5x5xDrl2d5-P4cA9VrDEs70YHxnaxKR-n5Cwr8Xr1p7gs9a6&usqp=CAE', N'women')
INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (16, N'Men''s Winter Jacket', CAST(100000.00 AS Decimal(10, 2)), 10, 4, N'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcThkWUC4QtL0yQwFPr0GImuIMf7IDWbsQZIByvRUz-UVhPH7yp8oDPdvhEmD-D7KTvXvZdc4E8bQMZT3KGe1dBMgPL_MU1zXYvXcOLL4WMurP75qeL_xu00ew&usqp=CAE', N'men')
INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (17, N'Women''s Leather Jacket', CAST(100000.00 AS Decimal(10, 2)), 10, 4, N'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRS7uYh5Q2oDKlgrXRbS5LYRKDNKPL3D5byiHdv1-ncHaWGQDCuJh5UlHTvKtRf5ay6s7h4zS0RjmK366zFnbHtSYNf_U_XY5Pbp05eLhDUL2EDjcQ1EBzsdQ&usqp=CAE', N'women')
INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (18, N'Baby Puffer Jacket', CAST(100000.00 AS Decimal(10, 2)), 10, 4, N'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSnhxAG70B9tHAONaoccyqrZVYHfoZzvoaIilxI81l31PbMawKhfT-wEmNJkHIsThZz_S_xMqWSTOu3wklObF4OgdQgT0toTuBuco_Rs7C5J52tW_atUHe_&usqp=CAE', N'baby')
INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (19, N'Men''s Denim Jacket', CAST(100000.00 AS Decimal(10, 2)), 10, 4, N'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTuWKeEo-ssQr-vC3U1pCra3v79p6j6V1C5ynqG59uTuu1GwH1xOba1tmLPAkpczj5PHvAGm6NqK_h1Q2JNnrpaIZGkBT1ec8WY7jmbjGsH6PAho5fUMbQVDIQ&usqp=CAE', N'men')
INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (20, N'Women''s Bomber Jacket', CAST(100000.00 AS Decimal(10, 2)), 10, 4, N'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQEO1onWEBec61z8WMlpN6JPRJ9y4m2klfK0X1OHbImMOLM9_8wqnjiuDntRlTT29vsLUvN7bgOp7lb8-Mg0984V7gBrLPb75qzGaxJRYUfVd6iwYAZRgc_&usqp=CAE', N'women')
INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (21, N'Men''s Casual Shoes', CAST(100000.00 AS Decimal(10, 2)), 10, 5, N'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcS50K_xJe6jiZBDizfe9YPSlzhNTdnq26H1WjNB7JjR6hSTRsLUuiGewH0YJJ8jvS_b82870_g1CP7w3vPOYwoqqGgpkBd7RdJ3CbkERw1s54jJpR2xpL9IHK4&usqp=CAE', N'men')
INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (22, N'Women''s High Heels', CAST(100000.00 AS Decimal(10, 2)), 10, 5, N'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSN64DDXmQ2N-2Ax5y_8A6mD7Ov9jf-wvML3-h0n2Xu5wSVHYnB-_V82XnQNiPCcflvHJyUhS6zsmRxzE9WVAua1Zkyp65qlA1ru8MyXNgoiWPhBBJQcBHSVKg&usqp=CAE', N'women')
INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (23, N'Baby Walking Shoes', CAST(100000.00 AS Decimal(10, 2)), 10, 5, N'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQXqiYyPaCyQFeONn-xi50J4_IrMSKK8TzOIrrQgWQQSRRRMtrPxnoL1Fg6U5xCtwYvlp8pWc-SmC_ER40jolrjO-9KzWFX4HUU0kTa6GNf&usqp=CAE', N'baby')
INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (24, N'Men''s Formal Shoes', CAST(100000.00 AS Decimal(10, 2)), 10, 5, N'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQ8dxCDGtK1gnxANzahDQhNp5CEZTtJ0UC4u8gGXCxcvY_zVlhL2tdoGz-OOOosZzpmbR4YXAcwqIRqWjBMKRuosEEXrNgSFsSKDJyarzlmzXs4b28k9P3k5A&usqp=CAE', N'men')
INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (25, N'Women''s Sneakers', CAST(100000.00 AS Decimal(10, 2)), 10, 5, N'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQjY1IUabbXwilTTnr-GipRYh8-1yqzR0CsV6E_K6TR2xlp-lUPf82cYSbmQ0MfLA021EcOwASgCu3q0fjB5200F-cK4d0SDxvWrA3nYgUazn1THSyy-s2T-F4&usqp=CAE', N'women')
INSERT [dbo].[Products] ([id], [name], [price], [stock], [category_id], [image], [category_type]) VALUES (27, N'Sneaker ', CAST(299000.00 AS Decimal(10, 2)), 2, 5, N'https://www.travelandleisure.com/thmb/_T5vmEP_W5Z45Zfn16h-FJsPdx0=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/tal-womens-sneakers-may-24-test-veja-womens-campo-low-top-heer-chaudri-10-1-d2c01974f1b94638b4b97913dee9af4a.jpeg', N'Women')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Shopping_Cart] ON 

INSERT [dbo].[Shopping_Cart] ([id], [user_id], [product_id], [quantity], [price], [statusCart]) VALUES (31, 2, 3, 1, CAST(100000.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Shopping_Cart] ([id], [user_id], [product_id], [quantity], [price], [statusCart]) VALUES (32, 2, 7, 1, CAST(100000.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Shopping_Cart] ([id], [user_id], [product_id], [quantity], [price], [statusCart]) VALUES (33, 2, 8, 1, CAST(100000.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Shopping_Cart] ([id], [user_id], [product_id], [quantity], [price], [statusCart]) VALUES (34, 2, 5, 1, CAST(100000.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Shopping_Cart] ([id], [user_id], [product_id], [quantity], [price], [statusCart]) VALUES (35, 2, 2, 1, CAST(100000.00 AS Decimal(10, 2)), 2)
SET IDENTITY_INSERT [dbo].[Shopping_Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [userName], [password], [name], [email], [phone], [dob], [address], [role]) VALUES (1, N'admin', N'admin', N'admin', N'admin@example.com', N'0123456789', CAST(N'2004-12-21' AS Date), N'Hanoi', N'admin')
INSERT [dbo].[Users] ([id], [userName], [password], [name], [email], [phone], [dob], [address], [role]) VALUES (2, N'user', N'1234', N'Le Trung Kien', N'user1@example.com', N'0355990013', CAST(N'2004-12-21' AS Date), N'Hanoi', N'user')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Categori__72E12F1BC4C642B6]    Script Date: 3/13/2025 1:52:17 AM ******/
ALTER TABLE [dbo].[Categories] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__66DCF95C3ECF7B30]    Script Date: 3/13/2025 1:52:17 AM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E61647490F94A]    Script Date: 3/13/2025 1:52:17 AM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ('pending') FOR [status]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ('men') FOR [category_type]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('customer') FOR [role]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Shopping_Cart]  WITH CHECK ADD  CONSTRAINT [FK__Shopping___produ__6477ECF3] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Shopping_Cart] CHECK CONSTRAINT [FK__Shopping___produ__6477ECF3]
GO
ALTER TABLE [dbo].[Shopping_Cart]  WITH CHECK ADD  CONSTRAINT [FK__Shopping___user___6383C8BA] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Shopping_Cart] CHECK CONSTRAINT [FK__Shopping___user___6383C8BA]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD CHECK  (([quantity]>(0)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([total_price]>=(0)))
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD CHECK  (([stock]>=(0)))
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [CK_Products_category_type] CHECK  (([category_type]='baby' OR [category_type]='women' OR [category_type]='men'))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_Products_category_type]
GO
ALTER TABLE [dbo].[Shopping_Cart]  WITH CHECK ADD  CONSTRAINT [CK__Shopping___price__628FA481] CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[Shopping_Cart] CHECK CONSTRAINT [CK__Shopping___price__628FA481]
GO
ALTER TABLE [dbo].[Shopping_Cart]  WITH CHECK ADD  CONSTRAINT [CK__Shopping___quant__619B8048] CHECK  (([quantity]>(0)))
GO
ALTER TABLE [dbo].[Shopping_Cart] CHECK CONSTRAINT [CK__Shopping___quant__619B8048]
GO
USE [master]
GO
ALTER DATABASE [FashionShop] SET  READ_WRITE 
GO
