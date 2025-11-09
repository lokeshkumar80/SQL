
                                                 -- -- Assignment 4 


/*Question - 01 */ -- Grouping, Ordering, Aggregates

USE UniversityDB;

-- -- 1. Group by Age and count students in each age group, ordering by count in descending order.
SELECT YEAR(CURDATE())- YEAR(dob) AS age, COUNT(*) AS student_count
FROM students
GROUP BY age
ORDER BY student_count DESC;

-- -- 2. Group by Department, calculate the maximum score for each department, and order by maximum score in descending order.
SELECT d.deptname, MAX(er.marksobtained) AS max_score
FROM students s
JOIN departments d ON s.deptid = d.deptid
JOIN examresults er ON s.studentid = er.studentid
GROUP BY d.deptname
ORDER BY max_score DESC;

-- -- 3. Group by Gender, calculate the average age for each gender, and order by average age in ascending order.
SELECT gender, AVG(YEAR(CURDATE())- YEAR(dob)) AS avg_age
FROM students
GROUP BY gender
ORDER BY avg_age ASC;

/*Question - 02 */  -- Arithmetic and Comparison Operators

 -- -- 1. Retrieve students with a score greater than or equal to 90.
 SELECT s.studentid, s.name, er.marksobtained
 FROM students s
 JOIN examresults er ON s.studentid = er.
 studentid
 WHERE er.marksobtained >= 90;
 
 -- -- 2. Retrieve students in Department1 with scores above 80.
 SELECT s.studentid, s.name, d.deptname, er.marksobtained
 FROM students s
 JOIN departments d ON s.deptid = d.deptid
 JOIN examresults er ON s.studentid = er.studentid
 WHERE d.deptname = 'MNC' AND er.marksobtained > 80;
 
 -- -- 3. Retrieve students between the ages of 20 and 25.
 SELECT studentid, name, YEAR(CURDATE())- YEAR(dob) AS age
 FROM students
 WHERE YEAR(CURDATE())- YEAR(dob) BETWEEN 20 AND 25;
 
 -- -- 4. Retrieve students with a score less than or equal to 60.
 SELECT s.studentid, s.name, er.marksobtained
 FROM students s
 JOIN examresults er ON s.studentid = er.studentid
 WHERE er.marksobtained <= 60;
 
 -- -- 5. Retrieve students not named “your name”.
 SELECT studentid, name
 FROM students
 WHERE name <> 'Rahul';
 
 
-- -- Question 3: Logical Operators


 -- -- 1. Retrieve students who are both older than 18 and have a score greater than 90.
 SELECT s.studentid, s.name, er.marksobtained
 FROM students s
 JOIN examresults er ON s.studentid = er.studentid
 WHERE (YEAR(CURDATE())- YEAR(dob)) > 18 AND er.marksobtained > 90;
 
 -- -- 2. Retrieve students who are either older than 25 or have a score greater than 95.
 SELECT s.studentid, s.name, er.marksobtained
 FROM students s
 JOIN examresults er ON s.studentid = er.studentid
 WHERE (YEAR(CURDATE())- YEAR(dob)) > 25 OR er.marksobtained > 95;
 
 -- -- 3. Retrieve students who have a score greater than 80 and are not older than 25.
 SELECT s.studentid, s.name, er.marksobtained
 FROM students s
 JOIN examresults er ON s.studentid = er.studentid
 WHERE er.marksobtained > 80 AND (YEAR(CURDATE())- YEAR(dob)) <= 25;
 
 -- -- 4. Retrieve students whose name starts with “first letter of your name”.
 SELECT studentid, name
 FROM students
 WHERE name LIKE 'R%';
 
 -- -- 5. Retrieve students who have scores between 70 and 90 (inclusive).
 SELECT s.studentid, s.name, er.marksobtained
 FROM students s
 JOIN examresults er ON s.studentid = er.studentid
 WHERE er.marksobtained BETWEEN 70 AND 90;
 
-- -- 6. Retrieve students who have no assigned department.
 SELECT studentid, name
 FROM students
 WHERE deptid IS NULL;
 
 -- -- 7. Retrieve students who belong to a department.
 SELECT studentid, name, deptid
 FROM students
 WHERE deptid IS NOT NULL