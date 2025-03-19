
--For organized data

CREATE SCHEMA Techshopstr;
go

-- create tables for all the required data
create table Techshopstr.customers
(
customerId int IDENTITY(1,1) primary key,
Firstname varchar(100) NOT NULL,
Lastname varchar(100) NOT NULL,
Email varchar(100) UNIQUE NOT NULL,
Phone bigint UNIQUE,
Address varchar(250)
);


CREATE TABLE Techshopstr.Products
(
ProductId int IDENTITY(1,1) primary key,
ProductName varchar(100) NOT NULL,
Description varchar(250),
Price decimal(10,2) NOT NULL check (Price > 0)
);



CREATE TABLE Techshopstr.Orders
(
OrderID int IDENTITY(1,1) primary key,
customerId int NOT NULL,
OrderDate DATETIME DEFAULT GETDATE(),
-- here datetime is built method to assign date and time and default getdate give the current date if no values are given for the date
TotalAmount decimal(10,2),
-- decimal followed by the total number digits accepted and the no of decimal places

    foreign key (customerId) REFERENCES Techshopstr.customers(customerId) ON DELETE CASCADE
);


CREATE TABLE Techshopstr.OrderDetails
(
OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
OrderID int NOT NULL,
ProductId int NOT NULL,
Quantity int NOT NULL CHECK (Quantity > 0),
foreign key (OrderID) REFERENCES Techshopstr.Orders(OrderID) ON DELETE CASCADE,
foreign key (ProductId) REFERENCES Techshopstr.Products(ProductId) ON DELETE CASCADE
);


CREATE TABLE Techshopstr.Inventory
(
InventoryID int IDENTITY(1,1) primary key,
ProductId int NOT NULL,
QuantityInStock int NOT NULL CHECK (QuantityInStock >= 0),
LastStockUpdate DATETIME DEFAULT GETDATE(),
foreign key (ProductId) REFERENCES Techshopstr.Products(ProductID) ON DELETE CASCADE
);


SELECT * from Techshopstr.customers
SELECT * from Techshopstr.Products
SELECT * from Techshopstr.Orders
SELECT * from Techshopstr.OrderDetails
SELECT * from Techshopstr.Inventory


UPDATE Techshopstr.Inventory SET LastStockUpdate = '2025-03-01 10:00:00' WHERE InventoryID = 1;
UPDATE Techshopstr.Inventory SET LastStockUpdate = '2025-03-02 11:15:00' WHERE InventoryID = 2;
UPDATE Techshopstr.Inventory SET LastStockUpdate = '2025-03-03 12:30:00' WHERE InventoryID = 3;
UPDATE Techshopstr.Inventory SET LastStockUpdate = '2025-03-04 13:45:00' WHERE InventoryID = 4;
UPDATE Techshopstr.Inventory SET LastStockUpdate = '2025-03-05 15:00:00' WHERE InventoryID = 5;
UPDATE Techshopstr.Inventory SET LastStockUpdate = '2025-03-06 16:20:00' WHERE InventoryID = 6;
UPDATE Techshopstr.Inventory SET LastStockUpdate = '2025-03-07 17:40:00' WHERE InventoryID = 7;
UPDATE Techshopstr.Inventory SET LastStockUpdate = '2025-03-08 18:55:00' WHERE InventoryID = 8;
UPDATE Techshopstr.Inventory SET LastStockUpdate = '2025-03-09 20:10:00' WHERE InventoryID = 9;
UPDATE Techshopstr.Inventory SET LastStockUpdate = '2025-03-10 21:30:00' WHERE InventoryID = 10;


SELECT * from Techshopstr.Inventory

SELECT FirstName, LastName, Email FROM Techshopstr.customers;


SELECT o.OrderID, o.OrderDate, c.FirstName, c.LastName
FROM Techshopstr.Orders o
JOIN Techshopstr.customers c ON o.customerId = c.customerId;

INSERT INTO Techshopstr.customers (FirstName, LastName, Email, Phone, Address)
VALUES ('Rajith', 'Miruthush', 'rajith.miruthush@example.com', 9876543210, '567 Cedar St');


UPDATE Techshopstr.Products
SET Price = Price * 1.10;

DELETE FROM Techshopstr.OrderDetails
WHERE OrderID = (SELECT OrderID FROM Techshopstr.Orders WHERE OrderID = 1);

DELETE FROM Techshopstr.Orders
WHERE OrderID = 1;

INSERT INTO Techshopstr.Orders (customerId, TotalAmount)
VALUES (3, 499.99);

UPDATE Techshopstr.Orders
SET TotalAmount = (SELECT SUM(p.Price * od.Quantity)
                   FROM Techshopstr.OrderDetails od
                   JOIN Techshopstr.Products p ON od.ProductID = p.ProductID
                   WHERE od.OrderID = Techshopstr.Orders.OrderID);

