INSERT INTO SISK.Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES
('John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890'),
('Alice', 'Smith', '1998-05-10', 'alice.smith@example.com', '9876543210'),
('Michael', 'Brown', '2000-03-21', 'michael.brown@example.com', '1122334455'),
('Emma', 'Johnson', '1999-07-08', 'emma.johnson@example.com', '4455667788'),
('Liam', 'Wilson', '1997-12-14', 'liam.wilson@example.com', '7788990011'),
('Olivia', 'Taylor', '1996-11-05', 'olivia.taylor@example.com', '8899001122'),
('Ethan', 'Anderson', '2001-01-23', 'ethan.anderson@example.com', '9911223344'),
('Sophia', 'Thomas', '1994-04-17', 'sophia.thomas@example.com', '1122445566'),
('James', 'Harris', '1993-09-28', 'james.harris@example.com', '2233445566'),
('Mia', 'Martin', '2002-02-12', 'mia.martin@example.com', '3344556677');


INSERT INTO SISK.Teacher (first_name, last_name, email)
VALUES
('Dr. Sarah', 'Smith', 'sarah.smith@example.com'),
('Prof. Michael', 'Johnson', 'michael.johnson@example.com'),
('Dr. Laura', 'Williams', 'laura.williams@example.com'),
('Dr. David', 'Miller', 'david.miller@example.com'),
('Prof. James', 'Moore', 'james.moore@example.com'),
('Dr. Emily', 'Clark', 'emily.clark@example.com'),
('Dr. Daniel', 'Lee', 'daniel.lee@example.com'),
('Prof. Olivia', 'White', 'olivia.white@example.com'),
('Dr. William', 'Hall', 'william.hall@example.com'),
('Prof. Sophia', 'Adams', 'sophia.adams@example.com');


INSERT INTO SISK.Courses (course_name, credits, teacher_id)
VALUES
('Introduction to Programming', 4, 1),
('Mathematics 101', 3, 2),
('Database Systems', 3, 3),
('Web Development', 4, 4),
('Data Science Basics', 5, 5),
('Machine Learning', 4, 6),
('Cybersecurity Essentials', 3, 7),
('Cloud Computing', 3, 8),
('Software Engineering', 4, 9),
('Artificial Intelligence', 5, 10);


INSERT INTO SISK.Enrollments (student_id, course_id, enrollment_date)
VALUES
(1, 1, '2023-09-01'),
(2, 2, '2023-09-05'),
(3, 3, '2023-09-07'),
(4, 4, '2023-09-10'),
(5, 5, '2023-09-12'),
(6, 6, '2023-09-15'),
(7, 7, '2023-09-18'),
(8, 8, '2023-09-20'),
(9, 9, '2023-09-22'),
(10, 10, '2023-09-25');



INSERT INTO SISK.Payments (student_id, amount, payment_date)
VALUES
(1, 500.00, '2023-04-10'),
(2, 300.00, '2023-05-01'),
(3, 700.00, '2023-06-15'),
(4, 450.00, '2023-07-10'),
(5, 600.00, '2023-08-20'),
(6, 550.00, '2023-09-01'),
(7, 650.00, '2023-10-05'),
(8, 750.00, '2023-11-15'),
(9, 400.00, '2023-12-01'),
(10, 500.00, '2024-01-10');

SELECT * FROM SISK.Students;
SELECT * FROM SISK.Teacher;
SELECT * FROM SISK.Courses;
SELECT * FROM SISK.Enrollments;
SELECT * FROM SISK.Payments;


