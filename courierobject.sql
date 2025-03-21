CREATE SCHEMA CourierMgmt;
GO

CREATE TABLE CourierMgmt.Userr (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    ContactNumber VARCHAR(20),
    Address TEXT
);

CREATE TABLE CourierMgmt.Courier (
    CourierID INT PRIMARY KEY IDENTITY(1,1),
    SenderName VARCHAR(255),
    SenderAddress TEXT,
    ReceiverName VARCHAR(255),
    ReceiverAddress TEXT,
    Weight DECIMAL(5, 2),
    Status VARCHAR(50),
    TrackingNumber VARCHAR(20) UNIQUE,
    DeliveryDate DATE
);


CREATE TABLE CourierMgmt.CourierServices (
    ServiceID INT PRIMARY KEY IDENTITY(1,1),
    ServiceName VARCHAR(100),
    Cost DECIMAL(8, 2)
);


CREATE TABLE CourierMgmt.Employee (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    ContactNumber VARCHAR(20),
    Role VARCHAR(50),
    Salary DECIMAL(10, 2)
);


CREATE TABLE CourierMgmt.Location (
    LocationID INT PRIMARY KEY IDENTITY(1,1),
    LocationName VARCHAR(100),
    Address TEXT
);


CREATE TABLE CourierMgmt.Payment (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    CourierID INT,
    LocationID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    FOREIGN KEY (CourierID) REFERENCES CourierMgmt.Courier(CourierID),
    FOREIGN KEY (LocationID) REFERENCES CourierMgmt.Location(LocationID)
);

select * from CourierMgmt.Userr
select * from CourierMgmt.Courier
select * from CourierMgmt.CourierServices
select * from CourierMgmt.Employee
select * from CourierMgmt.Location
select * from CourierMgmt.Payment


SELECT * 
FROM CourierMgmt.Userr;

SELECT * 
FROM CourierMgmt.Courier
WHERE SenderName = 'John Doe';

SELECT * 
FROM CourierMgmt.Courier;

SELECT * 
FROM CourierMgmt.Courier
WHERE TrackingNumber = 'TRK123456';

SELECT * 
FROM CourierMgmt.Courier
WHERE CourierID = 1 AND Status = 'Delivered';

SELECT * 
FROM CourierMgmt.Courier
WHERE Status != 'Delivered';

SELECT * 
FROM CourierMgmt.Courier
WHERE DeliveryDate = CAST(GETDATE() AS DATE);


SELECT * 
FROM CourierMgmt.Courier
WHERE Status = 'In Transit';


SELECT SenderName, COUNT(CourierID) AS TotalPackages
FROM CourierMgmt.Courier
GROUP BY SenderName;


SELECT SenderName, AVG(DATEDIFF(DAY, GETDATE(), DeliveryDate)) AS AvgDeliveryTime
FROM CourierMgmt.Courier
GROUP BY SenderName;



SELECT * 
FROM CourierMgmt.Courier
WHERE Weight BETWEEN 1 AND 3;


SELECT * 
FROM CourierMgmt.Employee
WHERE Name LIKE '%John%';


SELECT C.*
FROM CourierMgmt.Courier C
JOIN CourierMgmt.Payment P ON C.CourierID = P.CourierID
WHERE P.Amount > 50.00;


SELECT E.Name, COUNT(C.CourierID) AS TotalCouriers
FROM CourierMgmt.Employee E
JOIN CourierMgmt.Courier C ON E.EmployeeID = C.CourierID
GROUP BY E.Name;



SELECT L.LocationName, SUM(P.Amount) AS TotalRevenue
FROM CourierMgmt.Location L
JOIN CourierMgmt.Payment P ON L.LocationID = P.LocationID
GROUP BY L.LocationName;


SELECT L.LocationName, COUNT(C.CourierID) AS TotalDeliveries
FROM CourierMgmt.Location L
JOIN CourierMgmt.Courier C ON L.LocationID = C.CourierID
WHERE C.Status = 'Delivered'
GROUP BY L.LocationName;


