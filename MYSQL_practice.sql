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
describe hamza;
insert into Hamza (Roll_No,Name,Age,City)
values(1,"Muhammad Ali", 22,'Sahiwal'),
(2,"Muhammad Hamza", 22,'Sahiwal');
select * from Hamza;