create database student_management;

use student_management;

create table Class(
	ClassID int primary key auto_increment,
	ClassName varchar(60) not null,
    StartDate datetime not null,
    `Status` bit
);

create table Student(
	StudentID int primary key auto_increment,
    StudentName  varchar(50) not null,
    Address varchar(50),
    Phone varchar(20),
    `Status` bit
);

create table `Subject` (
	SubID int primary key auto_increment,
    SubName varchar(30) not null,
    Credit tinyint not null default 1 check(Credit >= 1),
    `Status` bit default 1
);

create table Mark(
	MarkID int primary key auto_increment,
    SubID int not null,
    StudentID int not null,
    unique(SubID, StudentID),
    ExamTimes tinyint default 1,
    foreign key(SubID) references `Subject`(SubID),
    foreign key(StudentID) references Student(StudentID)
);