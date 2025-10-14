CREATE DATABASE mydb;
USE mydb;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    City VARCHAR(50)
);
describe Students;
Show tables;
CREATE TABLE Hamza (
Roll_No INT primary Key,
Name varchar(30),
Age INT,
City varchar(30)
) ;
Alter table Hamza modify Roll_No int auto_increment;
describe hamza;
insert into Hamza (Name,Age,City)
values("Muhammad Hamza", 22,'Sahiwal'),
	   ("Muhammad Arham", 23,'Sahiwal'),
       ("Muhammad Hassan", 22,'Tariq'),
       ("Muhammad Haris", 22,'Bilal Colony'),
      ("Muhammad Anas", 22,'Tariq ');
select * from Hamza;
select * from Hamza Where City = 'Tariq';
delete from Hamza where City = 'Tariq';
SET SQL_SAFE_UPDATES = 0;
