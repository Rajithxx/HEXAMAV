CREATE SCHEMA SISK;
GO

CREATE TABLE SISK.Students
(
student_id INT IDENTITY(1,1) PRIMARY KEY,
first_name NVARCHAR(50) NOT NULL,
last_name NVARCHAR(50) NOT NULL,
date_of_birth DATE NOT NULL,
email NVARCHAR(100) UNIQUE NOT NULL,
phone_number NVARCHAR(20)
);

CREATE TABLE SISK.Courses 
(
course_id INT IDENTITY(1,1) PRIMARY KEY,
course_name NVARCHAR(100) NOT NULL,
credits INT NOT NULL CHECK (credits > 0),
teacher_id INT NULL
);


CREATE TABLE SISK.Teacher 
(
teacher_id INT IDENTITY(1,1) PRIMARY KEY,
first_name NVARCHAR(50) NOT NULL,
last_name NVARCHAR(50) NOT NULL,
email NVARCHAR(100) UNIQUE NOT NULL
);


CREATE TABLE SISK.Enrollments
(
enrollment_id INT IDENTITY(1,1) PRIMARY KEY,
student_id INT NOT NULL,
course_id INT NOT NULL,
enrollment_date DATE DEFAULT GETDATE(),
FOREIGN KEY (student_id) REFERENCES SISK.Students(student_id) ON DELETE CASCADE,
FOREIGN KEY (course_id) REFERENCES SISK.Courses(course_id) ON DELETE CASCADE
);


CREATE TABLE SISK.Payments 
(
payment_id INT IDENTITY(1,1) PRIMARY KEY,
student_id INT NOT NULL,
amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
payment_date DATE DEFAULT GETDATE(),
FOREIGN KEY (student_id) REFERENCES SISK.Students(student_id) ON DELETE CASCADE
);



INSERT INTO SISK.Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES
('Tom', 'Hardy', '1996-03-21', 'tom.hardy@example.com', '7778889990');

SELECT * FROM SISK.Students;
SELECT * FROM SISK.Teacher;
SELECT * FROM SISK.Courses;
SELECT * FROM SISK.Enrollments;
SELECT * FROM SISK.Payments;

INSERT INTO SISK.Enrollments (student_id, course_id, enrollment_date)
VALUES
(1, 1, GETDATE());

UPDATE SISK.Teacher
SET email = 'sarah.new@example.com'
WHERE teacher_id = 1;

DELETE FROM SISK.Enrollments
WHERE student_id = 1 AND course_id = 1;


UPDATE SISK.Courses
SET teacher_id = 2
WHERE course_id = 1;


DECLARE @student_id INT = 1;

DELETE FROM SISK.Enrollments WHERE student_id = @student_id;
DELETE FROM SISK.Students WHERE student_id = @student_id;

SELECT * FROM SISK.Enrollments;
SELECT * FROM SISK.Students;

UPDATE SISK.Payments
SET amount = 600.00
WHERE payment_id = 2;

SELECT s.first_name, s.last_name, SUM(p.amount) AS TotalPayments
FROM SISK.Students s
JOIN SISK.Payments p ON s.student_id = p.student_id
WHERE s.student_id = 2
GROUP BY s.first_name, s.last_name;


SELECT c.course_name, COUNT(e.enrollment_id) AS TotalEnrollments
FROM SISK.Courses c
LEFT JOIN SISK.Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name
ORDER BY TotalEnrollments DESC;

SELECT s.first_name, s.last_name
FROM SISK.Students s
LEFT JOIN SISK.Enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;


SELECT s.first_name, s.last_name, c.course_name
FROM SISK.Students s
JOIN SISK.Enrollments e ON s.student_id = e.student_id
JOIN SISK.Courses c ON e.course_id = c.course_id;

SELECT t.first_name, t.last_name, c.course_name
FROM SISK.Teacher t
LEFT JOIN SISK.Courses c ON t.teacher_id = c.teacher_id
WHERE c.course_name IS NOT NULL;