SELECT TOP 1 SenderName, AVG(DATEDIFF(DAY, GETDATE(), DeliveryDate)) AS AvgDeliveryTime
FROM CourierMgmt.Courier
GROUP BY SenderName
ORDER BY AvgDeliveryTime DESC;


SELECT L.LocationName, SUM(P.Amount) AS TotalPayments
FROM CourierMgmt.Location L
JOIN CourierMgmt.Payment P ON L.LocationID = P.LocationID
GROUP BY L.LocationName
HAVING SUM(P.Amount) < 500;



SELECT L.LocationName, SUM(P.Amount) AS TotalPayments
FROM CourierMgmt.Location L
JOIN CourierMgmt.Payment P ON L.LocationID = P.LocationID
GROUP BY L.LocationName;

SELECT C.*
FROM CourierMgmt.Courier C
JOIN CourierMgmt.Payment P ON C.CourierID = P.CourierID
WHERE P.LocationID = 1 AND P.Amount > 1000;


SELECT C.*
FROM CourierMgmt.Courier C
JOIN CourierMgmt.Payment P ON C.CourierID = P.CourierID
WHERE P.Amount > 1000 AND P.PaymentDate > '2025-03-10';

SELECT L.LocationName, SUM(P.Amount) AS TotalAmount
FROM CourierMgmt.Location L
JOIN CourierMgmt.Payment P ON L.LocationID = P.LocationID
WHERE P.PaymentDate < '2025-03-20'
GROUP BY L.LocationName
HAVING SUM(P.Amount) > 100;


SELECT L.LocationName, SUM(P.Amount) AS TotalAmount
FROM CourierMgmt.Location L
JOIN CourierMgmt.Payment P ON L.LocationID = P.LocationID
GROUP BY L.LocationName;


SELECT P.PaymentID, P.Amount, P.PaymentDate, C.TrackingNumber, C.Status
FROM CourierMgmt.Payment P
JOIN CourierMgmt.Courier C ON P.CourierID = C.CourierID;


SELECT P.PaymentID, P.Amount, P.PaymentDate, L.LocationName, L.Address
FROM CourierMgmt.Payment P
JOIN CourierMgmt.Location L ON P.LocationID = L.LocationID;


SELECT P.PaymentID, P.Amount, P.PaymentDate, C.TrackingNumber, C.Status, L.LocationName
FROM CourierMgmt.Payment P
JOIN CourierMgmt.Courier C ON P.CourierID = C.CourierID
JOIN CourierMgmt.Location L ON P.LocationID = L.LocationID;


SELECT P.PaymentID, P.Amount, C.SenderName, C.ReceiverName, C.Status
FROM CourierMgmt.Payment P
JOIN CourierMgmt.Courier C ON P.CourierID = C.CourierID;


SELECT C.TrackingNumber, SUM(P.Amount) AS TotalPayments
FROM CourierMgmt.Courier C
JOIN CourierMgmt.Payment P ON C.CourierID = P.CourierID
GROUP BY C.TrackingNumber;

SELECT *
FROM CourierMgmt.Payment
WHERE PaymentDate = '2025-03-05';


SELECT P.PaymentID, C.SenderName, C.ReceiverName, C.Weight, C.Status
FROM CourierMgmt.Payment P
JOIN CourierMgmt.Courier C ON P.CourierID = C.CourierID;


SELECT P.PaymentID, P.Amount, L.LocationName, L.Address
FROM CourierMgmt.Payment P
JOIN CourierMgmt.Location L ON P.LocationID = L.LocationID;


SELECT C.TrackingNumber, SUM(P.Amount) AS TotalPayment
FROM CourierMgmt.Courier C
JOIN CourierMgmt.Payment P ON C.CourierID = P.CourierID
GROUP BY C.TrackingNumber;

SELECT *
FROM CourierMgmt.Payment
WHERE PaymentDate BETWEEN '2025-03-01' AND '2025-03-15';


SELECT U.Name, C.TrackingNumber, C.Status
FROM CourierMgmt.Userr U
LEFT JOIN CourierMgmt.Courier C ON U.Name = C.SenderName;


