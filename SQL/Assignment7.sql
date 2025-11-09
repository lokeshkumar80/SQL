
-- -- Assignment 7 -- --

USE UniversityDB;


-- Q1) Find the names of students enrolled in the "Computer Science" department using a subquery. 
 SELECT Name 
 FROM Students 
 WHERE DeptID = ( 
     SELECT DeptID 
     FROM Departments 
     WHERE DeptName = 'Computer Science' 
     );
     
-- Q2) List the names of the top 3 students who achieved the highest marks in the ’Database
-- Management Systems’ course. Display the student’s name and their marks, ordered
--   from highest to lowest

SELECT s.StudentID, s.Name, er.MarksObtained
FROM ExamResults er
JOIN Exams e ON er.ExamID = e.ExamID
JOIN Courses c ON e.CourseID = c.CourseID
JOIN Students s ON s.StudentID = er.StudentID
WHERE c.CourseName = 'Database Systems'
ORDER BY er.MarksObtained DESC
LIMIT 3;
 
-- Q3) Find the students who are staying in hostels where the capacity is greater than 200. Display their 
-- StudentID, RoomNo, and the name of the hostel.
 
 SELECT ha.StudentID, ha.RoomNo, h.HostelName 
 FROM HostelAllotment ha 
 JOIN Hostels h ON ha.HostelID = h.HostelID 
 WHERE h.HostelID IN ( 
     SELECT HostelID 
     FROM Hostels 
     WHERE Capacity > 200 
     );
 
-- Q4) Find the students whose total marks in all exams are higher than the total marks of 
-- every student in ProgramID = 2. 

 SELECT s.StudentID, s.Name 
 FROM Students s 
 WHERE ( 
     SELECT SUM(er.MarksObtained) 
     FROM ExamResults er 
     WHERE er.StudentID = s.StudentID 
 ) > ALL ( 
     SELECT SUM(er2.MarksObtained) 
     FROM ExamResults er2 
     JOIN Students s2 ON er2.StudentID = s2.StudentID 
     WHERE s2.ProgramID = 2 
     GROUP BY er2.StudentID  
     );
     
-- Q5) Write a query to display each student’s StudentID, Name, and their average marks across all 
-- exams, rounded to two decimal places. Additionally, display whether their average mark is an Even or 
-- Odd number.
 
 SELECT s.StudentID, s.Name, ROUND(AVG(er.MarksObtained), 2) AS AvgMarks, 
     CASE  
         WHEN MOD(ROUND(AVG(er.MarksObtained), 0), 2) = 0 THEN 'Even' 
         ELSE 'Odd' 
     END AS AvgMarkType 
 FROM Students s 
 JOIN ExamResults er ON s.StudentID = er.StudentID 
 GROUP BY s.StudentID, s.Name; 
 
-- Q6) Using the Students and Enrollments tables, write a query that classifies students based 
-- on how many courses they are enrolled in. 
-- • If a student is enrolled in 5 or more courses, label them as "Full Load". 
-- • If enrolled in 3 or 4 courses, label them as "Medium Load". 
-- • If enrolled in 1 or 2 courses, label them as "Light Load". 
-- • If a student is not enrolled in any course, label them as "Not Enrolled". 

 SELECT s.StudentID, s.Name, 
 CASE  
         WHEN COUNT(e.CourseID) >= 5 THEN 'Full Load' 
         WHEN COUNT(e.CourseID) BETWEEN 3 AND 4 THEN 'Medium Load' 
         WHEN COUNT(e.CourseID) BETWEEN 1 AND 2 THEN 'Light Load' 
         ELSE 'Not Enrolled' 
     END AS Enrollment_Status 
 FROM Students s 
 LEFT JOIN Enrollments e ON s.StudentID = e.StudentID 
 GROUP BY s.StudentID, s.Name; 
 
-- Q7) Retrieve all faculty members who joined before 2020 and have more than 5 years of 
-- service. Display FacultyID, Name, HireDate, and the number of years they have been 
-- teaching. 

 SELECT f.FacultyID, f.Name, f.HireDate, 
        TIMESTAMPDIFF(YEAR, f.HireDate, CURDATE()) AS YearsOfService 
 FROM Faculty f 
 WHERE f.HireDate < '2020-01-01' 
   AND TIMESTAMPDIFF(YEAR, f.HireDate, CURDATE()) > 5; 
   
-- Q8) Find the students who were born after the year 2000 and who have at least one 
-- attendance record within the last two years. Display their StudentID, Name, and DOB.
 
SELECT DISTINCT s.StudentID, s.Name, s.DOB
FROM Students s
JOIN Attendance a ON s.StudentID = a.StudentID
WHERE YEAR(s.DOB) > 2000
  AND a.S_Marked >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);
         
