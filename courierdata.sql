INSERT INTO CourierMgmt.Userr (Name, Email, Password, ContactNumber, Address)
VALUES
('John Doe', 'john.doe@example.com', 'password123', '9876543210', '123 Elm St, New York'),
('Alice Smith', 'alice.smith@example.com', 'alice123', '8765432109', '456 Oak St, Chicago'),
('Michael Brown', 'michael.brown@example.com', 'mike2024', '7654321098', '789 Pine St, Los Angeles'),
('Eve Williams', 'eve.williams@example.com', 'evepass', '6543210987', '567 Maple Ave, Houston'),
('David Wilson', 'david.wilson@example.com', 'david2025', '5432109876', '345 Cedar Rd, Phoenix'),
('Laura Moore', 'laura.moore@example.com', 'laura2023', '9876543211', '789 Elm St, Miami'),
('Kevin Harris', 'kevin.harris@example.com', 'kevinpass', '8765432100', '456 Pine St, Dallas'),
('Sophia Lewis', 'sophia.lewis@example.com', 'sophia123', '7654321099', '567 Oak Ave, Austin'),
('James Taylor', 'james.taylor@example.com', 'jamespass', '6543210988', '345 Birch Ct, Seattle'),
('Olivia Martin', 'olivia.martin@example.com', 'olivia2025', '5432109877', '102 Redwood Dr, San Diego');

INSERT INTO CourierMgmt.Courier (SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate)
VALUES
('John Doe', '123 Elm St', 'Alice Smith', '456 Oak St', 2.50, 'Delivered', 'TRK123456', '2025-03-01'),
('Michael Brown', '789 Pine St', 'Eve Williams', '567 Maple Ave', 1.80, 'In Transit', 'TRK654321', '2025-03-05'),
('David Wilson', '345 Cedar Rd', 'Sophia Lewis', '567 Oak Ave', 3.00, 'Pending', 'TRK987654', '2025-03-10'),
('Alice Smith', '456 Oak St', 'Kevin Harris', '456 Pine St', 1.20, 'Delivered', 'TRK567890', '2025-03-15'),
('Eve Williams', '567 Maple Ave', 'John Doe', '123 Elm St', 2.00, 'Delivered', 'TRK112233', '2025-03-20'),
('Laura Moore', '789 Elm St', 'James Taylor', '345 Birch Ct', 1.90, 'In Transit', 'TRK445566', '2025-03-12'),
('Kevin Harris', '456 Pine St', 'Olivia Martin', '102 Redwood Dr', 2.75, 'Pending', 'TRK998877', '2025-03-18'),
('Sophia Lewis', '567 Oak Ave', 'Michael Brown', '789 Pine St', 3.50, 'Delivered', 'TRK776655', '2025-03-22'),
('James Taylor', '345 Birch Ct', 'Laura Moore', '789 Elm St', 0.75, 'Delivered', 'TRK554433', '2025-03-25'),
('Olivia Martin', '102 Redwood Dr', 'David Wilson', '345 Cedar Rd', 2.60, 'In Transit', 'TRK443322', '2025-03-28');


INSERT INTO CourierMgmt.CourierServices (ServiceName, Cost)
VALUES
('Standard Delivery', 20.00),
('Express Delivery', 50.00),
('Same-Day Delivery', 100.00),
('International Delivery', 200.00),
('Overnight Delivery', 150.00),
('Two-Day Delivery', 80.00),
('Fragile Items Delivery', 120.00),
('Document Delivery', 30.00),
('Heavy Items Delivery', 250.00),
('Temperature Controlled Delivery', 180.00);


INSERT INTO CourierMgmt.Employee (Name, Email, ContactNumber, Role, Salary)
VALUES
('Alice Johnson', 'alice.j@example.com', '1234567890', 'Manager', 75000.00),
('Bob Williams', 'bob.w@example.com', '2345678901', 'Delivery Boy', 35000.00),
('Charlie Davis', 'charlie.d@example.com', '3456789012', 'Customer Support', 40000.00),
('Diana Miller', 'diana.m@example.com', '4567890123', 'Supervisor', 60000.00),
('Ethan Wilson', 'ethan.w@example.com', '5678901234', 'Dispatcher', 45000.00),
('Fiona Lewis', 'fiona.l@example.com', '6789012345', 'Delivery Boy', 36000.00),
('George Smith', 'george.s@example.com', '7890123456', 'Manager', 77000.00),
('Hannah Moore', 'hannah.m@example.com', '8901234567', 'Supervisor', 62000.00),
('Ian Taylor', 'ian.t@example.com', '9012345678', 'Customer Support', 38000.00),
('Jack White', 'jack.w@example.com', '0123456789', 'Dispatcher', 44000.00);


INSERT INTO CourierMgmt.Location (LocationName, Address)
VALUES
('New York Hub', '123 Elm St, New York'),
('Chicago Hub', '456 Oak St, Chicago'),
('Los Angeles Hub', '789 Pine St, Los Angeles'),
('Houston Hub', '567 Maple Ave, Houston'),
('Phoenix Hub', '345 Cedar Rd, Phoenix'),
('Miami Hub', '789 Elm St, Miami'),
('Dallas Hub', '456 Pine St, Dallas'),
('Austin Hub', '567 Oak Ave, Austin'),
('Seattle Hub', '345 Birch Ct, Seattle'),
('San Diego Hub', '102 Redwood Dr, San Diego');


INSERT INTO CourierMgmt.Payment (CourierID, LocationID, Amount, PaymentDate)
VALUES
(1, 1, 50.00, '2025-03-01'),
(2, 2, 100.00, '2025-03-05'),
(3, 3, 200.00, '2025-03-10'),
(4, 4, 75.00, '2025-03-15'),
(5, 5, 150.00, '2025-03-20'),
(6, 6, 120.00, '2025-03-12'),
(7, 7, 130.00, '2025-03-18'),
(8, 8, 80.00, '2025-03-22'),
(9, 9, 60.00, '2025-03-25'),
(10, 10, 110.00, '2025-03-28');

