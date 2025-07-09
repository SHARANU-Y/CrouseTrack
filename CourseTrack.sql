CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    email VARCHAR(100) UNIQUE
);
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT
);
CREATE TABLE Enrollments (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    marks INT CHECK (marks >= 0 AND marks <= 100),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
INSERT INTO Students VALUES (1, 'Aarav Kumar', 'CSE', 'aarav@example.com');
INSERT INTO Students VALUES (2, 'Meera Sharma', 'ISE', 'meera@example.com');
INSERT INTO Students VALUES (3, 'Rahul Reddy', 'ECE', 'rahul@example.com');

INSERT INTO Courses VALUES (101, 'Data Structures', 4);
INSERT INTO Courses VALUES (102, 'Database Systems', 3);
INSERT INTO Courses VALUES (103, 'Operating Systems', 4);

INSERT INTO Enrollments VALUES (1001, 1, 101, 85);
INSERT INTO Enrollments VALUES (1002, 1, 102, 90);
INSERT INTO Enrollments VALUES (1003, 2, 101, 88);
INSERT INTO Enrollments VALUES (1004, 2, 103, 70);
INSERT INTO Enrollments VALUES (1005, 3, 102, 95);
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;
SELECT s.name AS student_name, c.course_name, e.marks
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;
SELECT c.course_name, AVG(e.marks) AS average_marks
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;