SELECT t.first_name, t.last_name, c.course_name
FROM SISK.Teacher t
LEFT JOIN SISK.Courses c ON t.teacher_id = c.teacher_id
WHERE c.course_name IS NOT NULL;

SELECT s.first_name, s.last_name, e.enrollment_date
FROM SISK.Students s
JOIN SISK.Enrollments e ON s.student_id = e.student_id
WHERE e.course_id = 2;


SELECT s.first_name, s.last_name
FROM SISK.Students s
LEFT JOIN SISK.Payments p ON s.student_id = p.student_id
WHERE p.payment_id IS NULL;

SELECT c.course_name
FROM SISK.Courses c
LEFT JOIN SISK.Enrollments e ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL;

SELECT s.first_name, s.last_name, COUNT(e.course_id) AS TotalCourses
FROM SISK.Students s
JOIN SISK.Enrollments e ON s.student_id = e.student_id
GROUP BY s.first_name, s.last_name
HAVING COUNT(e.course_id) > 4;

SELECT t.first_name, t.last_name
FROM SISK.Teacher t
LEFT JOIN SISK.Courses c ON t.teacher_id = c.teacher_id
WHERE c.course_id IS NULL;


SELECT AVG(EnrollmentCount) AS AvgStudentsPerCourse
FROM (
    SELECT course_id, COUNT(enrollment_id) AS EnrollmentCount
    FROM SISK.Enrollments
    GROUP BY course_id
) AS CourseEnrollments;

SELECT s.first_name, s.last_name, p.amount
FROM SISK.Students s
JOIN SISK.Payments p ON s.student_id = p.student_id
WHERE p.amount = (SELECT MAX(amount) FROM SISK.Payments);


SELECT c.course_name, EnrollmentCount
FROM (
    SELECT course_id, COUNT(enrollment_id) AS EnrollmentCount
    FROM SISK.Enrollments
    GROUP BY course_id
) AS CourseEnrollments
JOIN SISK.Courses c ON c.course_id = CourseEnrollments.course_id
WHERE EnrollmentCount = (SELECT MAX(EnrollmentCount) FROM (
                            SELECT COUNT(enrollment_id) AS EnrollmentCount
                            FROM SISK.Enrollments
                            GROUP BY course_id
                        ) AS MaxEnrollments);

SELECT t.first_name, t.last_name, SUM(p.amount) AS TotalPayments
FROM SISK.Teacher t
JOIN SISK.Courses c ON t.teacher_id = c.teacher_id
JOIN SISK.Enrollments e ON c.course_id = e.course_id
JOIN SISK.Payments p ON e.student_id = p.student_id
GROUP BY t.first_name, t.last_name;


SELECT s.first_name, s.last_name
FROM SISK.Students s
WHERE (SELECT COUNT(DISTINCT course_id) FROM SISK.Enrollments WHERE student_id = s.student_id) 
    = (SELECT COUNT(course_id) FROM SISK.Courses);

SELECT first_name, last_name
FROM SISK.Teacher
WHERE teacher_id NOT IN (SELECT DISTINCT teacher_id FROM SISK.Courses WHERE teacher_id IS NOT NULL);

SELECT AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS AvgAge
FROM SISK.Students;

SELECT course_name
FROM SISK.Courses
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM SISK.Enrollments);


SELECT s.first_name, s.last_name, c.course_name, SUM(p.amount) AS TotalPayments
FROM SISK.Students s
JOIN SISK.Enrollments e ON s.student_id = e.student_id
JOIN SISK.Courses c ON e.course_id = c.course_id
JOIN SISK.Payments p ON s.student_id = p.student_id
GROUP BY s.first_name, s.last_name, c.course_name;

SELECT s.first_name, s.last_name, COUNT(p.payment_id) AS PaymentCount
FROM SISK.Students s
JOIN SISK.Payments p ON s.student_id = p.student_id
GROUP BY s.first_name, s.last_name
HAVING COUNT(p.payment_id) >2;


