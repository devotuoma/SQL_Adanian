import sqlite3
from datetime import date
import pandas as pd

# Create/Connect to the database
conn = sqlite3.connect('edu_institute.db')
cursor = conn.cursor()



-- Create table
CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    age INTEGER,
    gender CHAR(1),
    enrollment_date DATE,
    program VARCHAR(50)
);

-- Insert data
INSERT INTO students VALUES (1, 'Alice Johnson', 21, 'F', '2023-08-21', 'Data Science');
INSERT INTO students VALUES (2, 'Brian O\'Neil', 23, 'M', '2023-01-15', 'Computer Science');
INSERT INTO students VALUES (3, 'Chloe Zhang', 20, 'F', '2024-02-20', 'Physics');
INSERT INTO students VALUES (4, 'David Kim', 19, 'M', '2024-03-11', 'Mathematics');
INSERT INTO students VALUES (5, 'Ella Martinez', 22, 'F', '2022-09-10', 'Chemistry');

-- Select Data Science students
SELECT * FROM students WHERE program = 'Data Science';

-- Total number of students
SELECT COUNT(*) AS 'Total Students' FROM students;

-- Today's Date
SELECT DATE('now') AS "Today's Date";

-- Names in uppercase and enrollment date
SELECT UPPER(name) AS name, enrollment_date FROM students;

-- Students count per program
SELECT program, COUNT(*) AS 'Number of Students' FROM students GROUP BY program ORDER BY COUNT(*) DESC;

-- Youngest student's name and age
SELECT name, age FROM students WHERE age = (SELECT MIN(age) FROM students);