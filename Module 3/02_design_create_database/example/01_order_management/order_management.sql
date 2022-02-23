create database order_management;

use order_management;

create table Hang(
	id_hang int primary key auto_increment,
    ten_hang varchar(50),
    dv_tinh varchar(10),
    mo_ta_hang varchar(50)
);

create table NguoiDat(
	id_nguoi_dat int primary key auto_increment,
    ten_nguoi_dat varchar(50)
);

create table DVKhach(
	id_dv int primary key auto_increment,
    ten_dv varchar(50),
    phone varchar(50),
    address varchar(10)
);

create table NguoiNhan(
	id_nguoi_nhan int primary key auto_increment,
    ten_nguoi_nhan varchar(50)
);