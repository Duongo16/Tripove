USE [tripove]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 05/07/2024 8:50:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](255) NULL,
	[username] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[gender] [nvarchar](255) NULL,
	[dateOfBirth] [date] NULL,
	[phoneNumber] [int] NULL,
	[email] [nvarchar](255) NULL,
	[address] [nvarchar](750) NULL,
	[image] [nvarchar](255) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluate]    Script Date: 05/07/2024 8:50:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Route_Detailid] [int] NOT NULL,
	[Accountid] [int] NOT NULL,
	[star] [int] NULL,
	[comment] [nvarchar](750) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 05/07/2024 8:50:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 05/07/2024 8:50:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[content] [ntext] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[image] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Route]    Script Date: 05/07/2024 8:50:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[Arrival_Locationid] [int] NOT NULL,
	[Departure_Locationid] [int] NOT NULL,
	[price] [int] NULL,
	[detail] [nvarchar](255) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Route_Detail]    Script Date: 05/07/2024 8:50:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route_Detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Routeid] [int] NOT NULL,
	[departureDate] [date] NULL,
	[departureTime] [time](7) NULL,
	[VehiclelicensePlate] [nvarchar](255) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seat]    Script Date: 05/07/2024 8:50:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[Route_Detailid] [int] NOT NULL,
	[Accountid] [int] NULL,
	[surcharge] [int] NULL,
	[paymentDate] [datetime] NULL,
	[pickUp] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 05/07/2024 8:50:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[licensePlate] [nvarchar](255) NOT NULL,
	[status] [int] NULL,
	[Vehicle_Categoryid] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[licensePlate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle_Category]    Script Date: 05/07/2024 8:50:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle_Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[utilities] [nvarchar](750) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[seatQuantity] [int] NULL,
	[seatType] [nvarchar](255) NULL,
	[image] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [role], [username], [password], [name], [gender], [dateOfBirth], [phoneNumber], [email], [address], [image], [created_at], [updated_at]) VALUES (1, N'admin', N'admin', N'123', N'Ngô Tùng Dương', N'male', CAST(N'2004-11-16' AS Date), 862521226, N'duongo1604@gmail.com', N'106, đường Vi Đức Thăng, phường Xương Giang, thành phố Bắc Giang', N'image/avatar/avatar.jpg', CAST(N'2024-06-03T09:11:32.757' AS DateTime), CAST(N'2024-06-26T08:06:07.170' AS DateTime))
