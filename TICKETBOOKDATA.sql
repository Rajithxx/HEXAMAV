-- Insert into Venue table
SET IDENTITY_INSERT Venue ON;

INSERT INTO Venue (venue_name, address) VALUES
('Chennai Grand Arena', 'Anna Salai, Chennai'),
('Mumbai Dome', 'Worli, Mumbai'),
('Delhi Stage Plaza', 'Connaught Place, Delhi'),
('Bangalore Star Hall', 'MG Road, Bangalore'),
('Hyderabad Live Center', 'Banjara Hills, Hyderabad'),
('Kolkata Arts Theatre', 'Park Street, Kolkata'),
('Pune Convention Center', 'Shivajinagar, Pune'),
('Ahmedabad Melody Grounds', 'Navrangpura, Ahmedabad'),
('Jaipur Raj Mandapam', 'MI Road, Jaipur'),
('Lucknow Heritage Hall', 'Hazratganj, Lucknow');


SET IDENTITY_INSERT Venue OFF;

-- Insert into Event table
SET IDENTITY_INSERT Event ON;

INSERT INTO Event (event_id, event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type, booking_id) VALUES
(1, 'Concert A', '2025-05-01', '19:00:00', 1, 5000, 5000, 1500, 'Concert', NULL),
(2, 'Movie B', '2025-05-02', '20:00:00', 2, 1000, 800, 1200, 'Movie', NULL),
(3, 'Play C', '2025-05-03', '18:00:00', 3, 1500, 1500, 1000, 'Play', NULL),
(4, 'Concert D', '2025-06-01', '20:30:00', 4, 3000, 2800, 1800, 'Concert', NULL),
(5, 'Sports Event E', '2025-06-10', '17:00:00', 5, 20000, 20000, 2000, 'Sports', NULL),
(6, 'Movie F', '2025-07-01', '21:00:00', 6, 2500, 2400, 1100, 'Movie', NULL),
(7, 'Concert G', '2025-07-15', '19:30:00', 7, 5000, 5000, 2200, 'Concert', NULL),
(8, 'Play H', '2025-08-01', '18:30:00', 8, 1500, 1300, 900, 'Play', NULL),
(9, 'Movie I', '2025-08-20', '20:15:00', 9, 2000, 1800, 950, 'Movie', NULL),
(10, 'Sports Event J', '2025-09-01', '16:00:00', 10, 25000, 24000, 2500, 'Sports', NULL);

SET IDENTITY_INSERT Event OFF;

-- Insert into Customer table
SET IDENTITY_INSERT Customer ON;

INSERT INTO Customer (customer_id, customer_name, email, phone_number, booking_id) VALUES
(1, 'John Doe', 'john@example.com', '9876540001', NULL),
(2, 'Alice Smith', 'alice@example.com', '9876540002', NULL),
(3, 'Bob Johnson', 'bob@example.com', '9876540003', NULL),
(4, 'Charlie Brown', 'charlie@example.com', '9876540004', NULL),
(5, 'David Williams', 'david@example.com', '9876540005', NULL),
(6, 'Eva Clark', 'eva@example.com', '9876540006', NULL),
(7, 'Frank Hall', 'frank@example.com', '9876540007', NULL),
(8, 'Grace Taylor', 'grace@example.com', '9876540008', NULL),
(9, 'Henry Moore', 'henry@example.com', '9876540009', NULL),
(10, 'Ivy Wilson', 'ivy@example.com', '9876540010', NULL);

SET IDENTITY_INSERT Customer OFF;

-- Insert into Booking table
SET IDENTITY_INSERT Booking ON;

INSERT INTO Booking (booking_id, customer_id, event_id, num_tickets, total_cost, booking_date) VALUES
(1, 1, 1, 2, 3000, '2025-05-01'),
(2, 2, 2, 1, 1200, '2025-05-02'),
(3, 3, 3, 3, 3000, '2025-05-03'),
(4, 4, 4, 4, 7200, '2025-06-01'),
(5, 5, 5, 5, 10000, '2025-06-10'),
(6, 6, 6, 2, 2200, '2025-07-01'),
(7, 7, 7, 1, 2200, '2025-07-15'),
(8, 8, 8, 3, 2700, '2025-08-01'),
(9, 9, 9, 2, 1900, '2025-08-20'),
(10, 10, 10, 6, 15000, '2025-09-01');

SET IDENTITY_INSERT Booking OFF;



ALTER TABLE Event DROP CONSTRAINT CK__Event__event_typ__412EB0B6;

ALTER TABLE Event
ADD CONSTRAINT CK_Event_event_type
CHECK (event_type IN ('Movie', 'Sports', 'Concert', 'Play'));
