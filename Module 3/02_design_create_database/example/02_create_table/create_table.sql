create database QuanLyDiemThi;

use QuanLyDiemThi;

create table HocSinh(
	MaHS int primary key auto_increment,
    TenHS varchar(50),
    NgaySinh date,
    Lop varchar(10),
    GT varchar(20)
);

create table GiaoVien(
	MaGV int primary key auto_increment,
	TenGV varchar(50),
    SDT varchar(20)
);

create table MonHoc(
	MaMH int primary key auto_increment,
    TenMH varchar(30),
    MaGV int,
    foreign key(MaGV) references GiaoVien(MaGV)
);

create table BangDiem(
	MaHS int,
    MaGV int,
    DiemThi int,
    NgayThi date,
    primary key(MaHS, MaGV),
    foreign key(MaHS) references HocSinh(MaHS),
    foreign key(MaGV) references GiaoVien(MaGV)
);