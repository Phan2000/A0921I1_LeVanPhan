create database QuanLyMuaBanHang;

use QuanLyMuaBanHang;

create table NhaCC(
	MaNcc int primary key auto_increment,
    TenNcc varchar(50) not null,
    DiaChi varchar(50) not null
);

create table SDT(
	MaNcc int,
    SDT varchar(20),
    foreign key(MaNcc) references NhaCC(MaNcc)
);

create table DonDH(
	MaDH int primary key auto_increment,
    NgayDH date not null, 
	MaNcc int,
	foreign key(MaNcc) references NhaCC(MaNcc)
);

create table VatTu(
	MaVT int primary key auto_increment,
    TenVT varchar(30) not null
);

create table ChiTietDDH(
	MaDH int not null,
    MaVT int not null,
    SoLuong int not null,
    primary key(MaDH, MaVT),
    foreign key(MaDH) references DonDH(MaDH),
    foreign key(MaVT) references VatTu(MaVT)
);

create table PhieuNhap(
	MaPhieuNhap int primary key auto_increment,
    NgayNhap date not null
);

create table PhieuXuat(
	MaPhieuXuat int primary key auto_increment,
    NgayXuat date not null
);