INSERT [dbo].[Account] ([id], [role], [username], [password], [name], [gender], [dateOfBirth], [phoneNumber], [email], [address], [image], [created_at], [updated_at]) VALUES (3, N'user', N'linh', N'123', N'Ngô Bảo Linh', N'female', CAST(N'2011-12-20' AS Date), 123456, N'linh@gmail.com', N'số 106, đường Vi Đức Thăng, phường Xương Giang, thành phố Bắc Giang	', N'image/avatar/avatar-linh.jpg', CAST(N'2024-06-10T11:18:15.723' AS DateTime), CAST(N'2024-06-20T21:08:35.967' AS DateTime))
INSERT [dbo].[Account] ([id], [role], [username], [password], [name], [gender], [dateOfBirth], [phoneNumber], [email], [address], [image], [created_at], [updated_at]) VALUES (4, N'user', N'thao', N'123', N'Vũ Thị Bích Thảo', N'female', CAST(N'1979-09-12' AS Date), 97412422, N'thao@gmail.com', N'số 106, đường Vi Đức Thăng, phường Xương Giang, thành phố Bắc Giang	', N'image/avatar/avatar-thao.jpg', CAST(N'2024-06-10T11:18:47.803' AS DateTime), CAST(N'2024-06-20T21:09:02.003' AS DateTime))
INSERT [dbo].[Account] ([id], [role], [username], [password], [name], [gender], [dateOfBirth], [phoneNumber], [email], [address], [image], [created_at], [updated_at]) VALUES (5, N'user', N'nang', N'123', N'Ngô Mạnh Năng', N'male', CAST(N'1975-11-06' AS Date), 982526766, N'nang@gmail.com', N'', N'image/avatar/avatar-nang.JPG', CAST(N'2024-06-10T11:19:20.300' AS DateTime), NULL)
INSERT [dbo].[Account] ([id], [role], [username], [password], [name], [gender], [dateOfBirth], [phoneNumber], [email], [address], [image], [created_at], [updated_at]) VALUES (6, N'user', N'un', N'123', N'Linh Đan', N'female', CAST(N'2024-06-05' AS Date), 1234567, N'haun@gmail.com', N'', N'image/avatar/avatar-un.JPG', CAST(N'2024-06-10T11:19:54.630' AS DateTime), CAST(N'2024-06-10T11:20:06.713' AS DateTime))
INSERT [dbo].[Account] ([id], [role], [username], [password], [name], [gender], [dateOfBirth], [phoneNumber], [email], [address], [image], [created_at], [updated_at]) VALUES (7, N'user', N'can', N'123', N'Hoàng Thị Cần', N'female', CAST(N'2024-05-28' AS Date), 123456789, N'can@gmail.com', N'gần Xưởng In, phường Trần Nguyên Hãn, thành phố Bắc Giang, tỉnh Bắc Giang', N'image/avatar/avatar-ba.jpg', CAST(N'2024-06-10T11:20:34.903' AS DateTime), CAST(N'2024-06-20T21:10:49.347' AS DateTime))
INSERT [dbo].[Account] ([id], [role], [username], [password], [name], [gender], [dateOfBirth], [phoneNumber], [email], [address], [image], [created_at], [updated_at]) VALUES (8, N'user', N'ngoc', N'123', N'Trần Bảo Ngọc', N'female', CAST(N'2004-07-09' AS Date), 9876543, N'ngoc@gmail.com', N'', N'image/avatar/avatar-ngoc.JPG', CAST(N'2024-06-10T11:43:10.873' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Evaluate] ON 

INSERT [dbo].[Evaluate] ([id], [Route_Detailid], [Accountid], [star], [comment], [created_at], [updated_at]) VALUES (3, 1048, 1, 4, N'<p><i>cũng ok</i></p>', CAST(N'2024-07-02T16:42:02.193' AS DateTime), NULL)
INSERT [dbo].[Evaluate] ([id], [Route_Detailid], [Accountid], [star], [comment], [created_at], [updated_at]) VALUES (4, 1048, 3, 5, N'<p>Xe rất đẹp, sạch sẽ và mát mẻ, <strong>sẽ ủng hộ tiếp!</strong></p>', CAST(N'2024-07-02T16:48:25.810' AS DateTime), NULL)
INSERT [dbo].[Evaluate] ([id], [Route_Detailid], [Accountid], [star], [comment], [created_at], [updated_at]) VALUES (5, 1048, 4, 4, N'<p>Mùi xe <i>hơi khó chịu</i> một chút nhưng bù lại khá thoáng mát và sạch sẽ</p>', CAST(N'2024-07-02T16:50:12.137' AS DateTime), NULL)
INSERT [dbo].[Evaluate] ([id], [Route_Detailid], [Accountid], [star], [comment], [created_at], [updated_at]) VALUES (6, 1053, 1, 5, N'<p>Xe <i>đi êm</i>, mùi <i>dễ chịu</i>, tôi <i>rất thoải mái </i>với dịch vụ của bên hãng!</p>', CAST(N'2024-07-02T20:59:06.807' AS DateTime), NULL)
INSERT [dbo].[Evaluate] ([id], [Route_Detailid], [Accountid], [star], [comment], [created_at], [updated_at]) VALUES (7, 1057, 5, 5, N'<p>Xe đi thích lắm, nhanh nhưng <strong>rất êm và an toàn!</strong></p>', CAST(N'2024-07-03T14:54:28.080' AS DateTime), NULL)
INSERT [dbo].[Evaluate] ([id], [Route_Detailid], [Accountid], [star], [comment], [created_at], [updated_at]) VALUES (8, 1052, 7, 5, N'<p>Tôi rất hài lòng với chuyến đi, sẽ ủng hộ tiếp trong tương lai!</p>', CAST(N'2024-07-03T16:30:26.973' AS DateTime), NULL)
INSERT [dbo].[Evaluate] ([id], [Route_Detailid], [Accountid], [star], [comment], [created_at], [updated_at]) VALUES (9, 1057, 8, 3, N'<p>Xe đi ổn</p>', CAST(N'2024-07-03T16:32:21.423' AS DateTime), NULL)
INSERT [dbo].[Evaluate] ([id], [Route_Detailid], [Accountid], [star], [comment], [created_at], [updated_at]) VALUES (10, 1052, 8, 4, N'<p>Xe thoáng, đi rất thoải mái</p>', CAST(N'2024-07-03T16:40:52.697' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Evaluate] OFF
GO
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([id], [name]) VALUES (64, N'An Giang')
INSERT [dbo].[Location] ([id], [name]) VALUES (65, N'Bà Rịa - Vũng Tàu')
INSERT [dbo].[Location] ([id], [name]) VALUES (66, N'Bắc Giang')
INSERT [dbo].[Location] ([id], [name]) VALUES (67, N'Bắc Kạn')
INSERT [dbo].[Location] ([id], [name]) VALUES (68, N'Bạc Liêu')
INSERT [dbo].[Location] ([id], [name]) VALUES (69, N'Bắc Ninh')
INSERT [dbo].[Location] ([id], [name]) VALUES (70, N'Bến Tre')
INSERT [dbo].[Location] ([id], [name]) VALUES (71, N'Bình Định')
INSERT [dbo].[Location] ([id], [name]) VALUES (72, N'Bình Dương')
INSERT [dbo].[Location] ([id], [name]) VALUES (73, N'Bình Phước')
INSERT [dbo].[Location] ([id], [name]) VALUES (74, N'Bình Thuận')
INSERT [dbo].[Location] ([id], [name]) VALUES (75, N'Cà Mau')
INSERT [dbo].[Location] ([id], [name]) VALUES (76, N'Cần Thơ')
INSERT [dbo].[Location] ([id], [name]) VALUES (77, N'Cao Bằng')
INSERT [dbo].[Location] ([id], [name]) VALUES (78, N'Đà Nẵng')
INSERT [dbo].[Location] ([id], [name]) VALUES (79, N'Đắk Lắk')
INSERT [dbo].[Location] ([id], [name]) VALUES (80, N'Đắk Nông')
INSERT [dbo].[Location] ([id], [name]) VALUES (81, N'Điện Biên')
INSERT [dbo].[Location] ([id], [name]) VALUES (82, N'Đồng Nai')
INSERT [dbo].[Location] ([id], [name]) VALUES (83, N'Đồng Tháp')
INSERT [dbo].[Location] ([id], [name]) VALUES (84, N'Gia Lai')
INSERT [dbo].[Location] ([id], [name]) VALUES (85, N'Hà Giang')
INSERT [dbo].[Location] ([id], [name]) VALUES (86, N'Hà Nam')
INSERT [dbo].[Location] ([id], [name]) VALUES (87, N'Hà Nội')
INSERT [dbo].[Location] ([id], [name]) VALUES (88, N'Hà Tĩnh')
INSERT [dbo].[Location] ([id], [name]) VALUES (89, N'Hải Dương')
INSERT [dbo].[Location] ([id], [name]) VALUES (90, N'Hải Phòng')
INSERT [dbo].[Location] ([id], [name]) VALUES (91, N'Hậu Giang')
INSERT [dbo].[Location] ([id], [name]) VALUES (92, N'Hòa Bình')
INSERT [dbo].[Location] ([id], [name]) VALUES (93, N'Hưng Yên')
INSERT [dbo].[Location] ([id], [name]) VALUES (94, N'Khánh Hòa')
INSERT [dbo].[Location] ([id], [name]) VALUES (95, N'Kiên Giang')
INSERT [dbo].[Location] ([id], [name]) VALUES (96, N'Kon Tum')
INSERT [dbo].[Location] ([id], [name]) VALUES (97, N'Lai Châu')
INSERT [dbo].[Location] ([id], [name]) VALUES (98, N'Lâm Đồng')
INSERT [dbo].[Location] ([id], [name]) VALUES (99, N'Lạng Sơn')
INSERT [dbo].[Location] ([id], [name]) VALUES (100, N'Lào Cai')
INSERT [dbo].[Location] ([id], [name]) VALUES (101, N'Long An')
INSERT [dbo].[Location] ([id], [name]) VALUES (102, N'Nam Định')
INSERT [dbo].[Location] ([id], [name]) VALUES (103, N'Nghệ An')
INSERT [dbo].[Location] ([id], [name]) VALUES (104, N'Ninh Bình')
INSERT [dbo].[Location] ([id], [name]) VALUES (105, N'Ninh Thuận')
INSERT [dbo].[Location] ([id], [name]) VALUES (106, N'Phú Thọ')
INSERT [dbo].[Location] ([id], [name]) VALUES (107, N'Phú Yên')
INSERT [dbo].[Location] ([id], [name]) VALUES (108, N'Quảng Bình')
INSERT [dbo].[Location] ([id], [name]) VALUES (109, N'Quảng Nam')
INSERT [dbo].[Location] ([id], [name]) VALUES (110, N'Quảng Ngãi')
INSERT [dbo].[Location] ([id], [name]) VALUES (111, N'Quảng Ninh')
INSERT [dbo].[Location] ([id], [name]) VALUES (112, N'Quảng Trị')
INSERT [dbo].[Location] ([id], [name]) VALUES (113, N'Sóc Trăng')
INSERT [dbo].[Location] ([id], [name]) VALUES (114, N'Sơn La')
INSERT [dbo].[Location] ([id], [name]) VALUES (115, N'Tây Ninh')
INSERT [dbo].[Location] ([id], [name]) VALUES (116, N'Thái Bình')
INSERT [dbo].[Location] ([id], [name]) VALUES (117, N'Thái Nguyên')
INSERT [dbo].[Location] ([id], [name]) VALUES (118, N'Thanh Hóa')
INSERT [dbo].[Location] ([id], [name]) VALUES (119, N'Thừa Thiên Huế')
INSERT [dbo].[Location] ([id], [name]) VALUES (120, N'Tiền Giang')
INSERT [dbo].[Location] ([id], [name]) VALUES (121, N'TP. Hồ Chí Minh')
INSERT [dbo].[Location] ([id], [name]) VALUES (122, N'Trà Vinh')
INSERT [dbo].[Location] ([id], [name]) VALUES (123, N'Tuyên Quang')
INSERT [dbo].[Location] ([id], [name]) VALUES (124, N'Vĩnh Long')
INSERT [dbo].[Location] ([id], [name]) VALUES (125, N'Vĩnh Phúc')
INSERT [dbo].[Location] ([id], [name]) VALUES (126, N'Yên Bái')
SET IDENTITY_INSERT [dbo].[Location] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([id], [title], [content], [created_at], [updated_at], [image]) VALUES (1, N'Hệ thống đặt vé xe trực tuyến Tripove chính thức đi vào hoạt động kể từ ngày 10/07/2024', N'<p>Ch&agrave;o mừng qu&yacute; kh&aacute;ch đến với Tripove - nền tảng đặt v&eacute; xe h&agrave;ng đầu! Ch&uacute;ng t&ocirc;i rất vui mừng th&ocirc;ng b&aacute;o rằng hệ thống của ch&uacute;ng t&ocirc;i đ&atilde; ch&iacute;nh thức mở cửa, mang đến cho qu&yacute; kh&aacute;ch trải nghiệm đặt v&eacute; xe m&aacute;y trực tuyến ho&agrave;n to&agrave;n mới lạ v&agrave; tiện lợi.Với Tripove, bạn c&oacute; thể dễ d&agrave;ng lựa chọn c&aacute;c chuyến xe uy t&iacute;n, từ c&aacute;c nh&agrave; vận chuyển h&agrave;ng đầu, v&agrave; đặt v&eacute; ngay tại nh&agrave; một c&aacute;ch nhanh ch&oacute;ng. Hệ thống thanh to&aacute;n an to&agrave;n v&agrave; tiện lợi gi&uacute;p bạn ho&agrave;n th&agrave;nh mọi giao dịch một c&aacute;ch trơn tru, chỉ với v&agrave;i c&uacute; click chuột.</p>

<p>Ch&uacute;ng t&ocirc;i cam kết cung cấp dịch vụ chất lượng cao v&agrave; hỗ trợ kh&aacute;ch h&agrave;ng nhiệt t&igrave;nh, lu&ocirc;n sẵn s&agrave;ng đ&aacute;p ứng mọi nhu cầu của qu&yacute; kh&aacute;ch.</p>

<p>H&atilde;y c&ugrave;ng ch&uacute;ng t&ocirc;i kh&aacute;m ph&aacute; v&agrave; trải nghiệm sự kh&aacute;c biệt với Tripove ngay h&ocirc;m nay!</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<h3><strong>1. Hướng Dẫn Đặt V&eacute; Xe Trực Tuyến Tại Tripove</strong></h3>

<p><img alt="" src="https://static.vecteezy.com/system/resources/previews/010/200/115/non_2x/internet-service-for-book-and-buy-bus-ticket-travel-and-tourism-concept-tourist-planning-trip-online-passengers-buying-tickets-for-bus-in-mobile-app-vector.jpg" style="height:109px; width:265px" /></p>

<p>Giới Thiệu</p>

<p>Tr&ecirc;n thế giới ng&agrave;y nay, sự tiện lợi l&agrave; rất quan trọng. Việc đặt v&eacute; xe m&aacute;y trực tuyến ng&agrave;y c&agrave;ng trở n&ecirc;n phổ biến với nhiều du kh&aacute;ch. Với nền tảng như Tripove, qu&aacute; tr&igrave;nh n&agrave;y diễn ra một c&aacute;ch mượt m&agrave; v&agrave; hiệu quả. Hướng dẫn n&agrave;y sẽ chỉ bạn từng bước c&aacute;ch đặt v&eacute; xe m&aacute;y trực tuyến.</p>

<p>C&aacute;c Lợi &Iacute;ch Của Việc Đặt V&eacute; Xe M&aacute;y Trực Tuyến</p>

<ol>
	<li><strong>Tiện Lợi</strong>: Đặt v&eacute; từ nh&agrave; hoặc bất cứ đ&acirc;u bằng điện thoại th&ocirc;ng minh.</li>
	<li><strong>Tiết Kiệm Thời Gian</strong>: Kh&ocirc;ng cần phải đứng xếp h&agrave;ng d&agrave;i tại bến xe.</li>
	<li><strong>C&oacute; Sẵn 24/7</strong>: Đặt v&eacute; bất cứ l&uacute;c n&agrave;o, ở đ&acirc;u.</li>
	<li><strong>So S&aacute;nh Dễ D&agrave;ng</strong>: Dễ d&agrave;ng so s&aacute;nh gi&aacute; cả v&agrave; lịch tr&igrave;nh của c&aacute;c chuyến xe.</li>
</ol>

<h3><strong>2. Những Điều Cần Biết Khi Sử Dụng Dịch Vụ Đặt V&eacute; Xe&nbsp;</strong></h3>

<h3><img alt="" src="https://static.vecteezy.com/system/resources/previews/008/517/686/original/online-booking-design-concept-for-mobile-phone-hotel-flight-car-tickets-vector.jpg" style="height:177px; width:265px" /></h3>

<p>Điều G&igrave; L&agrave;m N&ecirc;n Sự Kh&aacute;c Biệt</p>

<ol>
	<li><strong>Độ Tin Cậy</strong>: Tripove cam kết về độ tin cậy v&agrave; dịch vụ chuy&ecirc;n nghiệp.</li>
	<li><strong>Sự Th&acirc;n Thiện</strong>: Dịch vụ hỗ trợ kh&aacute;ch h&agrave;ng nhanh ch&oacute;ng v&agrave; th&acirc;n thiện.</li>
	<li><strong>T&iacute;nh Năng Nổi Bật</strong>: C&aacute;c t&iacute;nh năng tiện &iacute;ch như th&ocirc;ng tin chi tiết về chuyến đi, đ&aacute;nh gi&aacute; từ người d&ugrave;ng.</li>
</ol>

<h3><strong>3. Lợi &Iacute;ch Của Việc Sử Dụng Tripove Để Đặt V&eacute; Xe&nbsp;</strong></h3>

<p><strong><img alt="" src="https://as1.ftcdn.net/v2/jpg/01/76/39/98/1000_F_176399837_ITXfxUJPx7F8o66ywgW5GEt5WZ0dQS4Z.jpg" style="height:212px; width:265px" /></strong></p>

<p>Đảm Bảo An To&agrave;n V&agrave; Tiện Lợi</p>

<ol>
	<li><strong>An To&agrave;n</strong>: Thanh to&aacute;n trực tuyến an to&agrave;n v&agrave; bảo mật.</li>
	<li><strong>Chất Lượng Dịch Vụ</strong>: Chọn lựa c&aacute;c đối t&aacute;c vận chuyển uy t&iacute;n, đảm bảo chất lượng dịch vụ.</li>
	<li><strong>Sự Chuy&ecirc;n Nghiệp</strong>: Đội ngũ hỗ trợ kh&aacute;ch h&agrave;ng nhiệt t&igrave;nh v&agrave; chuy&ecirc;n nghiệp.</li>
</ol>

<h3><strong>4. Cẩm Nang Đặt V&eacute; Xe Tại Tripove Cho Người Mới Bắt Đầu:</strong></h3>

<p><strong><img alt="" src="https://img.freepik.com/premium-vector/flight-tickets-online-booking-illustration-concept_108061-1163.jpg" style="height:265px; width:265px" /></strong></p>

<p>Hướng Dẫn Cụ Thể Bước Đặt V&eacute;</p>

<ol>
	<li><strong>Bước 1</strong>: Truy cập v&agrave;o trang web hoặc ứng dụng Tripove.</li>
	<li><strong>Bước 2</strong>: Chọn điểm đi v&agrave; điểm đến, nhập th&ocirc;ng tin chuyến đi.</li>
	<li><strong>Bước 3</strong>: Chọn lựa chuyến xe v&agrave; ghế ngồi ph&ugrave; hợp.</li>
	<li><strong>Bước 4</strong>: Thanh to&aacute;n v&agrave; nhận v&eacute; qua email hoặc ứng dụng Tripove.</li>
</ol>

<h3><strong>5. Tin Tức Về C&aacute;c Sự Kiện V&agrave; Ưu Đ&atilde;i Đặc Biệt Tại Tripove</strong></h3>

<p><strong><img alt="" src="https://cdn.dribbble.com/users/2317423/screenshots/16332635/media/27614114fb991d7f22748f3f48f939e9.jpg?resize=400x0" style="height:199px; width:265px" /></strong></p>

<p>Cập Nhật Tin Tức Mới Nhất</p>

<ol>
	<li><strong>Khuyến M&atilde;i Đặc Biệt</strong>: Th&ocirc;ng tin về c&aacute;c chương tr&igrave;nh khuyến m&atilde;i, giảm gi&aacute; hấp dẫn.</li>
	<li><strong>Sự Kiện Đặc Biệt</strong>: C&aacute;c sự kiện, lễ hội được tổ chức v&agrave; hỗ trợ bởi Tripove.</li>
</ol>

<p>&nbsp;</p>
', CAST(N'2024-07-04T17:29:50.887' AS DateTime), CAST(N'2024-07-05T11:37:44.603' AS DateTime), N'image/news/tripove.png')
INSERT [dbo].[News] ([id], [title], [content], [created_at], [updated_at], [image]) VALUES (9, N'Khám Phá Tripove Và Nhận Ngay Ưu Đãi Hấp Dẫn Cho Khách Hàng Mới!', N'<p>Ch&agrave;o mừng bạn đến với Tripove - nền tảng đặt v&eacute; xe h&agrave;ng đầu, nơi bạn c&oacute; thể kh&aacute;m ph&aacute; v&agrave; trải nghiệm hệ thống đặt v&eacute; xe m&aacute;y trực tuyến tiện lợi nhất hiện nay. Để ch&agrave;o đ&oacute;n bạn, ch&uacute;ng t&ocirc;i h&acirc;n hạnh giới thiệu chương tr&igrave;nh khuyến m&atilde;i đặc biệt d&agrave;nh ri&ecirc;ng cho kh&aacute;ch h&agrave;ng mới.</p>

<p><strong>Ưu đ&atilde;i đặc biệt cho kh&aacute;ch h&agrave;ng mới:</strong></p>

<ol>
	<li>
	<p><strong>Giảm gi&aacute; 10% cho lần đặt v&eacute; đầu ti&ecirc;n:</strong> Thưởng thức gi&aacute; v&eacute; ưu đ&atilde;i hơn khi bạn đặt v&eacute; xe m&aacute;y lần đầu ti&ecirc;n tại Tripove. Kh&ocirc;ng cần m&atilde; giảm gi&aacute;, gi&aacute; trị giảm sẽ được &aacute;p dụng tự động cho đơn h&agrave;ng của bạn.<img alt="" src="https://png.pngtree.com/png-clipart/20230814/original/pngtree-10-percent-off-sale-discount-banner-with-megaphone-picture-image_7921414.png" /></p>
	</li>
	<li>
	<p><strong>T&iacute;ch lũy điểm thưởng:</strong> Mỗi lần đặt v&eacute;, bạn sẽ nhận được điểm thưởng. T&iacute;ch lũy điểm v&agrave; đổi lấy những phần qu&agrave; hấp dẫn hoặc giảm gi&aacute; cho c&aacute;c chuyến đi tiếp theo<br />
	.<img alt="" src="https://cdn.dribbble.com/userupload/10511684/file/original-cbd77b398ae68d1c9c29106bb300b8f7.jpg?resize=400x300&amp;vertical=center" /></p>
	</li>
	<li>
	<p><strong>Hỗ trợ kh&aacute;ch h&agrave;ng 24/7:</strong> Đội ngũ hỗ trợ kh&aacute;ch h&agrave;ng của ch&uacute;ng t&ocirc;i lu&ocirc;n sẵn s&agrave;ng hỗ trợ bạn mọi l&uacute;c, đảm bảo mọi c&acirc;u hỏi v&agrave; y&ecirc;u cầu của bạn được giải đ&aacute;p nhanh ch&oacute;ng v&agrave; hiệu quả.</p>
	</li>
</ol>

<p>Đừng bỏ lỡ cơ hội trải nghiệm sự tiện lợi v&agrave; tiết kiệm với Tripove ngay h&ocirc;m nay! Đăng k&yacute; ngay để nhận ưu đ&atilde;i v&agrave; kh&aacute;m ph&aacute; những điều tuyệt vời m&agrave; ch&uacute;ng t&ocirc;i d&agrave;nh ri&ecirc;ng cho bạn.</p>

<p><strong>Li&ecirc;n hệ với ch&uacute;ng t&ocirc;i:</strong> Để biết th&ecirc;m th&ocirc;ng tin chi tiết về chương tr&igrave;nh khuyến m&atilde;i n&agrave;y v&agrave; c&aacute;c dịch vụ của Tripove, vui l&ograve;ng truy cập website của ch&uacute;ng t&ocirc;i hoặc li&ecirc;n hệ với ch&uacute;ng t&ocirc;i qua email hoặc điện thoại. Ch&uacute;ng t&ocirc;i rất mong được phục vụ v&agrave; ch&agrave;o đ&oacute;n bạn!</p>
', CAST(N'2024-07-05T11:37:08.620' AS DateTime), CAST(N'2024-07-05T11:37:35.843' AS DateTime), N'image/news/membership.png')
INSERT [dbo].[News] ([id], [title], [content], [created_at], [updated_at], [image]) VALUES (10, N'Thông Báo Bảo Trì Hệ Thống ', N'<p><em>K&iacute;nh gửi qu&yacute; kh&aacute;ch h&agrave;ng của Tripove,</em></p>

<p>Ch&uacute;ng t&ocirc;i xin tr&acirc;n trọng th&ocirc;ng b&aacute;o rằng để n&acirc;ng cao chất lượng dịch vụ v&agrave; đảm bảo hoạt động ổn định của hệ thống, Tripove sẽ tiến h&agrave;nh bảo tr&igrave; định kỳ. Qu&aacute; tr&igrave;nh bảo tr&igrave; n&agrave;y dự kiến sẽ diễn ra như sau:</p>

<ul>
	<li><strong>Thời gian bảo tr&igrave;:</strong>&nbsp;dự kiến từ 00:00 ng&agrave;y 20/08/2024 đến 06:00 ng&agrave;y 20/08/2024</li>
	<li><strong>Ảnh hưởng:</strong> Trong thời gian n&agrave;y, c&aacute;c dịch vụ đặt v&eacute; xe m&aacute;y trực tuyến của Tripove c&oacute; thể tạm thời kh&ocirc;ng hoạt động. Qu&yacute; kh&aacute;ch kh&ocirc;ng thể truy cập v&agrave; thực hiện giao dịch tr&ecirc;n nền tảng của ch&uacute;ng t&ocirc;i.</li>
	<li><strong>Mục đ&iacute;ch:</strong> Đ&acirc;y l&agrave; hoạt động bảo tr&igrave; thường xuy&ecirc;n để cải thiện hiệu suất hệ thống, bảo vệ dữ liệu kh&aacute;ch h&agrave;ng v&agrave; đảm bảo sự ổn định trong qu&aacute; tr&igrave;nh vận h&agrave;nh.</li>
</ul>

<p>Ch&uacute;ng t&ocirc;i th&agrave;nh thật xin lỗi về sự bất tiện n&agrave;y v&agrave; xin qu&yacute; kh&aacute;ch h&agrave;ng th&ocirc;ng cảm. Qu&yacute; kh&aacute;ch vui l&ograve;ng lưu &yacute; v&agrave; l&ecirc;n kế hoạch đặt v&eacute; xe m&aacute;y trước hoặc sau thời gian bảo tr&igrave; để tr&aacute;nh ảnh hưởng đến kế hoạch của m&igrave;nh.</p>

<p>Ch&acirc;n th&agrave;nh cảm ơn qu&yacute; kh&aacute;ch h&agrave;ng đ&atilde; lu&ocirc;n tin tưởng v&agrave; ủng hộ Tripove. Ch&uacute;ng t&ocirc;i cam kết sẽ cung cấp dịch vụ tốt nhất v&agrave; ho&agrave;n hảo nhất sau khi ho&agrave;n th&agrave;nh qu&aacute; tr&igrave;nh bảo tr&igrave;.</p>

<p>Tr&acirc;n trọng,</p>

<p><em>Đội ngũ Tripove</em></p>
', CAST(N'2024-07-05T13:23:57.147' AS DateTime), CAST(N'2024-07-05T13:26:27.307' AS DateTime), N'image/news/bt.jpg')
INSERT [dbo].[News] ([id], [title], [content], [created_at], [updated_at], [image]) VALUES (11, N'Chương Trình Khuyến Mãi Đặc Biệt Nhân Ngày Giải Phóng Thủ Đô - Giảm Giá 50% Cho Các Vé Đến Thủ Đô Hà Nội!', N'<p><strong><em>K&iacute;nh gửi qu&yacute; kh&aacute;ch h&agrave;ng của Tripove,</em></strong></p>

<p>Nh&acirc;n dịp kỷ niệm ng&agrave;y Giải ph&oacute;ng Thủ đ&ocirc; 10/10, Tripove h&acirc;n hạnh giới thiệu chương tr&igrave;nh khuyến m&atilde;i đặc biệt d&agrave;nh cho qu&yacute; kh&aacute;ch h&agrave;ng y&ecirc;u th&iacute;ch v&agrave; muốn kh&aacute;m ph&aacute; thủ đ&ocirc; H&agrave; Nội th&acirc;n y&ecirc;u.</p>

<p><strong>Thời gian &aacute;p dụng:</strong> Từ ng&agrave;y 10/10 đến ng&agrave;y [ng&agrave;y kết th&uacute;c].</p>

<p><strong>Nội dung chương tr&igrave;nh:</strong></p>

<ul>
	<li><strong>Giảm gi&aacute; 50% cho c&aacute;c v&eacute; đến Thủ đ&ocirc; H&agrave; Nội:</strong> Tận hưởng mức giảm gi&aacute; đặc biệt khi đặt v&eacute; xe m&aacute;y đến H&agrave; Nội v&agrave;o ng&agrave;y kỷ niệm quan trọng n&agrave;y. Kh&ocirc;ng chỉ tiết kiệm chi ph&iacute; m&agrave; c&ograve;n c&oacute; cơ hội trải nghiệm những địa điểm du lịch nổi tiếng v&agrave; ẩm thực đặc trưng của Thủ đ&ocirc;.</li>
</ul>

<p><strong>Lợi &iacute;ch khi đặt v&eacute; qua Tripove:</strong></p>

<ul>
	<li><strong>Đơn giản v&agrave; nhanh ch&oacute;ng:</strong> Đặt v&eacute; ngay từ website hoặc ứng dụng Tripove, chỉ với v&agrave;i bước đơn giản.</li>
	<li><strong>Hỗ trợ kh&aacute;ch h&agrave;ng 24/7:</strong> Đội ngũ chăm s&oacute;c kh&aacute;ch h&agrave;ng lu&ocirc;n sẵn s&agrave;ng giải đ&aacute;p mọi thắc mắc v&agrave; hỗ trợ bạn mọi l&uacute;c.</li>
</ul>

<p><strong>Lưu &yacute;:</strong> Số lượng v&eacute; c&oacute; hạn v&agrave; chương tr&igrave;nh chỉ &aacute;p dụng v&agrave;o ng&agrave;y 10/10. Qu&yacute; kh&aacute;ch h&agrave;ng nhanh tay đặt v&eacute; để kh&ocirc;ng bỏ lỡ cơ hội v&agrave;ng n&agrave;y!</p>

<p>Cảm ơn qu&yacute; kh&aacute;ch đ&atilde; tin tưởng v&agrave; lựa chọn Tripove l&agrave; đối t&aacute;c du lịch tin cậy của m&igrave;nh. Ch&uacute;ng t&ocirc;i h&acirc;n hạnh được phục vụ v&agrave; ch&uacute;c qu&yacute; kh&aacute;ch c&oacute; một chuyến đi thật thoải m&aacute;i v&agrave; đ&aacute;ng nhớ đến Thủ đ&ocirc; H&agrave; Nội.</p>

<p>Tr&acirc;n trọng,</p>

<p><em>Đội ngũ Tripove</em></p>
', CAST(N'2024-07-05T13:39:36.817' AS DateTime), CAST(N'2024-07-05T13:40:20.023' AS DateTime), N'image/news/hanoi.jpg')
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Route] ON 

INSERT [dbo].[Route] ([id], [name], [Arrival_Locationid], [Departure_Locationid], [price], [detail], [created_at], [updated_at]) VALUES (1, N'Cao tốc Hà Nội Bắc Giang', 66, 87, 90000, N'Bến xe Mỹ Đình-Trung tâm văn hoá Bắc Ninh-Bến xe Bắc Giang', CAST(N'2024-06-03T15:49:38.863' AS DateTime), CAST(N'2024-06-26T08:33:31.463' AS DateTime))
INSERT [dbo].[Route] ([id], [name], [Arrival_Locationid], [Departure_Locationid], [price], [detail], [created_at], [updated_at]) VALUES (2, N'Lạng Sơn Hà Nội Sơn Tây', 87, 99, 90000, N'Bến xe Lạng Sơn-Thị trấn Vôi-Cây xăng Kế-Đại lộ Thăng Long-Đại học FPT-Sơn Tây', CAST(N'2024-06-03T15:58:55.717' AS DateTime), NULL)
INSERT [dbo].[Route] ([id], [name], [Arrival_Locationid], [Departure_Locationid], [price], [detail], [created_at], [updated_at]) VALUES (6, N'Cao tốc Hà Nội Nghệ An', 103, 87, 280000, N'Hà Nội-Pháp Vân-Cầu Giẽ-Cao Bồ-Ninh Bình-Thanh Hóa-Diễn Châu-Vinh-Nghệ An', CAST(N'2024-06-29T22:26:56.687' AS DateTime), CAST(N'2024-07-03T20:29:52.650' AS DateTime))
SET IDENTITY_INSERT [dbo].[Route] OFF
GO
SET IDENTITY_INSERT [dbo].[Route_Detail] ON 

INSERT [dbo].[Route_Detail] ([id], [Routeid], [departureDate], [departureTime], [VehiclelicensePlate], [created_at], [updated_at]) VALUES (1048, 1, CAST(N'2024-07-08' AS Date), CAST(N'05:00:00' AS Time), N'98A-11111', CAST(N'2024-06-27T16:59:41.473' AS DateTime), NULL)
INSERT [dbo].[Route_Detail] ([id], [Routeid], [departureDate], [departureTime], [VehiclelicensePlate], [created_at], [updated_at]) VALUES (1049, 1, CAST(N'2024-07-08' AS Date), CAST(N'05:00:00' AS Time), N'98A-22222', CAST(N'2024-06-27T17:00:06.200' AS DateTime), NULL)
INSERT [dbo].[Route_Detail] ([id], [Routeid], [departureDate], [departureTime], [VehiclelicensePlate], [created_at], [updated_at]) VALUES (1050, 1, CAST(N'2024-07-08' AS Date), CAST(N'09:00:00' AS Time), N'98A-11111', CAST(N'2024-06-27T17:00:38.107' AS DateTime), NULL)
INSERT [dbo].[Route_Detail] ([id], [Routeid], [departureDate], [departureTime], [VehiclelicensePlate], [created_at], [updated_at]) VALUES (1051, 1, CAST(N'2024-07-08' AS Date), CAST(N'09:00:00' AS Time), N'98A-22222', CAST(N'2024-06-27T17:00:49.203' AS DateTime), NULL)
INSERT [dbo].[Route_Detail] ([id], [Routeid], [departureDate], [departureTime], [VehiclelicensePlate], [created_at], [updated_at]) VALUES (1052, 2, CAST(N'2024-07-08' AS Date), CAST(N'05:00:00' AS Time), N'98A-33333', CAST(N'2024-06-27T17:01:01.587' AS DateTime), NULL)
INSERT [dbo].[Route_Detail] ([id], [Routeid], [departureDate], [departureTime], [VehiclelicensePlate], [created_at], [updated_at]) VALUES (1053, 2, CAST(N'2024-07-08' AS Date), CAST(N'05:00:00' AS Time), N'98A-55555', CAST(N'2024-06-27T17:01:16.710' AS DateTime), NULL)
INSERT [dbo].[Route_Detail] ([id], [Routeid], [departureDate], [departureTime], [VehiclelicensePlate], [created_at], [updated_at]) VALUES (1054, 1, CAST(N'2024-07-09' AS Date), CAST(N'05:00:00' AS Time), N'98A-11111', CAST(N'2024-06-27T17:03:51.497' AS DateTime), NULL)
INSERT [dbo].[Route_Detail] ([id], [Routeid], [departureDate], [departureTime], [VehiclelicensePlate], [created_at], [updated_at]) VALUES (1055, 1, CAST(N'2024-07-10' AS Date), CAST(N'05:00:00' AS Time), N'98A-22222', CAST(N'2024-06-27T17:04:03.280' AS DateTime), NULL)
INSERT [dbo].[Route_Detail] ([id], [Routeid], [departureDate], [departureTime], [VehiclelicensePlate], [created_at], [updated_at]) VALUES (1056, 1, CAST(N'2024-07-10' AS Date), CAST(N'09:00:00' AS Time), N'98A-11111', CAST(N'2024-06-27T17:04:19.737' AS DateTime), NULL)
INSERT [dbo].[Route_Detail] ([id], [Routeid], [departureDate], [departureTime], [VehiclelicensePlate], [created_at], [updated_at]) VALUES (1057, 6, CAST(N'2024-07-12' AS Date), CAST(N'05:30:00' AS Time), N'98A-55555', CAST(N'2024-06-29T22:27:27.270' AS DateTime), CAST(N'2024-06-29T22:27:40.847' AS DateTime))
SET IDENTITY_INSERT [dbo].[Route_Detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Seat] ON 

INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1187, N'S0', 1048, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1188, N'S1', 1048, 1, 0, CAST(N'2024-06-30T20:53:07.163' AS DateTime), N'bến xe Mỹ Đình')
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1189, N'S2', 1048, 4, 0, CAST(N'2024-07-02T16:49:35.653' AS DateTime), N'Ga tàu điện Cát Linh Hà Đông')
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1190, N'S3', 1048, 3, 0, CAST(N'2024-07-02T16:45:31.610' AS DateTime), N'Sân vận động Mỹ Đình')
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1191, N'S4', 1048, 4, 0, CAST(N'2024-07-02T16:49:35.660' AS DateTime), N'Ga tàu điện Cát Linh Hà Đông')
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1192, N'S5', 1048, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1193, N'S0', 1049, 5, 0, CAST(N'2024-07-03T14:54:58.837' AS DateTime), N'bến xe Gia Lâm')
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1194, N'S1', 1049, 3, 0, CAST(N'2024-07-03T14:59:43.427' AS DateTime), N'Ngã tư sở')
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1195, N'S2', 1049, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1196, N'S3', 1049, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1197, N'S4', 1049, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1198, N'S5', 1049, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1199, N'S0', 1050, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1200, N'S1', 1050, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1201, N'S2', 1050, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1202, N'S3', 1050, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1203, N'S4', 1050, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1204, N'S5', 1050, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1205, N'S0', 1051, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1206, N'S1', 1051, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1207, N'S2', 1051, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1208, N'S3', 1051, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1209, N'S4', 1051, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1210, N'S5', 1051, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1211, N'S0', 1052, 1, 0, CAST(N'2024-07-03T14:55:23.037' AS DateTime), N'thành phố Lạng Sơn')
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1212, N'S1', 1052, 3, 0, CAST(N'2024-07-03T15:00:04.690' AS DateTime), N'thành phố Lạng Sơn')
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1213, N'S2', 1052, 6, 0, CAST(N'2024-07-03T16:07:04.147' AS DateTime), N'thành phố Lạng Sơn')
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1214, N'S3', 1052, 7, 0, CAST(N'2024-07-03T16:25:51.530' AS DateTime), N'thành phố Lạng Sơn')
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1215, N'S4', 1052, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1216, N'S5', 1052, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1217, N'S6', 1052, 8, 0, CAST(N'2024-07-03T16:33:58.817' AS DateTime), N'trung tâm thành phố Lạng Sơn')
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1218, N'S7', 1052, 8, 0, CAST(N'2024-07-03T16:33:58.803' AS DateTime), N'trung tâm thành phố Lạng Sơn')
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1219, N'S8', 1052, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1220, N'S9', 1052, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1221, N'S10', 1052, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1222, N'S11', 1052, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1223, N'S12', 1052, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1224, N'S13', 1052, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1225, N'S14', 1052, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1226, N'S15', 1052, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1227, N'S16', 1052, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1228, N'S17', 1052, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1229, N'S18', 1052, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1230, N'S19', 1052, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1231, N'S0', 1053, 1, 0, CAST(N'2024-07-02T20:58:14.620' AS DateTime), N'thành phố Lạng Sơn')
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1232, N'S1', 1053, 1, 0, CAST(N'2024-07-02T20:58:14.627' AS DateTime), N'thành phố Lạng Sơn')
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1233, N'S2', 1053, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1234, N'S3', 1053, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1235, N'S4', 1053, 1, 0, CAST(N'2024-07-02T20:58:14.627' AS DateTime), N'thành phố Lạng Sơn')
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1236, N'S5', 1053, 1, 0, CAST(N'2024-07-02T20:58:14.627' AS DateTime), N'thành phố Lạng Sơn')
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1237, N'S6', 1053, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1238, N'S7', 1053, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1239, N'S8', 1053, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1240, N'S9', 1053, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1241, N'S10', 1053, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1242, N'S11', 1053, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1243, N'S12', 1053, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1244, N'S13', 1053, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1245, N'S14', 1053, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1246, N'S15', 1053, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1247, N'S16', 1053, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1248, N'S17', 1053, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1249, N'S18', 1053, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1250, N'S19', 1053, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1251, N'S0', 1054, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1252, N'S1', 1054, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1253, N'S2', 1054, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1254, N'S3', 1054, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1255, N'S4', 1054, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1256, N'S5', 1054, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1257, N'S0', 1055, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1258, N'S1', 1055, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1259, N'S2', 1055, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1260, N'S3', 1055, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1261, N'S4', 1055, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1262, N'S5', 1055, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1263, N'S0', 1056, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1264, N'S1', 1056, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1265, N'S2', 1056, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1266, N'S3', 1056, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1267, N'S4', 1056, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1268, N'S5', 1056, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1269, N'S0', 1057, 5, 0, CAST(N'2024-07-03T14:54:04.623' AS DateTime), N'bến xe Mỹ Đình')
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1270, N'S1', 1057, 5, 0, CAST(N'2024-07-03T14:54:04.640' AS DateTime), N'bến xe Mỹ Đình')
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1271, N'S2', 1057, 8, 0, CAST(N'2024-07-03T16:32:02.007' AS DateTime), N'pháo đài Láng')
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1272, N'S3', 1057, 8, 0, CAST(N'2024-07-03T16:32:02.017' AS DateTime), N'pháo đài Láng')
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1273, N'S4', 1057, 5, 0, CAST(N'2024-07-03T14:54:04.640' AS DateTime), N'bến xe Mỹ Đình')
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1274, N'S5', 1057, 5, 0, CAST(N'2024-07-03T14:54:04.640' AS DateTime), N'bến xe Mỹ Đình')
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1275, N'S6', 1057, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1276, N'S7', 1057, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1277, N'S8', 1057, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1278, N'S9', 1057, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1279, N'S10', 1057, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1280, N'S11', 1057, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1281, N'S12', 1057, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1282, N'S13', 1057, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1283, N'S14', 1057, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1284, N'S15', 1057, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1285, N'S16', 1057, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1286, N'S17', 1057, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1287, N'S18', 1057, NULL, 0, NULL, NULL)
INSERT [dbo].[Seat] ([id], [name], [Route_Detailid], [Accountid], [surcharge], [paymentDate], [pickUp]) VALUES (1288, N'S19', 1057, NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Seat] OFF
GO
INSERT [dbo].[Vehicle] ([licensePlate], [status], [Vehicle_Categoryid], [created_at], [updated_at]) VALUES (N'98A-11111', 10, 5, CAST(N'2024-06-27T16:58:33.937' AS DateTime), NULL)
INSERT [dbo].[Vehicle] ([licensePlate], [status], [Vehicle_Categoryid], [created_at], [updated_at]) VALUES (N'98A-22222', 9, 6, CAST(N'2024-06-27T16:58:43.717' AS DateTime), NULL)
INSERT [dbo].[Vehicle] ([licensePlate], [status], [Vehicle_Categoryid], [created_at], [updated_at]) VALUES (N'98A-33333', 10, 7, CAST(N'2024-06-27T16:58:58.510' AS DateTime), NULL)
INSERT [dbo].[Vehicle] ([licensePlate], [status], [Vehicle_Categoryid], [created_at], [updated_at]) VALUES (N'98A-55555', 10, 8, CAST(N'2024-06-27T16:59:06.370' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Vehicle_Category] ON 

INSERT [dbo].[Vehicle_Category] ([id], [name], [utilities], [created_at], [updated_at], [seatQuantity], [seatType], [image]) VALUES (5, N'Limousine Dương Ngô', N'Điều hoà mát lạnh,Wifi tốc độ cao,Nước lọc miễn phí,Ghế massage thoải mái', CAST(N'2024-06-27T16:53:38.580' AS DateTime), CAST(N'2024-06-27T16:53:44.590' AS DateTime), 6, N'Ngồi', N'image/vehicle/limo6.jpg')
INSERT [dbo].[Vehicle_Category] ([id], [name], [utilities], [created_at], [updated_at], [seatQuantity], [seatType], [image]) VALUES (6, N'Limousine Bảo Linh', N'Điều hoà mát lạnh,Wifi tốc độ cao,Nước lọc miễn phí,Khăn ướt miễn phí,Ghế massage thoải mái', CAST(N'2024-06-27T16:54:24.203' AS DateTime), CAST(N'2024-06-27T16:54:31.767' AS DateTime), 6, N'Ngồi', N'image/vehicle/limo16.jpg')
INSERT [dbo].[Vehicle_Category] ([id], [name], [utilities], [created_at], [updated_at], [seatQuantity], [seatType], [image]) VALUES (7, N'Xe khách Mạnh Năng', N'Điều hoà mát lạnh,Wifi tốc độ cao', CAST(N'2024-06-27T16:55:15.310' AS DateTime), CAST(N'2024-06-27T16:55:21.203' AS DateTime), 20, N'Ngồi', N'image/vehicle/coach45.jpg')
INSERT [dbo].[Vehicle_Category] ([id], [name], [utilities], [created_at], [updated_at], [seatQuantity], [seatType], [image]) VALUES (8, N'Xe giường nằm Bích Thảo', N'Điều hoà mát lạnh,Wifi tốc độ cao,Màn hình riêng,Ổ sạc tốc độ cao', CAST(N'2024-06-27T16:57:43.790' AS DateTime), CAST(N'2024-06-27T16:57:49.697' AS DateTime), 20, N'Nằm', N'image/vehicle/bus.jpg')
SET IDENTITY_INSERT [dbo].[Vehicle_Category] OFF
GO
ALTER TABLE [dbo].[Evaluate]  WITH CHECK ADD  CONSTRAINT [FKEvaluate531715] FOREIGN KEY([Route_Detailid])
REFERENCES [dbo].[Route_Detail] ([id])
GO
ALTER TABLE [dbo].[Evaluate] CHECK CONSTRAINT [FKEvaluate531715]
GO
ALTER TABLE [dbo].[Evaluate]  WITH CHECK ADD  CONSTRAINT [FKEvaluate708803] FOREIGN KEY([Accountid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Evaluate] CHECK CONSTRAINT [FKEvaluate708803]
GO
ALTER TABLE [dbo].[Route]  WITH CHECK ADD  CONSTRAINT [FKRoute464633] FOREIGN KEY([Departure_Locationid])
REFERENCES [dbo].[Location] ([id])
GO
ALTER TABLE [dbo].[Route] CHECK CONSTRAINT [FKRoute464633]
GO
ALTER TABLE [dbo].[Route]  WITH CHECK ADD  CONSTRAINT [FKRoute946096] FOREIGN KEY([Arrival_Locationid])
REFERENCES [dbo].[Location] ([id])
GO
ALTER TABLE [dbo].[Route] CHECK CONSTRAINT [FKRoute946096]
GO
ALTER TABLE [dbo].[Route_Detail]  WITH CHECK ADD  CONSTRAINT [FKRoute_Deta33966] FOREIGN KEY([Routeid])
REFERENCES [dbo].[Route] ([id])
GO
ALTER TABLE [dbo].[Route_Detail] CHECK CONSTRAINT [FKRoute_Deta33966]
GO
ALTER TABLE [dbo].[Route_Detail]  WITH CHECK ADD  CONSTRAINT [FKRoute_Deta860239] FOREIGN KEY([VehiclelicensePlate])
REFERENCES [dbo].[Vehicle] ([licensePlate])
GO
ALTER TABLE [dbo].[Route_Detail] CHECK CONSTRAINT [FKRoute_Deta860239]
GO
ALTER TABLE [dbo].[Seat]  WITH CHECK ADD  CONSTRAINT [FKSeat673167] FOREIGN KEY([Route_Detailid])
REFERENCES [dbo].[Route_Detail] ([id])
GO
ALTER TABLE [dbo].[Seat] CHECK CONSTRAINT [FKSeat673167]
GO
ALTER TABLE [dbo].[Seat]  WITH CHECK ADD  CONSTRAINT [FKSeat850255] FOREIGN KEY([Accountid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Seat] CHECK CONSTRAINT [FKSeat850255]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FKVehicle985719] FOREIGN KEY([Vehicle_Categoryid])
REFERENCES [dbo].[Vehicle_Category] ([id])
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FKVehicle985719]
GO
