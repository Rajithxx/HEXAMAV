INSERT INTO BankSystem.Customers
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '9876543210', '123 Street', 'New York'),
(2, 'Alice', 'Smith', 'alice.smith@example.com', '8765432109', '456 Lane', 'Chicago'),
(3, 'Bob', 'Johnson', 'bob.johnson@example.com', '7654321098', '789 Avenue', 'Los Angeles'),
(4, 'Eve', 'Williams', 'eve.williams@example.com', '6543210987', '567 Boulevard', 'Houston'),
(5, 'Mike', 'Brown', 'mike.brown@example.com', '5432109876', '345 Street', 'Phoenix'),
(6, 'Emma', 'Jones', 'emma.jones@example.com', '4321098765', '789 Square', 'Dallas'),
(7, 'Liam', 'Miller', 'liam.miller@example.com', '3210987654', '901 Lane', 'Austin'),
(8, 'Sophia', 'Davis', 'sophia.davis@example.com', '2109876543', '102 Highway', 'San Diego'),
(9, 'Olivia', 'Moore', 'olivia.moore@example.com', '1098765432', '203 Street', 'Seattle'),
(10, 'Noah', 'Taylor', 'noah.taylor@example.com', '0987654321', '304 Avenue', 'Miami');



INSERT INTO BankSystem.Accounts
VALUES
(101, 1, 'Savings', 5000.00),
(102, 2, 'Current', 1500.00),
(103, 3, 'Savings', 2000.00),
(104, 4, 'Savings', 3000.00),
(105, 5, 'Current', 4500.00),
(106, 6, 'Savings', 3500.00),
(107, 7, 'Current', 1200.00),
(108, 8, 'Savings', 1000.00),
(109, 9, 'Current', 7500.00),
(110, 10, 'Savings', 2500.00);


INSERT INTO BankSystem.TransactionDetails
VALUES
(1, 101, 'Deposit', 1000.00, '2025-03-01'),
(2, 102, 'Withdrawal', 500.00, '2025-03-02'),
(3, 103, 'Deposit', 200.00, '2025-03-03'),
(4, 104, 'Deposit', 500.00, '2025-03-04'),
(5, 105, 'Withdrawal', 1000.00, '2025-03-05'),
(6, 106, 'Deposit', 300.00, '2025-03-06'),
(7, 107, 'Withdrawal', 200.00, '2025-03-07'),
(8, 108, 'Deposit', 150.00, '2025-03-08'),
(9, 109, 'Deposit', 800.00, '2025-03-09'),
(10, 110, 'Withdrawal', 400.00, '2025-03-10');

