USE [master]
GO
/****** Object:  Database [ShopOnline]    Script Date: 07/01/2019 21:30:28 ******/
CREATE DATABASE [ShopOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ShopOnline.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShopOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ShopOnline_log.ldf' , SIZE = 1344KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShopOnline] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopOnline] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShopOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopOnline] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopOnline] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopOnline] SET  MULTI_USER 
GO
ALTER DATABASE [ShopOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopOnline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopOnline] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ShopOnline]
GO
/****** Object:  Table [dbo].[About]    Script Date: 07/01/2019 21:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[About](
	[AboutID] [int] IDENTITY(1,1) NOT NULL,
	[AboutName] [nvarchar](50) NULL,
	[MetaTitle] [varchar](50) NULL,
	[Description] [nvarchar](250) NULL,
	[Detail] [ntext] NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF__About__CreateDat__3A81B327]  DEFAULT (getdate()),
	[CreateBy] [varchar](50) NOT NULL,
	[ModifiedDate] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF__About__Status__3B75D760]  DEFAULT ((1)),
 CONSTRAINT [PK__About__717FC95C3F96A226] PRIMARY KEY CLUSTERED 
(
	[AboutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 07/01/2019 21:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Content]    Script Date: 07/01/2019 21:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Content](
	[ContentID] [int] IDENTITY(1,1) NOT NULL,
	[ContentName] [nvarchar](50) NULL,
	[MetaTitle] [varchar](50) NULL,
	[Description] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[NewsID] [int] NOT NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF__Content__CreateD__3C69FB99]  DEFAULT (getdate()),
	[CreateBy] [varchar](50) NOT NULL,
	[ModifiedDate] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF__Content__Status__3D5E1FD2]  DEFAULT ((1)),
	[Tophot] [datetime] NULL,
	[Viewcount] [int] NULL CONSTRAINT [DF__Content__Viewcou__3E52440B]  DEFAULT ((0)),
	[Tags] [varchar](500) NULL,
 CONSTRAINT [PK__Content__2907A87EF16AF779] PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerAccount]    Script Date: 07/01/2019 21:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerAccount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[PassWord] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[GioiTinh] [varchar](50) NULL,
	[BirthDay] [datetime] NULL,
	[TelephoneNumber] [int] NOT NULL,
	[ConfirmPassWord] [varchar](50) NULL,
 CONSTRAINT [PK__TaiKhoan__A9D10535C589C2B8] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 07/01/2019 21:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[FeedbackName] [nvarchar](50) NULL,
	[Phone] [int] NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[CreateDate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_Feedback_Status]  DEFAULT ((1)),
	[Content] [nvarchar](500) NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 07/01/2019 21:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NOT NULL,
	[Link] [nvarchar](250) NOT NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
	[MenuTypeID] [int] NOT NULL,
 CONSTRAINT [PK__Menu__C99ED2501B089D25] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 07/01/2019 21:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[MenuTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MenuTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 07/01/2019 21:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[NewsName] [nvarchar](50) NULL,
	[MetaTitle] [varchar](50) NULL,
	[ParentNewsID] [int] NULL,
	[DisplayOrder] [int] NULL CONSTRAINT [DF__News__DisplayOrd__3F466844]  DEFAULT ((0)),
	[SeoTittle] [nvarchar](250) NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF__News__CreateDate__403A8C7D]  DEFAULT (getdate()),
	[CreateBy] [varchar](50) NOT NULL,
	[ModifiedDate] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF__News__Status__412EB0B6]  DEFAULT ((1)),
	[ShowOnHome] [bit] NULL CONSTRAINT [DF__News__ShowOnHome__4222D4EF]  DEFAULT ((0)),
 CONSTRAINT [PK__News__19093A2B3BEF4975] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 07/01/2019 21:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CreateDay] [datetime] NULL,
	[CustomerID] [int] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipPhone] [int] NULL,
	[ShipAdress] [nvarchar](50) NULL,
	[ShipEmail] [nvarchar](50) NULL,
	[status] [bit] NOT NULL CONSTRAINT [DF_Order_status]  DEFAULT ((1)),
 CONSTRAINT [PK__HoaDon__C3905BAFB591D587] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 07/01/2019 21:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[PriceWhenBuyAtTime] [float] NOT NULL,
	[Trangthaigiao] [bit] NULL CONSTRAINT [DF_OrderDetail_Trangthaigiao]  DEFAULT ((0)),
	[Trangthaithanhtoan] [bit] NULL CONSTRAINT [DF_OrderDetail_Trangthaithanhtoan]  DEFAULT ((0)),
	[Trangthaixuli] [bit] NULL CONSTRAINT [DF_OrderDetail_Trangthaixuli]  DEFAULT ((1)),
	[NgayGiao] [datetime] NULL CONSTRAINT [DF_OrderDetail_NgayGiao]  DEFAULT (getdate()),
	[Trangthaidanggiao] [bit] NULL CONSTRAINT [DF_OrderDetail_Trangthaidanggiao]  DEFAULT ((0)),
 CONSTRAINT [PK__OrderDet__08D097C1A0B82072] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permission]    Script Date: 07/01/2019 21:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[PermissionID] [int] IDENTITY(1,1) NOT NULL,
	[PermissionName] [nchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 07/01/2019 21:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[MetaTitle] [varchar](50) NULL,
	[Description] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NOT NULL,
	[MoreImages] [xml] NULL,
	[Price] [float] NOT NULL CONSTRAINT [DF__Product__Price__4316F928]  DEFAULT ((0)),
	[PromotionPrice] [float] NULL,
	[IncludeVAT] [bit] NULL,
	[Quantity] [int] NOT NULL CONSTRAINT [DF__Product__Quantit__440B1D61]  DEFAULT ((0)),
	[CategoryID] [int] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF__Product__CreateD__44FF419A]  DEFAULT (getdate()),
	[CreateBy] [varchar](50) NOT NULL,
	[ModifiedDate] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF__Product__Status__45F365D3]  DEFAULT ((1)),
	[Tophot] [datetime] NULL,
	[Viewcount] [int] NULL CONSTRAINT [DF__Product__Viewcou__46E78A0C]  DEFAULT ((0)),
	[hinhanh] [ntext] NULL,
 CONSTRAINT [PK__Product__B40CC6ED26F3869C] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 07/01/2019 21:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[MetaTitle] [varchar](50) NULL,
	[ParentCategoryID] [int] NULL,
	[DisplayOrder] [int] NULL CONSTRAINT [DF__ProductCa__Displ__47DBAE45]  DEFAULT ((0)),
	[SeoTittle] [nvarchar](250) NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF__ProductCa__Creat__48CFD27E]  DEFAULT (getdate()),
	[CreateBy] [varchar](50) NOT NULL,
	[ModifiedDate] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF__ProductCa__Statu__49C3F6B7]  DEFAULT ((1)),
	[ShowOnHome] [bit] NULL CONSTRAINT [DF__ProductCa__ShowO__4AB81AF0]  DEFAULT ((0)),
 CONSTRAINT [PK__ProductC__19093A2BE8649EF1] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 07/01/2019 21:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Slide](
	[SlideID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NOT NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF__Slide__CreateDat__4BAC3F29]  DEFAULT (getdate()),
	[CreateBy] [varchar](50) NOT NULL,
	[ModifiedDate] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK__Slide__3214EC2749112030] PRIMARY KEY CLUSTERED 
(
	[SlideID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 07/01/2019 21:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemConfig](
	[SystemID] [varchar](50) NULL,
	[SystemName] [nvarchar](50) NULL,
	[SystemType] [nvarchar](50) NULL,
	[Value] [nvarchar](50) NULL,
	[Status] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 07/01/2019 21:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[TagID] [int] IDENTITY(1,1) NOT NULL,
	[NameTag] [nvarchar](50) NULL,
 CONSTRAINT [PK__Tag__657CFA4C14A46F0D] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 07/01/2019 21:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAccount](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserAccount] [varchar](50) NOT NULL,
	[PassWord] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_UserAccount_Status]  DEFAULT ((1)),
	[PermissionID] [int] NOT NULL,
 CONSTRAINT [PK_UserAccount] PRIMARY KEY CLUSTERED 
(
	[UserAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[About] ON 

INSERT [dbo].[About] ([AboutID], [AboutName], [MetaTitle], [Description], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (102, N'Công ty bán đồ điện tử ABC', NULL, NULL, N'<p><img alt="" src="/Data/images/orderdetails.png" style="height:150px; width:150px" /></p>
', CAST(N'2018-09-21 12:27:52.050' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[About] ([AboutID], [AboutName], [MetaTitle], [Description], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (103, N'Báo điện tử abc.com', NULL, NULL, N'<p><img alt="" src="/Data/images/orderdetails.png" style="height:150px; width:150px" /></p>
', CAST(N'2018-09-21 12:28:33.237' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[About] ([AboutID], [AboutName], [MetaTitle], [Description], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (105, N'adf', NULL, NULL, NULL, CAST(N'2018-09-23 17:35:37.923' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[About] ([AboutID], [AboutName], [MetaTitle], [Description], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (106, N'adh', NULL, NULL, NULL, CAST(N'2018-09-23 17:35:51.713' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[About] ([AboutID], [AboutName], [MetaTitle], [Description], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (107, N'adgrn', NULL, NULL, NULL, CAST(N'2018-09-23 17:36:16.237' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[About] ([AboutID], [AboutName], [MetaTitle], [Description], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (108, N'bfrg', NULL, NULL, NULL, CAST(N'2018-10-29 21:12:33.417' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[About] ([AboutID], [AboutName], [MetaTitle], [Description], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (109, N'ab222', NULL, NULL, NULL, CAST(N'2018-10-30 19:12:11.513' AS DateTime), N'Admin', N'30/10/2018 19:12:23', N'Admin', NULL, NULL, 1)
INSERT [dbo].[About] ([AboutID], [AboutName], [MetaTitle], [Description], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (110, N'abc', NULL, NULL, NULL, CAST(N'2018-10-30 22:01:12.107' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[About] ([AboutID], [AboutName], [MetaTitle], [Description], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (111, N'abc''', NULL, NULL, NULL, CAST(N'2018-10-31 17:34:33.770' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[About] ([AboutID], [AboutName], [MetaTitle], [Description], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (112, N'abc', NULL, NULL, NULL, CAST(N'2018-10-31 17:34:35.103' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[About] OFF
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ContactID], [Content], [Status]) VALUES (3, N'<p><span style="font-size:22px"><span style="color:#ffffff"><strong><span style="background-color:#95a5a6">C&ocirc;ng Ty H&amp;H&amp;B</span></strong></span></span></p>

<p><span style="color:#ffffff"><span style="font-size:18px"><img alt="" src="/Data/images/Logo/Logo.png" style="height:150px; width:150px" /></span></span></p>

<p><span style="font-size:22px"><span style="color:#ffffff"><span style="background-color:#95a5a6">Chuy&ecirc;n b&aacute;n tivi, camera,flycam</span></span></span></p>

<p><span style="font-size:22px"><span style="color:#ffffff"><span style="background-color:#95a5a6">Số điện thoại:0123456788</span></span></span></p>

<p><span style="font-size:22px"><span style="color:#ffffff"><span style="background-color:#95a5a6">Địa chỉ:1 D2 B&igrave;nh Th&agrave;nh</span></span></span></p>
', 1)
INSERT [dbo].[Contact] ([ContactID], [Content], [Status]) VALUES (4, N'<p><strong>TRUNG T&Acirc;M THIẾT BỊ AN NINH H&amp;H&amp;B</strong></p>

<p><strong>(C&Ocirc;NG TY CỔ PHẦN THƯƠNG MẠI&nbsp;V&Agrave; DỊCH VỤ&nbsp;VIỆT NAM)</strong></p>

<p>&nbsp; &nbsp; Được th&agrave;nh lập từ ng&agrave;y 27 th&aacute;ng 5 năm 2013, đến nay Trung t&acirc;m Thiết bị An ninh <strong>H&amp;H&amp;B</strong>&nbsp;đang l&agrave; một lựa chọn tin cậy cho hơn 120 căn hộ, biệt thự, khoảng 60 văn ph&ograve;ng, c&ocirc;ng ty v&agrave; nhiều nh&agrave; xưởng cũng như c&aacute;c trường mầm non tr&ecirc;n địa b&agrave;n H&agrave; Nội v&agrave; một số tỉnh l&acirc;n cận. M3 đ&atilde; mang đến sự an t&acirc;m, an to&agrave;n cho c&aacute;c gia đ&igrave;nh với c&aacute;c hệ thống camera, b&aacute;o động. Tăng năng suất lao động, tiết kiệm thời gian cho c&aacute;c nh&agrave; quản l&yacute; với hệ thống chấm c&ocirc;ng, kiểm so&aacute;t v&agrave;o ra v&agrave; hệ thống camera gi&aacute;m s&aacute;t.</p>

<p>Website:<strong>hhb.com</strong></p>

<p>Một trong những website tin cậy trong việc cung cấp, tư vấn v&agrave; lắp đặt c&aacute;c sản phẩm an ninh, an to&agrave;n, tự động như: CAMERA QUAN S&Aacute;T, B&Aacute;O ĐỘNG CHỐNG TRỘM, CHU&Ocirc;NG CỬA C&Oacute; H&Igrave;NH, CHẤM C&Ocirc;NG, ĐIỆN TH&Ocirc;NG MINH.</p>

<p>Qua hơn 2 năm hoạt động với phương ch&acirc;m đem đến cho Qu&yacute; kh&aacute;ch những sản phẩm tốt, gi&aacute; cả ph&ugrave; hợp, dịch vụ bảo h&agrave;nh chu đ&aacute;o. Trung t&acirc;m Thiết bị An ninh M3 đ&atilde; nhận được rất nhiều sự tin tưởng của Kh&aacute;ch h&agrave;ng v&agrave; Đối t&aacute;c.</p>

<p>X&acirc;y dựng được đội ngũ nh&acirc;n vi&ecirc;n Nhiệt t&igrave;nh, Chu đ&aacute;o v&agrave; Chuy&ecirc;n nghiệp,&nbsp;website&nbsp;m3.com.vn trở th&agrave;nh m&ocirc;̣t&nbsp;địa chỉ uy t&iacute;n cho kh&aacute;ch h&agrave;ng v&agrave; những người quan t&acirc;m đến lĩnh vực sản phẩm an ninh, an to&agrave;n v&agrave; tự động.</p>

<p><strong>C&aacute;c sản phẩm ch&iacute;nh:</strong></p>

<p><em>1. Hệ thống camera quan s&aacute;t tại chỗ v&agrave; từ xa qua mạng.</em></p>

<p>- HIKVISION: Nh&agrave; sản xuất đầu ghi h&igrave;nh số 1 thế giới. Nh&agrave; sản xuất Camera quan s&aacute;t số 1 thế giới. Sản phẩm HIKVISION c&oacute; chất lượng cao, mẫu m&atilde; đẹp v&agrave; gi&aacute; cả cạnh tranh, ph&ugrave; hợp cho c&aacute;c dự &aacute;n vừa v&agrave; lớn. HIKVISION c&oacute; dải sản phẩm rất rộng, bao gồm h&agrave;ng trăm mẫu m&atilde; sản phẩm:&nbsp;Analog Camera -&nbsp;DVR,&nbsp;IP Camera -&nbsp;NVR,&nbsp;Mobile DVR, ATM DVR, Flatform.</p>

<p>Thời gian bảo h&agrave;nh đầu ghi h&igrave;nh, camera: 24 th&aacute;ng. Miễn ph&iacute; phần mềm quản l&yacute; tới 1024 camera.</p>

<p><em>2. Hệ thống b&aacute;o động, b&aacute;o trộm tự động bằng c&ograve;i, đ&egrave;n hoặc cảnh b&aacute;o tự động qua điện thoại cố định, đi động, nhắn tin, email (Hệ thống hữu tuyến hoặc v&ocirc; tuyến). Phần mềm gi&aacute;m s&aacute;t nhiều trung t&acirc;m b&aacute;o động.</em></p>

<p>+ Electronics Line 3000, Lightsys 2&nbsp;(ISRAEL): Nh&agrave; sản xuất b&aacute;o động kh&ocirc;ng d&acirc;y v&agrave; c&oacute; d&acirc;y h&agrave;ng đầu thế giới.</p>

<p>+ AOLIN (China): Sản phẩm c&oacute; chất lượng rất ổn định, gi&aacute; cả hợp l&yacute;.</p>

<p>+ HIKVISION (China): Tích hợp báo đ&ocirc;̣ng kèm giám sát hình ảnh.</p>

<p><em>3. Hệ thống chu&ocirc;ng cửa c&oacute; h&igrave;nh c&oacute; tiếng (video door phone), kh&oacute;a điện mở cửa tự động.</em></p>

<p>+ Competition (Taiwan): sản phẩm chất lượng tốt, mẫu m&atilde; phong ph&uacute;, gi&aacute; cả cạnh tranh.</p>

<p>+ Hyundai (Korea): Thương hiệu h&agrave;ng đầu H&agrave;n Quốc.</p>

<p><em>4. Hệ thống b&aacute;o ch&aacute;y v&agrave; chữa ch&aacute;y tự động.</em></p>

<p>+ Yun-Yang (Đ&agrave;i loan), sản phẩm chất lượng cao, gi&aacute; cả cạnh tranh, c&oacute; cả b&aacute;o ch&aacute;y Analog v&agrave; b&aacute;o ch&aacute;y địa chỉ.</p>

<p><em>5. Hệ thống kiểm so&aacute;t v&agrave;o ra, chấm c&ocirc;ng bằng thẻ từ, thẻ giấy, bằng m&atilde; số, nhận dạng bằng v&acirc;n tay.</em></p>

<p>+ Nh&agrave; ph&acirc;n phối tại Việt Nam hệ thống nh&acirc;̣n dạng v&acirc;n tay, thẻ th&ocirc;ng minh:&nbsp;Suprema (Korea), Soyal (Đ&agrave;i Loan).</p>

<p>-----------------------------------------------------------</p>

<p><strong>TRUNG T&Acirc;M THIẾT BỊ AN NINH H&amp;H&amp;B</strong><br />
<strong>C&Ocirc;NG TY CP&nbsp;TM V&Agrave; DV&nbsp;M3 VIỆT NAM</strong><br />
<br />
<strong>MST:&nbsp;</strong>0108166748&nbsp; -&nbsp;<strong>Tel</strong>: 0243.647.53.62<br />
<strong>Email</strong>:&nbsp;hoanghuy97nt@gmail.com<br />
<strong>Website</strong>:&nbsp;hhb.com<br />
<strong>Hotline</strong>: 0243.647.53.62</p>
', 1)
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([ContentID], [ContentName], [MetaTitle], [Description], [Image], [NewsID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [Tags]) VALUES (116, N'Tivi SamSung Mới Nhất', N'tivi-samsung-moi-nhat', N'Sản phẩm TV thương hiệu Coocaa được săn lùng mạnh mẽ trên sàn thương mại điện tử Lazada Indonesia sẽ xuất hiện tại Việt Nam từ 28/12 tới đây.', N'/Data/images/Tivi/images.jpg', 37, N'<p><strong>Sản phẩm TV thương hiệu Coocaa được săn l&ugrave;ng mạnh mẽ tr&ecirc;n s&agrave;n thương mại điện tử Lazada Indonesia sẽ xuất hiện tại Việt Nam từ 28/12 tới đ&acirc;y.</strong></p>

<p style="text-align:center"><strong><img alt="" src="/Data/images/Tivi/images.jpg" style="height:183px; width:275px" /></strong></p>

<p><span style="font-size:18px">3 năm trở về trước, v&agrave;o cuối 2015, một trong số c&aacute;c &ldquo;&ocirc;ng lớn&rdquo; của l&agrave;ng sản xuất TV tr&ecirc;n thế giới Skyworth đ&atilde; mua lại nh&agrave; m&aacute;y TV của Toshiba đặt tại Indonesia. Đ&acirc;y l&agrave; một bước đi quan trọng của Skyworth, đồng thời l&agrave; cột mốc khai sinh ra thương hiệu TV Coocaa v&agrave;o th&aacute;ng 8/2018 vừa qua. Kh&ocirc;ng chỉ thừa hưởng hệ thống m&aacute;y m&oacute;c, nh&acirc;n vi&ecirc;n v&agrave; quy tr&igrave;nh quản l&yacute; của Toshiba, c&aacute;c sản phẩm của Coocaa c&ograve;n mang cả tinh thần của thương hiệu TV sở hữu 23 năm chất lượng Nhật Bản n&agrave;y.</span></p>

<p><span style="font-size:18px">Sau khi nhanh ch&oacute;ng chạm mốc 6.000 sản phẩm b&aacute;n ra chỉ sau 1 ng&agrave;y mở b&aacute;n tr&ecirc;n Lazada, TV Coocaa tiếp tục được người ti&ecirc;u d&ugrave;ng Indonesia đ&oacute;n nhận khi dễ d&agrave;ng đạt vị tr&iacute; đầu ti&ecirc;n trong hạng mục Thiết bị gia đ&igrave;nh b&aacute;n chạy nhất dịp 11/11 vừa qua của Lazada Indonesia v&agrave; thứ 5 to&agrave;n Đ&ocirc;ng Nam &Aacute;. 28/12 tới đ&acirc;y, Coocaa sẽ ch&iacute;nh thức ra mắt thị trường Việt Nam d&ograve;ng sản phẩm TV S5C v&agrave; S5G mang tinh thần trẻ trung, hiện đại v&agrave; chất lượng ti&ecirc;u chuẩn to&agrave;n cầu.&nbsp;</span></p>

<p>&nbsp;</p>

<p><span style="font-size:18px"><img alt="" src="http://channel.mediacdn.vn/prupload/156/2018/12/img20181201104337300.jpg" /></span></p>

<p><span style="font-size:18px">40S5G sẽ c&oacute; mặt tại Việt Nam từ th&aacute;ng 12 tới, với ưu điểm kh&ocirc;ng chỉ nằm ở k&iacute;ch thước 40 inch với độ ph&acirc;n giải Full HD v&agrave; sử dụng tấm nền độ ph&acirc;n giải cao 4K m&agrave; c&ograve;n nằm ở cấu h&igrave;nh lớn với RAM 1,25 GB, bộ nhớ trong 8 GB, hỗ trở mở rộng qua bộ nhớ gắn ngo&agrave;i v&agrave; chạy hệ điều h&agrave;nh Android 8.0 mới nhất</span></p>

<p><span style="font-size:18px">Nỗ lực theo đuổi triết l&yacute; &ldquo;mang tới cuộc sống dễ d&agrave;ng v&agrave; trải nghiệm vui vẻ&rdquo;, Coocaa mới đ&acirc;y đ&atilde; t&aacute;i định vị lại thương hiệu, nhắm đến tập kh&aacute;ch h&agrave;ng mục ti&ecirc;u l&agrave; người trẻ năng động. Đồng thời, Coocaa ch&iacute;nh thức mở rộng thị trường ra c&aacute;c quốc gia kh&aacute;c trong khu vực v&agrave; Việt Nam l&agrave; một trong những điểm đến hấp dẫn kh&ocirc;ng thể bỏ qua của thương hiệu n&agrave;y.</span></p>

<p>&nbsp;</p>

<p><span style="font-size:18px"><img alt="Mua tivi Coocaa, mang chất lượng Nhật về nhà - Ảnh 1." src="http://channel.mediacdn.vn/thumb_w/640/prupload/156/2018/12/img20181201104337832.jpg" title="Mua tivi Coocaa, mang chất lượng Nhật về nhà - Ảnh 1." /></span></p>

<p><span style="font-size:18px">S5G được Coocaa tung ra với ba phi&ecirc;n bản: 40S5G, 50S5G v&agrave; 55S5G. Đ&acirc;y l&agrave; d&ograve;ng Android TV hiện đại với chất lượng h&igrave;nh ảnh v&agrave; &acirc;m thanh được ch&uacute; trọng. Một điểm đặc biệt kh&aacute;c m&agrave; S5G cũng sở hữu tương tự người anh em S5C của m&igrave;nh l&agrave; t&iacute;nh năng điều khiển bằng giọng n&oacute;i Voice Search. Cả ba đại diện của S5G đều d&ugrave;ng tấm nền độ ph&acirc;n giải cao 4K, mang đến hiệu quả tr&igrave;nh chiếu cực đỉnh. C&ocirc;ng nghệ &acirc;m thanh Dolby v&agrave; DTS Tru-surround cũng được trang bị tr&ecirc;n cả hai d&ograve;ng S5C v&agrave; S5G của Coocaa, đem đến cho người d&ugrave;ng trải nghiệm ch&acirc;n thực, s&ocirc;i động nhất.</span></p>

<p>&nbsp;</p>

<p><span style="font-size:18px"><img alt="Mua tivi Coocaa, mang chất lượng Nhật về nhà - Ảnh 2." src="http://channel.mediacdn.vn/thumb_w/640/prupload/156/2018/12/img20181201104338206.jpg" title="Mua tivi Coocaa, mang chất lượng Nhật về nhà - Ảnh 2." /></span></p>

<p><span style="font-size:18px">Coocaa lựa chọn &quot;ch&agrave;o s&acirc;n&quot; Việt Nam với sản phẩm 40S5G được m&ocirc; tả v&ocirc; c&ugrave;ng hấp dẫn &ldquo;Viền v&ocirc; h&igrave;nh - Đỉnh thiết kế&rdquo;. 40S5G được coi l&agrave; lựa chọn tối ưu nhất cả về gi&aacute; th&agrave;nh (khoảng 5.990.000 VNĐ trong đợt mở b&aacute;n tr&ecirc;n Lazada Việt Nam v&agrave;o 1/12 tới đ&acirc;y) v&agrave; thiết kế viền m&agrave;n h&igrave;nh si&ecirc;u mỏng Infinity View &ndash; chỉ c&oacute; duy nhất tr&ecirc;n sản phẩm n&agrave;y của d&ograve;ng S5G.</span></p>

<p>&nbsp;</p>

<p><span style="font-size:18px"><img alt="Mua tivi Coocaa, mang chất lượng Nhật về nhà - Ảnh 3." src="http://channel.mediacdn.vn/thumb_w/640/prupload/156/2018/12/img20181201104338621.jpg" title="Mua tivi Coocaa, mang chất lượng Nhật về nhà - Ảnh 3." /></span></p>

<p><span style="font-size:18px">50S5G với m&agrave;n h&igrave;nh lớn 50 inch được m&ocirc; tả th&uacute; vị &ldquo;Cấu h&igrave;nh khủng - Game ung dung&rdquo; nhờ v&agrave;o điểm mạnh l&agrave; sở hữu phần cứng Cortex A53 v&agrave; RAM 2,5 GB, bộ nhớ trong 15 GB, hỗ trở mở rộng qua bộ nhớ gắn ngo&agrave;i giống anh cả 55S5G</span></p>

<p><span style="font-size:18px">Ở ph&acirc;n kh&uacute;c dưới, d&ograve;ng sản phẩm TV th&ocirc;ng minh (smart TV) S5C cũng ấn tượng kh&ocirc;ng k&eacute;m với hai phi&ecirc;n bản 32 inch v&agrave; 40 inch độ ph&acirc;n giải Full HD. Tương tự người anh S5G, TV Coocaa S5C cũng sở hữu viền si&ecirc;u mỏng v&ocirc; cực Infinity View nhờ việc loại bỏ ba khung viền hai b&ecirc;n v&agrave; ph&iacute;a tr&ecirc;n, từ đ&oacute; mở rộng kh&ocirc;ng gian hiển thị l&ecirc;n tới 97%. Chất lượng h&igrave;nh ảnh trung thực v&agrave; &acirc;m thanh sống động nhờ v&agrave;o c&ocirc;ng nghệ Dolby v&agrave; DTS Tru-surround tiếp tục được Coocaa đầu tư cho S5C.</span></p>

<p>&nbsp;</p>

<p><span style="font-size:18px"><img alt="Mua tivi Coocaa, mang chất lượng Nhật về nhà - Ảnh 4." src="http://channel.mediacdn.vn/thumb_w/640/prupload/156/2018/12/img20181201104339080.jpg" title="Mua tivi Coocaa, mang chất lượng Nhật về nhà - Ảnh 4." /></span></p>

<p><span style="font-size:18px">32S5C l&agrave; đại diện của d&ograve;ng S5C sẽ đến tay người d&ugrave;ng Việt Nam v&agrave;o 28/12 tới đ&acirc;y với m&ocirc; tả &ldquo;Đen sang trọng - D&aacute;ng tinh tế&rdquo; đến từ đặc điểm tương tự 40S5G: C&ocirc;ng nghệ mở kho&aacute; khung viền cao cấp, mở rộng m&agrave;n h&igrave;nh tr&agrave;n viền l&ecirc;n tới 97% diện t&iacute;ch của to&agrave;n bộ mặt trước (updating)</span></p>

<p><span style="font-size:18px">Tuy nhi&ecirc;n, với gi&aacute; b&aacute;n thấp hơn, thay v&igrave; vận h&agrave;nh bởi hệ điều h&agrave;nh Android th&igrave; nh&agrave; sản xuất đ&atilde; ph&aacute;t triển nền tảng ri&ecirc;ng c&oacute; t&ecirc;n Coocaa Lite cho d&ograve;ng S5C. Nền tảng độc quyền n&agrave;y l&agrave; sự kết hợp của TV kỹ thuật số v&agrave; c&aacute;c t&iacute;nh năng th&ocirc;ng minh, gi&uacute;p thao t&aacute;c của người d&ugrave;ng trở n&ecirc;n đơn giản hơn. Coocaa Lite cũng c&oacute; thể kết nối Internet, sở hữu kho ứng dụng ri&ecirc;ng với h&agrave;ng ngh&igrave;n chương tr&igrave;nh để người sử dụng tải th&ecirc;m. Điểm cộng m&agrave; Coocaa Lite gi&uacute;p smart TV S5C ghi điểm đ&oacute; l&agrave; khả năng mang tới trải nghiệm mượt m&agrave;. V&iacute; dụ, sẽ chỉ mất một gi&acirc;y để ch&uacute;ng ta v&agrave;o Youtube bằng một ph&iacute;m bấm ri&ecirc;ng tr&ecirc;n điều khiển v&agrave; t&igrave;m kiếm một đoạn phim y&ecirc;u th&iacute;ch.</span></p>
', NULL, CAST(N'2018-12-08 15:25:27.400' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Content] ([ContentID], [ContentName], [MetaTitle], [Description], [Image], [NewsID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [Tags]) VALUES (117, N'Tivi Thông Minh Google Home', N'tivi-thong-minh-google-home', N'Skyworth ra mắt tivi AI dòng E6, thay thế loa thông minh Google Home', N'/Data/images/Tivi/download.jpg', 37, N'<h1><strong>Skyworth ra mắt tivi AI d&ograve;ng E6, thay thế loa th&ocirc;ng minh Google Home</strong></h1>

<p><img alt="Skyworth ra mắt tivi AI dòng E6, thay thế loa thông minh Google Home" src="https://genknews.genkcdn.vn/thumb_w/640/2018/2018-photo-2-1540802508370883877889-0-99-546-974-crop-1540802856688-636764266380780703.jpg" style="width:640px" title="Skyworth ra mắt tivi AI dòng E6, thay thế loa thông minh Google Home" /></p>

<h2>Bạn c&oacute; bao giờ nghĩ một chiếc Android TV lại c&oacute; thể thay thế được cả thiết bị loa th&ocirc;ng minh Google Home lại chỉ c&oacute; gi&aacute; trong tầm từ 5 - 6 triệu đồng? Tin vui l&agrave; điều n&agrave;y ho&agrave;n to&agrave;n khả thi với Google Android Tivi E6 được h&atilde;ng Skyworth giới thiệu trong thời gian vừa qua.</h2>

<p><img alt="Skyworth ra mắt tivi AI dòng E6, thay thế loa thông minh Google Home - Ảnh 1." id="img_792b4770-db56-11e8-92f9-01d4a90844f8" src="http://channel.mediacdn.vn/thumb_w/640/2018/10/29/photo-1-1540802507621287474713.jpg" title="Skyworth ra mắt tivi AI dòng E6, thay thế loa thông minh Google Home - Ảnh 1." /></p>

<p>Về l&yacute; thuyết những thiết bị Android t&iacute;ch hợp Google Assistant đều c&oacute; thể l&agrave;m được điều n&agrave;y. Tuy nhi&ecirc;n trải nghiệm tr&ecirc;n một thiết bị như tivi ho&agrave;n to&agrave;n kh&aacute;c biệt với một chiếc loa. Nếu bạn vẫn chưa r&otilde;, th&igrave; tất cả điều đ&oacute; đến từ một n&uacute;t bấm quyền lực.</p>

<p>Đ&oacute; ch&iacute;nh l&agrave; Voice Control, bấm v&agrave;o v&agrave; trực tiếp ra lệnh bằng giọng n&oacute;i. Nếu đ&atilde; từng sử dụng Google Assistant, v&agrave; nghĩ rằng thao t&aacute;c tr&ecirc;n tivi cũng giống như tr&ecirc;n Smartphone th&igrave; bạn bỏ lỡ rất nhiều thủ thuật hay ho. Bởi v&igrave; n&uacute;t bấm n&agrave;y sẽ cho ph&eacute;p bạn dễ d&agrave;ng tăng giảm &acirc;m lượng, chuyển k&ecirc;nh hay tua lại đoạn video đ&atilde; bị bỏ lỡ. Tất nhi&ecirc;n, khi đ&atilde; đề cập thay thế được Google Home, th&igrave; Skyworth E6 ho&agrave;n to&agrave;n điều khiển mọi thiết bị điện trong nh&agrave; m&agrave; kh&ocirc;ng cần mất thời gian di chuyển. Phải n&oacute;i th&ecirc;m, tr&ecirc;n nền tảng Google Assistant th&igrave; phần lớn c&acirc;u lệnh sẽ l&agrave; tiếng Anh, tuy nhi&ecirc;n theo như tuy&ecirc;n bố của Google tại I/O 2018 đến cuối năm nay bạn đ&atilde; c&oacute; thể trải nghiệm chức năng n&agrave;y ho&agrave;n to&agrave;n bằng tiếng Việt.</p>

<p><img alt="Skyworth ra mắt tivi AI dòng E6, thay thế loa thông minh Google Home - Ảnh 2." id="img_79983a10-db56-11e8-acef-23204cbb7578" src="http://channel.mediacdn.vn/thumb_w/640/2018/10/29/photo-1-15408025083691508754900.jpg" title="Skyworth ra mắt tivi AI dòng E6, thay thế loa thông minh Google Home - Ảnh 2." /></p>

<p>Đặc biệt,&nbsp;<a href="https://pico.vn/38644/tivi-led-skyworth-32e6--32android-tv.html" rel="nofollow" target="_blank" title="Skyworth E6">Skyworth E6</a>&nbsp;sở hữu thiết kế tr&agrave;n viền (No-bezel), gi&uacute;p hiển thị nhiều tối đa h&igrave;nh ảnh nếu so tr&ecirc;n một m&agrave;n h&igrave;nh kh&aacute;c c&oacute; c&ugrave;ng k&iacute;ch thước. Kh&ocirc;ng chỉ m&atilde;n nh&atilde;n với c&ocirc;ng nghệ xử l&yacute; h&igrave;nh ảnh th&ocirc;ng minh AI PQ Processor cho h&igrave;nh ảnh hiển thị chi tiết hơn, độ tương phản cao hơn m&agrave; E6 c&ograve;n khiến bạn thoả m&atilde;n cả phần nghe một c&aacute;ch ch&acirc;n thật nhất với hệ thống loa từ t&iacute;nh, c&ocirc;ng nghệ &acirc;m thanh v&ograve;m Dolby &amp; DTS TruSurround.</p>

<p><img alt="Skyworth ra mắt tivi AI dòng E6, thay thế loa thông minh Google Home - Ảnh 3." id="img_7997ebf0-db56-11e8-977b-2b24c5465bf1" src="http://channel.mediacdn.vn/thumb_w/640/2018/10/29/photo-2-1540802508370883877889.jpg" title="Skyworth ra mắt tivi AI dòng E6, thay thế loa thông minh Google Home - Ảnh 3." /></p>

<p>Sản phẩm hiện c&oacute; 3 k&iacute;ch thước l&agrave; 32/40/43 inch. Về cấu h&igrave;nh, AI TV E6 c&ograve;n được trang bị chip xử l&yacute; 4 nh&acirc;n Cortex A53 mạnh mẽ, RAM 1.5GB v&agrave; ROM 8GB. Điều n&agrave;y l&agrave;m cho hiệu suất vận h&agrave;nh của E6 mạnh hơn so với Android TV th&ocirc;ng thường kh&aacute;c. Ngo&agrave;i ra, với đồ họa GPU Mali 450 MP, 2 nh&acirc;n chuy&ecirc;n xử l&yacute; h&igrave;nh ảnh 3D, người d&ugrave;ng ho&agrave;n to&agrave;n thả ga chiến c&aacute;c game hot nhất hiện nay như Asphalt8, Beach Buggy hoặc Modern Combat 5.</p>

<p><img alt="Skyworth ra mắt tivi AI dòng E6, thay thế loa thông minh Google Home - Ảnh 4." id="img_7996b370-db56-11e8-81f3-e1e41244df0a" src="http://channel.mediacdn.vn/thumb_w/640/2018/10/29/photo-3-15408025083721406215628.jpg" title="Skyworth ra mắt tivi AI dòng E6, thay thế loa thông minh Google Home - Ảnh 4." /></p>

<p>Xuất xứ từ Hong Kong &ndash; l&agrave; 1 trong 5 thương hiệu Tivi nổi tiếng to&agrave;n cầu. Skyworth kh&ocirc;ng hề xa lạ với c&aacute;c sản phẩm c&oacute; mặt tại thị trường Việt Nam từ 2013. Với cấu h&igrave;nh vượt trội, song gi&aacute; cả chỉ nằm ở ph&acirc;n kh&uacute;c phổ th&ocirc;ng, chiếc E6 ho&agrave;n to&agrave;n xứng đ&aacute;ng l&agrave; chiếc AI TV đỉnh nhất hiện nay với gi&aacute; b&aacute;n trong tầm 5 triệu đồng. Ngo&agrave;i ra trong dịp n&agrave;y; khi mua sản phẩm, kh&aacute;ch h&agrave;ng c&ograve;n nhận th&ecirc;m ưu đ&atilde;i xem miễn ph&iacute; truyền h&igrave;nh đến 3 th&aacute;ng tr&ecirc;n ứng dụng trực tuyến Clip TV.</p>

<p>Quang Vũ</p>

<p>Tr&iacute; Thức Trẻ</p>
', NULL, CAST(N'2018-12-08 15:31:26.737' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Content] ([ContentID], [ContentName], [MetaTitle], [Description], [Image], [NewsID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [Tags]) VALUES (118, N'TV màn hình lớn trên 40 inch', N'tv-man-hinh-lon-tren-40-inch', N' Người tiêu dùng trên thế giới ngày càng ưa chuộng TV màn hình lớn, và Việt Nam cũng không nằm ngoài xu thế đó', N'/Data/images/Tivi/vtbs1lv3277-1519804965.jpg', 37, N'<h2>Người ti&ecirc;u d&ugrave;ng tr&ecirc;n thế giới ng&agrave;y c&agrave;ng ưa chuộng TV m&agrave;n h&igrave;nh lớn, v&agrave; Việt Nam cũng kh&ocirc;ng nằm ngo&agrave;i xu thế đ&oacute;.</h2>

<p>Tại v&agrave;i thị trường như Mỹ, Trung Quốc; con số n&agrave;y thậm ch&iacute; xấp xỉ 50 inch. Xu hướng n&agrave;y c&oacute; thể do ba yếu tố: mức sống trung b&igrave;nh tăng l&ecirc;n, chi ph&iacute; sản xuất tivi m&agrave;n h&igrave;nh lớn giảm theo thời gian v&agrave; người ti&ecirc;u d&ugrave;ng ng&agrave;y c&agrave;ng coi trọng trải nghiệm giải tr&iacute; tại gia.</p>

<p>Tại Việt Nam, dịp World Cup 2018 vừa qua cũng ghi nhận mức tăng đột biến về lượng TV m&agrave;n h&igrave;nh lớn được b&aacute;n ra. Tuy chưa c&oacute; nghi&ecirc;n cứu ch&iacute;nh thức về k&iacute;ch thước TV trung b&igrave;nh tại Việt Nam, nhưng số liệu thống k&ecirc; cho thấy b&aacute;n chạy nhất l&agrave; c&aacute;c mẫu TV từ 40 &ndash; 45 inch ở ph&acirc;n kh&uacute;c phổ th&ocirc;ng. Điều n&agrave;y cho thấy Việt Nam đang bắt kịp xu hướng ti&ecirc;u d&ugrave;ng của thế giới. C&aacute;c nh&agrave; sản xuất TV cũng li&ecirc;n tục tung ra những mẫu sản phẩm k&iacute;ch thước lớn với chất lượng ng&agrave;y một tăng l&ecirc;n.</p>

<p>Sharp &ndash; thương hiệu TV h&agrave;ng đầu Nhật Bản l&agrave; một trong những h&atilde;ng ti&ecirc;n phong trong việc cải tiến c&ocirc;ng nghệ TV nhằm đem đến h&igrave;nh ảnh ch&acirc;n thực tuyệt đối, cho bạn trải nghiệm sống động kh&oacute; tin tr&ecirc;n m&agrave;n h&igrave;nh rộng.</p>

<p><img alt="TV màn hình lớn trên 40 inch – Xu hướng của toàn thế giới - Ảnh 1." id="img_39e34240-bd6d-11e8-8b6d-db6bb5cbc884" src="http://channel.mediacdn.vn/thumb_w/640/2018/9/21/photo-1-1537513741953217348459.jpg" title="TV màn hình lớn trên 40 inch – Xu hướng của toàn thế giới - Ảnh 1." /></p>

<p>TV Full HD của Sharp sử dụng bộ xử l&yacute; 2K Master Engine cho chất lượng h&igrave;nh ảnh cao, độ n&eacute;t vượt trội. Điểm nổi trội nhất của TV Sharp l&agrave; khả năng hiển thị m&agrave;u sắc ho&agrave;n hảo nhờ t&iacute;nh năng Wide Color. Đ&acirc;y l&agrave; c&ocirc;ng nghệ gi&uacute;p t&aacute;i tạo dải m&agrave;u rộng hơn TV th&ocirc;ng thường, đặc biệt m&agrave;u đỏ v&agrave; xanh được hiển thị trung thực nhất, cho trải nghiệm sống động như thật khi thưởng thức c&aacute;c cảnh phim về thi&ecirc;n nhi&ecirc;n, con người.</p>

<p><img alt="TV màn hình lớn trên 40 inch – Xu hướng của toàn thế giới - Ảnh 2." id="img_3b2b2b90-bd6d-11e8-b512-91be94e55a12" src="http://channel.mediacdn.vn/thumb_w/640/2018/9/21/photo-1-15375137460771258547496.jpg" title="TV màn hình lớn trên 40 inch – Xu hướng của toàn thế giới - Ảnh 2." /></p>

<p>C&aacute;c mẫu TV của Sharp đều được tăng cường t&iacute;nh năng giải tr&iacute; với ứng dụng Easy Smart, Youtube, t&iacute;ch hợp Wifi, cho bạn c&oacute; th&ecirc;m nhiều lựa chọn hấp dẫn ngo&agrave;i c&aacute;c chương tr&igrave;nh được ph&aacute;t s&oacute;ng.</p>

<p><img alt="TV màn hình lớn trên 40 inch – Xu hướng của toàn thế giới - Ảnh 3." id="img_3b1ab0d0-bd6d-11e8-a9d4-e1563a0a15d8" src="http://channel.mediacdn.vn/thumb_w/640/2018/9/21/photo-2-15375137460802052326234.jpg" title="TV màn hình lớn trên 40 inch – Xu hướng của toàn thế giới - Ảnh 3." /></p>

<p>Ngo&agrave;i khả năng hiển thị v&agrave; tiện &iacute;ch giải tr&iacute;, TV Sharp c&ograve;n tiết kiệm điện vượt trội so với c&aacute;c sản phẩm kh&aacute;c, do đ&oacute; được người ti&ecirc;u d&ugrave;ng ưa chuộng v&agrave; ng&agrave;y c&agrave;ng chiếm lĩnh thị trường tại Việt Nam.</p>

<p>Xem th&ecirc;m chi tiết c&aacute;c sản phẩm TV Sharp tại:</p>

<p><a href="https://sharp.vn/vn/index.php/thiet-bi-nghe-nhin/tivi/tivi-full-hd/684/lc-40sa5500x-detail" rel="nofollow" target="_blank" title="https://sharp.vn/vn/index.php/thiet-bi-nghe-nhin/tivi/tivi-full-hd/684/lc-40sa5500x-detail">https://sharp.vn/vn/index.php/thiet-bi-nghe-nhin/tivi/tivi-full-hd/684/lc-40sa5500x-detail</a></p>

<p>Quang Vũ</p>

<p>Tr&iacute; Thức Trẻ</p>
', NULL, CAST(N'2018-12-08 15:34:56.103' AS DateTime), N'Admin', N'08/12/2018 15:58:41', NULL, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Content] ([ContentID], [ContentName], [MetaTitle], [Description], [Image], [NewsID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [Tags]) VALUES (119, N'Tivi SamSung Mới Nhất', N'tivi-samsung-moi-nhat', N'Tivi SamSung B12 đang là mẫu mới nhất và tốt nhất hiện nay', N'/Data/images/Tivi/tivi-lg-32lk5400bpta-14-550x340.jpg', 5, N'<h1>LG Việt Nam tr&igrave;nh l&agrave;ng d&ograve;ng TV OLED &quot;d&aacute;n tường&quot;, mỏng nhất thị trường, chỉ 2,75 mm, gi&aacute; đắt ngang xe &ocirc; t&ocirc;</h1>

<p>15-08-2017 - 16:03 PM&nbsp;|&nbsp;<a href="http://genk.vn/do-choi-so.chn" title="/do-choi-so.chn">Đồ chơi số</a></p>

<p><iframe frameborder="0" height="1000px" name="f2240cc320713a" scrolling="no" src="https://www.facebook.com/plugins/like.php?action=like&amp;app_id=180276625471433&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter%2Fr%2FLviKjJ9cymB.js%3Fversion%3D43%23cb%3Df2a24684954175c%26domain%3Dgenk.vn%26origin%3Dhttp%253A%252F%252Fgenk.vn%252Ff2f14021e1ab09%26relation%3Dparent.parent&amp;container_width=0&amp;href=http%3A%2F%2Fgenk.vn%2Flg-viet-nam-trinh-lang-dong-tv-oled-dan-tuong-mong-nhat-thi-truong-chi-275-mm-gia-dat-ngang-xe-o-to-20170815132242428.chn&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=false&amp;show_faces=false&amp;size=small" title="fb:like Facebook Social Plugin" width="1000px"></iframe></p>

<p><a href="http://www.facebook.com/sharer.php?u=http://genk.vn/lg-viet-nam-trinh-lang-dong-tv-oled-dan-tuong-mong-nhat-thi-truong-chi-275-mm-gia-dat-ngang-xe-o-to-20170815132242428.chn" id="newsidpop20170815132242428" rel="nofollow">Chia sẻ7</a></p>

<p><img alt="LG Việt Nam trình làng dòng TV OLED dán tường, mỏng nhất thị trường, chỉ 2,75 mm, giá đắt ngang xe ô tô" src="https://genknews.genkcdn.vn/thumb_w/640/2017/mg-9778-1502787575503-crop1502787648794p.jpg" style="width:640px" title="LG Việt Nam trình làng dòng TV OLED dán tường, mỏng nhất thị trường, chỉ 2,75 mm, giá đắt ngang xe ô tô" /></p>

<h2>LG OLED signature W sẽ c&oacute; 2 tuỳ chọn k&iacute;ch thước l&agrave; 65 v&agrave; 77 inch. Đồng thời n&oacute; được trang bị những c&ocirc;ng nghệ v&agrave; chuẩn h&igrave;nh ảnh ti&ecirc;n tiến nhất như Multiple HDR (HDR10, HLG, Advenced HDR, HDR effect), ULTRA Luminance, Dolby Vision, Hybrid Log Gamma.</h2>

<p>H&ocirc;m nay, ng&agrave;y 15/8/2017,&nbsp;<a href="http://genk.vn/lg-electronics-viet-nam.html" target="_blank" title="LG Electronics Việt Nam">LG Electronics Việt Nam</a>&nbsp;ch&iacute;nh thức giới thiệu đến thị trường Việt Nam d&ograve;ng&nbsp;<a href="http://genk.vn/tv.html" target="_blank" title="TV">TV</a>&nbsp;OLED Signature W. Được biết, đ&acirc;y cũng l&agrave; chiếc TV mỏng nhất thị trường Việt Nam với độ mỏng chỉ 2,75 mm. Tổ chức kỉ lục Việt Nam cũng đ&atilde; cấp chứng nhận x&aacute;c lập cho kỉ lục n&agrave;y.</p>

<p><img alt="" id="img_144de1f0-8198-11e7-80ff-d718efb9a18f" src="http://genknews.genkcdn.vn/2017/mg-9778-1502787575503.jpg" /></p>

<p><img alt="" id="img_9a2dcda0-8196-11e7-a0dc-2d6011d03125" src="http://genknews.genkcdn.vn/2017/mg-9758-1502786919823.jpg" /></p>

<p>Thế hệ TV OLED Signature W được thiết kế si&ecirc;u mỏng nhờ loại bỏ ho&agrave;n to&agrave;n phần miền m&agrave;n h&igrave;nh v&agrave; dễ d&agrave;ng d&aacute;n l&ecirc;n tường. Từ đ&oacute; n&oacute; hứa hẹn sẽ mang đến cho người d&ugrave;ng trải nghiệm ho&agrave;n hảo, ch&acirc;n thực v&agrave; kh&aacute;c biệt so với TV th&ocirc;ng thường.</p>

<p><img alt="" id="img_1503eb80-8198-11e7-80ff-d718efb9a18f" src="http://genknews.genkcdn.vn/2017/mg-9829-1502787575505.jpg" /></p>

<p><img alt="" id="img_9bc66f00-8196-11e7-a3c1-5960577a97c8" src="http://genknews.genkcdn.vn/2017/mg-9766-1502786919836.jpg" /></p>

<p>LG OLED signature W sẽ c&oacute; 2 tuỳ chọn k&iacute;ch thước l&agrave; 65 v&agrave; 77 inch. Đồng thời n&oacute; được trang bị những c&ocirc;ng nghệ v&agrave; chuẩn h&igrave;nh ảnh ti&ecirc;n tiến nhất như Multiple HDR (HDR10, HLG, Advenced HDR, HDR effect), ULTRA Luminance, Dolby Vision, Hybrid Log Gamma. B&ecirc;n cạnh đ&oacute;, n&oacute; cũng l&agrave; chiếc TV đầu ti&ecirc;n tr&ecirc;n thế giới trang bị c&ocirc;ng nghệ &acirc;m thanh v&ograve;m Dolby Atmos. Ch&iacute;nh sự kết hợp giữa những chuẩn về h&igrave;nh ảnh v&agrave; &acirc;m thanh ti&ecirc;n tiến n&agrave;y sẽ c&oacute; thể biến ph&ograve;ng kh&aacute;c của người d&ugrave;ng trở n&ecirc;n sống động như l&agrave; rạp phim di động.</p>

<p><img alt="" id="img_9b101750-8196-11e7-a0dc-2d6011d03125" src="http://genknews.genkcdn.vn/2017/mg-9763-1502786919829.jpg" /></p>

<p>Ngo&agrave;i ra, LG OLED Signature W c&ograve;n được n&acirc;ng cấp l&ecirc;n hệ điều h&agrave;nh webOS 3.5, hỗ trợ nội dung Gear VR 360 độ v&agrave; nhiều ứng dụng 4K kh&aacute;c.</p>

<p><img alt="" id="img_97e3b690-8196-11e7-a0dc-2d6011d03125" src="http://genknews.genkcdn.vn/2017/20170815-150658-1502786919849.jpg" /></p>

<p><strong>Cuối c&ugrave;ng , TV LG OLED Siganture W sẽ được b&aacute;n ra tại tất cả trung t&acirc;m điện m&aacute;y lớn tr&ecirc;n cả nước trong thời gian tới đ&acirc;y. Đồng thời, gi&aacute; b&aacute;n lần lượt d&agrave;nh cho 2 phi&ecirc;n bản 65 inch v&agrave; 77 inch lần lượt sẽ l&agrave; 300.000.000 đồng v&agrave; 650.000.000 đồng.</strong></p>

<p><img alt="" id="img_963c6f30-8196-11e7-a0dc-2d6011d03125" src="http://genknews.genkcdn.vn/2017/20170815-150337-1502786919842.jpg" /></p>

<p>Đặc biệt hơn, trong thời gian từ ng&agrave;y 8/8 đến 8/9, kh&aacute;ch h&agrave;ng đặt trước sẽ nhận ngay qu&agrave; tặng đặc biệt l&agrave; m&aacute;y giặt cao cấp LG trị gi&aacute; 26,5 triệu đồng.</p>

<p><img alt="" id="img_96b1c640-8196-11e7-a0dc-2d6011d03125" src="http://genknews.genkcdn.vn/2017/20170815-150415-1502786919844.jpg" /></p>

<p><img alt="" id="img_98575ff0-8196-11e7-a0dc-2d6011d03125" src="http://genknews.genkcdn.vn/2017/20170815-154130-1502786919855.jpg" /></p>

<p><img alt="" id="img_14b640b0-8198-11e7-a3c1-5960577a97c8" src="http://genknews.genkcdn.vn/2017/mg-9784-1502787575504.jpg" /></p>

<p><img alt="" id="img_97723010-8196-11e7-a0dc-2d6011d03125" src="http://genknews.genkcdn.vn/2017/20170815-150645-1502786919847.jpg" /></p>

<p><img alt="" id="img_9707fc90-8196-11e7-a0dc-2d6011d03125" src="http://genknews.genkcdn.vn/2017/20170815-150623-1502786919846.jpg" /></p>

<p><img alt="" id="img_95a697d0-8196-11e7-a0dc-2d6011d03125" src="http://genknews.genkcdn.vn/2017/20170815-150309-1502786919839.jpg" /></p>

<p>Tuấn L&ecirc;</p>

<p>Tr&iacute; Thức Trẻ</p>
', NULL, CAST(N'2018-12-08 20:43:59.427' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Content] ([ContentID], [ContentName], [MetaTitle], [Description], [Image], [NewsID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [Tags]) VALUES (120, N'    Camera quan sát thế hệ mới mới - Starlight', N'----camera-quan-sat-the-he-moi-moi---starlight', N'Sẽ rất có ích khi bạn có thể tin tưởng vào hình ảnh thích hợp rõ nét trong mọi điều kiện ánh sáng, phải không? ', N'/Data/images/Camera%20hanh%20trinh%20va%20flycam/eken-h5s-plus-1-300x300.png', 36, N'<h2 style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif"><strong>&nbsp;<a href="http://bienbachn.com/" style="-webkit-font-smoothing:antialiased; -webkit-tap-highlight-color:transparent; margin:0px; padding:0px; border:0px; outline:0px; color:#ea2349; text-decoration:none; cursor:pointer; box-sizing:border-box" target="_blank">Camera quan s&aacute;t</a>&nbsp;thế hệ mới mới - Starlight</strong></span></span></span></span></h2>

<p style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;Sẽ rất c&oacute; &iacute;ch khi bạn c&oacute; thể tin tưởng v&agrave;o h&igrave;nh ảnh th&iacute;ch hợp r&otilde; n&eacute;t trong mọi điều kiện &aacute;nh s&aacute;ng, phải kh&ocirc;ng? Với d&ograve;ng sản phẩm camera starlight, mang đến một chuẩn mực chất lượng mới về gi&aacute;m s&aacute;t h&igrave;nh ảnh li&ecirc;n tục.</span></span></span></span></span></p>

<h3 style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif"><em><strong>&nbsp;&nbsp;&nbsp;&nbsp;C&ocirc;ng nghệ camera quan s&aacute;t Starlight 1</strong></em></span></span></span></span></h3>

<p style="margin-left:0cm; margin-right:0cm; text-align:start">&nbsp;</p>

<p style="margin-left:0cm; margin-right:0cm; text-align:center"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif"><img src="http://bienbachn.com/image/Tin%20tuc/lap-dat-camera/camera-quan-sat-cong-nghe-starlight.jpg" style="-webkit-font-smoothing:antialiased; -webkit-tap-highlight-color:transparent; border:0px; box-sizing:border-box; height:auto !important; margin:0px; max-width:100%; outline:0px; padding:0px" /></span></span></span></span></span></p>

<p style="margin-left:0cm; margin-right:0cm; text-align:center"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif"><em>Camera quan s&aacute;t c&ocirc;ng nghệ Starlight, nh&igrave;n đ&ecirc;m kh&ocirc;ng cần hồng ngoại vẫn c&oacute; m&agrave;u.</em></span></span></span></span></span></p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start">&nbsp;</p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start">&nbsp;</p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;Bất kể điều kiện &aacute;nh s&aacute;ng, thời gian trong ng&agrave;y hoặc đối tượng chuyển động, camera starlight cung cấp h&igrave;nh ảnh IP th&iacute;ch hợp suốt 24/7. C&aacute;c camera n&agrave;y tạo ra h&igrave;nh ảnh m&agrave;u ho&agrave;n chỉnh ngay trong b&oacute;ng tối, vượt qua cả những nơi m&agrave; c&aacute;c camera kh&aacute;c phải chuyển sang h&igrave;nh ảnh đơn sắc. Ở những nơi c&aacute;c camera kh&aacute;c kh&ocirc;ng ghi được h&igrave;nh ảnh n&agrave;o th&igrave; camera starlight vẫn c&oacute; thể cung cấp c&aacute;c h&igrave;nh ảnh đơn sắc chi tiết.</span></span></span></span></span></p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start">&nbsp;</p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start">&nbsp;</p>

<h3 style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif"><strong><em>C&ocirc;ng nghệ camera quan s&aacute;t Starlight 2</em></strong></span></span></span></span></h3>

<p style="margin-left:0cm; margin-right:0cm; text-align:start">&nbsp;</p>

<p style="margin-left:0cm; margin-right:0cm; text-align:center"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><img src="http://bienbachn.com/image/Tin%20tuc/lap-dat-camera/starlight-camera-quan-sat-ngay-dem.jpg" style="-webkit-font-smoothing:antialiased; -webkit-tap-highlight-color:transparent; border:0px; box-sizing:border-box; height:auto !important; margin:0px; max-width:100%; outline:0px; padding:0px" /></span></span></span></p>

<p style="margin-left:0cm; margin-right:0cm; text-align:center"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:17.3333px"><span style="font-family:Arial,sans-serif"><em>Camera Starlight - quan s&aacute;t cả ban ng&agrave;y v&agrave; ban đ&ecirc;m</em></span></span></span></span></span></p>

<p style="margin-left:0cm; margin-right:0cm; text-align:center">&nbsp;</p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;Camera hoạt động tối ưu 24/7 bằng c&aacute;c th&ocirc;ng số kỹ thuật đầy ấn tượng. Với d&ograve;ng sản phẩm starlight, mục ti&ecirc;u của ch&uacute;ng t&ocirc;i l&agrave; gi&uacute;p bạn nh&igrave;n thấy r&otilde; r&agrave;ng ngay trong b&oacute;ng tối.</span></span></span></span></span></p>

<h2 style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif"><strong>&nbsp;&nbsp;&nbsp;&nbsp;Th&ocirc;ng số kỹ thuật cơ bản camera quan s&aacute;t Starlight</strong></span></span></span></span></h2>

<p style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Cảm biến ảnh 1/2&quot; Sensor CMOS</span></span></span></span></span></p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Độ ph&acirc;n giải HD 1.0 Megapixel.</span></span></span></span></span></p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Độ nhạy s&aacute;ng 0.01Lux color.</span></span></span></span></span></p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Ống k&iacute;nh Auto Iris</span></span></span></span></span></p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Nh&igrave;n đ&ecirc;m kh&ocirc;ng cần hồng ngoại với điều kiện c&oacute; ch&uacute;t &aacute;nh s&aacute;ng yếu vẫn c&oacute; m&agrave;u.</span></span></span></span></span></p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Chức năng AGC, BLC...</span></span></span></span></span></p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Chuy&ecirc;n dụng lắp ngo&agrave;i trời</span></span></span></span></span></p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;Một loạt t&iacute;nh năng của d&ograve;ng camera Starlight l&agrave; một giải ph&aacute;p linh hoạt v&agrave; tương lai sẽ chứng minh hiệu quả chi ph&iacute; trong điều kiện &aacute;nh s&aacute;ng thấp k&eacute;m. Hiện nay đ&atilde; c&oacute; 1 số thương hiệu camera quan s&aacute;t c&oacute; uy t&iacute;n đ&atilde; cung cấp d&ograve;ng sản phẩm camera Starlight như&nbsp; Sambo, Vantech, KBVISION, Hikvision, Bosch, Dahua, Benco, Keeper, Shany,&hellip;</span></span></span></span></span></p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start">&nbsp;</p>

<p style="margin-left:0cm; margin-right:0cm; text-align:center"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif"><img src="http://bienbachn.com/image/San-pham/Sambo/camera-sambo.jpg" style="-webkit-font-smoothing:antialiased; -webkit-tap-highlight-color:transparent; border:0px; box-sizing:border-box; height:auto !important; margin:0px; max-width:100%; outline:0px; padding:0px" /></span></span></span></span></span></p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start">&nbsp;</p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start">&nbsp;</p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif"><em>&gt;&gt; H&atilde;y theo d&otilde;i ch&uacute;ng t&ocirc;i để lu&ocirc;n nhận được những bản tin, chương tr&igrave;nh khuyến mại mới nhất được cập theo theo từng giờ</em></span></span></span></span></span></p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif"><em>Fanpage ch&iacute;nh thức c&ocirc;ng ty:&nbsp;&nbsp;</em><a href="https://www.facebook.com/bienbachn" style="-webkit-font-smoothing:antialiased; -webkit-tap-highlight-color:transparent; margin:0px; padding:0px; border:0px; outline:0px; color:#ea2349; text-decoration:none; cursor:pointer; box-sizing:border-box" target="_blank">https://www.facebook.com/bienbachn</a></span></span></span></span></span></p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start">&nbsp;</p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif">Mọi th&ocirc;ng tin xin li&ecirc;n hệ với ch&uacute;ng t&ocirc;i theo:</span></span></span></span></span></p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif">C&Ocirc;NG TY CỔ PHẦN C&Ocirc;NG NGHỆ V&Agrave; X&Acirc;Y LẮP BIỂN BẠC</span></span></span></span></span></p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif">- Điện thoại: 024 3791 7414</span></span></span></span></span></p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif">- Hỗ trợ mua h&agrave;ng: 091 208 23 80</span></span></span></span></span></p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif">- Hỗ trợ mua h&agrave;ng: 094 1900 288</span></span></span></span></span></p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif">- Hỗ trợ tư vấn kỹ thuật, bảo h&agrave;nh: 0942 965 270</span></span></span></span></span></p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif">- Email: info@bienbachn.com</span></span></span></span></span></p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif">- Website: http://bienbachn.com</span></span></span></span></span></p>

<p style="margin-left:0px; margin-right:0px; text-align:start">&nbsp;</p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif">C&ocirc;ng ty&nbsp;</span></span><a href="http://bienbachn.com/lap-dat-camera-chong-trom-ha-noi.html" style="-webkit-font-smoothing:antialiased; -webkit-tap-highlight-color:transparent; margin:0px; padding:0px; border:0px; outline:0px; color:#ea2349; text-decoration:none; cursor:pointer; box-sizing:border-box" target="_blank">camera chống trộm</a>&nbsp;<span style="font-size:13pt"><span style="font-family:Arial,sans-serif">uy t&iacute;n, chuy&ecirc;n nghiệp</span></span></span></span></span></p>

<p style="margin-left:0cm; margin-right:0cm; text-align:start"><span style="font-size:13px"><span style="color:#333745"><span style="font-family:Roboto"><span style="font-size:13pt"><span style="font-family:Arial,sans-serif"><em>Tham khảo th&ecirc;m:&nbsp;<br />
<a href="http://bienbachn.com/camera-gia-re-tai-ha-noi" style="-webkit-font-smoothing:antialiased; -webkit-tap-highlight-color:transparent; margin:0px; padding:0px; border:0px; outline:0px; color:#ea2349; text-decoration:none; cursor:pointer; box-sizing:border-box" target="_blank">Lắp đặt camera gi&aacute; rẻ</a></em></span></span></span></span></span></p>
', NULL, CAST(N'2018-12-08 20:45:38.337' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Content] ([ContentID], [ContentName], [MetaTitle], [Description], [Image], [NewsID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [Tags]) VALUES (121, N'Hệ thống cảnh báo chống trộm nào tốt nhất?', N'he-thong-canh-bao-chong-trom-nao-tot-nhat', N'Một hệ thống chống trộm tốt nhất sẽ mang đến cho ngôi nhà ở của bạn sự an toàn tuyệt đối. ', N'/Data/images/Chuong%20cua%20co%20hinh/chuong-cua-panasonic_s727.jpg', 13, N'<p>Tr&ecirc;n đ&acirc;y l&agrave; một số thiết bị chống trộm m&agrave; TIS cung cấp khi bạn c&oacute; nhu cầu lắp đặt hệ thống chống trộm của TIS.</p>

<blockquote>
<p><strong>Xem th&ecirc;m:</strong></p>

<ul>
	<li><strong><a href="https://tissmarthome.com.vn/thiet-bi-bao-trom-thong-minh/" rel="noopener" target="_blank">Thiết bị b&aacute;o trộm th&ocirc;ng minh cho gia đ&igrave;nh</a></strong></li>
	<li><a href="https://tissmarthome.com.vn/khoa-cua-thong-minh/" rel="noopener" target="_blank"><strong>Kh&oacute;a của th&ocirc;ng minh si&ecirc;u phẩm chống trộm cho nh&agrave; bạn</strong></a></li>
</ul>
</blockquote>

<p><img alt="hệ thống chống trộm tốt nhất" src="https://tissmarthome.com.vn/wp-content/uploads/2018/05/he-thong-chong-trom-tot-nhat-2.jpg" style="height:352px; width:600px" /></p>

<p>Một số bộ phận trong hệ thống chống trộm</p>

<h3><strong>Hệ thống chống trộm kh&ocirc;ng d&acirc;y điều khiển như thế n&agrave;o?</strong></h3>

<p>Thật sự m&agrave; n&oacute;i, c&aacute;c thiết bị c&oacute; trong hệ thống sử dụng c&ocirc;ng nghệ phức tạp hiện đại. Tuy nhi&ecirc;n việc điều khiển hệ thống chống trộm kh&ocirc;ng d&acirc;y th&igrave; ho&agrave;n to&agrave;n ngươc lại.</p>

<p><strong>C&oacute; 2 c&aacute;ch điều khiển th&ocirc;ng dụng nhất.</strong></p>

<h4>C&aacute;ch 1: điều khiển hệ thống chống trộm qua điện thoại th&ocirc;ng minh.</h4>

<p>Chiếc điện thoại th&ocirc;ng minh l&agrave; c&ocirc;ng cụ kh&ocirc;ng thể thiếu trong điều khiển nh&agrave; th&ocirc;ng minh n&oacute;i chung v&agrave; hệ thống b&aacute;o trộm kh&ocirc;ng d&acirc;y n&oacute;i ri&ecirc;ng.</p>

<p>Điện thoại th&ocirc;ng minh đ&oacute;ng vai tr&ograve;: nhận cảnh b&aacute;o từ hệ thống, k&iacute;ch hoạt/tắt hệ thống chống trộm từ xa, quan s&aacute;t gi&aacute;m s&aacute;t từ xa ng&ocirc;i nh&agrave;.</p>

<p><img alt="hệ thống chống trộm tốt nhất" src="https://tissmarthome.com.vn/wp-content/uploads/2018/05/he-thong-chong-trom-tot-nhat-3.jpg" style="height:352px; width:600px" /></p>

<p>C&oacute; thể k&iacute;ch hoạt hệ thống v&agrave; gi&aacute;m s&aacute;t qua smartphone</p>

<h4>C&aacute;ch 2: điều khiển tự động qua cảm biến hồng ngoại.</h4>

<p>Chuy&ecirc;n vi&ecirc;n kỹ thuật của TIS sẽ cấu h&igrave;nh cảm biến chống trộm k&iacute;ch hoạt v&agrave; mở theo giờ. Cứ đ&uacute;ng giờ hệ thống cảnh b&aacute;o sẽ được k&iacute;ch hoạt, v&agrave; sẽ tự tắt khi đến giờ c&agrave;i đặt chế độ off.</p>

<p>Trong c&aacute;ch n&agrave;y sẽ c&oacute; một số nhược điểm như: những l&uacute;c bạn hay người th&acirc;n n&agrave;o về nh&agrave; đột xuất trong giờ n&agrave;y, hệ thống sẽ b&aacute;o động như thể bạn l&agrave; trộm ấy.</p>

<p>Tuy nhi&ecirc;n bạn c&oacute; thể tắt b&aacute;o động qua c&ocirc;ng tắc hoặc điện thoại th&ocirc;ng minh.</p>

<h3><strong>Thị trường c&oacute; 2 loại hệ thống cảnh b&aacute;o chống trộm?</strong></h3>

<p>T&ocirc;i ph&acirc;n ra 2 loại n&agrave;y chủ yếu dựa v&agrave;o chất lượng, gi&aacute; cả của thiết bị, thương hiệu của h&atilde;ng.</p>

<h4>Loại 1: Thiết bị chống trộm gi&aacute; rẻ</h4>

<p>Đối với hệ thống n&agrave;y, đơn vị b&aacute;n cung cấp c&aacute;c thiết bị c&oacute; chất lượng b&igrave;nh thường, độ bền thiết bị chưa cao v&agrave; hoạt động c&ograve;n chập chờn, thương hiệu chưa được ưa chuộng. Nhưng gi&aacute; th&agrave;nh rẻ so với c&aacute;c sản phẩm kh&aacute;c.</p>

<p>Tiền n&agrave;o của đ&oacute; th&ocirc;i bạn, với gi&aacute; th&agrave;nh rẻ bạn cũng kh&oacute; đ&ograve;i hỏi được sản phẩm phải chất lượng v&agrave; cao cấp được.</p>

<h4>Loại 2: Thiết bị chống trộm cao cấp</h4>

<p>Đ&acirc;y l&agrave; những thiết bị c&oacute; gi&aacute; th&agrave;nh cao, do c&aacute;c c&ocirc;ng ty chuy&ecirc;n sản xuất thiết bị an ninh chống trộm uy t&iacute;n, c&oacute; thương hiệu trong ng&agrave;nh sản xuất. Chuy&ecirc;n cung cấp thiết bị cho c&aacute;c h&atilde;ng smart home, c&aacute;c nh&agrave; ph&acirc;n phối chuy&ecirc;n về cung cấp giải ph&aacute;p chống trộm cho nh&agrave; ở.</p>

<p>Khi bạn lắp đặt hệ thống gồm c&aacute;c thiết bị cao cấp, bạn được tư vấn cặn kẽ về giải ph&aacute;p, phương &aacute;n thi c&ocirc;ng lắp đặt ph&ugrave; hợp với hiện trạng ng&ocirc;i nh&agrave;.</p>

<p>Sau khi lắp đặt xong, bạn được test v&agrave; trải nghiệm hệ thống chống trộm, khi hệ thống hoạt động ổn định th&igrave; được b&agrave;n giao đưa v&agrave;o sử dụng.</p>

<p>Đ&acirc;y l&agrave; quy tr&igrave;nh lắp đặt rất b&agrave;i bản của c&aacute;c c&ocirc;ng ty uy t&iacute;n, gi&uacute;p kh&aacute;ch h&agrave;ng y&ecirc;n t&acirc;m trong qu&aacute; tr&igrave;nh sử dụng.</p>

<p><img alt="hệ thống chống trộm tốt nhất" src="https://tissmarthome.com.vn/wp-content/uploads/2018/05/he-thong-chong-trom-tot-nhat-4.jpg" style="height:352px; width:600px" /></p>

<p>Quy tr&igrave;nh lắp đặt của một c&ocirc;ng ty uy t&iacute;n</p>

<h3><strong>C&aacute;ch chọn h&atilde;ng lắp đặt hệ thống chống trộm tốt nhất?</strong></h3>

<p>L&agrave;m sao để chọn được h&atilde;ng lắp đặt tốt nhất?, một c&acirc;u hỏi kh&oacute; nhưng cần thiết.</p>

<p>C&acirc;u hỏi bạn n&ecirc;n đặt ra đầu ti&ecirc;n trước khi chọn nh&agrave; cung cấp l&agrave;: hệ thống n&agrave;o ph&ugrave; hợp với nhu cầu sử dụng của m&igrave;nh?</p>

<ul>
	<li><em>Giờ m&igrave;nh cần lắp đặt những hệ thống g&igrave;, lắp đặt khu vực n&agrave;o?</em></li>
	<li><em>Chi ph&iacute; m&igrave;nh c&oacute; thể trả cho hệ thống n&agrave;y khoảng bao nhi&ecirc;u?(c&oacute; thể ch&ecirc;nh lệch bao nhi&ecirc;u %?)</em></li>
	<li><em>Hệ thống m&igrave;nh lắp đặt phải hoạt động tốt, ổn định.</em></li>
</ul>

<p><strong>Bạn cũng c&oacute; thể tham khảo th&ecirc;m 1 số c&acirc;u hỏi b&ecirc;n dưới:</strong></p>

<ul>
	<li><em>Thương hiệu h&atilde;ng cung cấp như thế n&agrave;o?, t&ocirc;i c&oacute; viết 1 b&agrave;i viết về&nbsp;<a href="https://tissmarthome.com.vn/6-hang-nha-thong-minh-tot-nhat-tren-thi-truong-viet-nam-hien-nay/" rel="noopener" target="_blank">6 h&atilde;ng nh&agrave; th&ocirc;ng minh tốt nhất</a>Việt Nam hiện nay bạn tham khảo nh&eacute;.</em></li>
	<li><em>Sản phẩm của c&ocirc;ng ty đ&oacute; c&oacute; tốt kh&ocirc;ng?. C&aacute;c c&ocirc;ng tr&igrave;nh họ đ&atilde; cung cấp sản phẩm hoạt động ổn định kh&ocirc;ng?</em></li>
	<li><em>Chế độ bảo h&agrave;nh, bảo tr&igrave; như thế n&agrave;o?</em></li>
</ul>

<h2>Kết luận:</h2>

<p>Tr&ecirc;n đ&acirc;y chỉ l&agrave; một số &yacute; kiến c&aacute; nh&acirc;n m&igrave;nh muốn chia sẽ cho bạn, v&igrave; để cần lắp đặt một hệ thống chống trộm tốt nhất cho nh&agrave; ở, bạn cần phải t&igrave;m hiểu kỹ rất nhiều th&ocirc;ng tin c&ugrave;ng chiều v&agrave; tr&aacute;i chiều.</p>

<p>Dựa v&agrave;o c&aacute;c &yacute; kiến b&ecirc;n tr&ecirc;n của m&igrave;nh, m&igrave;nh tin rằng bạn c&oacute; thể tự tin lựa chọn cho m&igrave;nh 1 h&atilde;ng cung cấp giải ph&aacute;p chống trộm uy t&iacute;n, đảm bảo cho ng&ocirc;i nh&agrave; th&acirc;n y&ecirc;u của m&igrave;nh.</p>

<p>Nếu bạn cần tư vấn giải ph&aacute;p chống trộm của TIS c&oacute; thể li&ecirc;n hệ đến&nbsp;<strong>Hotline:</strong>&nbsp;<strong>1900.63.63.54</strong>để được chuy&ecirc;n vi&ecirc;n kỹ thuật của TIS tư vấn nh&eacute;. Ch&uacute;c bạn lựa chọn được một giải ph&aacute;p như &yacute; muốn. Xin cảm ơn.</p>
', NULL, CAST(N'2018-12-08 20:48:19.887' AS DateTime), N'Admin', N'09-Dec-18 10:09:25 PM', NULL, NULL, NULL, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Content] OFF
SET IDENTITY_INSERT [dbo].[CustomerAccount] ON 

INSERT [dbo].[CustomerAccount] ([ID], [Email], [PassWord], [Name], [GioiTinh], [BirthDay], [TelephoneNumber], [ConfirmPassWord]) VALUES (2, N'12@gmail.com', N'a', N'huy', N'1', NULL, 123, NULL)
INSERT [dbo].[CustomerAccount] ([ID], [Email], [PassWord], [Name], [GioiTinh], [BirthDay], [TelephoneNumber], [ConfirmPassWord]) VALUES (25, N'a@gmail.com', N'5d793fc5b00a2348c3fb9ab59e5ca98a', N'fdsaf', N'Nam', NULL, 232, N'5d793fc5b00a2348c3fb9ab59e5ca98a')
INSERT [dbo].[CustomerAccount] ([ID], [Email], [PassWord], [Name], [GioiTinh], [BirthDay], [TelephoneNumber], [ConfirmPassWord]) VALUES (20, N'abc@gmail.com', N'30facee127ba33c2a7c57d1482e10132', N'huy', N'Nam', NULL, 123, N'30facee127ba33c2a7c57d1482e10132')
INSERT [dbo].[CustomerAccount] ([ID], [Email], [PassWord], [Name], [GioiTinh], [BirthDay], [TelephoneNumber], [ConfirmPassWord]) VALUES (21, N'abc123@gmail.com', N'30facee127ba33c2a7c57d1482e10132', N'huy', N'Nam', NULL, 123, N'30facee127ba33c2a7c57d1482e10132')
INSERT [dbo].[CustomerAccount] ([ID], [Email], [PassWord], [Name], [GioiTinh], [BirthDay], [TelephoneNumber], [ConfirmPassWord]) VALUES (26, N'baynguyen101097@gmail.com', N'9be32c39db39785d4648d9dcfb0c2c8d', N'fdsa', N'Nam', NULL, 23232, N'9be32c39db39785d4648d9dcfb0c2c8d')
INSERT [dbo].[CustomerAccount] ([ID], [Email], [PassWord], [Name], [GioiTinh], [BirthDay], [TelephoneNumber], [ConfirmPassWord]) VALUES (24, N'hoanghuy96nt@yahoo.com', N'30facee127ba33c2a7c57d1482e10132', N'Hoang Huy  Nguyen Le', N'Nam', NULL, 0, N'30facee127ba33c2a7c57d1482e10132')
INSERT [dbo].[CustomerAccount] ([ID], [Email], [PassWord], [Name], [GioiTinh], [BirthDay], [TelephoneNumber], [ConfirmPassWord]) VALUES (3, N'huy@gmail.com', N'30facee127ba33c2a7c57d1482e10132', N'huy', N'Nam', NULL, 123, N'30facee127ba33c2a7c57d1482e10132')
INSERT [dbo].[CustomerAccount] ([ID], [Email], [PassWord], [Name], [GioiTinh], [BirthDay], [TelephoneNumber], [ConfirmPassWord]) VALUES (22, N'huyne@gmail.com', N'30facee127ba33c2a7c57d1482e10132', N'huy', N'Nam', NULL, 123, N'30facee127ba33c2a7c57d1482e10132')
INSERT [dbo].[CustomerAccount] ([ID], [Email], [PassWord], [Name], [GioiTinh], [BirthDay], [TelephoneNumber], [ConfirmPassWord]) VALUES (27, N'khach@gmail.com', N'30facee127ba33c2a7c57d1482e10132', N'hoang huy', N'Nam', NULL, 123, N'30facee127ba33c2a7c57d1482e10132')
SET IDENTITY_INSERT [dbo].[CustomerAccount] OFF
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([FeedbackID], [FeedbackName], [Phone], [Email], [Address], [CreateDate], [Status], [Content]) VALUES (26, N'Huy', NULL, N'a@a.com', NULL, CAST(N'2018-10-03 08:15:24.770' AS DateTime), 1, NULL)
INSERT [dbo].[Feedback] ([FeedbackID], [FeedbackName], [Phone], [Email], [Address], [CreateDate], [Status], [Content]) VALUES (27, NULL, NULL, N'a@a.com', NULL, CAST(N'2018-10-03 08:15:28.103' AS DateTime), 1, NULL)
INSERT [dbo].[Feedback] ([FeedbackID], [FeedbackName], [Phone], [Email], [Address], [CreateDate], [Status], [Content]) VALUES (28, NULL, NULL, N'a@a.com', NULL, CAST(N'2018-10-03 08:15:31.903' AS DateTime), 0, NULL)
INSERT [dbo].[Feedback] ([FeedbackID], [FeedbackName], [Phone], [Email], [Address], [CreateDate], [Status], [Content]) VALUES (29, NULL, NULL, N'a@a.com', NULL, CAST(N'2018-10-03 08:15:34.860' AS DateTime), 1, NULL)
INSERT [dbo].[Feedback] ([FeedbackID], [FeedbackName], [Phone], [Email], [Address], [CreateDate], [Status], [Content]) VALUES (33, N'nguoi y kien', 123, N'dophuonglan0299@gmail.com', N'to 39 khu 7', CAST(N'2018-12-07 00:46:46.810' AS DateTime), 0, N'làm lại   ')
INSERT [dbo].[Feedback] ([FeedbackID], [FeedbackName], [Phone], [Email], [Address], [CreateDate], [Status], [Content]) VALUES (34, N'nguoi y kien', 123, N'dophuonglan0299@gmail.com', N'to 39 khu 7', CAST(N'2018-12-07 00:52:56.090' AS DateTime), 0, N'                ')
INSERT [dbo].[Feedback] ([FeedbackID], [FeedbackName], [Phone], [Email], [Address], [CreateDate], [Status], [Content]) VALUES (35, N'nguoi y kien', 123, N'dophuonglan0299@gmail.com', N'to 39 khu 7', CAST(N'2018-12-07 00:58:01.340' AS DateTime), 0, N'                ')
INSERT [dbo].[Feedback] ([FeedbackID], [FeedbackName], [Phone], [Email], [Address], [CreateDate], [Status], [Content]) VALUES (36, N'nguoi y kien', 123, N'dophuonglan0299@gmail.com', N'to 39 khu 7', CAST(N'2018-12-07 01:00:33.623' AS DateTime), 0, N'                ')
INSERT [dbo].[Feedback] ([FeedbackID], [FeedbackName], [Phone], [Email], [Address], [CreateDate], [Status], [Content]) VALUES (37, N'nguoi y kien', 123, N'dophuonglan0299@gmail.com', N'to 39 khu 7', CAST(N'2018-12-07 01:02:32.210' AS DateTime), 0, N'                ')
INSERT [dbo].[Feedback] ([FeedbackID], [FeedbackName], [Phone], [Email], [Address], [CreateDate], [Status], [Content]) VALUES (38, N'nguoi y kien', 123, N'dophuonglan0299@gmail.com', N'to 39 khu 7', CAST(N'2018-12-07 01:03:04.287' AS DateTime), 0, N'                ')
INSERT [dbo].[Feedback] ([FeedbackID], [FeedbackName], [Phone], [Email], [Address], [CreateDate], [Status], [Content]) VALUES (39, N'huy', 123, N'dophuonglan0299@gmail.com', N'to 39 khu 7', CAST(N'2018-12-07 01:03:16.190' AS DateTime), 0, N'                ')
SET IDENTITY_INSERT [dbo].[Feedback] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([MenuID], [Text], [Link], [DisplayOrder], [Target], [Status], [MenuTypeID]) VALUES (1, N'Trang Chu', N'/', 1, N'_self', 1, 24)
INSERT [dbo].[Menu] ([MenuID], [Text], [Link], [DisplayOrder], [Target], [Status], [MenuTypeID]) VALUES (2, N'Giới Thiệu', N'/gioi-thieu', 2, N'_self', 1, 24)
INSERT [dbo].[Menu] ([MenuID], [Text], [Link], [DisplayOrder], [Target], [Status], [MenuTypeID]) VALUES (3, N'Tin Tức', N'/tin-tuc-tat-ca-0', 3, N'_self', 1, 24)
INSERT [dbo].[Menu] ([MenuID], [Text], [Link], [DisplayOrder], [Target], [Status], [MenuTypeID]) VALUES (4, N'Sản Phẩm', N'/san-pham', 4, N'_self', 1, 24)
INSERT [dbo].[Menu] ([MenuID], [Text], [Link], [DisplayOrder], [Target], [Status], [MenuTypeID]) VALUES (5, N'Liên Hệ', N'/lien-he', 5, N'_self', 1, 24)
INSERT [dbo].[Menu] ([MenuID], [Text], [Link], [DisplayOrder], [Target], [Status], [MenuTypeID]) VALUES (6, N'Đăng Kí', N'/dang-ki', 6, N'_self', 1, 23)
INSERT [dbo].[Menu] ([MenuID], [Text], [Link], [DisplayOrder], [Target], [Status], [MenuTypeID]) VALUES (7, N'Đăng Nhập', N'/dang-nhap', 7, N'_self', 1, 23)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[MenuType] ON 

INSERT [dbo].[MenuType] ([MenuTypeID], [Name]) VALUES (23, N'MenuTop')
INSERT [dbo].[MenuType] ([MenuTypeID], [Name]) VALUES (24, N'MenuChinh')
SET IDENTITY_INSERT [dbo].[MenuType] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsID], [NewsName], [MetaTitle], [ParentNewsID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (5, N'Đồ Điện Tử', N'do-dien-tu', NULL, NULL, N'Đồ Điện Tử', CAST(N'2018-09-01 22:04:53.937' AS DateTime), N'Admin', NULL, NULL, N'Đồ Điện Tử', N'Đồ Điện Tử', 1, 0)
INSERT [dbo].[News] ([NewsID], [NewsName], [MetaTitle], [ParentNewsID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (13, N'Chuông Báo Động', N'chuong-bao-dong', 5, NULL, NULL, CAST(N'2018-09-01 22:25:46.660' AS DateTime), N'Admin', N'06/12/2018 11:08:02', N'Admin', NULL, NULL, 1, NULL)
INSERT [dbo].[News] ([NewsID], [NewsName], [MetaTitle], [ParentNewsID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (36, N'Về Camera', N've-camera', NULL, NULL, NULL, CAST(N'2018-12-06 11:07:25.853' AS DateTime), N'Admin', N'08/12/2018 20:40:21', N'Admin', NULL, NULL, 1, NULL)
INSERT [dbo].[News] ([NewsID], [NewsName], [MetaTitle], [ParentNewsID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (37, N'Về Tivi', N've-tivi', NULL, NULL, NULL, CAST(N'2018-12-06 11:07:43.830' AS DateTime), N'Admin', N'08/12/2018 20:40:38', N'Admin', NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (1, CAST(N'2018-12-05 18:17:38.093' AS DateTime), NULL, N'huy', 123, N'to 39 khu 7', N'a@gmail.com', 1)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (2, CAST(N'2018-12-05 19:55:47.693' AS DateTime), NULL, N'a', 433, N'gts', N'b@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (3, CAST(N'2018-12-05 21:41:25.293' AS DateTime), NULL, N'Lan', 123, N'gts', N'hoanghuy@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (4, CAST(N'2018-12-05 22:00:42.887' AS DateTime), NULL, N'huy', 123, N'gts', N'hoanghuy97nt@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (5, CAST(N'2018-12-06 20:51:50.213' AS DateTime), NULL, N'huy', 123, N'gts', N'hoanghuy96nt@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (6, CAST(N'2018-12-06 20:58:26.263' AS DateTime), NULL, N'huy', 123, N'gts', N'hoanghuy96nt@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (7, CAST(N'2018-12-06 21:01:58.557' AS DateTime), NULL, N'huy', 123, N'gts', N'hoanghuy96nt@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (8, CAST(N'2018-12-06 21:17:00.190' AS DateTime), NULL, N'huy', 1234, N'gts', N'hoanghuy96nt@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (9, CAST(N'2018-12-06 21:25:24.230' AS DateTime), NULL, N'huy', 123, N'gts', N'hoanghuy96nt@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (10, CAST(N'2018-12-06 21:28:00.287' AS DateTime), NULL, N'huy', 123, N'to 39 khu 7', N'dophuonglan0299@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (11, CAST(N'2018-12-06 21:38:10.023' AS DateTime), NULL, N'Lan của huy', 123456789, N'gts', N'dophuonglan0299@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (12, CAST(N'2018-12-09 16:24:28.243' AS DateTime), NULL, N'fdas', 1513, N'fdsafsda', N'baynguyen101097@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (13, CAST(N'2018-12-09 16:28:51.603' AS DateTime), NULL, N'fdsa', 1654, N'fdsa', N'baynguyen101097@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (14, CAST(N'2018-12-09 16:30:10.403' AS DateTime), NULL, N'bayng', 32439, N'dfkjsla', N'baynguyen101097@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (15, CAST(N'2018-12-09 16:31:56.447' AS DateTime), NULL, N'fds3', 2342, N'fdsaf', N'baynguyen101097@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (16, CAST(N'2018-12-09 16:35:39.170' AS DateTime), NULL, N'dsfa', 4343, N'fasdf', N'baynguyen101097@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (17, CAST(N'2018-12-09 16:39:24.417' AS DateTime), NULL, N'fds', 23, N'fdsa', N'baynguyen101097@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (18, CAST(N'2018-12-09 21:54:53.187' AS DateTime), NULL, N'fdsa', 23423, N'é', N'baynguyen101097@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (19, CAST(N'2019-01-01 16:25:44.527' AS DateTime), NULL, N'huy', 123, N'123', N'hoanghuy96nt@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (20, CAST(N'2019-01-01 16:26:41.707' AS DateTime), NULL, N'huy', 123, N'to 39 khu 7', N'hoanghuy96nt@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (21, CAST(N'2019-01-01 17:00:52.617' AS DateTime), 27, N'huy', 123, N'to 39 khu 7', N'hoanghuy96nt@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (22, CAST(N'2019-01-01 17:06:32.113' AS DateTime), 27, N'huy', 123, N'to 39 khu 7', N'hoanghuy96nt@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (23, CAST(N'2019-01-07 13:12:16.957' AS DateTime), 27, N'honagf huy', 123, N'7/5', N'hoanghuy96nt@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (24, CAST(N'2019-01-07 13:14:20.103' AS DateTime), 27, N'honagf huy', 123, N'7/5', N'hoanghuy96nt@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (25, CAST(N'2019-01-07 13:14:52.093' AS DateTime), 27, N'honagf huy', 123, N'7/5', N'hoanghuy96nt@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (26, CAST(N'2019-01-07 13:15:24.300' AS DateTime), 27, N'huy', 123, N'to 39 khu 7', N'hoanghuy96nt@gmail.com', 0)
INSERT [dbo].[Order] ([OrderID], [CreateDay], [CustomerID], [ShipName], [ShipPhone], [ShipAdress], [ShipEmail], [status]) VALUES (27, CAST(N'2019-01-07 13:42:07.877' AS DateTime), 27, N'huy', 2323, N'22qewwsdqw', N'hoanghuy96nt@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (1, 41, 1, 13500000, 0, 1, 0, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (1, 42, 1, 24300000, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (2, 4, 1, 3222442, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (3, 3, 1, 1904000, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (3, 5, 1, 2442224, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (3, 41, 2, 13500000, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (4, 4, 1, 3222442, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (5, 5, 1, 2442224, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (5, 42, 1, 24300000, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (6, 5, 1, 2442224, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (7, 2, 1, 2100000, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (8, 41, 1, 13500000, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (9, 4, 1, 3222442, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (10, 3, 1, 1904000, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (10, 4, 1, 3222442, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (11, 19, 1, 4200000, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (11, 42, 1, 24300000, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (12, 1, 1, 1800000, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (12, 4, 1, 3222442, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (12, 6, 1, 1320400, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (12, 11, 1, 32132111, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (13, 1, 2, 1800000, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (13, 4, 2, 3222442, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (13, 6, 1, 1320400, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (13, 11, 1, 32132111, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (14, 1, 2, 1800000, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (14, 4, 2, 3222442, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (14, 6, 1, 1320400, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (14, 11, 1, 32132111, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (15, 1, 2, 1800000, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (15, 4, 2, 3222442, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (15, 6, 1, 1320400, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (15, 11, 1, 32132111, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (16, 4, 1, 3222442, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (17, 4, 1, 3222442, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (17, 40, 1, 10800000, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (18, 41, 1, 13500000, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (19, 1, 2, 2700000, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (19, 4, 1, 3222442, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (19, 5, 1, 2442224, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (20, 1, 2, 2700000, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (20, 4, 1, 3222442, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (20, 5, 1, 2442224, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (20, 7, 1, 3212222, 0, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (21, 2, 1, 2100000, 0, 1, 1, NULL, 1)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (21, 31, 2, 600000, 1, 0, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (21, 46, 1, 19700000, 1, 1, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (22, 4, 1, 3222442, 1, 1, 1, NULL, 1)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (26, 3, 1, 1904000, 0, 0, 0, NULL, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (26, 4, 1, 3222442, 0, 0, 0, NULL, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [PriceWhenBuyAtTime], [Trangthaigiao], [Trangthaithanhtoan], [Trangthaixuli], [NgayGiao], [Trangthaidanggiao]) VALUES (27, 5, 2, 2442224, 0, 0, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([PermissionID], [PermissionName], [Description]) VALUES (1, N'Admin                                             ', N'Toàn quyền hệ thống')
INSERT [dbo].[Permission] ([PermissionID], [PermissionName], [Description]) VALUES (2, N'Employee                                          ', N'Quản lí sản phẩm, tin tức')
SET IDENTITY_INSERT [dbo].[Permission] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (1, N'Chuông bao dong 2101', N'chuong-bao-dong-ig-210221', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/628cplussmall_1470280701.jpg', NULL, 3000000, 10, NULL, 10, 1, N'<div class="pdp-product-detail">
<div class="pdp-product-desc">
<div class="message message_platform_pc message_type_info">
<div class="message__text">
<div class="message__item">Đ&acirc;y l&agrave; sản phẩm được b&aacute;n bởi Nh&agrave; B&aacute;n H&agrave;ng v&agrave; Nh&agrave; B&aacute;n H&agrave;ng c&oacute; tr&aacute;ch nhiệm xuất h&oacute;a đơn theo luật hiện h&agrave;nh.</div>
</div>
</div>

<div class="html-content pdp-product-highlights">
<ul>
	<li>Sản phẩm sử dụng 3 pin đồng hồ</li>
	<li>C&oacute; n&uacute;t On v&agrave; Off t&iacute;ch hợp.</li>
	<li>&Acirc;m thanh b&aacute;o động l&ecirc;n tới 105dB</li>
	<li>Nhỏ gọn dễ sử dụng</li>
	<li>Chất liệu cao cấp</li>
</ul>
</div>

<div class="detail-content html-content">&nbsp;</div>

<div class="pdp-mod-specification">
<h2>Đặc t&iacute;nh sản phẩm</h2>

<div class="pdp-general-features">
<ul>
	<li>Thương hiệu <!-- -->
	<div class="html-content key-value">OEM</div>
	</li>
	<li>SKU <!-- -->
	<div class="html-content key-value">250670553_VNAMZ-331461168</div>
	</li>
	<li>D&ograve;ng sản phẩm <!-- -->
	<div class="html-content key-value">Chu&ocirc;ng cửa cảm biến chống trộm tự b&aacute;o động + Tặng 1 pin sạc 04 vi&ecirc;n AA 700mAh</div>
	</li>
	<li>Loại bảo h&agrave;nh <!-- -->
	<div class="html-content key-value">No Warranty</div>
	</li>
</ul>
</div>

<div class="box-content">Bộ sản phẩm bao gồm
<div class="box-content-html html-content">
<p>2 san pham</p>
</div>
</div>
</div>
</div>
</div>
', NULL, CAST(N'2018-10-13 13:42:35.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, CAST(N'2018-04-12 00:00:00.000' AS DateTime), NULL, N'/Data/images/camera_wireless_0007_250_250.jpg|/Data/images/download%20(3).jpg|/Data/images/camera-quan-sat-hd-tvi-hikvision-ds-2ce16c0t-ir.jpg|/Data/images/camera-24917_camera_dahua_dh_hac_hfw1100dp_s3_hdcvi_1_0mp_1.jpg|')
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (2, N'Chuông báo động IG-503', N'chuong-bao-dong-ig-503', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Chuong%20cua%20co%20hinh/bo-chuong-cua-co-hinh-hikvision-ds-kis201.jpg', NULL, 2100000, NULL, NULL, 8, 1, N'<p>&lt;div id=&quot;module_product_detail&quot; class=&quot;pdp-block module&quot;&gt;&lt;h2 class=&quot;pdp-mod-section-title outer-title&quot;&gt;M&ocirc; tả sản phẩm WOND K&iacute;ch S&oacute;ng WIFI Video Chu&ocirc;ng Cửa Th&ocirc;ng Minh Thị Gi&aacute;c Chu&ocirc;ng Cửa Song C&ocirc;ng Luận Nh&agrave; B&aacute;o Động Ph&iacute;ch Cắm CH&Acirc;U &Acirc;U&lt;/h2&gt;&lt;div class=&quot;pdp-product-detail&quot; data-spm=&quot;product_detail&quot;&gt;&lt;div class=&quot;pdp-product-desc height-limit&quot; data-spm-anchor-id=&quot;a2o4n.pdp.product_detail.i0.374a32fcCTZDm1&quot;&gt;&lt;div class=&quot;message message_platform_pc message_type_info&quot;&gt;&lt;span class=&quot;lazada lazada-ic-infoNotes lazada-icon message__icon&quot;&gt;&lt;/span&gt;&lt;div class=&quot;message__text&quot;&gt;&lt;div class=&quot;message__item&quot;&gt;Sản phẩm được nhập trực tiếp từ nước ngo&agrave;i. Ho&aacute; đơn b&aacute;n h&agrave;ng kh&ocirc;ng được hỗ trợ trong trường hợp n&agrave;y. &lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;html-content pdp-product-highlights&quot;&gt;&lt;ul class=&quot;&quot;&gt;&lt;li class=&quot;&quot;&gt;Khi du kh&aacute;ch nhấn n&uacute;t tr&ecirc;n chu&ocirc;ng cửa, thiết bị th&ocirc;ng minh của bạn tương t&aacute;c&lt;/li&gt;&lt;li class=&quot;&quot;&gt;Với chu&ocirc;ng cửa:&lt;/li&gt;&lt;li class=&quot;&quot;&gt;Th&ocirc;ng qua video thời gian thực v&agrave; full duplex thảo luận&lt;/li&gt;&lt;li class=&quot;&quot;&gt;Chụp ảnh ảnh chụp m&agrave;n h&igrave;nh m&agrave; lưu trực tiếp v&agrave;o thiết bị th&ocirc;ng minh của bạn v&agrave;&lt;/li&gt;&lt;li class=&quot;&quot;&gt;Ghi Video lưu trực tiếp v&agrave;o micro an to&agrave;n kỹ thuật số thẻ nhớ của chu&ocirc;ng cửa&lt;/li&gt;&lt;li class=&quot;&quot;&gt;K&iacute;ch hoạt trong nh&agrave; bạn chu&ocirc;ng với c&agrave;i đặt sẵn giai điệu v&agrave; điều khiển &acirc;m lượng&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;&lt;div class=&quot;html-content detail-content&quot;&gt;T&iacute;nh năng:&lt;br&gt;Th&ocirc;ng minh chu&ocirc;ng cửa c&oacute; thể kết nối th&ocirc;ng qua WiFi hoặc CAT5E LAN C&aacute;p.&lt;br&gt;Khi du kh&aacute;ch nhấn n&uacute;t tr&ecirc;n chu&ocirc;ng cửa, thiết bị th&ocirc;ng minh của bạn tương t&aacute;c&lt;br&gt;Với chu&ocirc;ng cửa:&lt;br&gt;Th&ocirc;ng qua video thời gian thực v&agrave; full duplex thảo luận&lt;br&gt;Chụp ảnh ảnh chụp m&agrave;n h&igrave;nh m&agrave; lưu trực tiếp v&agrave;o thiết bị th&ocirc;ng minh của bạn v&agrave;&lt;br&gt;Ghi Video lưu trực tiếp v&agrave;o micro an to&agrave;n kỹ thuật số thẻ nhớ của chu&ocirc;ng cửa&lt;br&gt;K&iacute;ch hoạt trong nh&agrave; bạn chu&ocirc;ng với c&agrave;i đặt sẵn giai điệu v&agrave; điều khiển &acirc;m lượng&lt;br&gt;Th&ecirc;m t&iacute;nh năng bao gồm mở kh&oacute;a v&agrave; kh&oacute;a cửa hoặc cửa th&ocirc;ng qua thiết bị th&ocirc;ng minh&lt;br&gt;Trong khi tr&ecirc;n một gọi truy cập cho 5 bảo quản vi&ecirc;n người sử dụng v&agrave; nhiều kh&aacute;ch mời người sử dụng.&lt;br&gt;&lt;br&gt;M&ocirc; tả:&lt;br&gt;M&aacute;y chủ: P2P truyền, th&iacute;ch nghi mạng&lt;br&gt;Mạng: Wifi 802.11 B/g/n/AC hoặc kết nối trực tiếp với một mạng c&oacute; d&acirc;y&lt;br&gt;&Acirc;m thanh: G.711A Chế độ n&eacute;n&lt;br&gt;Thảo luận: Full Duplex thảo luận&lt;br&gt;Định dạng Video: H.264&lt;br&gt;Chế độ ghi: Hướng Dẫn Sử Dụng, Ghi &Acirc;m b&aacute;o động, Ghi &Acirc;m hẹn giờ&lt;br&gt;Thẻ Nhớ ngo&agrave;i: Micro An To&agrave;n Kỹ Thuật Số Thẻ Nhớ kh&ocirc;ng cần hạn chế dung lượng&lt;br&gt;Camera: 1 Megapixel&lt;br&gt;Ống K&iacute;nh m&aacute;y ảnh: 150 g&oacute;c Ngang&lt;br&gt;Tầm nh&igrave;n ban đ&ecirc;m: IR CUT kh&ocirc;ng m&agrave;u sắc độ lệch, B/W tầm nh&igrave;n ban đ&ecirc;m trong v&ograve;ng 5 m&eacute;t&lt;br&gt;&lt;br&gt;Th&ocirc;ng số kỹ thuật:&lt;br&gt;M&agrave;u sắc: Đen &amp;amp; Bạc&lt;br&gt;K&iacute;ch thước: 145*93*39 M&eacute;t&lt;br&gt;M&ocirc; h&igrave;nh: V1&lt;br&gt;Ph&iacute;ch cắm: Ph&iacute;ch Cắm EU/Ph&iacute;ch cắm US/UK/AU Plug&lt;br&gt;Điện &aacute;p: DC12 ~ 36 V, AC 8 ~ 24 V&lt;br&gt;Mức độ chống thấm nước: IP44&lt;br&gt;Nhiệt độ/độ ẩm:-20 ~ 55℃ 10-95% RH&lt;br&gt;Tỷ lệ khung h&igrave;nh: 25 Khung HD (1280*720), SD (640*360)&lt;br&gt;B&aacute;o động: Chuyển Động ph&aacute;t hiện, PIR b&aacute;o động, Tamper b&aacute;o động&lt;br&gt;Đẩy: tin nhắn Push th&ocirc;ng minh Điện thoại, gửi PIC để thiết lập thư&lt;br&gt;Dữ liệu giao diện: TCP/IP, UDP, SMTP, DHCP, UPnP, ONVIF kết nối NVR&lt;br&gt;&lt;br&gt;Bộ sản phẩm bao gồm:&lt;br&gt;1X Th&ocirc;ng Minh Chu&ocirc;ng Cửa&lt;br&gt;1X Bộ Chuyển Đổi Nguồn Điện&lt;br&gt;1x C&aacute;p DC&lt;br&gt;1X POE Injector&lt;br&gt;1X Tua V&iacute;t&lt;br&gt;1X Ốc V&iacute;t V&agrave; N&uacute;t Chặn&lt;br&gt;1X Băng D&iacute;nh&lt;br&gt;1X Mở Kh&oacute;a D&acirc;y&lt;br&gt;1X Truy Cập Hệ Thống D&acirc;y Điện&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;img src=&quot;https://my-live-01.slatic.net/original/994142dd4813a8141f6cf676601eb0d0.jpg&quot; width=&quot;700px&quot;&gt;&lt;img src=&quot;https://my-live-01.slatic.net/original/fe1c9877fff81d04b03da0251d10ec2b.jpg&quot; width=&quot;700px&quot;&gt;&lt;img src=&quot;https://my-live-01.slatic.net/original/7a07270c3c2ea1dd150d69ba6b7aa952.jpg&quot; width=&quot;700px&quot;&gt;&lt;img src=&quot;https://my-live-01.slatic.net/original/6c8ec0ade5139466d2c4287bb71aa79f.jpg&quot; width=&quot;700px&quot;&gt;&lt;img src=&quot;https://my-live-01.slatic.net/original/f3a6587e44636eb4dce7eac232264e90.jpg&quot; width=&quot;700px&quot;&gt;&lt;img src=&quot;https://my-live-01.slatic.net/original/9bbcaecbd3a53cddaa589cf2ce00dcfd.jpg&quot; width=&quot;700px&quot;&gt;&lt;img src=&quot;https://my-live-01.slatic.net/original/753bf8baab8ba1ed91529c22f24c6c80.jpg&quot; width=&quot;700px&quot;&gt;&lt;img src=&quot;https://my-live-01.slatic.net/original/8ddb9d86a198e2db3d6c32f43279c0c0.jpg&quot; width=&quot;700px&quot;&gt;&lt;/div&gt;&lt;div class=&quot;pdp-mod-specification&quot;&gt;&lt;h2 class=&quot;pdp-mod-section-title &quot;&gt;Đặc t&iacute;nh sản phẩm&lt;/h2&gt;&lt;div class=&quot;pdp-general-features&quot;&gt;&lt;ul class=&quot;specification-keys&quot;&gt;&lt;li class=&quot;key-li&quot;&gt;&lt;span class=&quot;key-title&quot;&gt; Thương hiệu &lt;!-- --&gt; &lt;/span&gt;&lt;div class=&quot;html-content key-value&quot;&gt;Wonderland&lt;/div&gt;&lt;/li&gt;&lt;li class=&quot;key-li&quot;&gt;&lt;span class=&quot;key-title&quot;&gt; SKU &lt;!-- --&gt; &lt;/span&gt;&lt;div class=&quot;html-content key-value&quot;&gt;252401824_VNAMZ-335727484&lt;/div&gt;&lt;/li&gt;&lt;li class=&quot;key-li&quot;&gt;&lt;span class=&quot;key-title&quot;&gt; D&ograve;ng sản phẩm &lt;!-- --&gt; &lt;/span&gt;&lt;div class=&quot;html-content key-value&quot;&gt;Wonderland - ZM1512601#@~&lt;/div&gt;&lt;/li&gt;&lt;li class=&quot;key-li&quot;&gt;&lt;span class=&quot;key-title&quot;&gt; Loại bảo h&agrave;nh &lt;!-- --&gt; &lt;/span&gt;&lt;div class=&quot;html-content key-value&quot;&gt;No Warranty&lt;/div&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;&lt;div class=&quot;box-content&quot;&gt;&lt;span class=&quot;key-title&quot;&gt;Bộ sản phẩm bao gồm&lt;/span&gt;&lt;div class=&quot;html-content box-content-html&quot;&gt;1x Smart Doorbell; 1x Power Adapter; 1x DC Cable; 1x POE Injector ; 1x Screwdriver ; 1x Screws And Stopper &nbsp;; 1x Adhesive Tape; 1x Unlock Wiring ; 1x Access Wiring; &nbsp; &nbsp; ;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;expand-button expand-cursor&quot;&gt;&lt;button class=&quot;pdp-view-more-btn pdp-button pdp-button_type_text pdp-button_theme_white pdp-button_size_m&quot;&gt;XEM TH&Ecirc;M&lt;/button&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;</p>
', NULL, CAST(N'2018-10-13 13:42:58.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, N'/Data/images/camera_wireless_0007_250_250(1).jpg|/Data/images/camera_wireless_0007_250_250.jpg|/Data/images/camera-quan-sat-hd-tvi-hikvision-ds-2ce16c0t-ir.jpg|/Data/images/camera-350_KB_Vision_KX_2004MC.png|')
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (3, N'Chuông báo động IG-402', N'chuong-bao-dong-ig-402', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/download%20(1).jpg', NULL, 1904000, NULL, NULL, 0, 1, N'<p>Chu&ocirc;ng B&aacute;o Động cửa nh&agrave; nhỏ gọn, tiện dụng - Chu&ocirc;ng chống trộm được thiết kế với t&iacute;nh năng b&aacute;o hiệu cực nhạy, khi c&oacute; người x&acirc;m nhập từ b&ecirc;n ngo&agrave;i, chu&ocirc;ng sẽ ph&aacute;t ra &acirc;m thanh b&aacute;o hiệu &gt;90dB, gi&uacute;p người trong nh&agrave; nhận biết được nguy hiểm. Chu&ocirc;ng c&oacute; qui tr&igrave;nh hoạt động đơn giản, dễ lắp đặt n&ecirc;n th&iacute;ch hợp để d&ugrave;ng cho mọi gia đ&igrave;nh. Sản phẩm nhỏ gọn nhưng lại ph&aacute;t ra tiếng k&ecirc;u rất lớn, n&oacute; vừa đảm bảo b&iacute; mật, kh&ocirc;ng g&acirc;y mất thẩm mỹ cho ng&ocirc;i nh&agrave; bạn. -Tình trạng tr&ocirc;̣m phá cửa đ&ocirc;̣t nh&acirc;̣p vào nhà đang diễn ra rất phổ biến. V&igrave; vậy, vấn đề bảo vệ t&agrave;i sản cũng như an to&agrave;n cho c&aacute;c th&agrave;nh vi&ecirc;n trong gia đ&igrave;nh l&agrave; điều quan t&acirc;m của tất cả mọi người -Thiết bị b&aacute;o động gắn cửa l&agrave; một trong những sản phẩm đ&aacute;p ứng được nhu cầu tr&ecirc;n của bạn, với chi ph&iacute; nhỏ m&agrave; lại rất hiệu quả. -Thiết bị sẽ b&aacute;o động khi c&aacute;nh cửa h&eacute; mở, bạn c&oacute; thể lắp đặt thiết bị ở tất cả c&aacute;c cửa sổ, cửa ch&iacute;nh trong căn hộ gia đ&igrave;nh để loại trừ mọi trường hợp kẻ gian đột nhập. C&ograve;i b&aacute;o động sẽ h&uacute; vang với &acirc;m lượng cực lớn khi cửa bị mở. - Chu&ocirc;ng gồm 2 phần: 1 bộ phận ch&iacute;nh gắn v&agrave;o cửa, một bộ phận phụ gắn v&agrave;o m&eacute;p tường b&ecirc;n cạnh. Chỉ cần mở cửa, 2 phần của chu&ocirc;ng c&aacute;ch xa v&agrave;i cm l&agrave; n&oacute; đ&atilde; ph&aacute;t tiếng k&ecirc;u b&aacute;o động. - C&oacute; n&uacute;t On/Off t&iacute;ch hợp, dễ sử dụng - Sản phẩm sử dụng 3 pin c&uacute;c &aacute;o, rất dễ thay thế v&agrave; lắp r&aacute;p. - H&agrave;ng mới 100%, full box, bảo h&agrave;nh thiết bị 3 th&aacute;ng, 1 đổi 1 tại cửa h&agrave;ng. - Gi&aacute; b&aacute;n: 50,000 VND / bộ Li&ecirc;n hệ mua h&agrave;ng: Hotline: 0919.222.660 (call,sms,zalo,viber thoải m&aacute;i) Địa chỉ: 64/10 Trần Đ&igrave;nh Xu - Phường C&ocirc; Giang, Quận 1, TP HCM (Đối diện nh&agrave; thờ Cầu Kho - Gần g&oacute;c: Trần Đ&igrave;nh Xu - V&otilde; Văn Kiệt) Skype: bmh1577 (online thường xuy&ecirc;n) www.laptopbenbi.com <a href="https://shopee.vn/chuongbaodong-tag">#chuongbaodong</a> <a href="https://shopee.vn/baodongchongtrom-tag">#baodongchongtrom</a> <a href="https://shopee.vn/chuongcanhbao-tag">#chuongcanhbao</a></p>
', NULL, CAST(N'2018-10-13 13:43:15.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, N'/Data/images/camera_wireless_0007_250_250(1).jpg|/Data/images/camera_wireless_0007_250_250.jpg|/Data/images/NoImage/NoImage.png|/Data/images/NoImage/NoImage.png|')
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (4, N'Chuông báo động IG-123', N'chuong-bao-dong-ig-123', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/download%20(2).jpg', NULL, 3222442, NULL, NULL, 5, 1, N'<p>Chu&ocirc;ng B&aacute;o Động cửa nh&agrave; nhỏ gọn, tiện dụng - Chu&ocirc;ng chống trộm được thiết kế với t&iacute;nh năng b&aacute;o hiệu cực nhạy, khi c&oacute; người x&acirc;m nhập từ b&ecirc;n ngo&agrave;i, chu&ocirc;ng sẽ ph&aacute;t ra &acirc;m thanh b&aacute;o hiệu &gt;90dB, gi&uacute;p người trong nh&agrave; nhận biết được nguy hiểm. Chu&ocirc;ng c&oacute; qui tr&igrave;nh hoạt động đơn giản, dễ lắp đặt n&ecirc;n th&iacute;ch hợp để d&ugrave;ng cho mọi gia đ&igrave;nh. Sản phẩm nhỏ gọn nhưng lại ph&aacute;t ra tiếng k&ecirc;u rất lớn, n&oacute; vừa đảm bảo b&iacute; mật, kh&ocirc;ng g&acirc;y mất thẩm mỹ cho ng&ocirc;i nh&agrave; bạn. -Tình trạng tr&ocirc;̣m phá cửa đ&ocirc;̣t nh&acirc;̣p vào nhà đang diễn ra rất phổ biến. V&igrave; vậy, vấn đề bảo vệ t&agrave;i sản cũng như an to&agrave;n cho c&aacute;c th&agrave;nh vi&ecirc;n trong gia đ&igrave;nh l&agrave; điều quan t&acirc;m của tất cả mọi người -Thiết bị b&aacute;o động gắn cửa l&agrave; một trong những sản phẩm đ&aacute;p ứng được nhu cầu tr&ecirc;n của bạn, với chi ph&iacute; nhỏ m&agrave; lại rất hiệu quả. -Thiết bị sẽ b&aacute;o động khi c&aacute;nh cửa h&eacute; mở, bạn c&oacute; thể lắp đặt thiết bị ở tất cả c&aacute;c cửa sổ, cửa ch&iacute;nh trong căn hộ gia đ&igrave;nh để loại trừ mọi trường hợp kẻ gian đột nhập. C&ograve;i b&aacute;o động sẽ h&uacute; vang với &acirc;m lượng cực lớn khi cửa bị mở. - Chu&ocirc;ng gồm 2 phần: 1 bộ phận ch&iacute;nh gắn v&agrave;o cửa, một bộ phận phụ gắn v&agrave;o m&eacute;p tường b&ecirc;n cạnh. Chỉ cần mở cửa, 2 phần của chu&ocirc;ng c&aacute;ch xa v&agrave;i cm l&agrave; n&oacute; đ&atilde; ph&aacute;t tiếng k&ecirc;u b&aacute;o động. - C&oacute; n&uacute;t On/Off t&iacute;ch hợp, dễ sử dụng - Sản phẩm sử dụng 3 pin c&uacute;c &aacute;o, rất dễ thay thế v&agrave; lắp r&aacute;p. - H&agrave;ng mới 100%, full box, bảo h&agrave;nh thiết bị 3 th&aacute;ng, 1 đổi 1 tại cửa h&agrave;ng. - Gi&aacute; b&aacute;n: 50,000 VND / bộ Li&ecirc;n hệ mua h&agrave;ng: Hotline: 0919.222.660 (call,sms,zalo,viber thoải m&aacute;i) Địa chỉ: 64/10 Trần Đ&igrave;nh Xu - Phường C&ocirc; Giang, Quận 1, TP HCM (Đối diện nh&agrave; thờ Cầu Kho - Gần g&oacute;c: Trần Đ&igrave;nh Xu - V&otilde; Văn Kiệt) Skype: bmh1577 (online thường xuy&ecirc;n) www.laptopbenbi.com <a href="https://shopee.vn/chuongbaodong-tag">#chuongbaodong</a> <a href="https://shopee.vn/baodongchongtrom-tag">#baodongchongtrom</a> <a href="https://shopee.vn/chuongcanhbao-tag">#chuongcanhbao</a></p>
', NULL, CAST(N'2018-10-13 13:43:54.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (5, N'Chuông báo động BO-kit253', N'chuong-bao-dong-bo-kit253', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/homematic_bo-kit-bao-dong-chong-trom-seckit02-2.jpg', NULL, 2442224, NULL, NULL, 10, 1, N'<table cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<th>Xuất xứ thương hiệu</th>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<th>Nơi Sản Xuất</th>
			<td>Trung Quốc</td>
		</tr>
		<tr>
			<th>Bảo h&agrave;nh</th>
			<td>2 Years</td>
		</tr>
		<tr>
			<th>Nơi bảo h&agrave;nh</th>
			<td>Bảo h&agrave;nh ch&iacute;nh h&atilde;ng Sony:http://trungtambaohanhsony.vn/bao-hanh-cac-san-pham-chinh-hang-sony?cat=dich-vu</td>
		</tr>
	</tbody>
</table>
', NULL, CAST(N'2018-10-13 13:44:13.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (6, N'Camera SONY-T604', N'camera-sony-t604', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/c604351e9857a6ef35514fece50c1365.jpg', NULL, 1320400, NULL, NULL, 0, 3, N'<div class="white-panel">
<div class="attribute-table single-table">&nbsp;</div>

<table cellspacing="0" class="table table-bordered table-detail table-striped" id="chi-tiet">
	<tbody>
		<tr>
			<td>Thương hiệu</td>
			<td><a href="http://tiki.vn/thuong-hieu/sony.html">Sony</a></td>
		</tr>
		<tr>
			<td>Sản xuất tại</td>
			<td>Trung Quốc</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước</td>
			<td>Khoảng 127.5 x 89.0 x 91.7mm</td>
		</tr>
		<tr>
			<td>Bộ cảm biến ảnh</td>
			<td>Super HAD CCD 20.1 MP</td>
		</tr>
		<tr>
			<td>Tốc độ m&agrave;n trập</td>
			<td>iAuto (2 - 1/1500) / Chương tr&igrave;nh tự động (1 - 1/1500) / Thủ c&ocirc;ng (30 - 1/1500)</td>
		</tr>
		<tr>
			<td>Tốc độ chụp</td>
			<td>chụp li&ecirc;n tiếp 0.8fps</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước m&agrave;n h&igrave;nh</td>
			<td>3 inch</td>
		</tr>
		<tr>
			<td>Loại / C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>
			<td>TFT</td>
		</tr>
		<tr>
			<td>Thẻ nhớ tương th&iacute;ch</td>
			<td>SD/SDHC/SDXC/Memory Stick PRO Duo/Pro-HG Duo</td>
		</tr>
		<tr>
			<td>Hỗ trợ định dạng</td>
			<td>JPEG</td>
		</tr>
		<tr>
			<td>SKU</td>
			<td>6008997443514</td>
		</tr>
		<tr>
			<td>Model</td>
			<td>DSC H300</td>
		</tr>
		<tr>
			<td>Trọng lượng</td>
			<td>590</td>
		</tr>
		<tr>
			<td>M&agrave;u/Mẫu</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Camera</td>
			<td>20.1MP</td>
		</tr>
		<tr>
			<td>Phụ kiện đi k&egrave;m</td>
			<td>Th&acirc;n m&aacute;y, Pin AA (kh&ocirc;ng sạc), C&aacute;p, D&acirc;y đeo, Nắp đậy ống k&iacute;nh, Hướng dẫn sử dụng</td>
		</tr>
	</tbody>
</table>
</div>
', NULL, CAST(N'2018-10-13 13:45:03.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, N'/Data/images/camera_wireless_0007_250_250(1).jpg|/Data/images/NoImage/NoImage.png|/Data/images/camera-350_KB_Vision_KX_2004MC.png|/Data/images/NoImage/NoImage.png|')
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (7, N'Camera HIKVSION-753', N'camera-hikvsion-753', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/camera-0_3.png', NULL, 3212222, NULL, NULL, 10, 3, N'<div class="white-panel">&nbsp; &nbsp;
<table cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<th>Xuất xứ thương hiệu</th>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<th>Nơi Sản Xuất</th>
			<td>Trung Quốc</td>
		</tr>
		<tr>
			<th>Bảo h&agrave;nh</th>
			<td>2 Years</td>
		</tr>
		<tr>
			<th>Nơi bảo h&agrave;nh</th>
			<td>Bảo h&agrave;nh ch&iacute;nh h&atilde;ng Sony:http://trungtambaohanhsony.vn/bao-hanh-cac-san-pham-chinh-hang-sony?cat=dich-vu</td>
		</tr>
	</tbody>
</table>

<div class="attribute-table single-table">&nbsp;</div>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

<table cellspacing="0" class="table table-bordered table-detail table-striped" id="chi-tiet">
	<tbody>
		<tr>
			<td>Thương hiệu</td>
			<td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a href="http://tiki.vn/thuong-hieu/sony.html">Sony</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
		</tr>
		<tr>
			<td>Sản xuất tại</td>
			<td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Trung Quốc &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước</td>
			<td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Khoảng 127.5 x 89.0 x 91.7mm &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
		</tr>
		<tr>
			<td>Bộ cảm biến ảnh</td>
			<td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Super HAD CCD &nbsp;20.1 MP &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
		</tr>
		<tr>
			<td>Tốc độ m&agrave;n trập</td>
			<td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; iAuto (2 - 1/1500) / Chương tr&igrave;nh tự động (1 - 1/1500) / Thủ c&ocirc;ng (30 - 1/1500) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
		</tr>
		<tr>
			<td>Tốc độ chụp</td>
			<td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; chụp li&ecirc;n tiếp 0.8fps &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước m&agrave;n h&igrave;nh</td>
			<td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 3 inch &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
		</tr>
		<tr>
			<td>Loại / C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>
			<td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TFT &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
		</tr>
		<tr>
			<td>Thẻ nhớ tương th&iacute;ch</td>
			<td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; SD/SDHC/SDXC/Memory Stick PRO Duo/Pro-HG Duo &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
		</tr>
		<tr>
			<td>Hỗ trợ định dạng</td>
			<td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; JPEG &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
		</tr>
		<tr>
			<td>SKU</td>
			<td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 6008997443514 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
		</tr>
		<tr>
			<td>Model</td>
			<td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DSC H300 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
		</tr>
		<tr>
			<td>Trọng lượng</td>
			<td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 590 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
		</tr>
		<tr>
			<td>M&agrave;u/Mẫu</td>
			<td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Đen &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
		</tr>
		<tr>
			<td>Camera</td>
			<td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 20.1MP &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
		</tr>
		<tr>
			<td>Phụ kiện đi k&egrave;m</td>
			<td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Th&acirc;n m&aacute;y, Pin AA (kh&ocirc;ng sạc), C&aacute;p, D&acirc;y đeo, Nắp đậy ống k&iacute;nh, Hướng dẫn sử dụng &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
		</tr>
	</tbody>
</table>
&nbsp; &nbsp;</div>
', NULL, CAST(N'2018-10-13 13:45:38.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (9, N'Camera Vistor-2004', N'camera-vistor-2004', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/camera-24917_camera_dahua_dh_hac_hfw1100dp_s3_hdcvi_1_0mp_1.jpg', NULL, 3366000, NULL, NULL, 0, 3, N'<div class="white-panel">
<table cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<th>Xuất xứ thương hiệu</th>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<th>Nơi Sản Xuất</th>
			<td>Trung Quốc</td>
		</tr>
		<tr>
			<th>Bảo h&agrave;nh</th>
			<td>2 Years</td>
		</tr>
		<tr>
			<th>Nơi bảo h&agrave;nh</th>
			<td>Bảo h&agrave;nh ch&iacute;nh h&atilde;ng Sony:http://trungtambaohanhsony.vn/bao-hanh-cac-san-pham-chinh-hang-sony?cat=dich-vu</td>
		</tr>
	</tbody>
</table>
</div>
', NULL, CAST(N'2018-10-13 13:46:31.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, N'/Data/images/NoImage/NoImage.png|/Data/images/camera_wireless_0007_250_250(1).jpg|/Data/images/download(1).jpg|/Data/images/NoImage/NoImage.png|')
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (10, N'Camera HIKVSION-HD-201', N'camera-hikvsion-hd-201', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/camera-350_KB_Vision_KX_2004MC.png', NULL, 4324243, NULL, NULL, 5, 3, N'<table cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<th>Xuất xứ thương hiệu</th>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<th>Nơi Sản Xuất</th>
			<td>Trung Quốc</td>
		</tr>
		<tr>
			<th>Bảo h&agrave;nh</th>
			<td>2 Years</td>
		</tr>
		<tr>
			<th>Nơi bảo h&agrave;nh</th>
			<td>Bảo h&agrave;nh ch&iacute;nh h&atilde;ng Sony:http://trungtambaohanhsony.vn/bao-hanh-cac-san-pham-chinh-hang-sony?cat=dich-vu</td>
		</tr>
	</tbody>
</table>
', NULL, CAST(N'2018-10-13 13:46:54.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, N'/Data/images/camera_wireless_0007_250_250(1).jpg|/Data/images/camera-quan-sat-hd-tvi-hikvision-ds-2ce16c0t-ir.jpg|/Data/images/camera-350_KB_Vision_KX_2004MC.png|/Data/images/download%20(1).jpg|')
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (11, N'Camera wifiless Sony-2794', N'camera-wifiless-sony-2794', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/camera_wireless_0007_250_250(1).jpg', NULL, 32132111, NULL, NULL, 10, 3, N'<table cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<th>Xuất xứ thương hiệu</th>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<th>Nơi Sản Xuất</th>
			<td>Trung Quốc</td>
		</tr>
		<tr>
			<th>Bảo h&agrave;nh</th>
			<td>2 Years</td>
		</tr>
		<tr>
			<th>Nơi bảo h&agrave;nh</th>
			<td>Bảo h&agrave;nh ch&iacute;nh h&atilde;ng Sony:http://trungtambaohanhsony.vn/bao-hanh-cac-san-pham-chinh-hang-sony?cat=dich-vu</td>
		</tr>
	</tbody>
</table>
', NULL, CAST(N'2018-10-13 13:47:19.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, N'/Data/images/NoImage/NoImage.png|/Data/images/camera-350_KB_Vision_KX_2004MC.png|/Data/images/camera-350_KB_Vision_KX_2004MC.png|/Data/images/NoImage/NoImage.png|')
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (12, N'Camera HIKVSION-642', N'camera-hikvsion-642', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/camera-quan-sat-hd-tvi-hikvision-ds-2ce16c0t-ir.jpg', NULL, 3213213, NULL, NULL, 0, 3, N'<table cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<th>Xuất xứ thương hiệu</th>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<th>Nơi Sản Xuất</th>
			<td>Trung Quốc</td>
		</tr>
		<tr>
			<th>Bảo h&agrave;nh</th>
			<td>2 Years</td>
		</tr>
		<tr>
			<th>Nơi bảo h&agrave;nh</th>
			<td>Bảo h&agrave;nh ch&iacute;nh h&atilde;ng Sony:http://trungtambaohanhsony.vn/bao-hanh-cac-san-pham-chinh-hang-sony?cat=dich-vu</td>
		</tr>
	</tbody>
</table>
', NULL, CAST(N'2018-10-13 13:47:34.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (13, N'Máy chấm công SamSung-24', N'may-cham-cong-samsung-24', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/628cplussmall_1470280701.jpg', NULL, 4000000, NULL, NULL, 10, 4, N'<div class="row">
<div class="span4">
<div class="float-fix-right">
<div class="view-product-question view-product_features">
<h3>Đặc điểm sản phẩm</h3>

<div class="content-product_features">
<div class="control-group">Bộ nhớ lưu trữ:
<div class="feature-value">
<ul>
	<li>2000 V&acirc;n Tay</li>
</ul>
</div>
</div>

<div class="control-group">Loại M&aacute;y:
<div class="feature-value">
<ul>
	<li>Chấm C&ocirc;ng V&acirc;n Tay</li>
</ul>
</div>
</div>

<div class="control-group">Ph&ugrave; Hợp M&ocirc; H&igrave;nh:
<div class="feature-value">
<ul>
	<li>C&ocirc;ng Ty - X&iacute; Nghiệp - Khu C&ocirc;ng Nghiệp, Nh&agrave; H&agrave;ng - Qu&aacute;n Ăn - Qu&aacute;n Cafe</li>
</ul>
</div>
</div>

<div class="control-group">Pin Lưu Điện:
<div class="feature-value">
<ul>
	<li>Kh&ocirc;ng</li>
</ul>
</div>
</div>

<div class="control-group">Chức năng:
<div class="feature-value">
<ul>
	<li>Quản L&yacute; Chấm C&ocirc;ng Nh&acirc;n Vi&ecirc;n</li>
</ul>
</div>
</div>

<div class="control-group">Cổng Kết Nối:
<div class="feature-value">
<ul>
	<li>LAN(Ethernet), USB</li>
</ul>
</div>
</div>

<div class="control-group">H&atilde;ng-Thương hiệu:
<div class="feature-value"><a href="https://vinhnguyen.vn/ronald-jack.html" title=" Ronald Jack">Ronald Jack</a></div>
</div>

<div class="control-group">Bảo h&agrave;nh:
<div class="feature-value">
<ul>
	<li>12 Th&aacute;ng</li>
</ul>
</div>
</div>

<div class="control-group">Xuất xứ:
<div class="feature-value">
<ul>
	<li>Malaysia</li>
</ul>
</div>
</div>
</div>
</div>

<div class="clearfix view-product-note" id="left_product-question">
<div class="view-product-question">
<h3>C&acirc;u hỏi sản phẩm</h3>

<div class="content-question">
<ul>
	<li><a class="to_link" href="#thong_tin_san_pham">Về đầu trang</a></li>
	<li><a class="to_link" href="#content_description">Video Sản phẩm</a></li>
	<li><a class="to_link" href="#content_description">Chi tiết sản phẩm</a></li>
	<li><a class="to_link" href="#thong_tin_san_pham">Đặt h&agrave;ng</a></li>
	<li><a class="to_link" href="#content_discussion">B&igrave;nh luận</a></li>
	<li><a class="to_link" href="#block__90">Sản phẩm li&ecirc;n quan</a></li>
</ul>
</div>
</div>

<div class="clear">&nbsp;</div>
</div>
<!-- Inline script moved to the bottom of the page --><!-- Inline script moved to the bottom of the page --></div>
</div>

<div class="span12">
<div class="tab_product_view">
<h3>Chi tiết sản phẩm</h3>

<div class="wysiwyg-content" id="content_description">
<div>
<p><span style="font-size:16px"><em><strong>Khuyến M&atilde;i SOOK : Tặng k&egrave;m 05m d&acirc;y, Lắp đặt Free HCM, Tặng phần mềm chấm c&ocirc;ng Chuy&ecirc;n nghiệp</strong></em></span></p>

<p>Với sự n&acirc;ng cấp vượt bật n&ecirc;n d&ograve;ng m&aacute;y chấm c&ocirc;ng Ronald Jack W200&nbsp;c&oacute; thể t&iacute;ch hợp được c&aacute;c c&ocirc;ng nghệ tốt nhất cho m&aacute;y chấm c&ocirc;ng hiện nay với mắt đọc cực nhạy v&agrave; si&ecirc;u nhanh gi&uacute;p việc chấm c&ocirc;ng thuận tiện hơn cho kh&aacute;ch h&agrave;ng</p>

<p>T&iacute;ch hợp 2000 v&acirc;n tay m&aacute;y c&oacute; thể xử l&yacute; dữ liệu nhanh ph&ugrave; hợp c&aacute;c m&ocirc; h&igrave;nh c&ocirc;ng ty tr&ecirc;n dưới 100 nh&acirc;n vi&ecirc;n tiện lợi</p>

<p>Mắt đọc c&ocirc;ng nghệ mới nhất được chứng nhận với chip intel</p>

<p style="text-align:center"><img alt="" src="https://vinhnguyen.vn/images/companies/1/Product/may-cham-cong/ronald-jack-w200.jpg?1537436863832" style="height:480px; width:600px" /></p>

<p><strong>M&aacute;y chấm c&ocirc;ng v&acirc;n tay Ronald Jack W200</strong></p>

<p>Kiểu ứng dụng: V&acirc;n tay</p>

<p>Dung lượng bộ nhớ: 2000 v&acirc;n tay</p>

<p>Dung lượng: 80 000 lần</p>

<p>M&agrave;n h&igrave;nh hiển thị: M&agrave;n h&igrave;nh LCD m&agrave;u</p>

<p>B&agrave;n ph&iacute;m : 16 ph&iacute;m số</p>

<p>Đ&egrave;n hiệu: LED 2 m&agrave;u: Xanh v&agrave; đỏ</p>

<p>Kết nối với m&aacute;y vi t&iacute;nh: RS232/RS485 &ndash; TCP/IP ( RJ-45), USB</p>

<p>Ng&ocirc;n ngữ: Tiếng Anh hoặc Tiếng Việt</p>

<p>Một nh&acirc;n vi&ecirc;n c&oacute; thể đăng k&yacute; 1-10 dấu v&acirc;n tay v&agrave; 1 thẻ cảm ứng với 1 m&atilde; đăng k&yacute;.</p>

<p>Thiết bị được kết nối trực tiếp đến m&aacute;y t&iacute;nh hoặc th&ocirc;ng qua mạng TCP/IP</p>

<p style="text-align:center">&nbsp;</p>
</div>

<div class="main-dat-mua-ngay">
<div class="main-dat-mua-ngay-button">Mua Ngay Giao H&agrave;ng Free Nội Th&agrave;nh HCM
<div class="float-left icon_yeucautuvan">tư vấnY&ecirc;u cầu được tư vấn</div>
</div>

<p style="text-align:center">Gọi đặt mua: <a href="tel:0908555547">0908 5555 47</a> - <a href="tel:0904555547">0904 5555 47</a> (8:00 - 20:00)</p>
</div>
</div>

<div class="wysiwyg-content" id="content_files">&nbsp;</div>

<div class="wysiwyg-content" id="content_buy_together">&nbsp;</div>

<div class="wysiwyg-content" id="content_attachments">&nbsp;</div>

<div class="wysiwyg-content" id="content_required_products">&nbsp;</div>
</div>

<div class="view-product-face">
<h2>B&igrave;nh luận v&agrave; đ&aacute;nh gi&aacute;</h2>

<div class="discussion-block" id="content_discussion">
<div class="vocabulary">M&aacute;y chấm c&ocirc;ng Ronald Jack W200&nbsp;&nbsp;<strong>Đ&aacute;nh gi&aacute; </strong>&nbsp;&nbsp;4.3/5 4</div>
<!--<div class="ty-discussion-post__buttons buttons-container"> <a class="cm-dialog-opener cm-dialog-auto-size ty-btn__primary " rel="nofollow" data-ca-target-id="new_post_dialog_">Viết bình luận</a> </div>-->

<div class="ty-discussion-post-popup" id="new_post_dialog_1303">
<form action="https://vinhnguyen.vn/" id="add_post_form_1303" method="post" name="add_post_form"><input name="result_ids" type="hidden" value="average_rating*,content_discussion" /><input name="post_data[thread_id]" type="hidden" value="1216" /><input name="redirect_url" type="hidden" value="index.php?sp=may-cham-cong-nhan-vien-w200&amp;gclid=CjwKCAiA9K3gBRA4EiwACEhFe1JQvdXtcWDTJ6EVEmJyIbAxo8Z1NPuWm2quqH_eJflDyo14y-Rk4hoCxmUQAvD_BwE&amp;dispatch=products.view&amp;product_id=1303" /><input name="selected_section" type="hidden" value="" />
<div id="new_post_1303">
<div class="ty-control-group">Tin nhắn của bạn<textarea name="post_data[message]" rows="3"></textarea></div>

<div class="hidden_post">
<div class="clearfix">
<div class="post_left" style="margin-right:15px">
<div class="ty-control-group">T&ecirc;n bạn <input name="hint_post_data[name]" size="20" type="text" value="" /></div>

<div class="ty-control-group">E-mail <input name="hint_post_data[email]" size="20" type="text" value="" /></div>

<div class="ayour_rating ty-control-group">Đ&aacute;nh gi&aacute;:
<div class="clearfix cm-field-container">
<p><input name="post_data[rating_value]" type="radio" value="5" />Tuyệt vời! <input name="post_data[rating_value]" type="radio" value="4" />Rất tốt <input name="post_data[rating_value]" type="radio" value="3" />Trung b&igrave;nh <input name="post_data[rating_value]" type="radio" value="2" />Fair <input name="post_data[rating_value]" type="radio" value="1" />K&eacute;m</p>
</div>
</div>

<div class="buttons-container-submit"><input name="dispatch[discussion.add]" type="submit" value="Gửi" /></div>
</div>
</div>
<!--new_post_1303--></div>
</div>
</form>
</div>

<div id="posts_list">
<div class="cm-pagination-container pagination-container" id="pagination_contents_comments_1303">
<div class="ty-discussion-post__content">L&acirc;m (11/21/2018)
<div class="clearfix ty-discussion-post" id="post_39">
<div class="ty-discussion-post__rating">Trả lời <a class="cm-ajax cm-ajax-full-render like-item" href="index.php?sp=may-cham-cong-nhan-vien-w200&amp;gclid=CjwKCAiA9K3gBRA4EiwACEhFe1JQvdXtcWDTJ6EVEmJyIbAxo8Z1NPuWm2quqH_eJflDyo14y-Rk4hoCxmUQAvD_BwE&amp;dispatch=products.view&amp;product_id=1303&amp;item_like=39_21vd67d8ab4f4c10bf22aa353e27879133c91a" id="discussion_item_like_39" rel="nofollow">Th&iacute;ch 0<!--discussion_item_like_39--></a></div>

<div class="ty-discussion-post__message">M&aacute;y n&agrave;y hoạt đồng theo c&aacute;ch kết nối v&agrave;o m&aacute;y t&iacute;nh đ&uacute;ng kh&ocirc;ng shop? C&oacute; phần mềm g&igrave; đi k&egrave;m kh&ocirc;ng.</div>
</div>
</div>

<div class="clearfix list-cmt-item-parent" id="show-list-item_39">
<div class="clearfix form-parent form-send-ask hiden-form-post-item" id="hiden-form-post-item_39">
<div class="avatar icon-user">&nbsp;</div>

<form action="https://vinhnguyen.vn/" method="post" name="add_tra_loi_parent_form"><input name="result_ids" type="hidden" value="content_discussion" /><input name="redirect_url" type="hidden" value="index.php?sp=may-cham-cong-nhan-vien-w200&amp;gclid=CjwKCAiA9K3gBRA4EiwACEhFe1JQvdXtcWDTJ6EVEmJyIbAxo8Z1NPuWm2quqH_eJflDyo14y-Rk4hoCxmUQAvD_BwE&amp;dispatch=products.view&amp;product_id=1303" /> <input name="item_data[posts_per_page]" type="hidden" value="N" /><input name="item_data[post_id]" type="hidden" value="39" />
<div class="ty-control-group"><textarea name="item_data[description]" rows="3"></textarea>Tin nhắn của bạn</div>

<div class="hidden_post_item relative">
<div class="float-left ty-control-group">T&ecirc;n<input name="item_data[name]" style="height:35px" type="text" value="" /></div>

<div class="add_post buttons-container"><input name="dispatch[discussion.add_item]" type="submit" value="Gửi" /></div>

<div class="clear">&nbsp;</div>
</div>
</form>

<div class="clear">&nbsp;</div>
</div>

<div class="replay"><strong>B&iacute;ch Phương - 0904 5555 47</strong> <a class="cm-ajax cm-ajax-full-render like-replay" href="index.php?sp=may-cham-cong-nhan-vien-w200&amp;gclid=CjwKCAiA9K3gBRA4EiwACEhFe1JQvdXtcWDTJ6EVEmJyIbAxo8Z1NPuWm2quqH_eJflDyo14y-Rk4hoCxmUQAvD_BwE&amp;dispatch=products.view&amp;product_id=1303&amp;replay_like=33_21v182be0c5cdcd5072bb1864cdee4d3d6e91a" id="discussion_replay_like_3933" rel="nofollow">Th&iacute;ch 18<!--discussion_replay_like_3933--></a>

<div class="replay-content">Ch&agrave;o Anh L&acirc;m, M&aacute;y chấm c&ocirc;ng Ronald Jack W200 sử dụng nguồn điện trực tiếp. M&aacute;y được kết nối với mạng lan để r&uacute;t dữ liệu chấm c&ocirc;ng về m&aacute;y t&iacute;nh c&oacute; c&agrave;i phần mềm chấm c&ocirc;ng. B&ecirc;n em m&aacute;y chấm c&ocirc;ng được tặng k&egrave;m khi mua m&aacute;y ạ.<br />
Anh c&oacute; thể li&ecirc;n hệ số điện thoại hotline để được tư vấn : 0904 5555 47 - 0901 555547 - 0908 5555 47</div>
</div>
<!--show-list-item_39--></div>

<div class="ty-discussion-post__content">H&ugrave;ng (11/08/2018)
<div class="clearfix ty-discussion-post ty-discussion-post_even" id="post_32">
<div class="ty-discussion-post__rating">
<p>&nbsp;</p>
Trả lời <a class="cm-ajax cm-ajax-full-render like-item" href="index.php?sp=may-cham-cong-nhan-vien-w200&amp;gclid=CjwKCAiA9K3gBRA4EiwACEhFe1JQvdXtcWDTJ6EVEmJyIbAxo8Z1NPuWm2quqH_eJflDyo14y-Rk4hoCxmUQAvD_BwE&amp;dispatch=products.view&amp;product_id=1303&amp;item_like=32_21v6364d3f0f495b6ab9dcf8d3b5c6e0b0191a" id="discussion_item_like_32" rel="nofollow">Th&iacute;ch 39<!--discussion_item_like_32--></a></div>

<div class="ty-discussion-post__message">Ch&agrave;o Vinh Nguyễn ! cho m&igrave;nh hỏi m&igrave;nh ở H&oacute;c M&ocirc;n b&ecirc;n bạn c&oacute; lắp đặt tận nơi hay kh&ocirc;ng? m&igrave;nh cần mua m&aacute;y Ronald Jack W200 n&agrave;y khoảng c&aacute;ch lắp m&aacute;y khoảng 20m</div>
</div>
</div>

<div class="clearfix list-cmt-item-parent" id="show-list-item_32">
<div class="clearfix form-parent form-send-ask hiden-form-post-item" id="hiden-form-post-item_32">
<div class="avatar icon-user">&nbsp;</div>

<form action="https://vinhnguyen.vn/" method="post" name="add_tra_loi_parent_form"><input name="result_ids" type="hidden" value="content_discussion" /><input name="redirect_url" type="hidden" value="index.php?sp=may-cham-cong-nhan-vien-w200&amp;gclid=CjwKCAiA9K3gBRA4EiwACEhFe1JQvdXtcWDTJ6EVEmJyIbAxo8Z1NPuWm2quqH_eJflDyo14y-Rk4hoCxmUQAvD_BwE&amp;dispatch=products.view&amp;product_id=1303" /> <input name="item_data[posts_per_page]" type="hidden" value="N" /><input name="item_data[post_id]" type="hidden" value="32" />
<div class="ty-control-group"><textarea name="item_data[description]" rows="3"></textarea>Tin nhắn của bạn</div>

<div class="hidden_post_item relative">
<div class="float-left ty-control-group">T&ecirc;n<input name="item_data[name]" style="height:35px" type="text" value="" /></div>

<div class="add_post buttons-container"><input name="dispatch[discussion.add_item]" type="submit" value="Gửi" /></div>

<div class="clear">&nbsp;</div>
</div>
</form>

<div class="clear">&nbsp;</div>
</div>

<div class="replay"><strong>Vinh Nguyễn POS</strong> <strong>Quản trị vi&ecirc;n</strong> <a class="cm-ajax cm-ajax-full-render like-replay" href="index.php?sp=may-cham-cong-nhan-vien-w200&amp;gclid=CjwKCAiA9K3gBRA4EiwACEhFe1JQvdXtcWDTJ6EVEmJyIbAxo8Z1NPuWm2quqH_eJflDyo14y-Rk4hoCxmUQAvD_BwE&amp;dispatch=products.view&amp;product_id=1303&amp;replay_like=26_21v4e732ced3463d06de0ca9a15b615367791a" id="discussion_replay_like_3226" rel="nofollow">Th&iacute;ch 59<!--discussion_replay_like_3226--></a>

<div class="replay-content">Ch&agrave;o Anh H&ugrave;ng ! Ở khu vực H&oacute;c M&ocirc;n ngoại th&agrave;nh HCM chi ph&iacute; lắp đặt m&aacute;y b&ecirc;n Em l&agrave; 200.000đ ạ c&ograve;n về khoảng c&aacute;ch lắp đặt 20m b&ecirc;n Em tặng m&igrave;nh 05m d&acirc;y mạng v&agrave; t&iacute;nh ph&iacute; 15m d&acirc;y, b&ecirc;n Em đi d&acirc;y mạng Cat6E loại tốt v&agrave; cứng gi&aacute; d&acirc;y mạng 12.000đ/m Anh nh&eacute;, b&ecirc;n Em lắp đặt miễn ph&iacute; chỉ nội th&agrave;nh HCM Anh nh&eacute;</div>
</div>
<!--show-list-item_32--></div>

<div class="ty-discussion-post__content">L&yacute; Quốc Hưng (11/08/2018)
<div class="clearfix ty-discussion-post" id="post_33">
<div class="ty-discussion-post__rating">
<p>&nbsp;</p>
Trả lời <a class="cm-ajax cm-ajax-full-render like-item" href="index.php?sp=may-cham-cong-nhan-vien-w200&amp;gclid=CjwKCAiA9K3gBRA4EiwACEhFe1JQvdXtcWDTJ6EVEmJyIbAxo8Z1NPuWm2quqH_eJflDyo14y-Rk4hoCxmUQAvD_BwE&amp;dispatch=products.view&amp;product_id=1303&amp;item_like=33_21v182be0c5cdcd5072bb1864cdee4d3d6e91a" id="discussion_item_like_33" rel="nofollow">Th&iacute;ch 6<!--discussion_item_like_33--></a></div>

<div class="ty-discussion-post__message">Cho t&ocirc;i hỏi m&aacute;y n&agrave;y quản l&yacute; được bao nhi&ecirc;u nh&acirc;n vi&ecirc;n, t&ocirc;i đang cần m&aacute;y quản l&yacute; nh&agrave; h&agrave;ng khoảng 40 nh&acirc;n vi&ecirc;n</div>
</div>
</div>

<div class="clearfix list-cmt-item-parent" id="show-list-item_33">
<div class="clearfix form-parent form-send-ask hiden-form-post-item" id="hiden-form-post-item_33">
<div class="avatar icon-user">&nbsp;</div>

<form action="https://vinhnguyen.vn/" method="post" name="add_tra_loi_parent_form"><input name="result_ids" type="hidden" value="content_discussion" /><input name="redirect_url" type="hidden" value="index.php?sp=may-cham-cong-nhan-vien-w200&amp;gclid=CjwKCAiA9K3gBRA4EiwACEhFe1JQvdXtcWDTJ6EVEmJyIbAxo8Z1NPuWm2quqH_eJflDyo14y-Rk4hoCxmUQAvD_BwE&amp;dispatch=products.view&amp;product_id=1303" /> <input name="item_data[posts_per_page]" type="hidden" value="N" /><input name="item_data[post_id]" type="hidden" value="33" />
<div class="ty-control-group"><textarea name="item_data[description]" rows="3"></textarea>Tin nhắn của bạn</div>

<div class="hidden_post_item relative">
<div class="float-left ty-control-group">T&ecirc;n<input name="item_data[name]" style="height:35px" type="text" value="" /></div>

<div class="add_post buttons-container"><input name="dispatch[discussion.add_item]" type="submit" value="Gửi" /></div>

<div class="clear">&nbsp;</div>
</div>
</form>

<div class="clear">&nbsp;</div>
</div>

<div class="replay"><strong>Vinh Nguyễn POS</strong> <strong>Quản trị vi&ecirc;n</strong> <a class="cm-ajax cm-ajax-full-render like-replay" href="index.php?sp=may-cham-cong-nhan-vien-w200&amp;gclid=CjwKCAiA9K3gBRA4EiwACEhFe1JQvdXtcWDTJ6EVEmJyIbAxo8Z1NPuWm2quqH_eJflDyo14y-Rk4hoCxmUQAvD_BwE&amp;dispatch=products.view&amp;product_id=1303&amp;replay_like=24_21v1ff1de774005f8da13f42943881c655f91a" id="discussion_replay_like_3324" rel="nofollow">Th&iacute;ch 100<!--discussion_replay_like_3324--></a>

<div class="replay-content">Ch&agrave;o Anh Hưng !<br />
Hiện tại model ronald Jack W200 c&oacute; bộ nhớ lưu trữ 2000 v&acirc;n tay m&aacute;y c&oacute; thể đ&aacute;p ứng tốt c&aacute;c nhu cầu quản l&yacute; dươi 100 nh&acirc;n vi&ecirc;n Anh nh&eacute;, m&aacute;y n&agrave;y rất ph&ugrave; hợp với doanh nghiệp m&igrave;nh với mức nh&acirc;n vi&ecirc;n 40 người như Anh n&oacute;i ở tr&ecirc;n ạ</div>
</div>
<!--show-list-item_33--></div>

<div class="ty-discussion-post__content">Anh Thư (11/10/2018)
<div class="clearfix ty-discussion-post ty-discussion-post_even" id="post_36">
<div class="ty-discussion-post__rating">
<p>&nbsp;</p>
Trả lời <a class="cm-ajax cm-ajax-full-render like-item" href="index.php?sp=may-cham-cong-nhan-vien-w200&amp;gclid=CjwKCAiA9K3gBRA4EiwACEhFe1JQvdXtcWDTJ6EVEmJyIbAxo8Z1NPuWm2quqH_eJflDyo14y-Rk4hoCxmUQAvD_BwE&amp;dispatch=products.view&amp;product_id=1303&amp;item_like=36_21v19ca14e7ea6328a42e0eb13d585e4c2291a" id="discussion_item_like_36" rel="nofollow">Th&iacute;ch 1<!--discussion_item_like_36--></a></div>

<div class="ty-discussion-post__message">Cho m&igrave;nh hỏi chi ph&iacute; lắp đặt ở KCN Nhơn Trạch Đồng Nai th&igrave; thế n&agrave;o ạ ?</div>
</div>
</div>

<div class="clearfix list-cmt-item-parent" id="show-list-item_36">
<div class="clearfix form-parent form-send-ask hiden-form-post-item" id="hiden-form-post-item_36">
<div class="avatar icon-user">&nbsp;</div>

<form action="https://vinhnguyen.vn/" method="post" name="add_tra_loi_parent_form"><input name="result_ids" type="hidden" value="content_discussion" /><input name="redirect_url" type="hidden" value="index.php?sp=may-cham-cong-nhan-vien-w200&amp;gclid=CjwKCAiA9K3gBRA4EiwACEhFe1JQvdXtcWDTJ6EVEmJyIbAxo8Z1NPuWm2quqH_eJflDyo14y-Rk4hoCxmUQAvD_BwE&amp;dispatch=products.view&amp;product_id=1303" /> <input name="item_data[posts_per_page]" type="hidden" value="N" /><input name="item_data[post_id]" type="hidden" value="36" />
<div class="ty-control-group"><textarea name="item_data[description]" rows="3"></textarea>Tin nhắn của bạn</div>

<div class="hidden_post_item relative">
<div class="float-left ty-control-group">T&ecirc;n<input name="item_data[name]" style="height:35px" type="text" value="" /></div>

<div class="add_post buttons-container"><input name="dispatch[discussion.add_item]" type="submit" value="Gửi" /></div>

<div class="clear">&nbsp;</div>
</div>
</form>

<div class="clear">&nbsp;</div>
</div>

<div class="replay"><strong>Quản trị vi&ecirc;n</strong> <a class="cm-ajax cm-ajax-full-render like-replay" href="index.php?sp=may-cham-cong-nhan-vien-w200&amp;gclid=CjwKCAiA9K3gBRA4EiwACEhFe1JQvdXtcWDTJ6EVEmJyIbAxo8Z1NPuWm2quqH_eJflDyo14y-Rk4hoCxmUQAvD_BwE&amp;dispatch=products.view&amp;product_id=1303&amp;replay_like=30_21v34173cb38f07f89ddbebc2ac9128303f91a" id="discussion_replay_like_3630" rel="nofollow">Th&iacute;ch 23<!--discussion_replay_like_3630--></a>

<div class="replay-content">Ch&agrave;o Anh Thư, đối với sản phẩm m&aacute;y chấm c&ocirc;ng b&ecirc;n em giao h&agrave;ng, lắp đặt hướng dẫn sử dụng tận nơi v&agrave; ph&iacute; giao h&agrave;ng tại đồng nai l&agrave; 300.000. Chị c&oacute; thể li&ecirc;n hệ hotline để được hỗ trợ th&ecirc;m ạ.<br />
Hotline: 0901 5555 47/ 0904 5555 47/ 0908 5555 47</div>
</div>
<!--show-list-item_36--></div>
<!--pagination_contents_comments_1303--></div>
<!--posts_list--></div>
<!--content_discussion--></div>
</div>

<div class="box-block-center sidebox-wrapper-nhansam" id="block__90">
<h3>Sản phẩm li&ecirc;n quan</h3>

<div class="sidebox-body_nhansam">
<div class="clearfix grid_product_list_column">
<div class="product_list_column4">
<div class="grid-list__item">
<div class="grid-list__image"><a href="https://vinhnguyen.vn/may-cham-cong/may-cham-cong-ronald-jack-x628pro.html" title="Máy chấm công Ronald Jack X628Pro"><img alt="" class="pict" src="https://vinhnguyen.vn/images/thumbnails/275/220/detailed/2/x628-pro.jpg" style="height:220px; width:275px" title="" /> GIẢM 250.000đ </a></div>

<div class="grid-list__rating no-rating">&nbsp;</div>

<div class="grid-list__price"><input name="appearance[show_price_values]" type="hidden" value="1" /> <input name="appearance[show_price]" type="hidden" value="1" /> 3.150.000&nbsp;<u>đ</u> <!--price_update_90000735--> 3.400.000&nbsp;<u>đ</u> <!--old_price_update_90000735--></div>

<div class="grid-list__item-name"><a class="product-title" href="https://vinhnguyen.vn/may-cham-cong/may-cham-cong-ronald-jack-x628pro.html">M&aacute;y chấm c&ocirc;ng Ronald Jack X628Pro</a></div>
</div>
</div>

<div class="product_list_column4">
<div class="grid-list__item">
<div class="grid-list__image"><a href="https://vinhnguyen.vn/may-cham-cong/may-cham-cong-ronald-jack-t8.html" title="Máy chấm công Ronald Jack T8"><img alt="" class="pict" src="https://vinhnguyen.vn/images/thumbnails/275/220/detailed/2/Ronald-jack-t8.jpg" style="height:220px; width:275px" title="" /> Mua Online Giảm 100K </a></div>

<div class="grid-list__rating no-rating">&nbsp;</div>

<div class="grid-list__price"><input name="appearance[show_price_values]" type="hidden" value="1" /> <input name="appearance[show_price]" type="hidden" value="1" /> 2.200.000&nbsp;<u>đ</u> <!--price_update_90000735--> 3.150.000&nbsp;<u>đ</u> <!--old_price_update_90000735--></div>

<div class="grid-list__item-name"><a class="product-title" href="https://vinhnguyen.vn/may-cham-cong/may-cham-cong-ronald-jack-t8.html">M&aacute;y chấm c&ocirc;ng Ronald Jack T8</a></div>
</div>
</div>

<div class="product_list_column4">
<div class="grid-list__item">
<div class="grid-list__image"><a href="https://vinhnguyen.vn/may-cham-cong/may-cham-cong-ronald-jack-4000-tid.html" title="Máy chấm công Ronald Jack 4000 TID"><img alt="" class="pict" src="https://vinhnguyen.vn/images/thumbnails/275/220/detailed/2/ronald-jack-4000-tid.jpg" style="height:220px; width:275px" title="" /> Si&ecirc;u giảm gi&aacute; </a></div>

<div class="grid-list__rating no-rating">&nbsp;</div>

<div class="grid-list__price"><input name="appearance[show_price_values]" type="hidden" value="1" /> <input name="appearance[show_price]" type="hidden" value="1" /> 2.990.000&nbsp;<u>đ</u> <!--price_update_90000735--> 3.450.000&nbsp;<u>đ</u> <!--old_price_update_90000735--></div>

<div class="grid-list__item-name"><a class="product-title" href="https://vinhnguyen.vn/may-cham-cong/may-cham-cong-ronald-jack-4000-tid.html">M&aacute;y chấm c&ocirc;ng Ronald Jack 4000 TID</a></div>
</div>
</div>

<div class="product_list_column4">
<div class="grid-list__item grid_list_row_last">
<div class="grid-list__image"><a href="https://vinhnguyen.vn/may-cham-cong/may-cham-cong-ronald-jack-rj550.html" title="Máy chấm công Ronald Jack RJ550"><img alt="" class="pict" src="https://vinhnguyen.vn/images/thumbnails/275/220/detailed/3/ronald-jack-rj550-new.jpg" style="height:220px; width:275px" title="" /> Si&ecirc;u giảm gi&aacute; </a></div>

<div class="grid-list__rating no-rating">&nbsp;</div>

<div class="grid-list__price"><input name="appearance[show_price_values]" type="hidden" value="1" /> <input name="appearance[show_price]" type="hidden" value="1" /> 2.300.000&nbsp;<u>đ</u> <!--price_update_90000735--> <!--old_price_update_90000735--></div>

<div class="grid-list__item-name"><a class="product-title" href="https://vinhnguyen.vn/may-cham-cong/may-cham-cong-ronald-jack-rj550.html">M&aacute;y chấm c&ocirc;ng Ronald Jack RJ550</a></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
', NULL, CAST(N'2018-10-13 14:02:18.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (14, N'Máy chấm công SamSung-5321', N'may-cham-cong-samsung-5321', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/8580_ma__y_ch____m_c__ng_ronald_jack_u160c_1.jpg', NULL, 2300000, NULL, NULL, 5, 4, N'<p>Xuất xứ Trung Quốc<br />
C&ocirc;ng nghệ Chip intel của Mỹ<br />
C&ocirc;ng suất lưu trữ 2000 dấu v&acirc;n tay + thẻ cảm ứng + password<br />
Bộ nhớ 200.000 lần giao dịch v&agrave;o, ra<br />
Access Control T&iacute;ch hợp chức năng access control<br />
T&iacute;ch hợp PIN LƯU ĐIỆN<br />
V&acirc;n tay/ nh&acirc;n vi&ecirc;n Tối đa 10 v&acirc;n tay / 1 nh&acirc;n vi&ecirc;n<br />
M&agrave;n h&igrave;nh m&agrave;u 2.4 inch<br />
chức năng t&ugrave;y chọn TCP/IP; USB hot, USB slave, Wiegand in<br />
&amp; out, 2 x Relay<br />
giao tiếp WiFi, Battery, RFID card, Printer, language,<br />
LAN/WAN<br />
Thời gian nhận dạng &lt; 0.5 s<br />
Cảm biến v&acirc;n tay Bền, chống trầy, tốc độ cao<br />
Nguồn điện DC 5 V 0.8A<br />
K&iacute;ch Thước 180mmL x 130mmW x 33mmT<br />
Dữ liệu Lưu trong m&aacute;y v&agrave; kh&ocirc;ng bị mất khi mất điện</p>
', NULL, CAST(N'2018-10-13 14:02:33.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (15, N'Máy chấm công Sony-262', N'may-cham-cong-sony-262', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/download%20(1)(1).jpg', NULL, 2600000, NULL, NULL, 0, 4, N'<p>Xuất xứ Trung Quốc<br />
C&ocirc;ng nghệ Chip intel của Mỹ<br />
C&ocirc;ng suất lưu trữ 2000 dấu v&acirc;n tay + thẻ cảm ứng + password<br />
Bộ nhớ 200.000 lần giao dịch v&agrave;o, ra<br />
Access Control T&iacute;ch hợp chức năng access control<br />
T&iacute;ch hợp PIN LƯU ĐIỆN<br />
V&acirc;n tay/ nh&acirc;n vi&ecirc;n Tối đa 10 v&acirc;n tay / 1 nh&acirc;n vi&ecirc;n<br />
M&agrave;n h&igrave;nh m&agrave;u 2.4 inch<br />
chức năng t&ugrave;y chọn TCP/IP; USB hot, USB slave, Wiegand in<br />
&amp; out, 2 x Relay<br />
giao tiếp WiFi, Battery, RFID card, Printer, language,<br />
LAN/WAN<br />
Thời gian nhận dạng &lt; 0.5 s<br />
Cảm biến v&acirc;n tay Bền, chống trầy, tốc độ cao<br />
Nguồn điện DC 5 V 0.8A<br />
K&iacute;ch Thước 180mmL x 130mmW x 33mmT<br />
Dữ liệu Lưu trong m&aacute;y v&agrave; kh&ocirc;ng bị mất khi mất điện</p>
', NULL, CAST(N'2018-10-13 14:02:48.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (16, N'Máy chấm công SamSung-753', N'may-cham-cong-samsung-753', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/download%20(1)(1).jpg', NULL, 3200000, NULL, NULL, 5, 4, N'<p>Xuất xứ Trung Quốc<br />
C&ocirc;ng nghệ Chip intel của Mỹ<br />
C&ocirc;ng suất lưu trữ 2000 dấu v&acirc;n tay + thẻ cảm ứng + password<br />
Bộ nhớ 200.000 lần giao dịch v&agrave;o, ra<br />
Access Control T&iacute;ch hợp chức năng access control<br />
T&iacute;ch hợp PIN LƯU ĐIỆN<br />
V&acirc;n tay/ nh&acirc;n vi&ecirc;n Tối đa 10 v&acirc;n tay / 1 nh&acirc;n vi&ecirc;n<br />
M&agrave;n h&igrave;nh m&agrave;u 2.4 inch<br />
chức năng t&ugrave;y chọn TCP/IP; USB hot, USB slave, Wiegand in<br />
&amp; out, 2 x Relay<br />
giao tiếp WiFi, Battery, RFID card, Printer, language,<br />
LAN/WAN<br />
Thời gian nhận dạng &lt; 0.5 s<br />
Cảm biến v&acirc;n tay Bền, chống trầy, tốc độ cao<br />
Nguồn điện DC 5 V 0.8A<br />
K&iacute;ch Thước 180mmL x 130mmW x 33mmT<br />
Dữ liệu Lưu trong m&aacute;y v&agrave; kh&ocirc;ng bị mất khi mất điện</p>
', NULL, CAST(N'2018-10-13 14:03:08.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (17, N'Máy chấm công LG-542', N'may-cham-cong-lg-542', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/download(1).jpg', NULL, 2500000, NULL, NULL, 10, 4, N'<p>Xuất xứ Trung Quốc<br />
C&ocirc;ng nghệ Chip intel của Mỹ<br />
C&ocirc;ng suất lưu trữ 2000 dấu v&acirc;n tay + thẻ cảm ứng + password<br />
Bộ nhớ 200.000 lần giao dịch v&agrave;o, ra<br />
Access Control T&iacute;ch hợp chức năng access control<br />
T&iacute;ch hợp PIN LƯU ĐIỆN<br />
V&acirc;n tay/ nh&acirc;n vi&ecirc;n Tối đa 10 v&acirc;n tay / 1 nh&acirc;n vi&ecirc;n<br />
M&agrave;n h&igrave;nh m&agrave;u 2.4 inch<br />
chức năng t&ugrave;y chọn TCP/IP; USB hot, USB slave, Wiegand in<br />
&amp; out, 2 x Relay<br />
giao tiếp WiFi, Battery, RFID card, Printer, language,<br />
LAN/WAN<br />
Thời gian nhận dạng &lt; 0.5 s<br />
Cảm biến v&acirc;n tay Bền, chống trầy, tốc độ cao<br />
Nguồn điện DC 5 V 0.8A<br />
K&iacute;ch Thước 180mmL x 130mmW x 33mmT<br />
Dữ liệu Lưu trong m&aacute;y v&agrave; kh&ocirc;ng bị mất khi mất điện</p>
', NULL, CAST(N'2018-10-13 14:03:31.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (18, N'Máy chấm công Rambo-241', N'may-cham-cong-rambo-241', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/may-cham-cong-van-tay-k21-rambo-00.jpg', NULL, 2300000, NULL, NULL, 0, 4, N'<p>Xuất xứ Trung Quốc<br />
C&ocirc;ng nghệ Chip intel của Mỹ<br />
C&ocirc;ng suất lưu trữ 2000 dấu v&acirc;n tay + thẻ cảm ứng + password<br />
Bộ nhớ 200.000 lần giao dịch v&agrave;o, ra<br />
Access Control T&iacute;ch hợp chức năng access control<br />
T&iacute;ch hợp PIN LƯU ĐIỆN<br />
V&acirc;n tay/ nh&acirc;n vi&ecirc;n Tối đa 10 v&acirc;n tay / 1 nh&acirc;n vi&ecirc;n<br />
M&agrave;n h&igrave;nh m&agrave;u 2.4 inch<br />
chức năng t&ugrave;y chọn TCP/IP; USB hot, USB slave, Wiegand in<br />
&amp; out, 2 x Relay<br />
giao tiếp WiFi, Battery, RFID card, Printer, language,<br />
LAN/WAN<br />
Thời gian nhận dạng &lt; 0.5 s<br />
Cảm biến v&acirc;n tay Bền, chống trầy, tốc độ cao<br />
Nguồn điện DC 5 V 0.8A<br />
K&iacute;ch Thước 180mmL x 130mmW x 33mmT<br />
Dữ liệu Lưu trong m&aacute;y v&agrave; kh&ocirc;ng bị mất khi mất điện</p>
', NULL, CAST(N'2018-10-13 14:03:44.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (19, N'Máy chấm công LG-584', N'may-cham-cong-lg-584', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/may-cham-cong-van-tay-RONALD-JACK-DG-1000.jpg', NULL, 4200000, NULL, NULL, 10, 4, N'<p>Xuất xứ Trung Quốc<br />
C&ocirc;ng nghệ Chip intel của Mỹ<br />
C&ocirc;ng suất lưu trữ 2000 dấu v&acirc;n tay + thẻ cảm ứng + password<br />
Bộ nhớ 200.000 lần giao dịch v&agrave;o, ra<br />
Access Control T&iacute;ch hợp chức năng access control<br />
T&iacute;ch hợp PIN LƯU ĐIỆN<br />
V&acirc;n tay/ nh&acirc;n vi&ecirc;n Tối đa 10 v&acirc;n tay / 1 nh&acirc;n vi&ecirc;n<br />
M&agrave;n h&igrave;nh m&agrave;u 2.4 inch<br />
chức năng t&ugrave;y chọn TCP/IP; USB hot, USB slave, Wiegand in<br />
&amp; out, 2 x Relay<br />
giao tiếp WiFi, Battery, RFID card, Printer, language,<br />
LAN/WAN<br />
Thời gian nhận dạng &lt; 0.5 s<br />
Cảm biến v&acirc;n tay Bền, chống trầy, tốc độ cao<br />
Nguồn điện DC 5 V 0.8A<br />
K&iacute;ch Thước 180mmL x 130mmW x 33mmT<br />
Dữ liệu Lưu trong m&aacute;y v&agrave; kh&ocirc;ng bị mất khi mất điện</p>
', NULL, CAST(N'2018-10-13 14:03:57.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (20, N'Chuông cửa có hình hikvision-ds-kis', N'chuong-cua-co-hinh-hikvision-ds-kis', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Chuong%20cua%20co%20hinh/bo-chuong-cua-co-hinh-hikvision-ds-kis201.jpg', NULL, 2300000, NULL, NULL, 5, 5, N'<h2>M&ocirc; tả sản phẩm Bộ chu&ocirc;ng cửa c&oacute; h&igrave;nh Hikvision KIS202</h2>

<p>Sản phẩm n&agrave;y l&agrave; t&agrave;i sản c&aacute; nh&acirc;n được b&aacute;n bởi Nh&agrave; B&aacute;n H&agrave;ng C&aacute; Nh&acirc;n v&agrave; kh&ocirc;ng thuộc đối tượng phải chịu thuế GTGT. Do đ&oacute; h&oacute;a đơn VAT kh&ocirc;ng được cấp trong trường hợp n&agrave;y.&nbsp;</p>

<ul>
	<li>- Camera độ ph&acirc;n giải 720 &times; 576&nbsp;</li>
	<li>- C&oacute; hỗ trợ đ&egrave;n hồng ngoại (Tầm xa 2m)</li>
	<li>- T&iacute;ch hợp Mic v&agrave; Loa (C&ocirc;ng nghệ giảm nhiễu v&agrave; tiếng vọng)</li>
	<li>- Vỏ hợp kim nh&ocirc;m ,thiết kế đẹp.</li>
	<li>- C&oacute; cổng kết nối đến kh&oacute;a điện</li>
	<li>- K&iacute;ch thước 128 mm &times; 42 mm &times; 24.8 mm</li>
	<li>- Hỗ trợ 1 n&uacute;t kết nối tới 3 m&agrave;n DS-KH2200</li>
	<li>- Kết nối trực tiếp bằng 4 d&acirc;y từ n&uacute;t đến m&agrave;n.</li>
	<li>- M&agrave;n h&igrave;nh m&agrave;u TFT LCD, K&iacute;ch thước 7-Inch, độ ph&acirc;n giải 800 &times; 480&nbsp;</li>
	<li>- Hỗ trợ n&uacute;t ấn cứng vật l&yacute;</li>
	<li>- T&iacute;ch hợp Mic v&agrave; Loa (C&ocirc;ng nghệ giảm nhiễu v&agrave; tiếng vọng)</li>
	<li>- 1 jack 4 ch&acirc;n đấu nối (1 ch&acirc;n tiếng, 1 ch&acirc;n h&igrave;nh, 1 ch&acirc;n nguồn, 1 chấn nối đất.</li>
	<li>- N&uacute;t mở kh&oacute;a điện</li>
	<li>- Hỗ trợ hiển thị camera Analog</li>
	<li>- K&iacute;ch thước 195.8 mm x 132.8 mm x 18.39 mm</li>
	<li>- Bảo h&agrave;nh ch&iacute;nh h&atilde;ng 12 th&aacute;ng</li>
</ul>

<p><img src="https://sg-test-11.slatic.net/shop/48483780466e40d1b21bc23a570034be.png" /><img src="https://vn-test-11.slatic.net/shop/21624397890a26531f967dc7120e3b7d.jpeg" /></p>

<p><img src="https://vn-test-11.slatic.net/shop/a8fb29a3dae04a7b982206451a6bb009.jpeg" /></p>

<h2>Đặc t&iacute;nh sản phẩm</h2>

<ul>
	<li>Thương hiệu
	<p>No Brand</p>
	</li>
	<li>SKU
	<p>249342228_VNAMZ-328157684</p>
	</li>
	<li>D&ograve;ng sản phẩm
	<p>door phone</p>
	</li>
	<li>Loại bảo h&agrave;nh
	<p>Bằng H&oacute;a đơn mua h&agrave;ng</p>
	</li>
	<li>Thời gian bảo h&agrave;nh
	<p>12 th&aacute;ng</p>
	</li>
</ul>

<p>Bộ sản phẩm bao gồm</p>

<p>m&agrave;n h&igrave;nh, n&uacute;t ấn camera, phụ kiện k&egrave;m theo</p>
', NULL, CAST(N'2018-10-13 14:04:46.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (21, N'Chuông cửa có hình Panasonic-nh-311', N'chuong-cua-co-hinh-panasonic-nh-311', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Chuong%20cua%20co%20hinh/bo-chuong-cua-man-hinh-7inch-panasonic-vl-sv71vn.jpg', NULL, 2310000, NULL, NULL, 0, 5, N'<h2>M&ocirc; tả sản phẩm Bộ chu&ocirc;ng cửa c&oacute; h&igrave;nh Hikvision KIS202</h2>

<p>Sản phẩm n&agrave;y l&agrave; t&agrave;i sản c&aacute; nh&acirc;n được b&aacute;n bởi Nh&agrave; B&aacute;n H&agrave;ng C&aacute; Nh&acirc;n v&agrave; kh&ocirc;ng thuộc đối tượng phải chịu thuế GTGT. Do đ&oacute; h&oacute;a đơn VAT kh&ocirc;ng được cấp trong trường hợp n&agrave;y.&nbsp;</p>

<ul>
	<li>- Camera độ ph&acirc;n giải 720 &times; 576&nbsp;</li>
	<li>- C&oacute; hỗ trợ đ&egrave;n hồng ngoại (Tầm xa 2m)</li>
	<li>- T&iacute;ch hợp Mic v&agrave; Loa (C&ocirc;ng nghệ giảm nhiễu v&agrave; tiếng vọng)</li>
	<li>- Vỏ hợp kim nh&ocirc;m ,thiết kế đẹp.</li>
	<li>- C&oacute; cổng kết nối đến kh&oacute;a điện</li>
	<li>- K&iacute;ch thước 128 mm &times; 42 mm &times; 24.8 mm</li>
	<li>- Hỗ trợ 1 n&uacute;t kết nối tới 3 m&agrave;n DS-KH2200</li>
	<li>- Kết nối trực tiếp bằng 4 d&acirc;y từ n&uacute;t đến m&agrave;n.</li>
	<li>- M&agrave;n h&igrave;nh m&agrave;u TFT LCD, K&iacute;ch thước 7-Inch, độ ph&acirc;n giải 800 &times; 480&nbsp;</li>
	<li>- Hỗ trợ n&uacute;t ấn cứng vật l&yacute;</li>
	<li>- T&iacute;ch hợp Mic v&agrave; Loa (C&ocirc;ng nghệ giảm nhiễu v&agrave; tiếng vọng)</li>
	<li>- 1 jack 4 ch&acirc;n đấu nối (1 ch&acirc;n tiếng, 1 ch&acirc;n h&igrave;nh, 1 ch&acirc;n nguồn, 1 chấn nối đất.</li>
	<li>- N&uacute;t mở kh&oacute;a điện</li>
	<li>- Hỗ trợ hiển thị camera Analog</li>
	<li>- K&iacute;ch thước 195.8 mm x 132.8 mm x 18.39 mm</li>
	<li>- Bảo h&agrave;nh ch&iacute;nh h&atilde;ng 12 th&aacute;ng</li>
</ul>

<p><img src="https://sg-test-11.slatic.net/shop/48483780466e40d1b21bc23a570034be.png" /><img src="https://vn-test-11.slatic.net/shop/21624397890a26531f967dc7120e3b7d.jpeg" /></p>

<p><img src="https://vn-test-11.slatic.net/shop/a8fb29a3dae04a7b982206451a6bb009.jpeg" /></p>

<h2>Đặc t&iacute;nh sản phẩm</h2>

<ul>
	<li>Thương hiệu
	<p>No Brand</p>
	</li>
	<li>SKU
	<p>249342228_VNAMZ-328157684</p>
	</li>
	<li>D&ograve;ng sản phẩm
	<p>door phone</p>
	</li>
	<li>Loại bảo h&agrave;nh
	<p>Bằng H&oacute;a đơn mua h&agrave;ng</p>
	</li>
	<li>Thời gian bảo h&agrave;nh
	<p>12 th&aacute;ng</p>
	</li>
</ul>

<p>Bộ sản phẩm bao gồm</p>

<p>m&agrave;n h&igrave;nh, n&uacute;t ấn camera, phụ kiện k&egrave;m theo</p>
', NULL, CAST(N'2018-10-13 14:05:04.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (22, N'Chuông cửa có hình Panasonic-nh-311', N'chuong-cua-co-hinh-panasonic-nh-311', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Chuong%20cua%20co%20hinh/chuong-cua-panasonic_s727.jpg', NULL, 3200000, NULL, NULL, 5, 5, N'<h2>M&ocirc; tả sản phẩm Bộ chu&ocirc;ng cửa c&oacute; h&igrave;nh Hikvision KIS202</h2>

<p>Sản phẩm n&agrave;y l&agrave; t&agrave;i sản c&aacute; nh&acirc;n được b&aacute;n bởi Nh&agrave; B&aacute;n H&agrave;ng C&aacute; Nh&acirc;n v&agrave; kh&ocirc;ng thuộc đối tượng phải chịu thuế GTGT. Do đ&oacute; h&oacute;a đơn VAT kh&ocirc;ng được cấp trong trường hợp n&agrave;y.&nbsp;</p>

<ul>
	<li>- Camera độ ph&acirc;n giải 720 &times; 576&nbsp;</li>
	<li>- C&oacute; hỗ trợ đ&egrave;n hồng ngoại (Tầm xa 2m)</li>
	<li>- T&iacute;ch hợp Mic v&agrave; Loa (C&ocirc;ng nghệ giảm nhiễu v&agrave; tiếng vọng)</li>
	<li>- Vỏ hợp kim nh&ocirc;m ,thiết kế đẹp.</li>
	<li>- C&oacute; cổng kết nối đến kh&oacute;a điện</li>
	<li>- K&iacute;ch thước 128 mm &times; 42 mm &times; 24.8 mm</li>
	<li>- Hỗ trợ 1 n&uacute;t kết nối tới 3 m&agrave;n DS-KH2200</li>
	<li>- Kết nối trực tiếp bằng 4 d&acirc;y từ n&uacute;t đến m&agrave;n.</li>
	<li>- M&agrave;n h&igrave;nh m&agrave;u TFT LCD, K&iacute;ch thước 7-Inch, độ ph&acirc;n giải 800 &times; 480&nbsp;</li>
	<li>- Hỗ trợ n&uacute;t ấn cứng vật l&yacute;</li>
	<li>- T&iacute;ch hợp Mic v&agrave; Loa (C&ocirc;ng nghệ giảm nhiễu v&agrave; tiếng vọng)</li>
	<li>- 1 jack 4 ch&acirc;n đấu nối (1 ch&acirc;n tiếng, 1 ch&acirc;n h&igrave;nh, 1 ch&acirc;n nguồn, 1 chấn nối đất.</li>
	<li>- N&uacute;t mở kh&oacute;a điện</li>
	<li>- Hỗ trợ hiển thị camera Analog</li>
	<li>- K&iacute;ch thước 195.8 mm x 132.8 mm x 18.39 mm</li>
	<li>- Bảo h&agrave;nh ch&iacute;nh h&atilde;ng 12 th&aacute;ng</li>
</ul>

<p><img src="https://sg-test-11.slatic.net/shop/48483780466e40d1b21bc23a570034be.png" /><img src="https://vn-test-11.slatic.net/shop/21624397890a26531f967dc7120e3b7d.jpeg" /></p>

<p><img src="https://vn-test-11.slatic.net/shop/a8fb29a3dae04a7b982206451a6bb009.jpeg" /></p>

<h2>Đặc t&iacute;nh sản phẩm</h2>

<ul>
	<li>Thương hiệu
	<p>No Brand</p>
	</li>
	<li>SKU
	<p>249342228_VNAMZ-328157684</p>
	</li>
	<li>D&ograve;ng sản phẩm
	<p>door phone</p>
	</li>
	<li>Loại bảo h&agrave;nh
	<p>Bằng H&oacute;a đơn mua h&agrave;ng</p>
	</li>
	<li>Thời gian bảo h&agrave;nh
	<p>12 th&aacute;ng</p>
	</li>
</ul>

<p>Bộ sản phẩm bao gồm</p>

<p>m&agrave;n h&igrave;nh, n&uacute;t ấn camera, phụ kiện k&egrave;m theo</p>
', NULL, CAST(N'2018-10-13 14:05:16.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (23, N'Chuông cửa có hình Sony-fr-31', N'chuong-cua-co-hinh-sony-fr-31', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Chuong%20cua%20co%20hinh/chuong_cua.jpg', NULL, 6000000, NULL, NULL, 10, 5, N'<h2>M&ocirc; tả sản phẩm Bộ chu&ocirc;ng cửa c&oacute; h&igrave;nh Hikvision KIS202</h2>

<p>Sản phẩm n&agrave;y l&agrave; t&agrave;i sản c&aacute; nh&acirc;n được b&aacute;n bởi Nh&agrave; B&aacute;n H&agrave;ng C&aacute; Nh&acirc;n v&agrave; kh&ocirc;ng thuộc đối tượng phải chịu thuế GTGT. Do đ&oacute; h&oacute;a đơn VAT kh&ocirc;ng được cấp trong trường hợp n&agrave;y.&nbsp;</p>

<ul>
	<li>- Camera độ ph&acirc;n giải 720 &times; 576&nbsp;</li>
	<li>- C&oacute; hỗ trợ đ&egrave;n hồng ngoại (Tầm xa 2m)</li>
	<li>- T&iacute;ch hợp Mic v&agrave; Loa (C&ocirc;ng nghệ giảm nhiễu v&agrave; tiếng vọng)</li>
	<li>- Vỏ hợp kim nh&ocirc;m ,thiết kế đẹp.</li>
	<li>- C&oacute; cổng kết nối đến kh&oacute;a điện</li>
	<li>- K&iacute;ch thước 128 mm &times; 42 mm &times; 24.8 mm</li>
	<li>- Hỗ trợ 1 n&uacute;t kết nối tới 3 m&agrave;n DS-KH2200</li>
	<li>- Kết nối trực tiếp bằng 4 d&acirc;y từ n&uacute;t đến m&agrave;n.</li>
	<li>- M&agrave;n h&igrave;nh m&agrave;u TFT LCD, K&iacute;ch thước 7-Inch, độ ph&acirc;n giải 800 &times; 480&nbsp;</li>
	<li>- Hỗ trợ n&uacute;t ấn cứng vật l&yacute;</li>
	<li>- T&iacute;ch hợp Mic v&agrave; Loa (C&ocirc;ng nghệ giảm nhiễu v&agrave; tiếng vọng)</li>
	<li>- 1 jack 4 ch&acirc;n đấu nối (1 ch&acirc;n tiếng, 1 ch&acirc;n h&igrave;nh, 1 ch&acirc;n nguồn, 1 chấn nối đất.</li>
	<li>- N&uacute;t mở kh&oacute;a điện</li>
	<li>- Hỗ trợ hiển thị camera Analog</li>
	<li>- K&iacute;ch thước 195.8 mm x 132.8 mm x 18.39 mm</li>
	<li>- Bảo h&agrave;nh ch&iacute;nh h&atilde;ng 12 th&aacute;ng</li>
</ul>

<p><img src="https://sg-test-11.slatic.net/shop/48483780466e40d1b21bc23a570034be.png" /><img src="https://vn-test-11.slatic.net/shop/21624397890a26531f967dc7120e3b7d.jpeg" /></p>

<p><img src="https://vn-test-11.slatic.net/shop/a8fb29a3dae04a7b982206451a6bb009.jpeg" /></p>

<h2>Đặc t&iacute;nh sản phẩm</h2>

<ul>
	<li>Thương hiệu
	<p>No Brand</p>
	</li>
	<li>SKU
	<p>249342228_VNAMZ-328157684</p>
	</li>
	<li>D&ograve;ng sản phẩm
	<p>door phone</p>
	</li>
	<li>Loại bảo h&agrave;nh
	<p>Bằng H&oacute;a đơn mua h&agrave;ng</p>
	</li>
	<li>Thời gian bảo h&agrave;nh
	<p>12 th&aacute;ng</p>
	</li>
</ul>

<p>Bộ sản phẩm bao gồm</p>

<p>m&agrave;n h&igrave;nh, n&uacute;t ấn camera, phụ kiện k&egrave;m theo</p>
', NULL, CAST(N'2018-10-13 14:05:29.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (24, N'Chuông cửa có hình Sony-fr-31', N'chuong-cua-co-hinh-sony-fr-31', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Chuong%20cua%20co%20hinh/chuong-cua-panasonic_s727.jpg', NULL, 3213222, NULL, NULL, 0, 5, N'<h2>M&ocirc; tả sản phẩm Bộ chu&ocirc;ng cửa c&oacute; h&igrave;nh Hikvision KIS202</h2>

<p>Sản phẩm n&agrave;y l&agrave; t&agrave;i sản c&aacute; nh&acirc;n được b&aacute;n bởi Nh&agrave; B&aacute;n H&agrave;ng C&aacute; Nh&acirc;n v&agrave; kh&ocirc;ng thuộc đối tượng phải chịu thuế GTGT. Do đ&oacute; h&oacute;a đơn VAT kh&ocirc;ng được cấp trong trường hợp n&agrave;y.&nbsp;</p>

<ul>
	<li>- Camera độ ph&acirc;n giải 720 &times; 576&nbsp;</li>
	<li>- C&oacute; hỗ trợ đ&egrave;n hồng ngoại (Tầm xa 2m)</li>
	<li>- T&iacute;ch hợp Mic v&agrave; Loa (C&ocirc;ng nghệ giảm nhiễu v&agrave; tiếng vọng)</li>
	<li>- Vỏ hợp kim nh&ocirc;m ,thiết kế đẹp.</li>
	<li>- C&oacute; cổng kết nối đến kh&oacute;a điện</li>
	<li>- K&iacute;ch thước 128 mm &times; 42 mm &times; 24.8 mm</li>
	<li>- Hỗ trợ 1 n&uacute;t kết nối tới 3 m&agrave;n DS-KH2200</li>
	<li>- Kết nối trực tiếp bằng 4 d&acirc;y từ n&uacute;t đến m&agrave;n.</li>
	<li>- M&agrave;n h&igrave;nh m&agrave;u TFT LCD, K&iacute;ch thước 7-Inch, độ ph&acirc;n giải 800 &times; 480&nbsp;</li>
	<li>- Hỗ trợ n&uacute;t ấn cứng vật l&yacute;</li>
	<li>- T&iacute;ch hợp Mic v&agrave; Loa (C&ocirc;ng nghệ giảm nhiễu v&agrave; tiếng vọng)</li>
	<li>- 1 jack 4 ch&acirc;n đấu nối (1 ch&acirc;n tiếng, 1 ch&acirc;n h&igrave;nh, 1 ch&acirc;n nguồn, 1 chấn nối đất.</li>
	<li>- N&uacute;t mở kh&oacute;a điện</li>
	<li>- Hỗ trợ hiển thị camera Analog</li>
	<li>- K&iacute;ch thước 195.8 mm x 132.8 mm x 18.39 mm</li>
	<li>- Bảo h&agrave;nh ch&iacute;nh h&atilde;ng 12 th&aacute;ng</li>
</ul>

<p><img src="https://sg-test-11.slatic.net/shop/48483780466e40d1b21bc23a570034be.png" /><img src="https://vn-test-11.slatic.net/shop/21624397890a26531f967dc7120e3b7d.jpeg" /></p>

<p><img src="https://vn-test-11.slatic.net/shop/a8fb29a3dae04a7b982206451a6bb009.jpeg" /></p>

<h2>Đặc t&iacute;nh sản phẩm</h2>

<ul>
	<li>Thương hiệu
	<p>No Brand</p>
	</li>
	<li>SKU
	<p>249342228_VNAMZ-328157684</p>
	</li>
	<li>D&ograve;ng sản phẩm
	<p>door phone</p>
	</li>
	<li>Loại bảo h&agrave;nh
	<p>Bằng H&oacute;a đơn mua h&agrave;ng</p>
	</li>
	<li>Thời gian bảo h&agrave;nh
	<p>12 th&aacute;ng</p>
	</li>
</ul>

<p>Bộ sản phẩm bao gồm</p>

<p>m&agrave;n h&igrave;nh, n&uacute;t ấn camera, phụ kiện k&egrave;m theo</p>
', NULL, CAST(N'2018-10-13 14:05:38.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (25, N'chuông cửa có hình Samsung-nh-241', N'chuong-cua-co-hinh-samsung-nh-241', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Chuong%20cua%20co%20hinh/jos-1a-camera14_vn.jpg', NULL, 4000000, NULL, NULL, 10, 5, N'<h2>M&ocirc; tả sản phẩm Bộ chu&ocirc;ng cửa c&oacute; h&igrave;nh Hikvision KIS202</h2>

<p>Sản phẩm n&agrave;y l&agrave; t&agrave;i sản c&aacute; nh&acirc;n được b&aacute;n bởi Nh&agrave; B&aacute;n H&agrave;ng C&aacute; Nh&acirc;n v&agrave; kh&ocirc;ng thuộc đối tượng phải chịu thuế GTGT. Do đ&oacute; h&oacute;a đơn VAT kh&ocirc;ng được cấp trong trường hợp n&agrave;y.&nbsp;</p>

<ul>
	<li>- Camera độ ph&acirc;n giải 720 &times; 576&nbsp;</li>
	<li>- C&oacute; hỗ trợ đ&egrave;n hồng ngoại (Tầm xa 2m)</li>
	<li>- T&iacute;ch hợp Mic v&agrave; Loa (C&ocirc;ng nghệ giảm nhiễu v&agrave; tiếng vọng)</li>
	<li>- Vỏ hợp kim nh&ocirc;m ,thiết kế đẹp.</li>
	<li>- C&oacute; cổng kết nối đến kh&oacute;a điện</li>
	<li>- K&iacute;ch thước 128 mm &times; 42 mm &times; 24.8 mm</li>
	<li>- Hỗ trợ 1 n&uacute;t kết nối tới 3 m&agrave;n DS-KH2200</li>
	<li>- Kết nối trực tiếp bằng 4 d&acirc;y từ n&uacute;t đến m&agrave;n.</li>
	<li>- M&agrave;n h&igrave;nh m&agrave;u TFT LCD, K&iacute;ch thước 7-Inch, độ ph&acirc;n giải 800 &times; 480&nbsp;</li>
	<li>- Hỗ trợ n&uacute;t ấn cứng vật l&yacute;</li>
	<li>- T&iacute;ch hợp Mic v&agrave; Loa (C&ocirc;ng nghệ giảm nhiễu v&agrave; tiếng vọng)</li>
	<li>- 1 jack 4 ch&acirc;n đấu nối (1 ch&acirc;n tiếng, 1 ch&acirc;n h&igrave;nh, 1 ch&acirc;n nguồn, 1 chấn nối đất.</li>
	<li>- N&uacute;t mở kh&oacute;a điện</li>
	<li>- Hỗ trợ hiển thị camera Analog</li>
	<li>- K&iacute;ch thước 195.8 mm x 132.8 mm x 18.39 mm</li>
	<li>- Bảo h&agrave;nh ch&iacute;nh h&atilde;ng 12 th&aacute;ng</li>
</ul>

<p><img src="https://sg-test-11.slatic.net/shop/48483780466e40d1b21bc23a570034be.png" /><img src="https://vn-test-11.slatic.net/shop/21624397890a26531f967dc7120e3b7d.jpeg" /></p>

<p><img src="https://vn-test-11.slatic.net/shop/a8fb29a3dae04a7b982206451a6bb009.jpeg" /></p>

<h2>Đặc t&iacute;nh sản phẩm</h2>

<ul>
	<li>Thương hiệu
	<p>No Brand</p>
	</li>
	<li>SKU
	<p>249342228_VNAMZ-328157684</p>
	</li>
	<li>D&ograve;ng sản phẩm
	<p>door phone</p>
	</li>
	<li>Loại bảo h&agrave;nh
	<p>Bằng H&oacute;a đơn mua h&agrave;ng</p>
	</li>
	<li>Thời gian bảo h&agrave;nh
	<p>12 th&aacute;ng</p>
	</li>
</ul>

<p>Bộ sản phẩm bao gồm</p>

<p>m&agrave;n h&igrave;nh, n&uacute;t ấn camera, phụ kiện k&egrave;m theo</p>
', NULL, CAST(N'2018-10-13 14:06:00.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (26, N'chuông cửa có hình Sony-ng-5432', N'chuong-cua-co-hinh-sony-ng-5432', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Chuong%20cua%20co%20hinh/sua-chua-chuong-cau-tot-nhat-ha-noi.jpg', NULL, 5400000, NULL, NULL, 5, 5, N'<h2>M&ocirc; tả sản phẩm Bộ chu&ocirc;ng cửa c&oacute; h&igrave;nh Hikvision KIS202</h2>

<p>Sản phẩm n&agrave;y l&agrave; t&agrave;i sản c&aacute; nh&acirc;n được b&aacute;n bởi Nh&agrave; B&aacute;n H&agrave;ng C&aacute; Nh&acirc;n v&agrave; kh&ocirc;ng thuộc đối tượng phải chịu thuế GTGT. Do đ&oacute; h&oacute;a đơn VAT kh&ocirc;ng được cấp trong trường hợp n&agrave;y.&nbsp;</p>

<ul>
	<li>- Camera độ ph&acirc;n giải 720 &times; 576&nbsp;</li>
	<li>- C&oacute; hỗ trợ đ&egrave;n hồng ngoại (Tầm xa 2m)</li>
	<li>- T&iacute;ch hợp Mic v&agrave; Loa (C&ocirc;ng nghệ giảm nhiễu v&agrave; tiếng vọng)</li>
	<li>- Vỏ hợp kim nh&ocirc;m ,thiết kế đẹp.</li>
	<li>- C&oacute; cổng kết nối đến kh&oacute;a điện</li>
	<li>- K&iacute;ch thước 128 mm &times; 42 mm &times; 24.8 mm</li>
	<li>- Hỗ trợ 1 n&uacute;t kết nối tới 3 m&agrave;n DS-KH2200</li>
	<li>- Kết nối trực tiếp bằng 4 d&acirc;y từ n&uacute;t đến m&agrave;n.</li>
	<li>- M&agrave;n h&igrave;nh m&agrave;u TFT LCD, K&iacute;ch thước 7-Inch, độ ph&acirc;n giải 800 &times; 480&nbsp;</li>
	<li>- Hỗ trợ n&uacute;t ấn cứng vật l&yacute;</li>
	<li>- T&iacute;ch hợp Mic v&agrave; Loa (C&ocirc;ng nghệ giảm nhiễu v&agrave; tiếng vọng)</li>
	<li>- 1 jack 4 ch&acirc;n đấu nối (1 ch&acirc;n tiếng, 1 ch&acirc;n h&igrave;nh, 1 ch&acirc;n nguồn, 1 chấn nối đất.</li>
	<li>- N&uacute;t mở kh&oacute;a điện</li>
	<li>- Hỗ trợ hiển thị camera Analog</li>
	<li>- K&iacute;ch thước 195.8 mm x 132.8 mm x 18.39 mm</li>
	<li>- Bảo h&agrave;nh ch&iacute;nh h&atilde;ng 12 th&aacute;ng</li>
</ul>

<p><img src="https://sg-test-11.slatic.net/shop/48483780466e40d1b21bc23a570034be.png" /><img src="https://vn-test-11.slatic.net/shop/21624397890a26531f967dc7120e3b7d.jpeg" /></p>

<p><img src="https://vn-test-11.slatic.net/shop/a8fb29a3dae04a7b982206451a6bb009.jpeg" /></p>

<h2>Đặc t&iacute;nh sản phẩm</h2>

<ul>
	<li>Thương hiệu
	<p>No Brand</p>
	</li>
	<li>SKU
	<p>249342228_VNAMZ-328157684</p>
	</li>
	<li>D&ograve;ng sản phẩm
	<p>door phone</p>
	</li>
	<li>Loại bảo h&agrave;nh
	<p>Bằng H&oacute;a đơn mua h&agrave;ng</p>
	</li>
	<li>Thời gian bảo h&agrave;nh
	<p>12 th&aacute;ng</p>
	</li>
</ul>

<p>Bộ sản phẩm bao gồm</p>

<p>m&agrave;n h&igrave;nh, n&uacute;t ấn camera, phụ kiện k&egrave;m theo</p>
', NULL, CAST(N'2018-10-13 14:06:16.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (27, N'Chuông cửa có hình hikvision-rg-522', N'chuong-cua-co-hinh-hikvision-rg-522', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Chuong%20cua%20co%20hinh/images.jpg', NULL, 3200000, NULL, NULL, 0, 5, N'<h2>M&ocirc; tả sản phẩm Bộ chu&ocirc;ng cửa c&oacute; h&igrave;nh Hikvision KIS202</h2>

<p>Sản phẩm n&agrave;y l&agrave; t&agrave;i sản c&aacute; nh&acirc;n được b&aacute;n bởi Nh&agrave; B&aacute;n H&agrave;ng C&aacute; Nh&acirc;n v&agrave; kh&ocirc;ng thuộc đối tượng phải chịu thuế GTGT. Do đ&oacute; h&oacute;a đơn VAT kh&ocirc;ng được cấp trong trường hợp n&agrave;y.&nbsp;</p>

<ul>
	<li>- Camera độ ph&acirc;n giải 720 &times; 576&nbsp;</li>
	<li>- C&oacute; hỗ trợ đ&egrave;n hồng ngoại (Tầm xa 2m)</li>
	<li>- T&iacute;ch hợp Mic v&agrave; Loa (C&ocirc;ng nghệ giảm nhiễu v&agrave; tiếng vọng)</li>
	<li>- Vỏ hợp kim nh&ocirc;m ,thiết kế đẹp.</li>
	<li>- C&oacute; cổng kết nối đến kh&oacute;a điện</li>
	<li>- K&iacute;ch thước 128 mm &times; 42 mm &times; 24.8 mm</li>
	<li>- Hỗ trợ 1 n&uacute;t kết nối tới 3 m&agrave;n DS-KH2200</li>
	<li>- Kết nối trực tiếp bằng 4 d&acirc;y từ n&uacute;t đến m&agrave;n.</li>
	<li>- M&agrave;n h&igrave;nh m&agrave;u TFT LCD, K&iacute;ch thước 7-Inch, độ ph&acirc;n giải 800 &times; 480&nbsp;</li>
	<li>- Hỗ trợ n&uacute;t ấn cứng vật l&yacute;</li>
	<li>- T&iacute;ch hợp Mic v&agrave; Loa (C&ocirc;ng nghệ giảm nhiễu v&agrave; tiếng vọng)</li>
	<li>- 1 jack 4 ch&acirc;n đấu nối (1 ch&acirc;n tiếng, 1 ch&acirc;n h&igrave;nh, 1 ch&acirc;n nguồn, 1 chấn nối đất.</li>
	<li>- N&uacute;t mở kh&oacute;a điện</li>
	<li>- Hỗ trợ hiển thị camera Analog</li>
	<li>- K&iacute;ch thước 195.8 mm x 132.8 mm x 18.39 mm</li>
	<li>- Bảo h&agrave;nh ch&iacute;nh h&atilde;ng 12 th&aacute;ng</li>
</ul>

<p><img src="https://sg-test-11.slatic.net/shop/48483780466e40d1b21bc23a570034be.png" /><img src="https://vn-test-11.slatic.net/shop/21624397890a26531f967dc7120e3b7d.jpeg" /></p>

<p><img src="https://vn-test-11.slatic.net/shop/a8fb29a3dae04a7b982206451a6bb009.jpeg" /></p>

<h2>Đặc t&iacute;nh sản phẩm</h2>

<ul>
	<li>Thương hiệu
	<p>No Brand</p>
	</li>
	<li>SKU
	<p>249342228_VNAMZ-328157684</p>
	</li>
	<li>D&ograve;ng sản phẩm
	<p>door phone</p>
	</li>
	<li>Loại bảo h&agrave;nh
	<p>Bằng H&oacute;a đơn mua h&agrave;ng</p>
	</li>
	<li>Thời gian bảo h&agrave;nh
	<p>12 th&aacute;ng</p>
	</li>
</ul>

<p>Bộ sản phẩm bao gồm</p>

<p>m&agrave;n h&igrave;nh, n&uacute;t ấn camera, phụ kiện k&egrave;m theo</p>
', NULL, CAST(N'2018-10-13 14:06:29.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (28, N'Chuông cửa có hình Panasonic-nh-532', N'chuong-cua-co-hinh-panasonic-nh-532', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Chuong%20cua%20co%20hinh/bo-chuong-cua-co-hinh-hikvision-ds-kis201.jpg', NULL, 4300000, NULL, NULL, 5, 5, N'<h2>M&ocirc; tả sản phẩm Bộ chu&ocirc;ng cửa c&oacute; h&igrave;nh Hikvision KIS202</h2>

<p>Sản phẩm n&agrave;y l&agrave; t&agrave;i sản c&aacute; nh&acirc;n được b&aacute;n bởi Nh&agrave; B&aacute;n H&agrave;ng C&aacute; Nh&acirc;n v&agrave; kh&ocirc;ng thuộc đối tượng phải chịu thuế GTGT. Do đ&oacute; h&oacute;a đơn VAT kh&ocirc;ng được cấp trong trường hợp n&agrave;y.&nbsp;</p>

<ul>
	<li>- Camera độ ph&acirc;n giải 720 &times; 576&nbsp;</li>
	<li>- C&oacute; hỗ trợ đ&egrave;n hồng ngoại (Tầm xa 2m)</li>
	<li>- T&iacute;ch hợp Mic v&agrave; Loa (C&ocirc;ng nghệ giảm nhiễu v&agrave; tiếng vọng)</li>
	<li>- Vỏ hợp kim nh&ocirc;m ,thiết kế đẹp.</li>
	<li>- C&oacute; cổng kết nối đến kh&oacute;a điện</li>
	<li>- K&iacute;ch thước 128 mm &times; 42 mm &times; 24.8 mm</li>
	<li>- Hỗ trợ 1 n&uacute;t kết nối tới 3 m&agrave;n DS-KH2200</li>
	<li>- Kết nối trực tiếp bằng 4 d&acirc;y từ n&uacute;t đến m&agrave;n.</li>
	<li>- M&agrave;n h&igrave;nh m&agrave;u TFT LCD, K&iacute;ch thước 7-Inch, độ ph&acirc;n giải 800 &times; 480&nbsp;</li>
	<li>- Hỗ trợ n&uacute;t ấn cứng vật l&yacute;</li>
	<li>- T&iacute;ch hợp Mic v&agrave; Loa (C&ocirc;ng nghệ giảm nhiễu v&agrave; tiếng vọng)</li>
	<li>- 1 jack 4 ch&acirc;n đấu nối (1 ch&acirc;n tiếng, 1 ch&acirc;n h&igrave;nh, 1 ch&acirc;n nguồn, 1 chấn nối đất.</li>
	<li>- N&uacute;t mở kh&oacute;a điện</li>
	<li>- Hỗ trợ hiển thị camera Analog</li>
	<li>- K&iacute;ch thước 195.8 mm x 132.8 mm x 18.39 mm</li>
	<li>- Bảo h&agrave;nh ch&iacute;nh h&atilde;ng 12 th&aacute;ng</li>
</ul>

<p><img src="https://sg-test-11.slatic.net/shop/48483780466e40d1b21bc23a570034be.png" /><img src="https://vn-test-11.slatic.net/shop/21624397890a26531f967dc7120e3b7d.jpeg" /></p>

<p><img src="https://vn-test-11.slatic.net/shop/a8fb29a3dae04a7b982206451a6bb009.jpeg" /></p>

<h2>Đặc t&iacute;nh sản phẩm</h2>

<ul>
	<li>Thương hiệu
	<p>No Brand</p>
	</li>
	<li>SKU
	<p>249342228_VNAMZ-328157684</p>
	</li>
	<li>D&ograve;ng sản phẩm
	<p>door phone</p>
	</li>
	<li>Loại bảo h&agrave;nh
	<p>Bằng H&oacute;a đơn mua h&agrave;ng</p>
	</li>
	<li>Thời gian bảo h&agrave;nh
	<p>12 th&aacute;ng</p>
	</li>
</ul>

<p>Bộ sản phẩm bao gồm</p>

<p>m&agrave;n h&igrave;nh, n&uacute;t ấn camera, phụ kiện k&egrave;m theo</p>
', NULL, CAST(N'2018-10-13 14:06:46.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (29, N'Đèn 200W-Panasonic', N'den-200w-panasonic', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Thiet%20Bi%20Chieu%20Sang/den2(9).PNG', NULL, 230000, NULL, NULL, 10, 7, N'<h2>M&ocirc; tả sản phẩm Đ&egrave;n pha 200W IP66-Si&ecirc;u s&aacute;ng - Chuẩn 200W-&Aacute;nh s&aacute;ng trắng</h2>

<p>Sản phẩm n&agrave;y l&agrave; t&agrave;i sản c&aacute; nh&acirc;n được b&aacute;n bởi Nh&agrave; B&aacute;n H&agrave;ng C&aacute; Nh&acirc;n v&agrave; kh&ocirc;ng thuộc đối tượng phải chịu thuế GTGT. Do đ&oacute; h&oacute;a đơn VAT kh&ocirc;ng được cấp trong trường hợp n&agrave;y.&nbsp;</p>

<ul>
	<li>Đ&egrave;n pha 200w ip66 mẫu mới.</li>
	<li>.Được thiết kế v&agrave; sử dụng tốt ngo&agrave;i trời nhưng kh&ocirc;ng cần c&aacute;c thiết bị bảo vệ đi k&egrave;m. Điện năng để sử dụng lu&ocirc;n lu&ocirc;n duy tr&igrave; ở mức thấp nhất tuổi thọ sản phẩm cao sử dụng l&acirc;u d&agrave;i đồng thời giảm chi ph&iacute; bảo dưỡng bảo h&agrave;nh cho n&ecirc;n đ&acirc;y l&agrave; sự lựa chọn tuyệt vời để thay thế c&aacute;c loại đ&egrave;n pha c&ocirc;ng suất cao hiện nay nhưng chưa được tối ưu như c&aacute;c loại đ&egrave;n cao &aacute;p</li>
	<li>Th&ocirc;ng số kỹ thuật pha 200W IP66</li>
	<li>Size 450*310*90 (mm)</li>
	<li>Quang th&ocirc;ng 16000 Lumen</li>
	<li>C&ocirc;ng suất 200W</li>
	<li>M&agrave;u sắc 3000K 6500K</li>
	<li>Điện &aacute;p 220V</li>
	<li>Vật liệu vỏ nh&ocirc;m c&aacute;ch nhiệt c&aacute;ch điện tốt</li>
	<li>Bảo h&agrave;nh 12 th&aacute;ng</li>
	<li>Ti&ecirc;u chuẩn IP66</li>
	<li>Ứng dụng Pha led 200W IP66</li>
	<li>- S&acirc;n b&oacute;ng s&acirc;n tenis hội trường</li>
	<li>- Chiếu s&aacute;ng c&ocirc;ng cộng chiếu s&aacute;ng quảng c&aacute;o chiếu s&aacute;ng khu vực cần nhiều &aacute;nh s&aacute;ng</li>
	<li>Đ&egrave;n pha led TP66 c&oacute; c&aacute;c loại c&ocirc;ng suất 100W 200W 300W 400W 500W với gi&aacute; b&aacute;n kh&ocirc;ng nơi n&agrave;o tốt hơn</li>
</ul>

<p><br />
Đ&egrave;n pha 200w ip66 mẫu mới.&nbsp;<br />
.Được thiết kế v&agrave; sử dụng tốt ngo&agrave;i trời nhưng kh&ocirc;ng cần c&aacute;c thiết bị bảo vệ đi k&egrave;m. Điện năng để sử dụng lu&ocirc;n lu&ocirc;n duy tr&igrave; ở mức thấp nhất tuổi thọ sản phẩm cao sử dụng l&acirc;u d&agrave;i đồng thời giảm chi ph&iacute; bảo dưỡng bảo h&agrave;nh cho n&ecirc;n đ&acirc;y l&agrave; sự lựa chọn tuyệt vời để thay thế c&aacute;c loại đ&egrave;n pha c&ocirc;ng suất cao hiện nay nhưng chưa được tối ưu như c&aacute;c loại đ&egrave;n cao &aacute;p&nbsp;<br />
Th&ocirc;ng số kỹ thuật pha 200W IP66&nbsp;<br />
Size 450*310*90 (mm)&nbsp;<br />
Quang th&ocirc;ng 16000 Lumen&nbsp;<br />
C&ocirc;ng suất 200W&nbsp;<br />
M&agrave;u sắc 3000K 6500K&nbsp;<br />
Điện &aacute;p 220V&nbsp;<br />
Vật liệu vỏ nh&ocirc;m c&aacute;ch nhiệt c&aacute;ch điện tốt&nbsp;<br />
Bảo h&agrave;nh 12 th&aacute;ng&nbsp;<br />
Ti&ecirc;u chuẩn IP66&nbsp;<br />
Ứng dụng Pha led 200W IP66&nbsp;<br />
- S&acirc;n b&oacute;ng s&acirc;n tenis hội trường&nbsp;<br />
- Chiếu s&aacute;ng c&ocirc;ng cộng chiếu s&aacute;ng quảng c&aacute;o chiếu s&aacute;ng khu vực cần nhiều &aacute;nh s&aacute;ng&nbsp;<br />
Đ&egrave;n pha led TP66 c&oacute; c&aacute;c loại c&ocirc;ng suất 100W 200W 300W 400W 500W với gi&aacute; b&aacute;n kh&ocirc;ng nơi n&agrave;o tốt hơn&nbsp;</p>
', NULL, CAST(N'2018-10-13 14:09:06.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (30, N'2 bóng đén 200W-Sony-421', N'2-bong-den-200w-sony-421', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Thiet%20Bi%20Chieu%20Sang/download%20(3).jpg', NULL, 400000, NULL, NULL, 0, 7, N'<h2>M&ocirc; tả sản phẩm Đ&egrave;n pha 200W IP66-Si&ecirc;u s&aacute;ng - Chuẩn 200W-&Aacute;nh s&aacute;ng trắng</h2>

<p>Sản phẩm n&agrave;y l&agrave; t&agrave;i sản c&aacute; nh&acirc;n được b&aacute;n bởi Nh&agrave; B&aacute;n H&agrave;ng C&aacute; Nh&acirc;n v&agrave; kh&ocirc;ng thuộc đối tượng phải chịu thuế GTGT. Do đ&oacute; h&oacute;a đơn VAT kh&ocirc;ng được cấp trong trường hợp n&agrave;y.&nbsp;</p>

<ul>
	<li>Đ&egrave;n pha 200w ip66 mẫu mới.</li>
	<li>.Được thiết kế v&agrave; sử dụng tốt ngo&agrave;i trời nhưng kh&ocirc;ng cần c&aacute;c thiết bị bảo vệ đi k&egrave;m. Điện năng để sử dụng lu&ocirc;n lu&ocirc;n duy tr&igrave; ở mức thấp nhất tuổi thọ sản phẩm cao sử dụng l&acirc;u d&agrave;i đồng thời giảm chi ph&iacute; bảo dưỡng bảo h&agrave;nh cho n&ecirc;n đ&acirc;y l&agrave; sự lựa chọn tuyệt vời để thay thế c&aacute;c loại đ&egrave;n pha c&ocirc;ng suất cao hiện nay nhưng chưa được tối ưu như c&aacute;c loại đ&egrave;n cao &aacute;p</li>
	<li>Th&ocirc;ng số kỹ thuật pha 200W IP66</li>
	<li>Size 450*310*90 (mm)</li>
	<li>Quang th&ocirc;ng 16000 Lumen</li>
	<li>C&ocirc;ng suất 200W</li>
	<li>M&agrave;u sắc 3000K 6500K</li>
	<li>Điện &aacute;p 220V</li>
	<li>Vật liệu vỏ nh&ocirc;m c&aacute;ch nhiệt c&aacute;ch điện tốt</li>
	<li>Bảo h&agrave;nh 12 th&aacute;ng</li>
	<li>Ti&ecirc;u chuẩn IP66</li>
	<li>Ứng dụng Pha led 200W IP66</li>
	<li>- S&acirc;n b&oacute;ng s&acirc;n tenis hội trường</li>
	<li>- Chiếu s&aacute;ng c&ocirc;ng cộng chiếu s&aacute;ng quảng c&aacute;o chiếu s&aacute;ng khu vực cần nhiều &aacute;nh s&aacute;ng</li>
	<li>Đ&egrave;n pha led TP66 c&oacute; c&aacute;c loại c&ocirc;ng suất 100W 200W 300W 400W 500W với gi&aacute; b&aacute;n kh&ocirc;ng nơi n&agrave;o tốt hơn</li>
</ul>

<p><br />
Đ&egrave;n pha 200w ip66 mẫu mới.&nbsp;<br />
.Được thiết kế v&agrave; sử dụng tốt ngo&agrave;i trời nhưng kh&ocirc;ng cần c&aacute;c thiết bị bảo vệ đi k&egrave;m. Điện năng để sử dụng lu&ocirc;n lu&ocirc;n duy tr&igrave; ở mức thấp nhất tuổi thọ sản phẩm cao sử dụng l&acirc;u d&agrave;i đồng thời giảm chi ph&iacute; bảo dưỡng bảo h&agrave;nh cho n&ecirc;n đ&acirc;y l&agrave; sự lựa chọn tuyệt vời để thay thế c&aacute;c loại đ&egrave;n pha c&ocirc;ng suất cao hiện nay nhưng chưa được tối ưu như c&aacute;c loại đ&egrave;n cao &aacute;p&nbsp;<br />
Th&ocirc;ng số kỹ thuật pha 200W IP66&nbsp;<br />
Size 450*310*90 (mm)&nbsp;<br />
Quang th&ocirc;ng 16000 Lumen&nbsp;<br />
C&ocirc;ng suất 200W&nbsp;<br />
M&agrave;u sắc 3000K 6500K&nbsp;<br />
Điện &aacute;p 220V&nbsp;<br />
Vật liệu vỏ nh&ocirc;m c&aacute;ch nhiệt c&aacute;ch điện tốt&nbsp;<br />
Bảo h&agrave;nh 12 th&aacute;ng&nbsp;<br />
Ti&ecirc;u chuẩn IP66&nbsp;<br />
Ứng dụng Pha led 200W IP66&nbsp;<br />
- S&acirc;n b&oacute;ng s&acirc;n tenis hội trường&nbsp;<br />
- Chiếu s&aacute;ng c&ocirc;ng cộng chiếu s&aacute;ng quảng c&aacute;o chiếu s&aacute;ng khu vực cần nhiều &aacute;nh s&aacute;ng&nbsp;<br />
Đ&egrave;n pha led TP66 c&oacute; c&aacute;c loại c&ocirc;ng suất 100W 200W 300W 400W 500W với gi&aacute; b&aacute;n kh&ocirc;ng nơi n&agrave;o tốt hơn&nbsp;</p>
', NULL, CAST(N'2018-10-13 14:09:23.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (31, N'Thiết bị chiếu sáng Sony-23n4', N'thiet-bi-chieu-sang-sony-23n4', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Thiet%20Bi%20Chieu%20Sang/images%20(1).jpg', NULL, 600000, NULL, NULL, 6, 7, N'<h2>M&ocirc; tả sản phẩm Đ&egrave;n pha 200W IP66-Si&ecirc;u s&aacute;ng - Chuẩn 200W-&Aacute;nh s&aacute;ng trắng</h2>

<p>Sản phẩm n&agrave;y l&agrave; t&agrave;i sản c&aacute; nh&acirc;n được b&aacute;n bởi Nh&agrave; B&aacute;n H&agrave;ng C&aacute; Nh&acirc;n v&agrave; kh&ocirc;ng thuộc đối tượng phải chịu thuế GTGT. Do đ&oacute; h&oacute;a đơn VAT kh&ocirc;ng được cấp trong trường hợp n&agrave;y.&nbsp;</p>

<ul>
	<li>Đ&egrave;n pha 200w ip66 mẫu mới.</li>
	<li>.Được thiết kế v&agrave; sử dụng tốt ngo&agrave;i trời nhưng kh&ocirc;ng cần c&aacute;c thiết bị bảo vệ đi k&egrave;m. Điện năng để sử dụng lu&ocirc;n lu&ocirc;n duy tr&igrave; ở mức thấp nhất tuổi thọ sản phẩm cao sử dụng l&acirc;u d&agrave;i đồng thời giảm chi ph&iacute; bảo dưỡng bảo h&agrave;nh cho n&ecirc;n đ&acirc;y l&agrave; sự lựa chọn tuyệt vời để thay thế c&aacute;c loại đ&egrave;n pha c&ocirc;ng suất cao hiện nay nhưng chưa được tối ưu như c&aacute;c loại đ&egrave;n cao &aacute;p</li>
	<li>Th&ocirc;ng số kỹ thuật pha 200W IP66</li>
	<li>Size 450*310*90 (mm)</li>
	<li>Quang th&ocirc;ng 16000 Lumen</li>
	<li>C&ocirc;ng suất 200W</li>
	<li>M&agrave;u sắc 3000K 6500K</li>
	<li>Điện &aacute;p 220V</li>
	<li>Vật liệu vỏ nh&ocirc;m c&aacute;ch nhiệt c&aacute;ch điện tốt</li>
	<li>Bảo h&agrave;nh 12 th&aacute;ng</li>
	<li>Ti&ecirc;u chuẩn IP66</li>
	<li>Ứng dụng Pha led 200W IP66</li>
	<li>- S&acirc;n b&oacute;ng s&acirc;n tenis hội trường</li>
	<li>- Chiếu s&aacute;ng c&ocirc;ng cộng chiếu s&aacute;ng quảng c&aacute;o chiếu s&aacute;ng khu vực cần nhiều &aacute;nh s&aacute;ng</li>
	<li>Đ&egrave;n pha led TP66 c&oacute; c&aacute;c loại c&ocirc;ng suất 100W 200W 300W 400W 500W với gi&aacute; b&aacute;n kh&ocirc;ng nơi n&agrave;o tốt hơn</li>
</ul>

<p><br />
Đ&egrave;n pha 200w ip66 mẫu mới.&nbsp;<br />
.Được thiết kế v&agrave; sử dụng tốt ngo&agrave;i trời nhưng kh&ocirc;ng cần c&aacute;c thiết bị bảo vệ đi k&egrave;m. Điện năng để sử dụng lu&ocirc;n lu&ocirc;n duy tr&igrave; ở mức thấp nhất tuổi thọ sản phẩm cao sử dụng l&acirc;u d&agrave;i đồng thời giảm chi ph&iacute; bảo dưỡng bảo h&agrave;nh cho n&ecirc;n đ&acirc;y l&agrave; sự lựa chọn tuyệt vời để thay thế c&aacute;c loại đ&egrave;n pha c&ocirc;ng suất cao hiện nay nhưng chưa được tối ưu như c&aacute;c loại đ&egrave;n cao &aacute;p&nbsp;<br />
Th&ocirc;ng số kỹ thuật pha 200W IP66&nbsp;<br />
Size 450*310*90 (mm)&nbsp;<br />
Quang th&ocirc;ng 16000 Lumen&nbsp;<br />
C&ocirc;ng suất 200W&nbsp;<br />
M&agrave;u sắc 3000K 6500K&nbsp;<br />
Điện &aacute;p 220V&nbsp;<br />
Vật liệu vỏ nh&ocirc;m c&aacute;ch nhiệt c&aacute;ch điện tốt&nbsp;<br />
Bảo h&agrave;nh 12 th&aacute;ng&nbsp;<br />
Ti&ecirc;u chuẩn IP66&nbsp;<br />
Ứng dụng Pha led 200W IP66&nbsp;<br />
- S&acirc;n b&oacute;ng s&acirc;n tenis hội trường&nbsp;<br />
- Chiếu s&aacute;ng c&ocirc;ng cộng chiếu s&aacute;ng quảng c&aacute;o chiếu s&aacute;ng khu vực cần nhiều &aacute;nh s&aacute;ng&nbsp;<br />
Đ&egrave;n pha led TP66 c&oacute; c&aacute;c loại c&ocirc;ng suất 100W 200W 300W 400W 500W với gi&aacute; b&aacute;n kh&ocirc;ng nơi n&agrave;o tốt hơn&nbsp;</p>
', NULL, CAST(N'2018-10-13 14:09:47.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (32, N'Đèn 120W-KenTom-23', N'den-120w-kentom-23', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Thiet%20Bi%20Chieu%20Sang/images-workshop-lights.jpg', NULL, 540000, NULL, NULL, 5, 7, N'<h2>M&ocirc; tả sản phẩm Đ&egrave;n pha 200W IP66-Si&ecirc;u s&aacute;ng - Chuẩn 200W-&Aacute;nh s&aacute;ng trắng</h2>

<p>Sản phẩm n&agrave;y l&agrave; t&agrave;i sản c&aacute; nh&acirc;n được b&aacute;n bởi Nh&agrave; B&aacute;n H&agrave;ng C&aacute; Nh&acirc;n v&agrave; kh&ocirc;ng thuộc đối tượng phải chịu thuế GTGT. Do đ&oacute; h&oacute;a đơn VAT kh&ocirc;ng được cấp trong trường hợp n&agrave;y.&nbsp;</p>

<ul>
	<li>Đ&egrave;n pha 200w ip66 mẫu mới.</li>
	<li>.Được thiết kế v&agrave; sử dụng tốt ngo&agrave;i trời nhưng kh&ocirc;ng cần c&aacute;c thiết bị bảo vệ đi k&egrave;m. Điện năng để sử dụng lu&ocirc;n lu&ocirc;n duy tr&igrave; ở mức thấp nhất tuổi thọ sản phẩm cao sử dụng l&acirc;u d&agrave;i đồng thời giảm chi ph&iacute; bảo dưỡng bảo h&agrave;nh cho n&ecirc;n đ&acirc;y l&agrave; sự lựa chọn tuyệt vời để thay thế c&aacute;c loại đ&egrave;n pha c&ocirc;ng suất cao hiện nay nhưng chưa được tối ưu như c&aacute;c loại đ&egrave;n cao &aacute;p</li>
	<li>Th&ocirc;ng số kỹ thuật pha 200W IP66</li>
	<li>Size 450*310*90 (mm)</li>
	<li>Quang th&ocirc;ng 16000 Lumen</li>
	<li>C&ocirc;ng suất 200W</li>
	<li>M&agrave;u sắc 3000K 6500K</li>
	<li>Điện &aacute;p 220V</li>
	<li>Vật liệu vỏ nh&ocirc;m c&aacute;ch nhiệt c&aacute;ch điện tốt</li>
	<li>Bảo h&agrave;nh 12 th&aacute;ng</li>
	<li>Ti&ecirc;u chuẩn IP66</li>
	<li>Ứng dụng Pha led 200W IP66</li>
	<li>- S&acirc;n b&oacute;ng s&acirc;n tenis hội trường</li>
	<li>- Chiếu s&aacute;ng c&ocirc;ng cộng chiếu s&aacute;ng quảng c&aacute;o chiếu s&aacute;ng khu vực cần nhiều &aacute;nh s&aacute;ng</li>
	<li>Đ&egrave;n pha led TP66 c&oacute; c&aacute;c loại c&ocirc;ng suất 100W 200W 300W 400W 500W với gi&aacute; b&aacute;n kh&ocirc;ng nơi n&agrave;o tốt hơn</li>
</ul>

<p><br />
Đ&egrave;n pha 200w ip66 mẫu mới.&nbsp;<br />
.Được thiết kế v&agrave; sử dụng tốt ngo&agrave;i trời nhưng kh&ocirc;ng cần c&aacute;c thiết bị bảo vệ đi k&egrave;m. Điện năng để sử dụng lu&ocirc;n lu&ocirc;n duy tr&igrave; ở mức thấp nhất tuổi thọ sản phẩm cao sử dụng l&acirc;u d&agrave;i đồng thời giảm chi ph&iacute; bảo dưỡng bảo h&agrave;nh cho n&ecirc;n đ&acirc;y l&agrave; sự lựa chọn tuyệt vời để thay thế c&aacute;c loại đ&egrave;n pha c&ocirc;ng suất cao hiện nay nhưng chưa được tối ưu như c&aacute;c loại đ&egrave;n cao &aacute;p&nbsp;<br />
Th&ocirc;ng số kỹ thuật pha 200W IP66&nbsp;<br />
Size 450*310*90 (mm)&nbsp;<br />
Quang th&ocirc;ng 16000 Lumen&nbsp;<br />
C&ocirc;ng suất 200W&nbsp;<br />
M&agrave;u sắc 3000K 6500K&nbsp;<br />
Điện &aacute;p 220V&nbsp;<br />
Vật liệu vỏ nh&ocirc;m c&aacute;ch nhiệt c&aacute;ch điện tốt&nbsp;<br />
Bảo h&agrave;nh 12 th&aacute;ng&nbsp;<br />
Ti&ecirc;u chuẩn IP66&nbsp;<br />
Ứng dụng Pha led 200W IP66&nbsp;<br />
- S&acirc;n b&oacute;ng s&acirc;n tenis hội trường&nbsp;<br />
- Chiếu s&aacute;ng c&ocirc;ng cộng chiếu s&aacute;ng quảng c&aacute;o chiếu s&aacute;ng khu vực cần nhiều &aacute;nh s&aacute;ng&nbsp;<br />
Đ&egrave;n pha led TP66 c&oacute; c&aacute;c loại c&ocirc;ng suất 100W 200W 300W 400W 500W với gi&aacute; b&aacute;n kh&ocirc;ng nơi n&agrave;o tốt hơn&nbsp;</p>
', NULL, CAST(N'2018-10-13 14:10:12.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (33, N'Thiết Bị chiếu sáng HKVISION-43', N'thiet-bi-chieu-sang-hkvision-43', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Thiet%20Bi%20Chieu%20Sang/M_NN01_2x36W_1.jpg', NULL, 800000, NULL, NULL, 0, 7, N'<table cellspacing="0" id="chi-tiet">
	<tbody>
		<tr>
			<td>Thương hiệu</td>
			<td><a href="http://tiki.vn/thuong-hieu/philips.html">Philips</a></td>
		</tr>
		<tr>
			<td>Sản xuất tại</td>
			<td>Trung Quốc</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước</td>
			<td>D&agrave;i 60cm</td>
		</tr>
		<tr>
			<td>SKU</td>
			<td>1304419839152</td>
		</tr>
		<tr>
			<td>Model</td>
			<td>Ledtube 740 T8 APCG</td>
		</tr>
		<tr>
			<td>Nguồn điện</td>
			<td>220 - 240V</td>
		</tr>
		<tr>
			<td>C&ocirc;ng suất</td>
			<td>8W</td>
		</tr>
		<tr>
			<td>Loại b&oacute;ng đ&egrave;n</td>
			<td>LED</td>
		</tr>
		<tr>
			<td>Tuổi thọ tối đa</td>
			<td>30000 giờ</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>
			<ul>
				<li>Vỏ đ&egrave;n: thủy tinh cao cấp</li>
				<li>Đui đ&egrave;n: nh&ocirc;m trắng c&aacute;ch nhiệt</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
', NULL, CAST(N'2018-10-13 14:10:42.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (34, N'Camera hành trình SamSung-23', N'camera-hanh-trinh-samsung-23', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Camera%20hanh%20trinh%20va%20flycam/camera-h%C3%A0nh-tr%C3%ACnh-sj7000.png', NULL, 7800000, NULL, NULL, 5, 26, N'<ul>
	<li>Cam h&agrave;nh tr&igrave;nh Pioneer h&agrave;ng mới về liền cam l&ugrave;i.</li>
	<li>Si&ecirc;u n&eacute;t, quay trước, sau v&agrave; trong xe</li>
	<li>Bảo h&agrave;nh 1 năm</li>
</ul>

<ul>
	<li>Cam h&agrave;nh tr&igrave;nh Pioneer h&agrave;ng mới về liền cam l&ugrave;i.</li>
	<li>Si&ecirc;u n&eacute;t, quay trước, sau v&agrave; trong xe</li>
	<li>Bảo h&agrave;nh 1 năm<img src="https://vn-test-11.slatic.net/shop/9f0a1758c6823ec1d8491d5f4bcffbf4.jpeg" style="height:1333px; width:1000px" /><img src="https://vn-test-11.slatic.net/shop/75da179672386cafda3f16fe625d50fa.jpeg" style="height:1333px; width:1000px" /></li>
</ul>

<h2>Đặc t&iacute;nh sản phẩm</h2>

<ul>
	<li>Thương hiệu
	<p>OMG</p>
	</li>
	<li>SKU
	<p>244689012_VNAMZ-313675640</p>
	</li>
	<li>D&ograve;ng sản phẩm
	<p>H&agrave;ng vừa về Camera h&agrave;nh tr&igrave;nh 3 mắt Full HD</p>
	</li>
</ul>
', NULL, CAST(N'2018-10-13 14:11:38.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (35, N'Camera G3-due', N'camera-g3-due', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Camera%20hanh%20trinh%20va%20flycam/download%20(1).jpg', NULL, 6070000, NULL, NULL, 10, 26, N'<ul>
	<li>Cam h&agrave;nh tr&igrave;nh Pioneer h&agrave;ng mới về liền cam l&ugrave;i.</li>
	<li>Si&ecirc;u n&eacute;t, quay trước, sau v&agrave; trong xe</li>
	<li>Bảo h&agrave;nh 1 năm</li>
</ul>

<ul>
	<li>Cam h&agrave;nh tr&igrave;nh Pioneer h&agrave;ng mới về liền cam l&ugrave;i.</li>
	<li>Si&ecirc;u n&eacute;t, quay trước, sau v&agrave; trong xe</li>
	<li>Bảo h&agrave;nh 1 năm<img src="https://vn-test-11.slatic.net/shop/9f0a1758c6823ec1d8491d5f4bcffbf4.jpeg" style="height:1333px; width:1000px" /><img src="https://vn-test-11.slatic.net/shop/75da179672386cafda3f16fe625d50fa.jpeg" style="height:1333px; width:1000px" /></li>
</ul>

<h2>Đặc t&iacute;nh sản phẩm</h2>

<ul>
	<li>Thương hiệu
	<p>OMG</p>
	</li>
	<li>SKU
	<p>244689012_VNAMZ-313675640</p>
	</li>
	<li>D&ograve;ng sản phẩm
	<p>H&agrave;ng vừa về Camera h&agrave;nh tr&igrave;nh 3 mắt Full HD</p>
	</li>
</ul>
', NULL, CAST(N'2018-10-13 14:11:53.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (36, N'Flycam Bug3', N'flycam-bug3', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Camera%20hanh%20trinh%20va%20flycam/download.jpg', NULL, 5420000, NULL, NULL, 0, 26, N'<ul>
	<li>Cam h&agrave;nh tr&igrave;nh Pioneer h&agrave;ng mới về liền cam l&ugrave;i.</li>
	<li>Si&ecirc;u n&eacute;t, quay trước, sau v&agrave; trong xe</li>
	<li>Bảo h&agrave;nh 1 năm</li>
</ul>

<ul>
	<li>Cam h&agrave;nh tr&igrave;nh Pioneer h&agrave;ng mới về liền cam l&ugrave;i.</li>
	<li>Si&ecirc;u n&eacute;t, quay trước, sau v&agrave; trong xe</li>
	<li>Bảo h&agrave;nh 1 năm<img src="https://vn-test-11.slatic.net/shop/9f0a1758c6823ec1d8491d5f4bcffbf4.jpeg" style="height:1333px; width:1000px" /><img src="https://vn-test-11.slatic.net/shop/75da179672386cafda3f16fe625d50fa.jpeg" style="height:1333px; width:1000px" /></li>
</ul>

<h2>Đặc t&iacute;nh sản phẩm</h2>

<ul>
	<li>Thương hiệu
	<p>OMG</p>
	</li>
	<li>SKU
	<p>244689012_VNAMZ-313675640</p>
	</li>
	<li>D&ograve;ng sản phẩm
	<p>H&agrave;ng vừa về Camera h&agrave;nh tr&igrave;nh 3 mắt Full HD</p>
	</li>
</ul>
', NULL, CAST(N'2018-10-13 14:14:03.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (37, N'Camera hành trình SamSung-542', N'camera-hanh-trinh-samsung-542', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Camera%20hanh%20trinh%20va%20flycam/eken-h5s-plus-1-300x300.png', NULL, 4380000, NULL, NULL, 10, 26, N'<ul>
	<li>Cam h&agrave;nh tr&igrave;nh Pioneer h&agrave;ng mới về liền cam l&ugrave;i.</li>
	<li>Si&ecirc;u n&eacute;t, quay trước, sau v&agrave; trong xe</li>
	<li>Bảo h&agrave;nh 1 năm</li>
</ul>

<ul>
	<li>Cam h&agrave;nh tr&igrave;nh Pioneer h&agrave;ng mới về liền cam l&ugrave;i.</li>
	<li>Si&ecirc;u n&eacute;t, quay trước, sau v&agrave; trong xe</li>
	<li>Bảo h&agrave;nh 1 năm<img src="https://vn-test-11.slatic.net/shop/9f0a1758c6823ec1d8491d5f4bcffbf4.jpeg" style="height:1333px; width:1000px" /><img src="https://vn-test-11.slatic.net/shop/75da179672386cafda3f16fe625d50fa.jpeg" style="height:1333px; width:1000px" /></li>
</ul>

<h2>Đặc t&iacute;nh sản phẩm</h2>

<ul>
	<li>Thương hiệu
	<p>OMG</p>
	</li>
	<li>SKU
	<p>244689012_VNAMZ-313675640</p>
	</li>
	<li>D&ograve;ng sản phẩm
	<p>H&agrave;ng vừa về Camera h&agrave;nh tr&igrave;nh 3 mắt Full HD</p>
	</li>
</ul>
', NULL, CAST(N'2018-10-13 14:21:42.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (38, N'Camera hành trình Sony-ny-3205', N'camera-hanh-trinh-sony-ny-3205', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Camera%20hanh%20trinh%20va%20flycam/hqdefault.jpg', NULL, 9700000, NULL, NULL, 5, 26, N'<ul>
	<li>Cam h&agrave;nh tr&igrave;nh Pioneer h&agrave;ng mới về liền cam l&ugrave;i.</li>
	<li>Si&ecirc;u n&eacute;t, quay trước, sau v&agrave; trong xe</li>
	<li>Bảo h&agrave;nh 1 năm</li>
</ul>

<ul>
	<li>Cam h&agrave;nh tr&igrave;nh Pioneer h&agrave;ng mới về liền cam l&ugrave;i.</li>
	<li>Si&ecirc;u n&eacute;t, quay trước, sau v&agrave; trong xe</li>
	<li>Bảo h&agrave;nh 1 năm<img src="https://vn-test-11.slatic.net/shop/9f0a1758c6823ec1d8491d5f4bcffbf4.jpeg" style="height:1333px; width:1000px" /><img src="https://vn-test-11.slatic.net/shop/75da179672386cafda3f16fe625d50fa.jpeg" style="height:1333px; width:1000px" /></li>
</ul>

<h2>Đặc t&iacute;nh sản phẩm</h2>

<ul>
	<li>Thương hiệu
	<p>OMG</p>
	</li>
	<li>SKU
	<p>244689012_VNAMZ-313675640</p>
	</li>
	<li>D&ograve;ng sản phẩm
	<p>H&agrave;ng vừa về Camera h&agrave;nh tr&igrave;nh 3 mắt Full HD</p>
	</li>
</ul>
', NULL, CAST(N'2018-10-13 14:22:06.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (39, N'Camera hành trình SamSung-432', N'camera-hanh-trinh-samsung-432', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Camera%20hanh%20trinh%20va%20flycam/camera-h%C3%A0nh-tr%C3%ACnh-sj7000.png', NULL, 5460000, 10, NULL, 0, 26, N'<ul>
	<li>Cam h&agrave;nh tr&igrave;nh Pioneer h&agrave;ng mới về liền cam l&ugrave;i.</li>
	<li>Si&ecirc;u n&eacute;t, quay trước, sau v&agrave; trong xe</li>
	<li>Bảo h&agrave;nh 1 năm</li>
</ul>

<ul>
	<li>Cam h&agrave;nh tr&igrave;nh Pioneer h&agrave;ng mới về liền cam l&ugrave;i.</li>
	<li>Si&ecirc;u n&eacute;t, quay trước, sau v&agrave; trong xe</li>
	<li>Bảo h&agrave;nh 1 năm<img src="https://vn-test-11.slatic.net/shop/9f0a1758c6823ec1d8491d5f4bcffbf4.jpeg" style="height:1333px; width:1000px" /><img src="https://vn-test-11.slatic.net/shop/75da179672386cafda3f16fe625d50fa.jpeg" style="height:1333px; width:1000px" /></li>
</ul>

<h2>Đặc t&iacute;nh sản phẩm</h2>

<ul>
	<li>Thương hiệu
	<p>OMG</p>
	</li>
	<li>SKU
	<p>244689012_VNAMZ-313675640</p>
	</li>
	<li>D&ograve;ng sản phẩm
	<p>H&agrave;ng vừa về Camera h&agrave;nh tr&igrave;nh 3 mắt Full HD</p>
	</li>
</ul>
', NULL, CAST(N'2018-10-13 14:22:23.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, CAST(N'2018-04-12 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (40, N'Máy bay flycam sjrc-422t', N'may-bay-flycam-sjrc-422t', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Camera%20hanh%20trinh%20va%20flycam/flycam-mjx-bugs-3-linhkienstore11.jpg', NULL, 12000000, 10, NULL, 5, 26, N'<ul>
	<li>Cam h&agrave;nh tr&igrave;nh Pioneer h&agrave;ng mới về liền cam l&ugrave;i.</li>
	<li>Si&ecirc;u n&eacute;t, quay trước, sau v&agrave; trong xe</li>
	<li>Bảo h&agrave;nh 1 năm</li>
</ul>

<ul>
	<li>Cam h&agrave;nh tr&igrave;nh Pioneer h&agrave;ng mới về liền cam l&ugrave;i.</li>
	<li>Si&ecirc;u n&eacute;t, quay trước, sau v&agrave; trong xe</li>
	<li>Bảo h&agrave;nh 1 năm<img src="https://vn-test-11.slatic.net/shop/9f0a1758c6823ec1d8491d5f4bcffbf4.jpeg" style="height:1333px; width:1000px" /><img src="https://vn-test-11.slatic.net/shop/75da179672386cafda3f16fe625d50fa.jpeg" style="height:1333px; width:1000px" /></li>
</ul>

<h2>Đặc t&iacute;nh sản phẩm</h2>

<ul>
	<li>Thương hiệu
	<p>OMG</p>
	</li>
	<li>SKU
	<p>244689012_VNAMZ-313675640</p>
	</li>
	<li>D&ograve;ng sản phẩm
	<p>H&agrave;ng vừa về Camera h&agrave;nh tr&igrave;nh 3 mắt Full HD</p>
	</li>
</ul>
', NULL, CAST(N'2018-10-13 14:22:44.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, CAST(N'2018-04-12 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (41, N'Tivi Sony-4k-HD-213', N'tivi-sony-4k-hd-213', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Tivi/download.jpg', NULL, 15000000, 10, NULL, 8, 25, N'<p>M&atilde; SKU: 397854</p>

<h3>Th&ocirc;ng số sản phẩm</h3>

<table cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<th>Quy c&aacute;ch đ&oacute;ng g&oacute;i</th>
			<td>S&aacute;ch hướng dẫn, Remote, Phiếu bảo h&agrave;nh, Ch&acirc;n đế</td>
		</tr>
		<tr>
			<th>Nơi Sản Xuất</th>
			<td>Việt Nam</td>
		</tr>
		<tr>
			<th>Bảo h&agrave;nh</th>
			<td>12 months</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>N/A</td>
		</tr>
		<tr>
			<th>Độ ph&acirc;n giải</th>
			<td>Full HD (1920 x 1080)</td>
		</tr>
		<tr>
			<th>TV Th&ocirc;ng minh</th>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<th>&Acirc;m thanh</th>
			<td>C&ocirc;ng nghệ &acirc;m thanh V-audio</td>
		</tr>
	</tbody>
</table>

<p>Th&ocirc;ng tin sản phẩm</p>

<p><img alt="ThÃ´ng sá»‘ ká»¹ thuáº­t Tivi Panasonic 40 inch TH-40E400V" src="https://cdn.tgdd.vn/Products/Images/1942/102180/Kit/tivi-panasonic-th-40e400v-1copy.jpg" /></p>
', NULL, CAST(N'2018-10-13 14:32:57.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, CAST(N'2018-04-12 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (42, N'Tivi Samsung-HDR-2135', N'tivi-samsung-hdr-2135', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Tivi/images.jpg', NULL, 27000000, 10, NULL, -2, 25, N'<p>M&atilde; SKU: 397854</p>

<h3>Th&ocirc;ng số sản phẩm</h3>

<table cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<th>Quy c&aacute;ch đ&oacute;ng g&oacute;i</th>
			<td>S&aacute;ch hướng dẫn, Remote, Phiếu bảo h&agrave;nh, Ch&acirc;n đế</td>
		</tr>
		<tr>
			<th>Nơi Sản Xuất</th>
			<td>Việt Nam</td>
		</tr>
		<tr>
			<th>Bảo h&agrave;nh</th>
			<td>12 months</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>N/A</td>
		</tr>
		<tr>
			<th>Độ ph&acirc;n giải</th>
			<td>Full HD (1920 x 1080)</td>
		</tr>
		<tr>
			<th>TV Th&ocirc;ng minh</th>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<th>&Acirc;m thanh</th>
			<td>C&ocirc;ng nghệ &acirc;m thanh V-audio</td>
		</tr>
	</tbody>
</table>

<p>Th&ocirc;ng tin sản phẩm</p>

<p><img alt="ThÃ´ng sá»‘ ká»¹ thuáº­t Tivi Panasonic 40 inch TH-40E400V" src="https://cdn.tgdd.vn/Products/Images/1942/102180/Kit/tivi-panasonic-th-40e400v-1copy.jpg" /></p>
', NULL, CAST(N'2018-10-13 14:33:18.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, CAST(N'2018-04-12 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (43, N'Tivi LG-321k540', N'tivi-lg-321k540', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Tivi/tivi-lg-32lk5400bpta-14-550x340.jpg', NULL, 13000000, NULL, NULL, 10, 25, N'<p>M&atilde; SKU: 397854</p>

<h3>Th&ocirc;ng số sản phẩm</h3>

<table cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<th>Quy c&aacute;ch đ&oacute;ng g&oacute;i</th>
			<td>S&aacute;ch hướng dẫn, Remote, Phiếu bảo h&agrave;nh, Ch&acirc;n đế</td>
		</tr>
		<tr>
			<th>Nơi Sản Xuất</th>
			<td>Việt Nam</td>
		</tr>
		<tr>
			<th>Bảo h&agrave;nh</th>
			<td>12 months</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>N/A</td>
		</tr>
		<tr>
			<th>Độ ph&acirc;n giải</th>
			<td>Full HD (1920 x 1080)</td>
		</tr>
		<tr>
			<th>TV Th&ocirc;ng minh</th>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<th>&Acirc;m thanh</th>
			<td>C&ocirc;ng nghệ &acirc;m thanh V-audio</td>
		</tr>
	</tbody>
</table>

<p>Th&ocirc;ng tin sản phẩm</p>

<p><img alt="ThÃ´ng sá»‘ ká»¹ thuáº­t Tivi Panasonic 40 inch TH-40E400V" src="https://cdn.tgdd.vn/Products/Images/1942/102180/Kit/tivi-panasonic-th-40e400v-1copy.jpg" /></p>
', NULL, CAST(N'2018-10-13 14:33:39.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (44, N'Tivi LG-43uk6340', N'tivi-lg-43uk6340', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Tivi/tivi-lg-43uk6340ptf-22-550x340.jpg', NULL, 12500000, NULL, NULL, 5, 25, N'<p>M&atilde; SKU: 397854</p>

<h3>Th&ocirc;ng số sản phẩm</h3>

<table cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<th>Quy c&aacute;ch đ&oacute;ng g&oacute;i</th>
			<td>S&aacute;ch hướng dẫn, Remote, Phiếu bảo h&agrave;nh, Ch&acirc;n đế</td>
		</tr>
		<tr>
			<th>Nơi Sản Xuất</th>
			<td>Việt Nam</td>
		</tr>
		<tr>
			<th>Bảo h&agrave;nh</th>
			<td>12 months</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>N/A</td>
		</tr>
		<tr>
			<th>Độ ph&acirc;n giải</th>
			<td>Full HD (1920 x 1080)</td>
		</tr>
		<tr>
			<th>TV Th&ocirc;ng minh</th>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<th>&Acirc;m thanh</th>
			<td>C&ocirc;ng nghệ &acirc;m thanh V-audio</td>
		</tr>
	</tbody>
</table>

<p>Th&ocirc;ng tin sản phẩm</p>

<p><img alt="ThÃ´ng sá»‘ ká»¹ thuáº­t Tivi Panasonic 40 inch TH-40E400V" src="https://cdn.tgdd.vn/Products/Images/1942/102180/Kit/tivi-panasonic-th-40e400v-1copy.jpg" /></p>
', NULL, CAST(N'2018-10-13 14:34:01.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (45, N'Tivi SamSung-ua43n5500', N'tivi-samsung-ua43n5500', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Tivi/tivi-samsung-ua43n5500-13-550x340.jpg', NULL, 16000000, NULL, NULL, 0, 25, NULL, NULL, CAST(N'2018-10-13 14:34:16.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (46, N'Tivi Samsung-ua43nu7400', N'tivi-samsung-ua43nu7400', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Tivi/tivi-samsung-ua43nu7400-14-550x340.jpg', NULL, 19700000, NULL, NULL, 8, 25, N'<p>M&atilde; SKU: 397854</p>

<h3>Th&ocirc;ng số sản phẩm</h3>

<table cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<th>Quy c&aacute;ch đ&oacute;ng g&oacute;i</th>
			<td>S&aacute;ch hướng dẫn, Remote, Phiếu bảo h&agrave;nh, Ch&acirc;n đế</td>
		</tr>
		<tr>
			<th>Nơi Sản Xuất</th>
			<td>Việt Nam</td>
		</tr>
		<tr>
			<th>Bảo h&agrave;nh</th>
			<td>12 months</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>N/A</td>
		</tr>
		<tr>
			<th>Độ ph&acirc;n giải</th>
			<td>Full HD (1920 x 1080)</td>
		</tr>
		<tr>
			<th>TV Th&ocirc;ng minh</th>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<th>&Acirc;m thanh</th>
			<td>C&ocirc;ng nghệ &acirc;m thanh V-audio</td>
		</tr>
	</tbody>
</table>

<p>Th&ocirc;ng tin sản phẩm</p>

<p><img alt="ThÃ´ng sá»‘ ká»¹ thuáº­t Tivi Panasonic 40 inch TH-40E400V" src="https://cdn.tgdd.vn/Products/Images/1942/102180/Kit/tivi-panasonic-th-40e400v-1copy.jpg" /></p>
', NULL, CAST(N'2018-10-13 14:34:30.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (47, N'Tivi Samsung-vtbs11v3277', N'tivi-samsung-vtbs11v3277', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/Tivi/vtbs1lv3277-1519804965.jpg', NULL, 12000000, NULL, NULL, 10, 25, N'<p>M&atilde; SKU: 397854</p>

<h3>Th&ocirc;ng số sản phẩm</h3>

<table cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<th>Quy c&aacute;ch đ&oacute;ng g&oacute;i</th>
			<td>S&aacute;ch hướng dẫn, Remote, Phiếu bảo h&agrave;nh, Ch&acirc;n đế</td>
		</tr>
		<tr>
			<th>Nơi Sản Xuất</th>
			<td>Việt Nam</td>
		</tr>
		<tr>
			<th>Bảo h&agrave;nh</th>
			<td>12 months</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>N/A</td>
		</tr>
		<tr>
			<th>Độ ph&acirc;n giải</th>
			<td>Full HD (1920 x 1080)</td>
		</tr>
		<tr>
			<th>TV Th&ocirc;ng minh</th>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<th>&Acirc;m thanh</th>
			<td>C&ocirc;ng nghệ &acirc;m thanh V-audio</td>
		</tr>
	</tbody>
</table>

<p>Th&ocirc;ng tin sản phẩm</p>

<p><img alt="ThÃ´ng sá»‘ ká»¹ thuáº­t Tivi Panasonic 40 inch TH-40E400V" src="https://cdn.tgdd.vn/Products/Images/1942/102180/Kit/tivi-panasonic-th-40e400v-1copy.jpg" /></p>
', NULL, CAST(N'2018-10-13 14:34:58.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (48, N'Máy in Sony-1003', N'may-in-sony-1003', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/May%20in/10036181-2_36k2-wx.jpg', NULL, 7200000, NULL, NULL, 0, 6, N'<ul>
	<li>Th&ocirc;ng tin sản phẩm</li>
	<li>Đ&aacute;nh gi&aacute; &amp; nhận x&eacute;t&nbsp;( 0 )</li>
</ul>

<p>M&atilde; SKU: 496218</p>

<h3>Th&ocirc;ng số sản phẩm</h3>

<table cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<th>Xuất xứ thương hiệu</th>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<th>Nơi Sản Xuất</th>
			<td>Trung Quốc</td>
		</tr>
		<tr>
			<th>Bảo h&agrave;nh</th>
			<td>2 Years</td>
		</tr>
		<tr>
			<th>Độ ph&acirc;n giải</th>
			<td>None</td>
		</tr>
	</tbody>
</table>

<p>Th&ocirc;ng tin sản phẩm</p>

<h3><big>* Lưu &yacute;: Sản phẩm m&aacute;y in chỉ &aacute;p dụng bảo h&agrave;nh trong trường hợp c&oacute; lỗi từ nh&agrave; sản xuất, kh&ocirc;ng &aacute;p dung đổi/trả theo ch&iacute;nh s&aacute;ch của Lotte.vn</big><br />
<br />
Thiết kế hiện đại</h3>

<p>M&aacute;y in laser Brother HL-L2321D được thiết kế với kiểu d&aacute;ng hiện đại v&agrave; gam m&agrave;u đen tinh tế. Th&ecirc;m v&agrave;o đ&oacute;, độ bền c&uacute;a m&aacute;y cũng được người d&ugrave;ng đ&aacute;nh gi&aacute; rất cao.</p>

<p><img alt="Máy in laser Brother HL-L2321D với thiết kế cứng cáp" src="http://cdn.nguyenkimmall.com/images/companies/1/000000000010012500-a-may-in-brother-11.jpg" />​​​​​​​</p>
', NULL, CAST(N'2018-10-13 14:37:00.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (49, N'Máy in fed-201', N'may-in-fed-201', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/May%20in/1703_343_fed75fc7a70d870793b92b161bf30403.jpg', NULL, 3200000, NULL, NULL, 10, 6, N'<ul>
	<li>Th&ocirc;ng tin sản phẩm</li>
	<li>Đ&aacute;nh gi&aacute; &amp; nhận x&eacute;t&nbsp;( 0 )</li>
</ul>

<p>M&atilde; SKU: 496218</p>

<h3>Th&ocirc;ng số sản phẩm</h3>

<table cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<th>Xuất xứ thương hiệu</th>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<th>Nơi Sản Xuất</th>
			<td>Trung Quốc</td>
		</tr>
		<tr>
			<th>Bảo h&agrave;nh</th>
			<td>2 Years</td>
		</tr>
		<tr>
			<th>Độ ph&acirc;n giải</th>
			<td>None</td>
		</tr>
	</tbody>
</table>

<p>Th&ocirc;ng tin sản phẩm</p>

<h3><big>* Lưu &yacute;: Sản phẩm m&aacute;y in chỉ &aacute;p dụng bảo h&agrave;nh trong trường hợp c&oacute; lỗi từ nh&agrave; sản xuất, kh&ocirc;ng &aacute;p dung đổi/trả theo ch&iacute;nh s&aacute;ch của Lotte.vn</big><br />
<br />
Thiết kế hiện đại</h3>

<p>M&aacute;y in laser Brother HL-L2321D được thiết kế với kiểu d&aacute;ng hiện đại v&agrave; gam m&agrave;u đen tinh tế. Th&ecirc;m v&agrave;o đ&oacute;, độ bền c&uacute;a m&aacute;y cũng được người d&ugrave;ng đ&aacute;nh gi&aacute; rất cao.</p>

<p><img alt="Máy in laser Brother HL-L2321D với thiết kế cứng cáp" src="http://cdn.nguyenkimmall.com/images/companies/1/000000000010012500-a-may-in-brother-11.jpg" />​​​​​​​</p>
', NULL, CAST(N'2018-10-13 14:37:14.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (50, N'Máy in canor-342', N'may-in-canor-342', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/May%20in/31529-canon-g2010.png', NULL, 6500000, NULL, NULL, 5, 6, N'<ul>
	<li>Th&ocirc;ng tin sản phẩm</li>
	<li>Đ&aacute;nh gi&aacute; &amp; nhận x&eacute;t&nbsp;( 0 )</li>
</ul>

<p>M&atilde; SKU: 496218</p>

<h3>Th&ocirc;ng số sản phẩm</h3>

<table cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<th>Xuất xứ thương hiệu</th>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<th>Nơi Sản Xuất</th>
			<td>Trung Quốc</td>
		</tr>
		<tr>
			<th>Bảo h&agrave;nh</th>
			<td>2 Years</td>
		</tr>
		<tr>
			<th>Độ ph&acirc;n giải</th>
			<td>None</td>
		</tr>
	</tbody>
</table>

<p>Th&ocirc;ng tin sản phẩm</p>

<h3><big>* Lưu &yacute;: Sản phẩm m&aacute;y in chỉ &aacute;p dụng bảo h&agrave;nh trong trường hợp c&oacute; lỗi từ nh&agrave; sản xuất, kh&ocirc;ng &aacute;p dung đổi/trả theo ch&iacute;nh s&aacute;ch của Lotte.vn</big><br />
<br />
Thiết kế hiện đại</h3>

<p>M&aacute;y in laser Brother HL-L2321D được thiết kế với kiểu d&aacute;ng hiện đại v&agrave; gam m&agrave;u đen tinh tế. Th&ecirc;m v&agrave;o đ&oacute;, độ bền c&uacute;a m&aacute;y cũng được người d&ugrave;ng đ&aacute;nh gi&aacute; rất cao.</p>

<p><img alt="Máy in laser Brother HL-L2321D với thiết kế cứng cáp" src="http://cdn.nguyenkimmall.com/images/companies/1/000000000010012500-a-may-in-brother-11.jpg" />​​​​​​​</p>
', NULL, CAST(N'2018-10-13 14:37:25.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (51, N'Máy in Samsung-2nt3', N'may-in-samsung-2nt3', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/May%20in/may-in-laser-canon-lbp-6030-trananh-1.jpg', NULL, 4300000, NULL, NULL, 0, 6, N'<ul>
	<li>Th&ocirc;ng tin sản phẩm</li>
	<li>Đ&aacute;nh gi&aacute; &amp; nhận x&eacute;t&nbsp;( 0 )</li>
</ul>

<p>M&atilde; SKU: 496218</p>

<h3>Th&ocirc;ng số sản phẩm</h3>

<table cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<th>Xuất xứ thương hiệu</th>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<th>Nơi Sản Xuất</th>
			<td>Trung Quốc</td>
		</tr>
		<tr>
			<th>Bảo h&agrave;nh</th>
			<td>2 Years</td>
		</tr>
		<tr>
			<th>Độ ph&acirc;n giải</th>
			<td>None</td>
		</tr>
	</tbody>
</table>

<p>Th&ocirc;ng tin sản phẩm</p>

<h3><big>* Lưu &yacute;: Sản phẩm m&aacute;y in chỉ &aacute;p dụng bảo h&agrave;nh trong trường hợp c&oacute; lỗi từ nh&agrave; sản xuất, kh&ocirc;ng &aacute;p dung đổi/trả theo ch&iacute;nh s&aacute;ch của Lotte.vn</big><br />
<br />
Thiết kế hiện đại</h3>

<p>M&aacute;y in laser Brother HL-L2321D được thiết kế với kiểu d&aacute;ng hiện đại v&agrave; gam m&agrave;u đen tinh tế. Th&ecirc;m v&agrave;o đ&oacute;, độ bền c&uacute;a m&aacute;y cũng được người d&ugrave;ng đ&aacute;nh gi&aacute; rất cao.</p>

<p><img alt="Máy in laser Brother HL-L2321D với thiết kế cứng cáp" src="http://cdn.nguyenkimmall.com/images/companies/1/000000000010012500-a-may-in-brother-11.jpg" />​​​​​​​</p>
', NULL, CAST(N'2018-10-13 14:38:46.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (52, N'Máy in ONY-2316', N'may-in-ony-2316', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/May%20in/OKI%20MB472%20(1).png', NULL, 5300000, NULL, NULL, 5, 6, N'<ul>
	<li>Th&ocirc;ng tin sản phẩm</li>
	<li>Đ&aacute;nh gi&aacute; &amp; nhận x&eacute;t&nbsp;( 0 )</li>
</ul>

<p>M&atilde; SKU: 496218</p>

<h3>Th&ocirc;ng số sản phẩm</h3>

<table cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<th>Xuất xứ thương hiệu</th>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<th>Nơi Sản Xuất</th>
			<td>Trung Quốc</td>
		</tr>
		<tr>
			<th>Bảo h&agrave;nh</th>
			<td>2 Years</td>
		</tr>
		<tr>
			<th>Độ ph&acirc;n giải</th>
			<td>None</td>
		</tr>
	</tbody>
</table>

<p>Th&ocirc;ng tin sản phẩm</p>

<h3><big>* Lưu &yacute;: Sản phẩm m&aacute;y in chỉ &aacute;p dụng bảo h&agrave;nh trong trường hợp c&oacute; lỗi từ nh&agrave; sản xuất, kh&ocirc;ng &aacute;p dung đổi/trả theo ch&iacute;nh s&aacute;ch của Lotte.vn</big><br />
<br />
Thiết kế hiện đại</h3>

<p>M&aacute;y in laser Brother HL-L2321D được thiết kế với kiểu d&aacute;ng hiện đại v&agrave; gam m&agrave;u đen tinh tế. Th&ecirc;m v&agrave;o đ&oacute;, độ bền c&uacute;a m&aacute;y cũng được người d&ugrave;ng đ&aacute;nh gi&aacute; rất cao.</p>

<p><img alt="Máy in laser Brother HL-L2321D với thiết kế cứng cáp" src="http://cdn.nguyenkimmall.com/images/companies/1/000000000010012500-a-may-in-brother-11.jpg" />​​​​​​​</p>
', NULL, CAST(N'2018-10-13 14:39:02.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (53, N'Máy in OKI-6433', N'may-in-oki-6433', N'Đây là một trong những mấu tốt nhất trên thị trường, chắc chắn sẽ làm bạn hài lòng', N'/Data/images/May%20in/download%20(2).jpg', NULL, 3200000, NULL, NULL, 10, 6, N'<ul>
	<li>Th&ocirc;ng tin sản phẩm</li>
	<li>Đ&aacute;nh gi&aacute; &amp; nhận x&eacute;t&nbsp;( 0 )</li>
</ul>

<p>M&atilde; SKU: 496218</p>

<h3>Th&ocirc;ng số sản phẩm</h3>

<table cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<th>Xuất xứ thương hiệu</th>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<th>Nơi Sản Xuất</th>
			<td>Trung Quốc</td>
		</tr>
		<tr>
			<th>Bảo h&agrave;nh</th>
			<td>2 Years</td>
		</tr>
		<tr>
			<th>Độ ph&acirc;n giải</th>
			<td>None</td>
		</tr>
	</tbody>
</table>

<p>Th&ocirc;ng tin sản phẩm</p>

<h3><big>* Lưu &yacute;: Sản phẩm m&aacute;y in chỉ &aacute;p dụng bảo h&agrave;nh trong trường hợp c&oacute; lỗi từ nh&agrave; sản xuất, kh&ocirc;ng &aacute;p dung đổi/trả theo ch&iacute;nh s&aacute;ch của Lotte.vn</big><br />
<br />
Thiết kế hiện đại</h3>

<p>M&aacute;y in laser Brother HL-L2321D được thiết kế với kiểu d&aacute;ng hiện đại v&agrave; gam m&agrave;u đen tinh tế. Th&ecirc;m v&agrave;o đ&oacute;, độ bền c&uacute;a m&aacute;y cũng được người d&ugrave;ng đ&aacute;nh gi&aacute; rất cao.</p>

<p><img alt="Máy in laser Brother HL-L2321D với thiết kế cứng cáp" src="http://cdn.nguyenkimmall.com/images/companies/1/000000000010012500-a-may-in-brother-11.jpg" />​​​​​​​</p>
', NULL, CAST(N'2018-10-13 14:39:15.000' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (54, N'may-chong-trom', N'may-chong-trom', N'khong', N'/Data/images/500x417Bao-dong-rung-DKTX-V1-1(1).jpg', NULL, 34232, 3232, 0, 4, 1, N'<p>fdsaf</p>
', NULL, CAST(N'2018-12-09 14:37:49.267' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, N'/Data/images/NoImage/NoImage.png|/Data/images/NoImage/NoImage.png|/Data/images/500x417Bao-dong-rung-DKTX-V1-1(1).jpg|/Data/images/NoImage/NoImage.png|')
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tophot], [Viewcount], [hinhanh]) VALUES (55, N'tivi abcd', N'tivi-abcd', NULL, N'/Data/images/Tivi/images.jpg', NULL, 12321321321, NULL, NULL, 2, 23, N'<p>abccd</p>
', NULL, CAST(N'2019-01-07 13:10:18.487' AS DateTime), N'Admin', NULL, N'Admin', NULL, NULL, 1, NULL, NULL, N'/Data/images/NoImage/NoImage.png|/Data/images/NoImage/NoImage.png|/Data/images/NoImage/NoImage.png|/Data/images/NoImage/NoImage.png')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [MetaTitle], [ParentCategoryID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (1, N'Báo Động Chống Trộm', N'bao-dong-chong-trom', NULL, 1, NULL, CAST(N'2018-10-05 15:26:47.550' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [MetaTitle], [ParentCategoryID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (3, N'Camera Quan Sát', N'camera-quan-sat', NULL, 1, NULL, CAST(N'2018-10-05 15:32:03.453' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [MetaTitle], [ParentCategoryID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (4, N'Chấm Công Vân Tay', N'cham-cong-van-tay', NULL, 1, NULL, CAST(N'2018-10-05 15:32:18.267' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [MetaTitle], [ParentCategoryID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (5, N'Chuông cửa có hình', N'chuong-cua-co-hinh', NULL, 1, NULL, CAST(N'2018-10-05 15:32:32.513' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [MetaTitle], [ParentCategoryID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (6, N'Máy In', N'may-in', NULL, 1, NULL, CAST(N'2018-10-05 15:48:24.633' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [MetaTitle], [ParentCategoryID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (7, N'Thiết Bị Chiếu Sáng', N'thiet-bi-chieu-sang', NULL, 1, NULL, CAST(N'2018-10-05 15:48:43.100' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [MetaTitle], [ParentCategoryID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (23, N'Điện Thoại', N'dien-thoai', NULL, 1, NULL, CAST(N'2018-10-10 22:50:47.677' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [MetaTitle], [ParentCategoryID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (25, N'Tivi', N'tivi', NULL, 1, NULL, CAST(N'2018-10-13 14:31:01.007' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [MetaTitle], [ParentCategoryID], [DisplayOrder], [SeoTittle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (26, N'Camera hành trình và flycam', N'camera-hanh-trinh', NULL, NULL, NULL, CAST(N'2018-10-13 15:13:14.240' AS DateTime), N'Admin', NULL, NULL, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([SlideID], [Image], [DisplayOrder], [Link], [Description], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (8, N'/Data/images/500x417Bao-dong-rung-DKTX-V1-1(1).jpg', NULL, N'san-pham', NULL, CAST(N'2018-10-20 22:33:07.283' AS DateTime), N'Admin', N'08/12/2018 20:49:44', NULL, 1)
INSERT [dbo].[Slide] ([SlideID], [Image], [DisplayOrder], [Link], [Description], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (14, N'/Data/images/Tivi/images.jpg', NULL, N'san-pham', NULL, CAST(N'2018-10-21 14:36:38.210' AS DateTime), N'Admin', N'08/12/2018 20:49:34', NULL, 1)
INSERT [dbo].[Slide] ([SlideID], [Image], [DisplayOrder], [Link], [Description], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (15, N'/Data/images/Camera%20hanh%20trinh%20va%20flycam/new-0802-camera-a19.png', 1, N'san-pham', NULL, CAST(N'2018-12-04 00:00:29.177' AS DateTime), N'Admin', N'08/12/2018 20:49:23', NULL, 1)
SET IDENTITY_INSERT [dbo].[Slide] OFF
SET IDENTITY_INSERT [dbo].[UserAccount] ON 

INSERT [dbo].[UserAccount] ([UserID], [UserAccount], [PassWord], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [PermissionID]) VALUES (1, N'Admin', N'30facee127ba33c2a7c57d1482e10132', N'huy', N'tp.hochiminh', N'hoanghuy', N'21321', NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[UserAccount] ([UserID], [UserAccount], [PassWord], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [PermissionID]) VALUES (2, N'test', N'202cb962ac59075b964b07152d234b70', N'test', NULL, NULL, NULL, NULL, NULL, CAST(N'2018-11-10 00:09:31.930' AS DateTime), NULL, 1, 2)
SET IDENTITY_INSERT [dbo].[UserAccount] OFF
ALTER TABLE [dbo].[About]  WITH CHECK ADD  CONSTRAINT [FK_About_UserAccount] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[UserAccount] ([UserAccount])
GO
ALTER TABLE [dbo].[About] CHECK CONSTRAINT [FK_About_UserAccount]
GO
ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_News] FOREIGN KEY([NewsID])
REFERENCES [dbo].[News] ([NewsID])
GO
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_News]
GO
ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_UserAccount1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[UserAccount] ([UserAccount])
GO
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_UserAccount1]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_MenuType] FOREIGN KEY([MenuTypeID])
REFERENCES [dbo].[MenuType] ([MenuTypeID])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_MenuType]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_UserAccount1] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[UserAccount] ([UserAccount])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_UserAccount1]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Order__50FB042B] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__Order__50FB042B]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Produ__477199F1] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__Produ__477199F1]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategory] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_UserAccount] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[UserAccount] ([UserAccount])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_UserAccount]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_UserAccount] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[UserAccount] ([UserAccount])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_UserAccount]
GO
ALTER TABLE [dbo].[Slide]  WITH CHECK ADD  CONSTRAINT [FK_Slide_UserAccount] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[UserAccount] ([UserAccount])
GO
ALTER TABLE [dbo].[Slide] CHECK CONSTRAINT [FK_Slide_UserAccount]
GO
ALTER TABLE [dbo].[UserAccount]  WITH CHECK ADD  CONSTRAINT [FK_UserAccount_Permission] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permission] ([PermissionID])
GO
ALTER TABLE [dbo].[UserAccount] CHECK CONSTRAINT [FK_UserAccount_Permission]
GO
USE [master]
GO
ALTER DATABASE [ShopOnline] SET  READ_WRITE 
GO
