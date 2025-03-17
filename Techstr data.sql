INSERT INTO Techshopstr.customers (FirstName, LastName, Email, Phone, Address)
VALUES
('Johnson', 'Nithish', 'johnson.nithish@example.com', '1112223344', '789 Pine Ln'),
('Shyam', 'Anand', 'shyam.anand@example.com', '5556667788', '101 Maple Ave'),
('Rajith', 'Rufus', 'rajith.rufus@example.com', '9990001122', '222 Cedar Rd'),
('Niranjan', 'Sabari', 'niranjan.sabari@example.com', '3334445566', '333 Birch Ct'),
('Rohith', 'Immanuel', 'rohith.immanuel@example.com', '7778889900', '444 Willow Dr'),
('Hariharan', 'Mohan', 'hariharan.mohan@example.com', '4443332211', '555 Redwood Pl'),
('Vaishali', 'Senthil', 'vaishali.senthil@example.com', '8887776655', '666 Spruce St'),
('Vishnu', 'Priya', 'vishnu.priya@example.com', '2221110099', '777 Oakwood Blvd'),
('Aarthi', 'Krishna', 'aarthi.krishna@example.com', '6665554433', '888 Sycamore Way'),
('Vedhavarshni', 'Prabu', 'vedhavarshni.prabu@example.com', '0009998877', '999 Chestnut Ter');


INSERT INTO Techshopstr.Products (ProductName, Description, Price)
VALUES
('Wireless Headphones', 'Noise-cancelling, Bluetooth 5.0', 149.50),
('Smartwatch', 'Fitness tracking, heart rate monitor', 249.00),
('Tablet', '10-inch display, 128GB storage', 399.99),
('External SSD', '1TB, USB 3.2, portable', 119.75),
('Gaming Mouse', 'High precision, customizable RGB', 79.99),
('Mechanical Keyboard', 'Tactile switches, backlit keys', 129.00),
('Portable Speaker', 'Waterproof, long battery life', 89.25),
('Webcam', '1080p, built-in microphone', 59.50),
('Printer', 'Wireless, color inkjet', 199.00),
('Router', 'Dual-band Wi-Fi 6, high speed', 179.99);


INSERT INTO Techshopstr.Orders (customerId, TotalAmount)
VALUES
(3, 125.50),
(1, 349.00),
(5, 78.99),
(2, 1599.00),
(8, 299.95),
(4, 85.00),
(7, 549.99),
(9, 65.75),
(6, 420.00),
(10, 99.50);

INSERT INTO Techshopstr.OrderDetails (OrderID, ProductID, Quantity)
VALUES
(3, 4, 1),
(3, 5, 3),
(4, 6, 2),
(5, 7, 1),
(6, 8, 4),
(7, 9, 1),
(8, 10, 2),
(9, 1, 1),
(10, 2, 3),
(4, 3, 1);


INSERT INTO Techshopstr.Inventory (ProductID, QuantityInStock)
VALUES
(4, 75),
(5, 20),
(6, 40),
(7, 60),
(8, 90),
(9, 150),
(10, 80),
(1, 40),
(2, 25),
(3, 90);
