create database QuanLyBaiDoXe
use QuanLyBaiDoXe 
create table DangNhapAdmin(
	UserNameAd nvarchar(50) not null primary key,
	PasswordAd nvarchar(50) not null
)
create table TruyCap(
	id nvarchar(50)not null primary key,
	Ngay date,
	LuotTruyCap int,
)
create table KhachHang(
	userName nvarchar(50) not null primary key,
	tenKH nvarchar(50),
	GioiTinh nvarchar(10),
	NgaySinh date,
	DiaChi nvarchar(50) not null,
	Email nvarchar(50),
	SDT nvarchar(50),
	CMND nvarchar(10) not null,
	BienSoXe nvarchar(20) not null,
	Passwords nvarchar(50) not null
)
create table HinhThucGui(
	MaHinhThucGui nvarchar(50) not null primary key,
	loaiHinhThucGui nvarchar(50),
)
create table ViTriDoXe(
	MaViTri nvarchar(50) not null primary key,
	ViTri nvarchar(50),
	SoChoNgoiCuaXe int,
	TrangThai nvarchar(10)
)
create table HinhThucThanhToan(
	MaHinhThucThanhToan nvarchar(50) not null primary key,
	HinhThucThanhToan nvarchar(50)
)
create table ThoiGianGui(
	MaThoiGian nvarchar(50) not null primary key,
	LoaiThoiGian nvarchar(50),
)
create table DonGia(
	MaDonGia nvarchar(50) not null primary key,
	MaHinhThucGui nvarchar(50) foreign key(MaHinhThucGui) references HinhThucGui(MaHinhThucGui), 
	MaViTri nvarchar(50) foreign key(MaViTri) references ViTriDoXe(MaViTri),
	MaHinhThucThanhToan nvarchar(50) foreign key(MaHinhThucThanhToan) references HinhThucThanhToan(MaHinhThucThanhToan),
	MaThoiGian nvarchar(50) foreign key(MaThoiGian) references ThoiGianGui(MaThoiGian),
	Gia float,
)
create table DangKyDoXe(
	MaDK nvarchar(50) not null primary key,
	userName nvarchar(50) foreign key(userName) references KhachHang(userName),
	NgayBatDauGui date,
	NgayKetThuc date,
	GioBatDauGui nvarchar(10),
	MaDonGia nvarchar(50) foreign key(MaDonGia) references DonGia(MaDonGia),
)
create table HoaDon(
	MaHoaDon nvarchar(50) not null primary key,
	MaDK nvarchar(50) foreign key (MaDK) references DangKyDoXe(MaDK),
	NgayTT date,
	TongTien float
)
--admin phải xác nhận xe đã vào hay ra bãi chưa.
--nếu xe đã vào thì xác nhận Trạng thái của ViTriDoXe là đã đỗ 
--nếu xe đã ra thì xác nhận trạng tháy của ViTriDoXe là chưa có xe đỗ 
create table QuanLyRaVao(
	MaQL nvarchar(50) not null primary key,
	MaDK nvarchar(50) foreign key (MaDK) references DangKyDoXe(MaDK),
	GioLayXe nvarchar(20)
)