-- Q9) Write a query to retrieve StudentID, name in uppercase, cleaned address (trimmed of 
-- leading/trailing spaces), the first 10 characters of the address, phone number, and a 
-- modified email where all occurrences of @gmail.com are replaced with @hotmail.com. Only 
-- include students enrolled in programs that offer more than 2 students. Use string functions 
-- such as UPPER(), TRIM(), SUBSTRING(), REPLACE() 

SELECT s.StudentID, UPPER(s.Name) AS UpperName, TRIM(s.Address) AS CleanAddress, SUBSTRING(TRIM(s.Address), 1, 10) AS ShortAddress, s.Phone, REPLACE(s.EmailID, '@university.com', '@hotmail.com') AS ModifiedEmail
FROM Students s
WHERE s.ProgramID IN (
    SELECT p.ProgramID
    FROM Students s2
    JOIN Programs p ON s2.ProgramID = p.ProgramID
    GROUP BY p.ProgramID
    HAVING COUNT(s2.StudentID) > 2
);
 
-- Q10) Write a query to retrieve FacultyID, full name as stored in the database, length of the 
-- full name in characters, email domain (everything after @), and initials of the faculty 
-- member (first letters of first and last name) for faculty members in departments that have 
-- more than 3 faculty. Use string functions such as CHAR_LENGTH(), SUBSTRING(), INSTR(), 
-- LEFT(), and CONCAT(), and include a subquery to filter departments. 

 SELECT f.FacultyID, 
        f.Name AS FullName, 
        CHAR_LENGTH(f.Name) AS NameLength, 
        SUBSTRING(f.Email, INSTR(f.Email, '@') + 1) AS EmailDomain, 
        CONCAT( 
            LEFT(SUBSTRING_INDEX(f.Name, ' ', 1), 1), 
            LEFT(SUBSTRING_INDEX(f.Name, ' ', -1), 1) 
        ) AS Initials 
 FROM Faculty f 
 WHERE f.DeptID IN ( 
     SELECT DeptID 
     FROM Faculty 
     GROUP BY DeptID 
     HAVING COUNT(FacultyID) > 1 
 ); 
 
-- Q11) Write a query to find StudentID, Name, DOB, the number of courses each student is 
-- enrolled in, and their total attendance records for all students who were born after the year 
-- 2000 and have attended at least one class in any of their enrolled courses, using SQL 
-- functions, subqueries, and aggregate functions to calculate the counts. 

 SELECT s.StudentID, s.Name, s.DOB, COALESCE(ec.courses_enrolled, 0) AS courses_enrolled, COALESCE(a.attendance_count, 0) AS attendance_count 
 FROM Students s 
 LEFT JOIN ( 
     SELECT StudentID, COUNT(*) AS attendance_count 
     FROM Attendance 
     GROUP BY StudentID 
 ) a ON a.StudentID = s.StudentID 
 LEFT JOIN ( 
     SELECT StudentID, COUNT(DISTINCT CourseID) AS courses_enrolled 
     FROM Enrollments 
     GROUP BY StudentID 
 ) ec ON ec.StudentID = s.StudentID 
 WHERE YEAR(s.DOB) > 2000 
 AND EXISTS ( 
     SELECT 1 
     FROM Attendance a2 
     WHERE a2.StudentID = s.StudentID 
     );

-- Q12) Write a query to find students who satisfy the following two conditions: 
-- 1. They have fully paid all tuition fees. 
-- 2. Their average marks across all exams are greater than the average marks of students 
-- in at least one other program. 
-- Retrieve the StudentID and Name of such students. Use subqueries and aggregate functions 
-- as needed. 

 SELECT DISTINCT s.StudentID, s.Name 
 FROM Students s 
 WHERE NOT EXISTS ( 
    SELECT * 
     FROM Payments p 
     WHERE p.StudentID = s.StudentID 
       AND p.Payment_Type = 'Tuition' 
       AND p.Payment_Status <> 'Paid' 
 ) 
 AND ( 
     SELECT AVG(er1.MarksObtained) 
     FROM ExamResults er1 
     WHERE er1.StudentID = s.StudentID 
 ) > ( 
     SELECT MIN(t.program_avg) 
     FROM ( 
         SELECT st2.ProgramID, AVG(er2.MarksObtained) AS program_avg 
         FROM Students st2 
         JOIN ExamResults er2 ON st2.StudentID = er2.StudentID 
         GROUP BY st2.ProgramID 
     ) t 
     WHERE t.ProgramID <> s.ProgramID
     );
     
