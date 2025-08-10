CREATE DATABASE CarShowroomDB;

CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    JoinDate DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Cars (
    CarID SERIAL PRIMARY KEY,
    Model VARCHAR(50),
    Brand VARCHAR(50),
    Year INT,
    Price DECIMAL(10, 2),
    Color VARCHAR(30),
    InventoryCount INT
);

CREATE TABLE Salespersons (
    SalespersonID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    HireDate DATE
);

CREATE TABLE Sales (
    SaleID SERIAL PRIMARY KEY,
    CustomerID INT REFERENCES Customers(CustomerID),
    CarID INT REFERENCES Cars(CarID),
    SaleDate DATE,
    SalePrice DECIMAL(10, 2),
    SalespersonID INT REFERENCES Salespersons(SalespersonID)
);

CREATE TABLE ServiceRecords (
    RecordID SERIAL PRIMARY KEY,
    CarID INT REFERENCES Cars(CarID),
    ServiceDate DATE,
    ServiceType VARCHAR(50),
    Cost DECIMAL(10, 2),
    TechnicianID INT 
);

-- Part 1: Basic Aggregate Functions

-- 1. Total number of customers
SELECT COUNT(*) AS TotalCustomers
FROM Customers;

-- 2. Average sale price of all car sales
SELECT AVG(SalePrice) AS AverageSalePrice
FROM Sales;

-- 3. Most expensive car ever sold
SELECT MAX(SalePrice) AS MostExpensiveSale
FROM Sales;

-- 4. Total inventory count of all cars in the showroom
SELECT SUM(InventoryCount) AS TotalInventory
FROM Cars;

-- 5. Earliest and most recent sale dates
SELECT MIN(SaleDate) AS EarliestSale, MAX(SaleDate) AS LatestSale
FROM Sales;

-- Part 2: GROUP BY Exercises

-- 1. Group cars by brand and count how many models each brand has
SELECT Brand, COUNT(DISTINCT Model) AS ModelCount
FROM Cars
GROUP BY Brand;

-- 2. Total sales amount for each salesperson
SELECT s.SalespersonID, sp.Name, SUM(s.SalePrice) AS TotalSales
FROM Sales s
JOIN Salespersons sp ON s.SalespersonID = sp.SalespersonID
GROUP BY s.SalespersonID, sp.Name;

-- 3. Average sale price for each car model
SELECT c.Model, AVG(s.SalePrice) AS AverageSalePrice
FROM Sales s
JOIN Cars c ON s.CarID = c.CarID
GROUP BY c.Model;

-- 4. Average service cost per service type
SELECT ServiceType, AVG(Cost) AS AverageCost
FROM ServiceRecords
GROUP BY ServiceType;

-- 5. Count of cars by brand and color combination
SELECT Brand, Color, COUNT(*) AS CarCount
FROM Cars
GROUP BY Brand, Color;

-- Part 3: HAVING Clause Exercises

-- 1. Brands that offer more than five different car models
SELECT Brand, COUNT(DISTINCT Model) AS ModelCount
FROM Cars
GROUP BY Brand
HAVING COUNT(DISTINCT Model) > 5;

-- 2. Car models that have been sold more than 10 times
SELECT c.Model, COUNT(*) AS SalesCount
FROM Sales s
JOIN Cars c ON s.CarID = c.CarID
GROUP BY c.Model
HAVING COUNT(*) > 10;

-- 3. Salespersons whose average sale price is greater than 50,000
SELECT s.SalespersonID, sp.Name, AVG(s.SalePrice) AS AvgSalePrice
FROM Sales s
JOIN Salespersons sp ON s.SalespersonID = sp.SalespersonID
GROUP BY s.SalespersonID, sp.Name
HAVING AVG(s.SalePrice) > 50000;

-- 4. Months that had more than 20 sales
SELECT DATE_TRUNC('month', SaleDate) AS SaleMonth, COUNT(*) AS SalesCount
FROM Sales
GROUP BY SaleMonth
HAVING COUNT(*) > 20;

-- 5. Service types where average cost is greater than 500
SELECT ServiceType, AVG(Cost) AS AverageCost
FROM ServiceRecords
GROUP BY ServiceType
HAVING AVG(Cost) > 500;

