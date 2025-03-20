CREATE SCHEMA BankSystem;
GO


CREATE TABLE BankSystem.Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50)
);


CREATE TABLE BankSystem.Accounts (
    AccountNumber INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES BankSystem.Customers(CustomerID)
);



CREATE TABLE BankSystem.TransactionDetails (
    TransactionID INT PRIMARY KEY,
    AccountNumber INT,
    TransactionType VARCHAR(50),
    Amount DECIMAL(10, 2),
    TransactionDate DATE,
    FOREIGN KEY (AccountNumber) REFERENCES BankSystem.Accounts(AccountNumber)
);


select * from  BankSystem.Customers
select * from  BankSystem.Accounts
select * from  BankSystem.TransactionDetails


SELECT FirstName + ' ' + LastName AS FullName, AccountType, Email
FROM BankSystem.Customers C
JOIN BankSystem.Accounts A ON C.CustomerID = A.CustomerID;

SELECT C.FirstName + ' ' + C.LastName AS FullName, T.TransactionType, T.Amount, T.TransactionDate
FROM BankSystem.Customers C
JOIN BankSystem.Accounts A ON C.CustomerID = A.CustomerID
JOIN BankSystem.TransactionDetails T ON A.AccountNumber = T.AccountNumber;


SELECT CustomerID, FirstName + ' ' + LastName AS FullName
FROM BankSystem.Customers;

SELECT * 
FROM BankSystem.Customers
WHERE City = 'New York';

SELECT Balance
FROM BankSystem.Accounts
WHERE AccountNumber = 101;

SELECT *
FROM BankSystem.Accounts
WHERE AccountType = 'Current' AND Balance > 1000;


SELECT *
FROM BankSystem.TransactionDetails
WHERE AccountNumber = 101;

SELECT AccountNumber, Balance * 0.05 AS InterestAccrued
FROM BankSystem.Accounts
WHERE AccountType = 'Savings';

SELECT *
FROM BankSystem.Accounts
WHERE Balance < 500;


SELECT *
FROM BankSystem.Customers
WHERE City <> 'New York';


SELECT AVG(Balance) AS AverageBalance
FROM BankSystem.Accounts;


SELECT TOP 10 *
FROM BankSystem.Accounts
ORDER BY Balance DESC;


SELECT SUM(Amount) AS TotalDeposits
FROM BankSystem.TransactionDetails
WHERE TransactionType = 'Deposit' AND TransactionDate = '2025-03-01';


SELECT TOP 1 * FROM BankSystem.Customers ORDER BY CustomerID ASC; -- Oldest
SELECT TOP 1 * FROM BankSystem.Customers ORDER BY CustomerID DESC; -- Newest


SELECT T.*, A.AccountType
FROM BankSystem.TransactionDetails T
JOIN BankSystem.Accounts A ON T.AccountNumber = A.AccountNumber;


SELECT C.FirstName + ' ' + C.LastName AS FullName, A.*
FROM BankSystem.Customers C
JOIN BankSystem.Accounts A ON C.CustomerID = A.CustomerID;


SELECT C.FirstName + ' ' + C.LastName AS FullName, T.*
FROM BankSystem.Customers C
JOIN BankSystem.Accounts A ON C.CustomerID = A.CustomerID
JOIN BankSystem.TransactionDetails T ON A.AccountNumber = T.AccountNumber
WHERE A.AccountNumber = 101;


SELECT CustomerID, COUNT(AccountNumber) AS AccountCount
FROM BankSystem.Accounts
GROUP BY CustomerID
HAVING COUNT(AccountNumber) > 1;


SELECT AccountNumber,
       SUM(CASE WHEN TransactionType = 'Deposit' THEN Amount ELSE 0 END) -
       SUM(CASE WHEN TransactionType = 'Withdrawal' THEN Amount ELSE 0 END) AS BalanceDifference
FROM BankSystem.TransactionDetails
GROUP BY AccountNumber;


SELECT AccountNumber, AVG(Balance) AS AvgDailyBalance
FROM BankSystem.Accounts
GROUP BY AccountNumber;


SELECT C.*
FROM BankSystem.Customers C
JOIN BankSystem.Accounts A ON C.CustomerID = A.CustomerID
WHERE A.Balance = (SELECT MAX(Balance) FROM BankSystem.Accounts);

SELECT C.CustomerID, AVG(A.Balance) AS AvgBalance
FROM BankSystem.Customers C
JOIN BankSystem.Accounts A ON C.CustomerID = A.CustomerID
GROUP BY C.CustomerID
HAVING COUNT(A.AccountNumber) > 1;


SELECT *
FROM BankSystem.TransactionDetails
WHERE Amount > (SELECT AVG(Amount) FROM BankSystem.TransactionDetails);


SELECT C.*
FROM BankSystem.Customers C
WHERE C.CustomerID NOT IN (
    SELECT A.CustomerID
    FROM BankSystem.Accounts A
    JOIN BankSystem.TransactionDetails T ON A.AccountNumber = T.AccountNumber
);


SELECT SUM(Balance) AS TotalBalance
FROM BankSystem.Accounts A
WHERE NOT EXISTS (
    SELECT 1
    FROM BankSystem.TransactionDetails T
    WHERE A.AccountNumber = T.AccountNumber
);


SELECT T.*
FROM BankSystem.TransactionDetails T
WHERE T.AccountNumber = (
    SELECT TOP 1 AccountNumber
    FROM BankSystem.Accounts
    ORDER BY Balance ASC
);


SELECT CustomerID
FROM BankSystem.Accounts
GROUP BY CustomerID
HAVING COUNT(DISTINCT AccountType) > 1;


SELECT AccountType, 
       COUNT(*) * 100.0 / (SELECT COUNT(*) FROM BankSystem.Accounts) AS Percentage
FROM BankSystem.Accounts
GROUP BY AccountType;

SELECT T.*
FROM BankSystem.TransactionDetails T
JOIN BankSystem.Accounts A ON T.AccountNumber = A.AccountNumber
WHERE A.CustomerID = 1;



SELECT AccountType, 
       (SELECT SUM(Balance) 
        FROM BankSystem.Accounts A2
        WHERE A2.AccountType = A1.AccountType) AS TotalBalance
FROM BankSystem.Accounts A1
GROUP BY AccountType;

UPDATE BankSystem.Accounts
SET Balance = Balance + 1000
WHERE AccountNumber = 101;

select * from BankSystem.Accounts


DELETE FROM BankSystem.Accounts
WHERE Balance = 0 AND AccountType = 'Savings';






