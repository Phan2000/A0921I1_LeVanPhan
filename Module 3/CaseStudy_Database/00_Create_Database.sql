CREATE DATABASE furama_data;

USE furama_data;

CREATE TABLE ViTri(
	MaViTri INT PRIMARY KEY AUTO_INCREMENT,
    TenViTri VARCHAR(45)
);

CREATE TABLE TrinhDo(
	MaTrinhDo INT PRIMARY KEY AUTO_INCREMENT,
	TenTrinhDo VARCHAR(45)
);

CREATE TABLE BoPhan(
	MaBoPhan INT PRIMARY KEY AUTO_INCREMENT,
    TenBoPhan VARCHAR(45) 
);				

CREATE TABLE NhanVien(
	MaNhanVien INT PRIMARY KEY AUTO_INCREMENT,
    HoTen VARCHAR(45),
    NgaySinh DATE,
    SoCMND VARCHAR(45),
    Luong DOUBLE,
    SoDienThoai VARCHAR(45),
    Email VARCHAR(45),
    DiaChi VARCHAR(45),
    MaVT INT,
    MaTD INT, 
    MaBP INT,
    FOREIGN KEY(MaVT) REFERENCES ViTri(MaViTri),
    FOREIGN KEY(MaTD) REFERENCES TrinhDo(MaTrinhDo),
    FOREIGN KEY(MaBP) REFERENCES BoPhan(MaBoPhan)
);

CREATE TABLE LoaiKhach(
	MaLoaiKhach int PRIMARY KEY AUTO_INCREMENT,
    TenLoaiKhach VARCHAR(45)
);

CREATE TABLE KhachHang(
	MaKhachHang INT PRIMARY KEY AUTO_INCREMENT,
    HoTen VARCHAR(45),
    NgaySinh DATE,
    GioiTinh BIT DEFAULT 1,
    SoCMND VARCHAR(45),
    SoDienThoai VARCHAR(45),
    Email VARCHAR(45),
    DiaChi VARCHAR(45),
    MaLK int,
    FOREIGN KEY(MaLK) REFERENCES LoaiKhach(MaLoaiKhach)
);

CREATE TABLE KieuThue(
	MaKieuThue INT PRIMARY KEY AUTO_INCREMENT,
    TenKieuThue VARCHAR(45)
);

CREATE TABLE LoaiDichVu(
	MaLoaiDichVu INT PRIMARY KEY AUTO_INCREMENT,
    TenLoaiDichVu VARCHAR(45)
);

CREATE TABLE DichVu(
	MaDichVu INT PRIMARY KEY AUTO_INCREMENT,
    TenDichVu VARCHAR(45),
    DienTich INT,
    ChiPhiThue DOUBLE,
    SoNguoiToiDa INT,
    TieuChuanPhong VARCHAR(45),
    MoTaTienNghiKhac VARCHAR(45),
    DienTichHoBoi DOUBLE,
    SoTang INT,
	MaKT INT,
    MaLDV INT,
    FOREIGN KEY(MaKT) REFERENCES KieuThue(MaKieuThue),
    FOREIGN KEY(MaLDV) REFERENCES LoaiDichVu(MaLoaiDichVu)
);

CREATE TABLE HopDong(
	MaHopDong INT PRIMARY KEY AUTO_INCREMENT,
    NgayLamHopDong DATETIME,
    NgayKetThuc DATETIME,
    TienDatCoc DOUBLE,
    MaNV int,
    MaKH int,
    MaDV int,
    FOREIGN KEY(MaNV) REFERENCES NhanVien(MaNhanVien),
    FOREIGN KEY(MaKH) REFERENCES KhachHang(MaKhachHang),
    FOREIGN KEY(MaDV) REFERENCES DichVu(MaDichVu)
);

CREATE TABLE DichVuDiKem(
	MaDichVuDiKem INT PRIMARY KEY AUTO_INCREMENT,
    TenDichVuDiKem VARCHAR(45),
    Gia DOUBLE,
    DonVi VARCHAR(45),
    TrangThai VARCHAR(45)
);

CREATE TABLE HopDongChiTiet(
	MaHopDongChiTiet INT PRIMARY KEY AUTO_INCREMENT,
    SoLuong int,
    MaHD int,
    MaDVDK int,
    FOREIGN KEY(MaHD) REFERENCES HopDong(MaHopDong),
    FOREIGN KEY(MaDVDK) REFERENCES DichVuDiKem(MaDichVuDiKem)
);