create database sales_management;

use sales_management;

create table Customer(
	CustomerID int primary key auto_increment,
    CustomerName varchar(50) not null,
    CustomerAge int 
);

create table `Order`(
	OrderID int primary key auto_increment,
    CustomerID int,
    OrderDate date,
    OrderTotalPrice double,
    foreign key(CustomerID) references Customer(CustomerID)
);

create table OrderDetail(
	OrderID int,
    CustomerID int,
    OrderQTY int,
    primary key(OrderID, CustomerID),
    foreign key(OrderID) references `Order`(OrderID),
    foreign key(CustomerID) references Customer(CustomerID)
);

create table Product(
	ProductID int primary key auto_increment,
    ProductName varchar(50),
    ProductPrice double
);