DECLARE @CustomerID INT = 1;

DELETE FROM Techshopstr.OrderDetails 
WHERE OrderID IN (SELECT OrderID FROM Techshopstr.Orders WHERE CustomerID = @CustomerID);

DELETE FROM Techshopstr.Orders WHERE CustomerID = @CustomerID;


INSERT INTO Techshopstr.Products (ProductName, Description, Price)
VALUES ('Playstation 5', 'powerful processor for your gaming needs', 999.99);


DECLARE @OrderID INT = 4;

UPDATE Techshopstr.Orders
SET OrderDate = GETDATE()
WHERE OrderID = @OrderID;

ALTER TABLE Techshopstr.customers ADD TotalOrders INT DEFAULT 0;

UPDATE Techshopstr.customers
SET TotalOrders = (SELECT COUNT(*) FROM Techshopstr.Orders WHERE Techshopstr.Orders.customerId = Techshopstr.customers.customerId);

DECLARE @CustomerID INT = 2;

UPDATE Techshopstr.Customers
SET Email = 'newemail@example.com', Address = 'Updated Address'
WHERE CustomerID = @CustomerID;


SELECT * FROM Techshopstr.OrderDetails;
SELECT * FROM Techshopstr.Orders;

SELECT SUM(ISNULL(o.TotalAmount, 0)) AS TotalRevenue
FROM Techshopstr.Orders o;

SELECT SUM(o.TotalAmount) AS TotalRevenue
FROM Techshopstr.Orders o;

SELECT o.OrderID, c.CustomerID, o.TotalAmount
FROM Techshopstr.Orders o
LEFT JOIN Techshopstr.Customers c
ON o.CustomerID = c.CustomerID
WHERE o.TotalAmount IS NULL;

JOIN Techshopstr.Customers c ON o.customerId = c.customerId;

SELECT * FROM Techshopstr.Orders WHERE TotalAmount IS NULL;

SELECT i.InventoryID, p.ProductName, i.QuantityInStock
FROM Techshopstr.Inventory i
JOIN Techshopstr.Products p
ON i.ProductId = p.ProductId
WHERE i.QuantityInStock < 50;


UPDATE Techshopstr.Inventory
SET QuantityInStock = 100,
LastStockUpdate = GETDATE()
WHERE QuantityInStock < 50;
SELECT * FROM Techshopstr.Inventory

INSERT INTO Techshopstr.Products (ProductName, Description, Price)
VALUES
('Wireless Mouse', 'Bluetooth Mouse with long battery life', 750.00),
('Gaming Keyboard', 'RGB Mechanical Keyboard', 1500.00);

SELECT * FROM Techshopstr.Products

INSERT INTO Techshopstr.Inventory (ProductId, QuantityInStock, LastStockUpdate)
VALUES
(11, 80, GETDATE()), 
(12, 60, GETDATE());

INSERT INTO Techshopstr.Products (ProductName, Description, Price)
VALUES
('Battery', 'long battery life', 750.00),
('Home theatre', 'BASSSS', 1500.00);


INSERT INTO Techshopstr.Inventory (ProductId, QuantityInStock, LastStockUpdate)
VALUES
(14, 0, GETDATE()),
(15, 0, GETDATE()); 

SELECT * FROM Techshopstr.Inventory
SELECT * FROM Techshopstr.Products
DELETE FROM Techshopstr.Inventory
WHERE QuantityInStock = 0;

SELECT SUM(QuantityInStock) AS TotalQuantity
FROM Techshopstr.Inventory;

SELECT AVG(QuantityInStock) AS AverageStock
FROM Techshopstr.Inventory;



SELECT TOP 1 p.ProductName, i.QuantityInStock
FROM Techshopstr.Inventory i
JOIN Techshopstr.Products p
ON i.ProductId = p.ProductId
ORDER BY i.QuantityInStock DESC;


SELECT p.ProductName, i.QuantityInStock, i.LastStockUpdate
FROM Techshopstr.Inventory i
JOIN Techshopstr.Products p
ON i.ProductId = p.ProductId
WHERE i.LastStockUpdate >= DATEADD(DAY, -7, GETDATE());


UPDATE Techshopstr.Inventory
SET QuantityInStock = 50,
    LastStockUpdate = GETDATE()
WHERE ProductId IN (1, 3, 5); 


SELECT i.InventoryID, p.ProductName, i.QuantityInStock, i.LastStockUpdate
FROM Techshopstr.Inventory i
JOIN Techshopstr.Products p
ON i.ProductId = p.ProductId
WHERE p.ProductName = 'Wireless Mouse';
