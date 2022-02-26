create database quanlybanhang;
use quanlybanhang;

create table Customer(
	CustomerID int not null auto_increment primary key,
    NameCustomer varchar(25) not null,
    CustomerAge int not null
);

create table Ordered(
	OrderID int not null auto_increment primary key,
    CID int not null,
    OrderDate datetime,
    OrderTotalPrice int,
    foreign key (CID) references Customer(CustomerID)
);

create table Product(
	ProductID int not null auto_increment primary key,
    ProductName varchar(25) not null,
    ProductPrice int not null
);

create table OrderDetail(
	OID int not null,
    PID int not null,
    ODQTY int,
    primary key(OID, PID),
    foreign key (OID) references Ordered(OrderID),
    foreign key (PID) references Product(ProductID)
);

insert into Customer(NameCustomer, CustomerAge)
values('Minh Quan', 10),
	  ('Ngoc Oanh', 20),
	  ('Hong Ha', 50);

insert into Ordered(CID, OrderDate, OrderTotalPrice)
values(1, '2006-03-21', null),
	  (2, '2006-03-23', null),
	  (1, '2006-03-16', null);

insert into Product(ProductName, ProductPrice)
values ('May giat', 3),
	   ('Tu lanh', 5),
       ('Dieu hoa', 7),
       ('Quat', 1),
       ('Bep dien', 2);
       
insert into OrderDetail(OID, PID, ODQTY)
values(1, 1, 3),
      (1, 3, 7),
      (1, 4, 2),
      (2, 1, 1),
      (3, 1, 8),
      (2, 5, 4),
      (2, 3, 3);
      
select * from Customer;
-- 1. Hien thi tat ca cac field trong bang order
select * from Ordered;

-- 2. Hien thi danh sach khach hang da mua hang
-- Va danh sach cac san pham duoc mua boi khach hang
select NameCustomer, ProductName, ODQTY
from Customer join Ordered on Customer.CustomerID = Ordered.CID join OrderDetail on OrderDetail.OID = Ordered.OrderID 
join Product on OrderDetail.PID = Product.ProductID;

-- 3. Hien thi danh sach khach hang khong mua san pham
select NameCustomer
from Customer
where Customer.CustomerID not in (select Ordered.CID from Ordered);

-- 4. Hien thi ma hoa don, ngay ban va gia tien cua tung hoa don.
select Ordered.OrderID, Ordered.OrderDate, sum(Product.ProductPrice * orderDetail.ODQTY) 
from Ordered join orderDetail on Ordered.OrderID = orderDetail.OID
join Product on Product.ProductID = orderDetail.PID
group by Ordered.OrderID;