SELECT C.TrackingNumber, S.ServiceName, S.Cost
FROM CourierMgmt.Courier C
LEFT JOIN CourierMgmt.CourierServices S ON C.CourierID = S.ServiceID;

SELECT E.Name, P.PaymentID, P.Amount
FROM CourierMgmt.Employee E
LEFT JOIN CourierMgmt.Payment P ON E.EmployeeID = P.CourierID;

SELECT U.Name, S.ServiceName
FROM CourierMgmt.Userr U
CROSS JOIN CourierMgmt.CourierServices S;


SELECT E.Name, L.LocationName
FROM CourierMgmt.Employee E
CROSS JOIN CourierMgmt.Location L;


SELECT C.TrackingNumber, C.SenderName, C.SenderAddress
FROM CourierMgmt.Courier C;


SELECT C.TrackingNumber, C.ReceiverName, C.ReceiverAddress
FROM CourierMgmt.Courier C;


SELECT C.TrackingNumber, S.ServiceName, S.Cost
FROM CourierMgmt.Courier C
LEFT JOIN CourierMgmt.CourierServices S ON C.CourierID = S.ServiceID;


SELECT E.Name, COUNT(C.CourierID) AS AssignedCouriers
FROM CourierMgmt.Employee E
JOIN CourierMgmt.Courier C ON E.EmployeeID = C.CourierID
GROUP BY E.Name;


SELECT L.LocationName, SUM(P.Amount) AS TotalPayment
FROM CourierMgmt.Location L
JOIN CourierMgmt.Payment P ON L.LocationID = P.LocationID
GROUP BY L.LocationName;

SELECT *
FROM CourierMgmt.Courier
WHERE SenderName = 'John Doe';


SELECT Role, COUNT(EmployeeID) AS TotalEmployees
FROM CourierMgmt.Employee
GROUP BY Role
HAVING COUNT(EmployeeID) > 1;


SELECT P.*
FROM CourierMgmt.Payment P
JOIN CourierMgmt.Courier C ON P.CourierID = C.CourierID
JOIN CourierMgmt.Location L ON P.LocationID = L.LocationID
WHERE L.LocationName = 'New York Hub';


SELECT *
FROM CourierMgmt.Courier
WHERE CAST(SenderAddress AS VARCHAR(MAX)) = '123 Elm St';

SELECT E.Name, COUNT(C.CourierID) AS DeliveredCount
FROM CourierMgmt.Employee E
JOIN CourierMgmt.Courier C ON E.EmployeeID = C.CourierID
WHERE C.Status = 'Delivered'
GROUP BY E.Name;

SELECT C.TrackingNumber, P.Amount, S.Cost
FROM CourierMgmt.Courier C
JOIN CourierMgmt.Payment P ON C.CourierID = P.CourierID
JOIN CourierMgmt.CourierServices S ON C.CourierID = S.ServiceID
WHERE P.Amount > S.Cost;

SELECT *
FROM CourierMgmt.Courier
WHERE Weight > (SELECT AVG(Weight) FROM CourierMgmt.Courier);

SELECT Name
FROM CourierMgmt.Employee
WHERE Salary > (SELECT AVG(Salary) FROM CourierMgmt.Employee);


SELECT SUM(Cost) AS TotalCost
FROM CourierMgmt.CourierServices
WHERE Cost < (SELECT MAX(Cost) FROM CourierMgmt.CourierServices);

SELECT C.*
FROM CourierMgmt.Courier C
WHERE EXISTS (
    SELECT 1
    FROM CourierMgmt.Payment P
    WHERE P.CourierID = C.CourierID
);

SELECT L.LocationName, MAX(P.Amount) AS MaxPayment
FROM CourierMgmt.Location L
JOIN CourierMgmt.Payment P ON L.LocationID = P.LocationID
GROUP BY L.LocationName
HAVING MAX(P.Amount) = (SELECT MAX(Amount) FROM CourierMgmt.Payment);


SELECT *
FROM CourierMgmt.Courier C
WHERE Weight > ALL (
    SELECT Weight
    FROM CourierMgmt.Courier
    WHERE SenderName = 'John Doe'
);

