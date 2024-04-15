--  SISDB
CREATE DATABASE SISDB
USE SISDB
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) NOT NULL
);
CREATE TABLE Courses (
    course_id INT PRIMARY KEY ,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY ,
    student_id INT,
    course_id INT,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY ,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY ,
    student_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Students (student_id,first_name, last_name, date_of_birth, email, phone_number) VALUES
(1,'John', 'Doe', '1995-05-15', 'john.doe@example.com', '123-456-7890'),
(2,'Alice', 'Smith', '1998-10-20', 'alice.smith@example.com', '987-654-3210'),
(3,'Emma', 'Johnson', '1997-07-12', 'emma.johnson@example.com', '456-789-0123'),
(4,'Michael', 'Brown', '1996-02-28', 'michael.brown@example.com', '789-012-3456'),
(5,'Sophia', 'Wilson', '1999-11-03', 'sophia.wilson@example.com', '234-567-8901'),
(6,'James', 'Taylor', '1994-09-25', 'james.taylor@example.com', '567-890-1234'),
(7,'Olivia', 'Anderson', '1998-04-17', 'olivia.anderson@example.com', '890-123-4567'),
(8,'William','Martinez', '1997-01-08', 'william.martinez@example.com','345-678-9012'),
(9,'Ava', 'Garcia', '1996-08-30', 'ava.garcia@example.com', '678-901-2345'),
(10,'Liam', 'Hernandez', '1995-12-10', 'liam.hernandez@example.com', '012-345-6789');
INSERT INTO Courses (course_id, course_name, credits, teacher_id) VALUES
(1,'Computer Science 101', 3, 11),
(2,'Mathematics 201', 4, 12),
(3,'Physics 101', 3, 13),
(4,'English Composition', 3, 14),
(5,'History 101', 3, 15),
(6,'Chemistry 101', 3, 16),
(7,'Biology 101', 3, 17),
(8,'Art Appreciation', 2, 18),
(9,'Music Theory', 2, 19),
(10,'Physical Education', 1, 20);
INSERT INTO Enrollments (enrollment_id,student_id, course_id, enrollment_date) VALUES
(21,1, 1, '2023-01-10'),
(22,2, 2, '2023-01-11'),
(23,3, 3, '2023-01-12'),
(24,4, 4, '2023-01-13'),
(25,5, 5, '2023-01-14'),
(26,6, 6, '2023-01-15'),
(27,7, 7, '2023-01-16'),
(28,8, 8, '2023-01-17'),
(29,9, 9, '2023-01-18'),
(30,10, 10, '2023-01-19');
INSERT INTO Teacher (teacher_id,first_name, last_name, email) VALUES
(11,'Prof. Smith', 'Johnson', 'smith.johnson@example.com'),
(12,'Prof. Emily', 'Davis', 'emily.davis@example.com'),
(13,'Prof. David', 'Miller', 'david.miller@example.com'),
(14,'Prof. Sarah', 'Brown', 'sarah.brown@example.com'),
(15,'Prof. Robert', 'Garcia', 'robert.garcia@example.com'),
(16,'Prof. Maria', 'Martinez', 'maria.martinez@example.com'),
(17,'Prof. Jennifer', 'Lopez', 'jennifer.lopez@example.com'),
(18,'Prof. William', 'Anderson', 'william.anderson@example.com'),
(19,'Prof. Olivia', 'Lee', 'olivia.lee@example.com'),
(20,'Prof. Michael', 'Harris', 'michael.harris@example.com');
INSERT INTO Payments (payment_id,student_id, amount, payment_date) VALUES
(31,1, 500.00, '2023-01-10'),
(32,2, 600.00, '2023-01-11'),
(33,3, 550.00, '2023-01-12'),
(34,4, 700.00, '2023-01-13'),
(35,5, 450.00, '2023-01-14'),
(36,6, 525.00, '2023-01-15'),
(37,7, 480.00, '2023-01-16'),
(38,8, 520.00, '2023-01-17'),
(39,9, 620.00, '2023-01-18'),
(40,10, 400.00, '2023-01-19');
--TASK 2
--1. Write an SQL query to insert a new student into the "Students" table with the following details:
--a. First Name: John
--b. Last Name: Doe
--c. Date of Birth: 1995-08-15
--d. Email: john.doe@example.com
--e. Phone Number: 1234567890
INSERT INTO SISDB.dbo.Students (student_id,first_name, last_name, date_of_birth, email, phone_number)
VALUES (111,'John', 'Smith', '1995-08-15', 'john.smith@example.com', '1234567890');

--2. Write an SQL query to enroll a student in a course. Choose an existing student and course and
--insert a record into the "Enrollments" table with the enrollment date.
INSERT INTO Enrollments (enrollment_id,student_id, course_id, enrollment_date)
VALUES (899,1, 1, '2024-04-10');

--3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and
--modify their email address.
UPDATE Teacher
SET email = 'newemail@example.com'
WHERE teacher_id = 20;

--4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select
--an enrollment record based on the student and course
DELETE FROM Enrollments
WHERE student_id = 2 AND course_id = 2;

--5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and
--teacher from the respective tables.
UPDATE Courses
SET teacher_id = 11
WHERE course_id = 6;

--6. Delete a specific student from the "Students" table and remove all their enrollment records
--from the "Enrollments" table. Be sure to maintain referential integrity
DELETE FROM Enrollments
WHERE student_id =3;
DELETE FROM Payments
WHERE student_id = 3;
DELETE FROM Students
WHERE student_id = 3;

--7. Update the payment amount for a specific payment record in the "Payments" table. Choose any
--payment record and modify the payment amount
UPDATE Payments
SET amount = 750.00
WHERE payment_id = 34;
ALTER TABLE EnrollmentsDROP CONSTRAINT FK_Studentid; ALTER TABLE EnrollmentsADD CONSTRAINT FK_Studentid FOREIGN KEY (student_id) REFERENCES Students(student_id)ON DELETE CASCADE;

--TAST 3
--1. Write an SQL query to calculate the total payments made by a specific student. You will need to
--join the "Payments" table with the "Students" table based on the student's ID
SELECT s.student_id, s.first_name, s.last_name, SUM(p.amount) AS total_payments
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
WHERE s.student_id = 1
GROUP BY s.student_id, s.first_name, s.last_name;

--2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each
--course. Use a JOIN operation between the "Courses" table and the "Enrollments" table
SELECT c.course_id, c.course_name, COUNT(e.student_id) AS enrolled_students
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

--3. Write an SQL query to find the names of students who have not enrolled in any course. Use aLEFT JOIN 
--between the "Students" table and the "Enrollments" table to identify students without enrollments
SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

--4. Write an SQL query to retrieve the first name, last name of students, and the names of the
--courses they are enrolled in. Use JOIN operations between the "Students" table and the
--"Enrollments" and "Courses" tables.
SELECT s.first_name,s.last_name,c.course_name
FROM 
    Students s
JOIN 
    Enrollments e ON s.student_id = e.student_id
JOIN 
    Courses c ON e.course_id = c.course_id;

--5. Create a query to list the names of teachers and the courses they are assigned to. Join the
--"Teacher" table with the "Courses" table.
SELECT 
    t.first_name,t.last_name,c.course_name
FROM 
    Teacher t
JOIN 
    Courses c ON t.teacher_id = c.teacher_id;

--6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the
--"Students" table with the "Enrollments" and "Courses" tables
SELECT s.first_name,s.last_name,e.enrollment_date
FROM 
    Students s
JOIN 
    Enrollments e ON s.student_id = e.student_id
JOIN 
    Courses c ON e.course_id = c.course_id
WHERE 
    c.course_name = 'Chemistry 101';

--7. Find the names of students who have not made any payments. Use a LEFT JOIN between the
--"Students" table and the "Payments" table and filter for students with NULL payment records
SELECT 
    s.first_name,s.last_name
FROM 
    Students s
LEFT JOIN 
    Payments p ON s.student_id = p.student_id
WHERE 
    p.payment_id IS NULL;

--8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN between 
--the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records
SELECT 
    c.course_name
FROM 
    Courses c
LEFT JOIN 
    Enrollments e ON c.course_id = e.course_id
WHERE 
    e.course_id IS NULL;

--9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments"
--table to find students with multiple enrollment records.
SELECT s.student_id,s.first_name,s.last_name
FROM Enrollments e1
JOIN Enrollments e2 ON e1.student_id = e2.student_id
JOIN Students s ON e1.student_id = s.student_id
WHERE e1.course_id <> e2.course_id 
GROUP BY s.student_id, s.first_name, s.last_name
ORDER BY s.student_id;

--10.Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher"
--table and the "Courses" table and filter for teachers with NULL course assignments.
SELECT t.teacher_id,t.first_name,t.last_name
FROM 
    Teacher t
LEFT JOIN 
    Courses c ON t.teacher_id = c.teacher_id
WHERE 
    c.teacher_id IS NULL;

--TASK 4
--1.Write an SQL query to calculate the average number of students enrolled in each course. Use
--aggregate functions and subqueries to achieve this.
SELECT 
    Courses.course_id,
    Courses.course_name,
    (
        SELECT COUNT(Enrollments.enrollment_id)
        FROM Enrollments
        WHERE Enrollments.course_id = courses.course_id
    ) AS average_students_enrolled
FROM 
    Courses;

--2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum
--payment amount and then retrieve the student(s) associated with that amount.
SELECT s.student_id, s.first_name, p.amount
FROM Payments p, Students s
WHERE amount = (
    SELECT MAX(amount)
    FROM Payments
);

--3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the
--course(s) with the maximum enrollment count.
SELECT course_id, course_name
FROM Courses
WHERE course_id IN (
    SELECT course_id
    FROM Enrollments
    GROUP BY course_id
    HAVING COUNT(*) = (
	    SELECT MAX(enrollment_count)FROM (
			SELECT COUNT(*) AS enrollment_count
            FROM Enrollments
            GROUP BY course_id
        ) AS max_enrollments
    )
);

--4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum
--payments for each teacher's courses.
SELECT 
    t.teacher_id,
    t.first_name,
    (
        SELECT SUM(amount)
        FROM Payments
        WHERE Courses.teacher_id = t.teacher_id

    ) AS total_payments
FROM 
    Teacher t, Courses;

--5. Identify students who are enrolled in all available courses. Use subqueries to compare a
--student's enrollments with the total number of courses.
SELECT student_id, first_name
FROM Students
WHERE (
    SELECT COUNT(DISTINCT course_id)
    FROM Enrollments
  ) = (
    SELECT COUNT(DISTINCT course_id)
    FROM Courses
  )
AND student_id IN (
    SELECT student_id
    FROM Enrollments
    GROUP BY student_id
    HAVING COUNT(DISTINCT course_id) = (
        SELECT COUNT(DISTINCT course_id)
        FROM Courses
    )
);

--6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to
--find teachers with no course assignments.
SELECT first_name
FROM Teacher
WHERE teacher_id NOT IN (
    SELECT DISTINCT teacher_id
    FROM Courses
);

--7. Calculate the average age of all students. Use subqueries to calculate the age of each student
--based on their date of birth.
SELECT 
    AVG(age) AS average_age
FROM 
    (
        SELECT 
            DATEDIFF(day,'2024-04-12', date_of_birth )/ 365 AS age
        FROM 
            Students
    ) AS student_ages;

--8. Identify courses with no enrollments. Use subqueries to find courses without enrollment
--records.
SELECT course_id, course_name
FROM Courses
WHERE course_id NOT IN (
    SELECT DISTINCT course_id
    FROM Enrollments
);

--9. Calculate the total payments made by each student for each course they are enrolled in. Use
--subqueries and aggregate functions to sum payments.
SELECT 
    student_id,
    course_id,
    SUM(amount) AS total_payments
FROM 
    (
        SELECT 
            Enrollments.student_id,
            Enrollments.course_id,
            Payments.amount
        FROM 
            Enrollments
        LEFT JOIN 
            Payments ON Enrollments.student_id = Payments.student_id
         LEFT JOIN   Courses   ON Enrollments.course_id = Courses.course_id
    ) AS student_payments
GROUP BY 
    student_id, course_id;

--10. Identify students who have made more than one payment. Use subqueries and aggregate
--functions to count payments per student and filter for those with counts greater than one.
SELECT 
    student_id,
    first_name
FROM 
    Students
WHERE 
    student_id IN (
        SELECT 
            student_id
        FROM 
            Payments
        GROUP BY 
            student_id
        HAVING 
            COUNT(*) > 1
    );

--11. Write an SQL query to calculate the total payments made by each student. Join the "Students" table 
--with the "Payments" table and use GROUP BY to calculate the sum of payments for each student.
SELECT 
    Students.student_id,
    Students.first_name,
    COALESCE(total_payments, 0) AS total_payments
FROM 
    Students
LEFT JOIN 
    (
        SELECT 
            student_id,
            SUM(amount) AS total_payments
        FROM 
            Payments
        GROUP BY 
            student_id
    ) AS PaymentSummary
ON 
    Students.student_id = PaymentSummary.student_id;

--12. Retrieve a list of course names along with the count of students enrolled in each course. Use JOIN 
--operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments.
SELECT 
    Courses.course_name,
    COALESCE(EnrollmentSummary.student_count, 0) AS student_count
FROM 
    Courses
LEFT JOIN 
    (
        SELECT 
            course_id,
            COUNT(*) AS student_count
        FROM 
            Enrollments
        GROUP BY 
            course_id
    ) AS EnrollmentSummary
ON 
    Courses.course_id = EnrollmentSummary.course_id;

--13. Calculate the average payment amount made by students. Use JOIN operations between the
--"Students" table and the "Payments" table and GROUP BY to calculate the average.
SELECT 
    AVG(amount) AS average_amount
FROM 
    Payments
WHERE 
    student_id IN (
        SELECT 
            student_id
        FROM 
            Students
    );
