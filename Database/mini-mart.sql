CREATE DATABASE [mini-mart]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mini-mart].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mini-mart] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mini-mart] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mini-mart] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mini-mart] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mini-mart] SET ARITHABORT OFF 
GO
ALTER DATABASE [mini-mart] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mini-mart] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mini-mart] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mini-mart] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mini-mart] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mini-mart] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mini-mart] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mini-mart] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mini-mart] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mini-mart] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mini-mart] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mini-mart] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mini-mart] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mini-mart] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mini-mart] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mini-mart] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mini-mart] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mini-mart] SET RECOVERY FULL 
GO
ALTER DATABASE [mini-mart] SET  MULTI_USER 
GO
ALTER DATABASE [mini-mart] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mini-mart] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mini-mart] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mini-mart] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mini-mart] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [mini-mart] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'mini-mart', N'ON'
GO
ALTER DATABASE [mini-mart] SET QUERY_STORE = ON
GO
ALTER DATABASE [mini-mart] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [mini-mart]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/19/2023 12:05:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[maAdmin] [char](8) NOT NULL,
	[tenTaiKhoan] [varchar](255) NOT NULL,
	[tenAdmin] [nvarchar](255) NOT NULL,
	[gioiTinh] [nvarchar](3) NULL,
	[ngaySinh] [date] NULL,
	[soDienThoai] [varchar](13) NULL,
	[email] [varchar](255) NULL,
	[diaChi] [nvarchar](255) NULL,
	[trangThai] [bit] NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[maAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 11/19/2023 12:05:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[maHoaDon] [char](17) NOT NULL,
	[maSanPham] [char](8) NOT NULL,
	[soLuong] [int] NOT NULL,
	[donViTinh] [nvarchar](50) NOT NULL,
	[giaBan] [money] NOT NULL,
	[thanhTien] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuNhap]    Script Date: 11/19/2023 12:05:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhap](
	[maPhieuNhap] [char](17) NOT NULL,
	[maSanPham] [char](8) NOT NULL,
	[soLuong] [int] NOT NULL,
	[donViTinh] [nvarchar](50) NOT NULL,
	[donGia] [money] NOT NULL,
	[thanhTien] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 11/19/2023 12:05:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[maHoaDon] [char](17) NOT NULL,
	[maNhanVien] [char](8) NOT NULL,
	[maKhachHang] [char](8) NULL,
	[maKhuyenMai] [char](8) NULL,
	[thoiGianTao] [datetime2](0) NOT NULL,
	[tongTien] [money] NOT NULL,
	[giamGia] [money] NULL,
	[thanhTien] [money] NOT NULL,
	[tienNhan] [money] NOT NULL,
	[tienThua] [money] NOT NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[maHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 11/19/2023 12:05:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[maKhachHang] [char](8) NOT NULL,
	[tenKhachHang] [nvarchar](255) NOT NULL,
	[gioiTinh] [nvarchar](3) NULL,
	[ngaySinh] [date] NULL,
	[soDienThoai] [varchar](13) NOT NULL,
	[email] [varchar](255) NULL,
	[diaChi] [nvarchar](255) NULL,
	[bacThanhVien] [nvarchar](4) NOT NULL,
	[diemTichLuy] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[maKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 11/19/2023 12:05:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[maKhuyenMai] [char](8) NOT NULL,
	[tenKhuyenMai] [nvarchar](255) NOT NULL,
	[thoiGianBatDau] [datetime2](0) NOT NULL,
	[thoiGianKetThuc] [datetime2](0) NOT NULL,
	[loaiGiaTri] [nvarchar](9) NOT NULL,
	[giaTriApDung] [float] NOT NULL,
 CONSTRAINT [PK_KhuyenMai] PRIMARY KEY CLUSTERED 
(
	[maKhuyenMai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 11/19/2023 12:05:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[maLoaiSanPham] [char](8) NOT NULL,
	[tenLoaiSanPham] [nvarchar](255) NOT NULL,
	[trangThai] [bit] NOT NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[maLoaiSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 11/19/2023 12:05:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[maNhaCungCap] [char](8) NOT NULL,
	[tenNhaCungCap] [nvarchar](255) NOT NULL,
	[soDienThoai] [varchar](13) NULL,
	[email] [varchar](255) NULL,
	[diaChi] [nvarchar](255) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[maNhaCungCap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 11/19/2023 12:05:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[maNhanVien] [char](8) NOT NULL,
	[tenTaiKhoan] [varchar](255) NOT NULL,
	[tenNhanVien] [nvarchar](255) NOT NULL,
	[gioiTinh] [nvarchar](3) NULL,
	[ngaySinh] [date] NULL,
	[soDienThoai] [varchar](13) NULL,
	[email] [varchar](255) NULL,
	[diaChi] [nvarchar](255) NULL,
	[trangThai] [bit] NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[maNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 11/19/2023 12:05:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[maPhanQuyen] [char](4) NOT NULL,
	[tenPhanQuyen] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[maPhanQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 11/19/2023 12:05:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[maPhieuNhap] [char](17) NOT NULL,
	[maNhaCungCap] [char](8) NOT NULL,
	[maNhanVien] [char](8) NOT NULL,
	[maQuanLi] [char](8) NULL,
	[thoiGianTao] [datetime2](0) NOT NULL,
	[thoiGianDuyet] [datetime2](0) NULL,
	[thanhTien] [money] NOT NULL,
	[trangThaiDuyet] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[maPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuanLi]    Script Date: 11/19/2023 12:05:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanLi](
	[maQuanLi] [char](8) NOT NULL,
	[tenTaiKhoan] [varchar](255) NOT NULL,
	[tenQuanLi] [nvarchar](255) NOT NULL,
	[gioiTinh] [nvarchar](3) NULL,
	[ngaySinh] [date] NULL,
	[soDienThoai] [varchar](13) NULL,
	[email] [varchar](255) NULL,
	[diaChi] [nvarchar](255) NULL,
	[trangThai] [bit] NOT NULL,
 CONSTRAINT [PK_QuanLi] PRIMARY KEY CLUSTERED 
(
	[maQuanLi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 11/19/2023 12:05:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[maSanPham] [char](8) NOT NULL,
	[maLoaiSanPham] [char](8) NOT NULL,
	[maNhaCungCap] [char](8) NOT NULL,
	[tenSanPham] [nvarchar](255) NOT NULL,
	[donViTinh] [nvarchar](50) NOT NULL,
	[soLuong] [int] NOT NULL,
	[giaBan] [money] NOT NULL,
	[duongDanAnh] [varchar](255) NOT NULL,
	[trangThai] [bit] NOT NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[maSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 11/19/2023 12:05:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[maPhanQuyen] [char](4) NOT NULL,
	[tenTaiKhoan] [varchar](255) NOT NULL,
	[matKhau] [varchar](255) NOT NULL,
	[trangThai] [bit] NOT NULL,
 CONSTRAINT [PK_TaiKhoan_1] PRIMARY KEY CLUSTERED 
(
	[tenTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([maAdmin], [tenTaiKhoan], [tenAdmin], [gioiTinh], [ngaySinh], [soDienThoai], [email], [diaChi], [trangThai]) VALUES (N'ADM00001', N'admin', N'Phạm Minh Trung', N'Nam', CAST(N'2003-04-06' AS Date), N'0706094657', N'admin@email.com', N'Hồ Chí Minh', 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([maHoaDon], [maSanPham], [soLuong], [donViTinh], [giaBan], [thanhTien]) VALUES (N'14/11/2023-HD0001', N'SPH00001', 2, N'Gói', 9000.0000, 18000.0000)
INSERT [dbo].[ChiTietHoaDon] ([maHoaDon], [maSanPham], [soLuong], [donViTinh], [giaBan], [thanhTien]) VALUES (N'14/11/2023-HD0002', N'SPH00004', 1, N'Hộp', 60000.0000, 60000.0000)
INSERT [dbo].[ChiTietHoaDon] ([maHoaDon], [maSanPham], [soLuong], [donViTinh], [giaBan], [thanhTien]) VALUES (N'14/11/2023-HD0003', N'SPH00005', 1, N'Khay', 35000.0000, 35000.0000)
INSERT [dbo].[ChiTietHoaDon] ([maHoaDon], [maSanPham], [soLuong], [donViTinh], [giaBan], [thanhTien]) VALUES (N'14/11/2023-HD0003', N'SPH00007', 1, N'Chai', 200000.0000, 200000.0000)
INSERT [dbo].[ChiTietHoaDon] ([maHoaDon], [maSanPham], [soLuong], [donViTinh], [giaBan], [thanhTien]) VALUES (N'14/11/2023-HD0003', N'SPH00003', 1, N'Hộp', 10300.0000, 10300.0000)
INSERT [dbo].[ChiTietHoaDon] ([maHoaDon], [maSanPham], [soLuong], [donViTinh], [giaBan], [thanhTien]) VALUES (N'14/11/2023-HD0004', N'SPH00006', 2, N'Gói', 18000.0000, 36000.0000)
INSERT [dbo].[ChiTietHoaDon] ([maHoaDon], [maSanPham], [soLuong], [donViTinh], [giaBan], [thanhTien]) VALUES (N'14/11/2023-HD0001', N'SPH00003', 1, N'Hộp', 10300.0000, 10300.0000)
INSERT [dbo].[ChiTietHoaDon] ([maHoaDon], [maSanPham], [soLuong], [donViTinh], [giaBan], [thanhTien]) VALUES (N'15/11/2023-HD0001', N'SPH00001', 10, N'Gói', 9000.0000, 90000.0000)
GO
INSERT [dbo].[ChiTietPhieuNhap] ([maPhieuNhap], [maSanPham], [soLuong], [donViTinh], [donGia], [thanhTien]) VALUES (N'15/11/2023-PN0001', N'SPH00003', 200, N'Hộp', 6500.0000, 1300000.0000)
INSERT [dbo].[ChiTietPhieuNhap] ([maPhieuNhap], [maSanPham], [soLuong], [donViTinh], [donGia], [thanhTien]) VALUES (N'15/11/2023-PN0001', N'SPH00006', 100, N'Gói', 8000.0000, 800000.0000)
INSERT [dbo].[ChiTietPhieuNhap] ([maPhieuNhap], [maSanPham], [soLuong], [donViTinh], [donGia], [thanhTien]) VALUES (N'15/11/2023-PN0002', N'SPH00002', 200, N'Gói', 4000.0000, 800000.0000)
GO
INSERT [dbo].[HoaDon] ([maHoaDon], [maNhanVien], [maKhachHang], [maKhuyenMai], [thoiGianTao], [tongTien], [giamGia], [thanhTien], [tienNhan], [tienThua]) VALUES (N'14/11/2023-HD0001', N'NVB00001', NULL, NULL, CAST(N'2023-11-14T16:35:02.0000000' AS DateTime2), 28300.0000, 0.0000, 28300.0000, 30000.0000, 1700.0000)
INSERT [dbo].[HoaDon] ([maHoaDon], [maNhanVien], [maKhachHang], [maKhuyenMai], [thoiGianTao], [tongTien], [giamGia], [thanhTien], [tienNhan], [tienThua]) VALUES (N'14/11/2023-HD0002', N'NVB00002', NULL, N'KHM00001', CAST(N'2023-11-14T16:36:15.0000000' AS DateTime2), 60000.0000, 12000.0000, 48000.0000, 50000.0000, 2000.0000)
INSERT [dbo].[HoaDon] ([maHoaDon], [maNhanVien], [maKhachHang], [maKhuyenMai], [thoiGianTao], [tongTien], [giamGia], [thanhTien], [tienNhan], [tienThua]) VALUES (N'14/11/2023-HD0003', N'NVB00003', N'KHH00003', NULL, CAST(N'2023-11-14T16:40:59.0000000' AS DateTime2), 245300.0000, 12265.0000, 233035.0000, 500000.0000, 266965.0000)
INSERT [dbo].[HoaDon] ([maHoaDon], [maNhanVien], [maKhachHang], [maKhuyenMai], [thoiGianTao], [tongTien], [giamGia], [thanhTien], [tienNhan], [tienThua]) VALUES (N'14/11/2023-HD0004', N'NVB00002', N'KHH00001', N'KHM00001', CAST(N'2023-11-14T16:45:54.0000000' AS DateTime2), 36000.0000, 7200.0000, 28800.0000, 30000.0000, 1200.0000)
INSERT [dbo].[HoaDon] ([maHoaDon], [maNhanVien], [maKhachHang], [maKhuyenMai], [thoiGianTao], [tongTien], [giamGia], [thanhTien], [tienNhan], [tienThua]) VALUES (N'15/11/2023-HD0001', N'NVB00001', NULL, NULL, CAST(N'2023-11-15T17:13:49.0000000' AS DateTime2), 90000.0000, 0.0000, 90000.0000, 100000.0000, 10000.0000)
GO
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [gioiTinh], [ngaySinh], [soDienThoai], [email], [diaChi], [bacThanhVien], [diemTichLuy]) VALUES (N'KHH00001', N'Phạm Minh Trung', N'Nam', CAST(N'2003-06-04' AS Date), N'0706074537', N'', N'HCM', N'Vàng', CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [gioiTinh], [ngaySinh], [soDienThoai], [email], [diaChi], [bacThanhVien], [diemTichLuy]) VALUES (N'KHH00002', N'Nguyễn Ngọc Ngạn', N'Nam', NULL, N'0905647392', N'', N'Nam', N'Vàng', CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [gioiTinh], [ngaySinh], [soDienThoai], [email], [diaChi], [bacThanhVien], [diemTichLuy]) VALUES (N'KHH00003', N'Hồ Ngọc Hà', N'Nữ', CAST(N'1990-12-22' AS Date), N'01202759473', N'', N'HCM', N'Bạc', CAST(8070.25 AS Decimal(18, 2)))
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [gioiTinh], [ngaySinh], [soDienThoai], [email], [diaChi], [bacThanhVien], [diemTichLuy]) VALUES (N'KHH00004', N'Nguyễn Ngọc Tín', N'Nam', NULL, N'0703627395', N'ngtin@gmail.com', N'Đà Nẵng', N'Bạc', CAST(5295.50 AS Decimal(18, 2)))
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [gioiTinh], [ngaySinh], [soDienThoai], [email], [diaChi], [bacThanhVien], [diemTichLuy]) VALUES (N'KHH00005', N'Bích Phương', N'Nữ', NULL, N'0905747392', N'', N'', N'Đồng', CAST(2356.00 AS Decimal(18, 2)))
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [gioiTinh], [ngaySinh], [soDienThoai], [email], [diaChi], [bacThanhVien], [diemTichLuy]) VALUES (N'KHH00006', N'Ngô Duy Khang', N'Nam', CAST(N'2003-12-12' AS Date), N'0905738294', N'khangbeo@gmail.com', N'Quận 8, HCM', N'Bạc', CAST(8654.00 AS Decimal(18, 2)))
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [gioiTinh], [ngaySinh], [soDienThoai], [email], [diaChi], [bacThanhVien], [diemTichLuy]) VALUES (N'KHH00007', N'Ô Lạp Na Lạp Thị Thanh Anh', N'Nữ', CAST(N'1718-03-11' AS Date), N'0785936281', N'', N'Trung Quốc', N'Bạc', CAST(6943.00 AS Decimal(18, 2)))
INSERT [dbo].[KhachHang] ([maKhachHang], [tenKhachHang], [gioiTinh], [ngaySinh], [soDienThoai], [email], [diaChi], [bacThanhVien], [diemTichLuy]) VALUES (N'KHH00008', N'Lana Del Rey', N'Nữ', CAST(N'1985-06-21' AS Date), N'0607254893', N'gaime@gmail.com', N'New York, Mỹ', N'Vàng', CAST(10000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[KhuyenMai] ([maKhuyenMai], [tenKhuyenMai], [thoiGianBatDau], [thoiGianKetThuc], [loaiGiaTri], [giaTriApDung]) VALUES (N'KHM00001', N'Khai trương', CAST(N'2023-11-14T00:00:00.0000000' AS DateTime2), CAST(N'2023-11-25T23:59:59.0000000' AS DateTime2), N'Phần trăm', 20)
INSERT [dbo].[KhuyenMai] ([maKhuyenMai], [tenKhuyenMai], [thoiGianBatDau], [thoiGianKetThuc], [loaiGiaTri], [giaTriApDung]) VALUES (N'KHM00002', N'Lễ Giáng sinh', CAST(N'2023-12-24T00:00:00.0000000' AS DateTime2), CAST(N'2023-12-25T23:59:59.0000000' AS DateTime2), N'Cụ thể', 10000)
GO
INSERT [dbo].[LoaiSanPham] ([maLoaiSanPham], [tenLoaiSanPham], [trangThai]) VALUES (N'LSP00001', N'Thịt các loại', 1)
INSERT [dbo].[LoaiSanPham] ([maLoaiSanPham], [tenLoaiSanPham], [trangThai]) VALUES (N'LSP00002', N'Thủy hải sản', 1)
INSERT [dbo].[LoaiSanPham] ([maLoaiSanPham], [tenLoaiSanPham], [trangThai]) VALUES (N'LSP00003', N'Bánh, kẹo', 1)
INSERT [dbo].[LoaiSanPham] ([maLoaiSanPham], [tenLoaiSanPham], [trangThai]) VALUES (N'LSP00004', N'Rau, củ', 1)
INSERT [dbo].[LoaiSanPham] ([maLoaiSanPham], [tenLoaiSanPham], [trangThai]) VALUES (N'LSP00005', N'Trái cây', 1)
INSERT [dbo].[LoaiSanPham] ([maLoaiSanPham], [tenLoaiSanPham], [trangThai]) VALUES (N'LSP00006', N'Đồ uống có cồn', 1)
INSERT [dbo].[LoaiSanPham] ([maLoaiSanPham], [tenLoaiSanPham], [trangThai]) VALUES (N'LSP00007', N'Nước giải khát', 1)
INSERT [dbo].[LoaiSanPham] ([maLoaiSanPham], [tenLoaiSanPham], [trangThai]) VALUES (N'LSP00008', N'Sữa các loại', 1)
INSERT [dbo].[LoaiSanPham] ([maLoaiSanPham], [tenLoaiSanPham], [trangThai]) VALUES (N'LSP00009', N'Gia vị', 1)
INSERT [dbo].[LoaiSanPham] ([maLoaiSanPham], [tenLoaiSanPham], [trangThai]) VALUES (N'LSP00010', N'Mì ăn liền', 1)
INSERT [dbo].[LoaiSanPham] ([maLoaiSanPham], [tenLoaiSanPham], [trangThai]) VALUES (N'LSP00011', N'Văn phòng phẩm', 1)
INSERT [dbo].[LoaiSanPham] ([maLoaiSanPham], [tenLoaiSanPham], [trangThai]) VALUES (N'LSP00012', N'Sản phẩm vệ sinh nhà cửa', 1)
INSERT [dbo].[LoaiSanPham] ([maLoaiSanPham], [tenLoaiSanPham], [trangThai]) VALUES (N'LSP00013', N'Sản phẩm vệ sinh cá nhân', 1)
INSERT [dbo].[LoaiSanPham] ([maLoaiSanPham], [tenLoaiSanPham], [trangThai]) VALUES (N'LSP00014', N'Đồ gia dụng', 1)
INSERT [dbo].[LoaiSanPham] ([maLoaiSanPham], [tenLoaiSanPham], [trangThai]) VALUES (N'LSP00015', N'Cà phê', 1)
INSERT [dbo].[LoaiSanPham] ([maLoaiSanPham], [tenLoaiSanPham], [trangThai]) VALUES (N'LSP00016', N'Kem', 0)
GO
INSERT [dbo].[NhaCungCap] ([maNhaCungCap], [tenNhaCungCap], [soDienThoai], [email], [diaChi]) VALUES (N'NCC00001', N'Công ty Cổ phần Chăn nuôi C.P. Việt Nam', N'0513836086', N'web-info@cp.com.vn', N'Số 2 đường 2A, KCN Biên Hoà II, P. Long Bình Tân, TP. Biên Hòa, Tỉnh Đồng Nai, Việt Nam')
INSERT [dbo].[NhaCungCap] ([maNhaCungCap], [tenNhaCungCap], [soDienThoai], [email], [diaChi]) VALUES (N'NCC00002', N'Công ty Cổ phần Thực phẩm Masan', N'0902662660', N'info@msc.masangroup.com', N'23 Lê Duẩn, Phường Bến Nghé, Quận 1, Thành phố Hồ Chí Minh, Việt Nam')
INSERT [dbo].[NhaCungCap] ([maNhaCungCap], [tenNhaCungCap], [soDienThoai], [email], [diaChi]) VALUES (N'NCC00003', N'Công Ty TNHH Văn Phòng Phẩm & Thiết Bị Văn Phòng Hồng Hà', N'0243537133', N'', N'Số 242, Tây Sơn, P. Trung Liệt, Q. Đống Đa, Hà Nội, Việt Nam')
INSERT [dbo].[NhaCungCap] ([maNhaCungCap], [tenNhaCungCap], [soDienThoai], [email], [diaChi]) VALUES (N'NCC00004', N'Công Ty TNHH Nestlé Việt Nam', N'0283913737', N'consumer.services@vn.nestle.com', N'Lầu 5, Empress Tower, 138-142 Hai Bà Trưng, phường Đa Kao, quận 1, thành phố Hồ Chí Minh')
INSERT [dbo].[NhaCungCap] ([maNhaCungCap], [tenNhaCungCap], [soDienThoai], [email], [diaChi]) VALUES (N'NCC00005', N'Công ty CP Bibica', N'0283917920', N'', N'Số 443 Lý Thường Kiệt, phường 8, quận Tân Bình, thành phố Hồ Chí Minh')
INSERT [dbo].[NhaCungCap] ([maNhaCungCap], [tenNhaCungCap], [soDienThoai], [email], [diaChi]) VALUES (N'NCC00006', N'Công ty TNHH Thực phẩm OK (OKFood)', N'0938451796', N'okfoodvn@gmail.com', N'186 Phú Định, Phường 16, Quận 8, TP.HCM
')
INSERT [dbo].[NhaCungCap] ([maNhaCungCap], [tenNhaCungCap], [soDienThoai], [email], [diaChi]) VALUES (N'NCC00007', N'Đại lý bia nước ngọt Khương Duу', N'0163334084', N'', N'44/3a 13 Đường TTH10, Khu phố 3, phường Tân Thới Hiệp, Quận 12, TP Hồ Chí Minh')
INSERT [dbo].[NhaCungCap] ([maNhaCungCap], [tenNhaCungCap], [soDienThoai], [email], [diaChi]) VALUES (N'NCC00008', N'HỆ THỐNG CHUỖI CỬA HÀNG HT SÀI GÒN', N'0888030777', N'htsaigon54@gmail.com', N'Phường Bình Hưng Hòa, Quận Bình Tân, TP. HCM')
INSERT [dbo].[NhaCungCap] ([maNhaCungCap], [tenNhaCungCap], [soDienThoai], [email], [diaChi]) VALUES (N'NCC00009', N'CÔNG TY CP HÓA MỸ PHẨM TỰ NHIÊN', N'0896355777', N'info@tunhienvn.com', N'718 Lương Định Của, Tp. Nha Trang, tỉnh Khánh Hòa')
INSERT [dbo].[NhaCungCap] ([maNhaCungCap], [tenNhaCungCap], [soDienThoai], [email], [diaChi]) VALUES (N'NCC00010', N'Công Ty TNHH Miniso Việt Nam', N'02839309536', N'support@minisovietnam.vn', N'Lầu 6, 81 Cao Thắng, Phường 3, Quận 3, TP.HCM')
GO
INSERT [dbo].[NhanVien] ([maNhanVien], [tenTaiKhoan], [tenNhanVien], [gioiTinh], [ngaySinh], [soDienThoai], [email], [diaChi], [trangThai]) VALUES (N'NVB00001', N'nvbhanh', N'Ngô Anh Trí', N'Nữ', NULL, N'0675836195', N'abc@gmail.com', N'Sao Hỏa', 1)
INSERT [dbo].[NhanVien] ([maNhanVien], [tenTaiKhoan], [tenNhanVien], [gioiTinh], [ngaySinh], [soDienThoai], [email], [diaChi], [trangThai]) VALUES (N'NVB00002', N'nvbhtien', N'Nguyễn Thúc Thùy Tiên', N'Nữ', CAST(N'1999-04-07' AS Date), N'0583657683', N'', N'Quận 1, Hồ Chí Minh', 1)
INSERT [dbo].[NhanVien] ([maNhanVien], [tenTaiKhoan], [tenNhanVien], [gioiTinh], [ngaySinh], [soDienThoai], [email], [diaChi], [trangThai]) VALUES (N'NVB00003', N'nvbhvu', N'Nguyễn Ngọc Tuấn Vũ', N'Nam', NULL, N'', N'nvbhvu@email.com', N'', 1)
INSERT [dbo].[NhanVien] ([maNhanVien], [tenTaiKhoan], [tenNhanVien], [gioiTinh], [ngaySinh], [soDienThoai], [email], [diaChi], [trangThai]) VALUES (N'NVB00004', N'test3', N'test', N'Nam', NULL, N'', N'', N'', 1)
INSERT [dbo].[NhanVien] ([maNhanVien], [tenTaiKhoan], [tenNhanVien], [gioiTinh], [ngaySinh], [soDienThoai], [email], [diaChi], [trangThai]) VALUES (N'NVK00001', N'nvkphat', N'Phạm Tấn Phát', N'Nam', CAST(N'2002-05-08' AS Date), N'0836184038', N'nvkphat@email.com', N'Bình Tân, Hồ Chí Minh', 1)
INSERT [dbo].[NhanVien] ([maNhanVien], [tenTaiKhoan], [tenNhanVien], [gioiTinh], [ngaySinh], [soDienThoai], [email], [diaChi], [trangThai]) VALUES (N'NVK00002', N'nvktri', N'Nguyễn Minh Trí', N'Nữ', NULL, N'0905128673', N'trideptrai@gmail.com', N'Trái Đất', 1)
INSERT [dbo].[NhanVien] ([maNhanVien], [tenTaiKhoan], [tenNhanVien], [gioiTinh], [ngaySinh], [soDienThoai], [email], [diaChi], [trangThai]) VALUES (N'NVK00003', N'nvktuan', N'Gia Hoàng Minh Tuấn', N'Nam', NULL, N'', N'nvktuan@email.com', N'Thủ Đức', 1)
INSERT [dbo].[NhanVien] ([maNhanVien], [tenTaiKhoan], [tenNhanVien], [gioiTinh], [ngaySinh], [soDienThoai], [email], [diaChi], [trangThai]) VALUES (N'NVK00004', N'test2', N'Haah', N'', CAST(N'2003-12-24' AS Date), N'', N'', N'', 1)
GO
INSERT [dbo].[PhanQuyen] ([maPhanQuyen], [tenPhanQuyen]) VALUES (N'PQ01', N'Admin')
INSERT [dbo].[PhanQuyen] ([maPhanQuyen], [tenPhanQuyen]) VALUES (N'PQ02', N'Quản lí')
INSERT [dbo].[PhanQuyen] ([maPhanQuyen], [tenPhanQuyen]) VALUES (N'PQ03', N'Nhân viên bán hàng')
INSERT [dbo].[PhanQuyen] ([maPhanQuyen], [tenPhanQuyen]) VALUES (N'PQ04', N'Nhân viên kho')
GO
INSERT [dbo].[PhieuNhap] ([maPhieuNhap], [maNhaCungCap], [maNhanVien], [maQuanLi], [thoiGianTao], [thoiGianDuyet], [thanhTien], [trangThaiDuyet]) VALUES (N'15/11/2023-PN0001', N'NCC00004', N'NVK00001', N'QLI00001', CAST(N'2023-11-15T19:32:39.0000000' AS DateTime2), CAST(N'2023-11-15T20:53:22.0000000' AS DateTime2), 2100000.0000, N'Đã duyệt')
INSERT [dbo].[PhieuNhap] ([maPhieuNhap], [maNhaCungCap], [maNhanVien], [maQuanLi], [thoiGianTao], [thoiGianDuyet], [thanhTien], [trangThaiDuyet]) VALUES (N'15/11/2023-PN0002', N'NCC00002', N'NVK00003', NULL, CAST(N'2023-11-15T19:37:48.0000000' AS DateTime2), NULL, 800000.0000, N'Từ chối')
GO
INSERT [dbo].[QuanLi] ([maQuanLi], [tenTaiKhoan], [tenQuanLi], [gioiTinh], [ngaySinh], [soDienThoai], [email], [diaChi], [trangThai]) VALUES (N'QLI00001', N'qltrung', N'Phạm Minh Trung', N'Nam', CAST(N'2003-04-06' AS Date), N'0964738564', N'qltrung@email.com', N'Hồ Chí Minh', 1)
INSERT [dbo].[QuanLi] ([maQuanLi], [tenTaiKhoan], [tenQuanLi], [gioiTinh], [ngaySinh], [soDienThoai], [email], [diaChi], [trangThai]) VALUES (N'QLI00002', N'qltin', N'Nguyễn Ngọc Tín', N'Nam', NULL, N'', N'', N'', 1)
INSERT [dbo].[QuanLi] ([maQuanLi], [tenTaiKhoan], [tenQuanLi], [gioiTinh], [ngaySinh], [soDienThoai], [email], [diaChi], [trangThai]) VALUES (N'QLI00003', N'qlkhang', N'Ngô Gia Khang', N'Nữ', NULL, N'', N'qlkhang@email.com', N'Hồ Chí Minh', 1)
GO
INSERT [dbo].[SanPham] ([maSanPham], [maLoaiSanPham], [maNhaCungCap], [tenSanPham], [donViTinh], [soLuong], [giaBan], [duongDanAnh], [trangThai]) VALUES (N'SPH00001', N'LSP00010', N'NCC00002', N'Mì dinh dưỡng khoai tây Omachi xốt bò hầm', N'Gói', 90, 9000.0000, N'Images\SanPham\mi_khoai_tay_omachi_sot_bo_ham.png', 1)
INSERT [dbo].[SanPham] ([maSanPham], [maLoaiSanPham], [maNhaCungCap], [tenSanPham], [donViTinh], [soLuong], [giaBan], [duongDanAnh], [trangThai]) VALUES (N'SPH00002', N'LSP00010', N'NCC00002', N'Mì dinh dưỡng khoai tây Omachi Tôm chua cay Thái', N'Gói', 200, 9000.0000, N'Images\SanPham\mi_khoai_tay_omachi_tom_chua_cay_thai.png', 1)
INSERT [dbo].[SanPham] ([maSanPham], [maLoaiSanPham], [maNhaCungCap], [tenSanPham], [donViTinh], [soLuong], [giaBan], [duongDanAnh], [trangThai]) VALUES (N'SPH00003', N'LSP00008', N'NCC00004', N'Sữa lúa mạch Milo nắp vặn hộp 210ml', N'Hộp', 547, 10300.0000, N'Images\SanPham\sua-lua-mach-milo-nap-van-hop-210ml.png', 1)
INSERT [dbo].[SanPham] ([maSanPham], [maLoaiSanPham], [maNhaCungCap], [tenSanPham], [donViTinh], [soLuong], [giaBan], [duongDanAnh], [trangThai]) VALUES (N'SPH00004', N'LSP00015', N'NCC00004', N'Cà phê sữa đậm hài hòa NesCafé 3in1 340g', N'Hộp', 454, 60000.0000, N'Images\SanPham\ca-phe-sua-nescafe-3-in-1-dam-da-hai-hoa-340g.png', 1)
INSERT [dbo].[SanPham] ([maSanPham], [maLoaiSanPham], [maNhaCungCap], [tenSanPham], [donViTinh], [soLuong], [giaBan], [duongDanAnh], [trangThai]) VALUES (N'SPH00005', N'LSP00001', N'NCC00001', N'Má đùi gà C.P 500g (3-5 cái)', N'Khay', 253, 35000.0000, N'Images\SanPham\ma-dui-ga-khay-500g-2-4-cai.png', 1)
INSERT [dbo].[SanPham] ([maSanPham], [maLoaiSanPham], [maNhaCungCap], [tenSanPham], [donViTinh], [soLuong], [giaBan], [duongDanAnh], [trangThai]) VALUES (N'SPH00006', N'LSP00003', N'NCC00004', N'Bánh xốp phủ socola KitKat gói 35g', N'Gói', 431, 18000.0000, N'Images\SanPham\banh-xop-phu-socola-kitkat-35g.png', 1)
INSERT [dbo].[SanPham] ([maSanPham], [maLoaiSanPham], [maNhaCungCap], [tenSanPham], [donViTinh], [soLuong], [giaBan], [duongDanAnh], [trangThai]) VALUES (N'SPH00007', N'LSP00013', N'NCC00008', N'Sữa tắm bảo vệ khỏi vi khuẩn Lifebuoy chăm sóc da 980ml', N'Chai', 457, 200000.0000, N'Images\SanPham\sua-tam-bao-ve-khoi-vi-khuan-lifebuoy-sua-duong-am-980ml.png', 1)
INSERT [dbo].[SanPham] ([maSanPham], [maLoaiSanPham], [maNhaCungCap], [tenSanPham], [donViTinh], [soLuong], [giaBan], [duongDanAnh], [trangThai]) VALUES (N'SPH00008', N'LSP00012', N'NCC00008', N'Nước giặt OMO Matic cửa trước ngăn mùi ẩm mốc túi 3.6kg', N'Túi', 24, 230000.0000, N'Images\SanPham\nuoc-giat-omo-matic-cua-truoc-ngan-mui-am-moc-3_6kg.png', 1)
INSERT [dbo].[SanPham] ([maSanPham], [maLoaiSanPham], [maNhaCungCap], [tenSanPham], [donViTinh], [soLuong], [giaBan], [duongDanAnh], [trangThai]) VALUES (N'SPH00009', N'LSP00011', N'NCC00003', N'Bút Bi ENERGEL Pentel BLN55-A - Đen', N'Cây', 514, 49600.0000, N'Images\SanPham\but-bi-energel-pentel-bln55-a-den.png', 0)
GO
INSERT [dbo].[TaiKhoan] ([maPhanQuyen], [tenTaiKhoan], [matKhau], [trangThai]) VALUES (N'PQ01', N'admin', N'admin', 1)
INSERT [dbo].[TaiKhoan] ([maPhanQuyen], [tenTaiKhoan], [matKhau], [trangThai]) VALUES (N'PQ03', N'nvbhanh', N'nvbh', 1)
INSERT [dbo].[TaiKhoan] ([maPhanQuyen], [tenTaiKhoan], [matKhau], [trangThai]) VALUES (N'PQ03', N'nvbhtien', N'nvbh', 1)
INSERT [dbo].[TaiKhoan] ([maPhanQuyen], [tenTaiKhoan], [matKhau], [trangThai]) VALUES (N'PQ03', N'nvbhvu', N'nvbh', 1)
INSERT [dbo].[TaiKhoan] ([maPhanQuyen], [tenTaiKhoan], [matKhau], [trangThai]) VALUES (N'PQ04', N'nvkphat', N'nvk', 1)
INSERT [dbo].[TaiKhoan] ([maPhanQuyen], [tenTaiKhoan], [matKhau], [trangThai]) VALUES (N'PQ04', N'nvktri', N'nvk', 1)
INSERT [dbo].[TaiKhoan] ([maPhanQuyen], [tenTaiKhoan], [matKhau], [trangThai]) VALUES (N'PQ04', N'nvktuan', N'nvk', 1)
INSERT [dbo].[TaiKhoan] ([maPhanQuyen], [tenTaiKhoan], [matKhau], [trangThai]) VALUES (N'PQ02', N'qlkhang', N'ql', 1)
INSERT [dbo].[TaiKhoan] ([maPhanQuyen], [tenTaiKhoan], [matKhau], [trangThai]) VALUES (N'PQ02', N'qltin', N'ql', 1)
INSERT [dbo].[TaiKhoan] ([maPhanQuyen], [tenTaiKhoan], [matKhau], [trangThai]) VALUES (N'PQ02', N'qltrung', N'ql', 1)
INSERT [dbo].[TaiKhoan] ([maPhanQuyen], [tenTaiKhoan], [matKhau], [trangThai]) VALUES (N'PQ03', N'test1', N'test', 1)
INSERT [dbo].[TaiKhoan] ([maPhanQuyen], [tenTaiKhoan], [matKhau], [trangThai]) VALUES (N'PQ04', N'test2', N'test', 1)
INSERT [dbo].[TaiKhoan] ([maPhanQuyen], [tenTaiKhoan], [matKhau], [trangThai]) VALUES (N'PQ03', N'test3', N'test', 1)
INSERT [dbo].[TaiKhoan] ([maPhanQuyen], [tenTaiKhoan], [matKhau], [trangThai]) VALUES (N'PQ04', N'test4', N'test', 1)
INSERT [dbo].[TaiKhoan] ([maPhanQuyen], [tenTaiKhoan], [matKhau], [trangThai]) VALUES (N'PQ03', N'testThemTaiKhoan', N'test', 0)
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_TaiKhoan] FOREIGN KEY([tenTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([tenTaiKhoan])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_TaiKhoan]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([maHoaDon])
REFERENCES [dbo].[HoaDon] ([maHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_SanPham] FOREIGN KEY([maSanPham])
REFERENCES [dbo].[SanPham] ([maSanPham])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_SanPham]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuNhap_PhieuNhap] FOREIGN KEY([maPhieuNhap])
REFERENCES [dbo].[PhieuNhap] ([maPhieuNhap])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK_ChiTietPhieuNhap_PhieuNhap]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuNhap_SanPham] FOREIGN KEY([maSanPham])
REFERENCES [dbo].[SanPham] ([maSanPham])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK_ChiTietPhieuNhap_SanPham]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([maKhachHang])
REFERENCES [dbo].[KhachHang] ([maKhachHang])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhuyenMai] FOREIGN KEY([maKhuyenMai])
REFERENCES [dbo].[KhuyenMai] ([maKhuyenMai])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhuyenMai]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[NhanVien] ([maNhanVien])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_TaiKhoan] FOREIGN KEY([tenTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([tenTaiKhoan])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_TaiKhoan]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NhaCungCap] FOREIGN KEY([maNhaCungCap])
REFERENCES [dbo].[NhaCungCap] ([maNhaCungCap])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhaCungCap]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NhanVien] FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[NhanVien] ([maNhanVien])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhanVien]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_QuanLi] FOREIGN KEY([maQuanLi])
REFERENCES [dbo].[QuanLi] ([maQuanLi])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_QuanLi]
GO
ALTER TABLE [dbo].[QuanLi]  WITH CHECK ADD  CONSTRAINT [FK_QuanLi_TaiKhoan] FOREIGN KEY([tenTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([tenTaiKhoan])
GO
ALTER TABLE [dbo].[QuanLi] CHECK CONSTRAINT [FK_QuanLi_TaiKhoan]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([maLoaiSanPham])
REFERENCES [dbo].[LoaiSanPham] ([maLoaiSanPham])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaCungCap] FOREIGN KEY([maNhaCungCap])
REFERENCES [dbo].[NhaCungCap] ([maNhaCungCap])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaCungCap]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_PhanQuyen] FOREIGN KEY([maPhanQuyen])
REFERENCES [dbo].[PhanQuyen] ([maPhanQuyen])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_PhanQuyen]
GO
USE [master]
GO
ALTER DATABASE [mini-mart] SET  READ_WRITE 
GO