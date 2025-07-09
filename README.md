# CourseTrack – SQL Mini Project 📊

**CourseTrack** is a mini SQL-based project designed to manage student enrollments, courses, and performance tracking using a relational database structure. It showcases practical implementation of relational design principles, normalization, and SQL querying including joins and aggregations.

---

## 📌 Project Features

- Structured **relational database design** with 3 key tables: `Students`, `Courses`, and `Enrollments`
- Uses **primary keys**, **foreign key constraints**, and **CHECK conditions** to maintain data integrity
- Sample data entries for testing and demonstration
- Optimized SQL queries for:
  - Listing enrollments with student and course details
  - Calculating **average marks** per course
  - Fetching complete student records
- Queries for `JOIN`, `GROUP BY`, `AGGREGATE FUNCTIONS`, and **subqueries**

---

## 🛠️ Technologies Used

- **Database**: MySQL (also compatible with SQL Server or PostgreSQL)
- **Language**: SQL (DDL & DML)
- **Platform**: [OneCompiler](https://onecompiler.com/mysql) or MySQL Workbench

---

## 🧱 Database Schema

### `Students`  
| Field       | Type         |
|-------------|--------------|
| student_id  | INT (PK)     |
| name        | VARCHAR(100) |
| department  | VARCHAR(50)  |
| email       | VARCHAR(100) |

### `Courses`  
| Field       | Type         |
|-------------|--------------|
| course_id   | INT (PK)     |
| course_name | VARCHAR(100) |
| credits     | INT          |

### `Enrollments`  
| Field       | Type         |
|-------------|--------------|
| enroll_id   | INT (PK)     |
| student_id  | INT (FK)     |
| course_id   | INT (FK)     |
| marks       | INT (0–100)  |

---

## 📥 Sample SQL Queries

### 1. View Enrollments with Student & Course Info
```sql
SELECT s.name AS student_name, c.course_name, e.marks
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

2. Get Average Marks by Course
SELECT c.course_name, AVG(e.marks) AS average_marks
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

3. Top 3 Students by Average Marks
SELECT s.name, AVG(e.marks) AS avg_score
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id
ORDER BY avg_score DESC
LIMIT 3;
