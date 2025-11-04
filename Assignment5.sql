                                           -- -- Assignment 5 - Advanced SQL Clauses 
                                           
-- Q1. Using DISTINCT

-- USE UniversityDB;

-- 1. Retrieve the list of unique departments from which students are enrolled.

-- SELECT DISTINCT DeptID
-- FROM Students;


-- 2. Find all distinct exam dates scheduled in the database.

-- SELECT DISTINCT ExamDate
-- FROM Exams;

-- Q2. Using LIMIT

-- 1. List the top 5 students with the highest marks in any exam.

-- SELECT s.StudentID, s.Name, er.MarksObtained
-- FROM Students s
-- JOIN ExamResults er ON s.StudentID = er.StudentID
-- ORDER BY er.MarksObtained DESC
-- LIMIT 5;


-- 2. Display the first 10 students admitted to the University (based on AdmissionYear ascending).

-- SELECT StudentID, Name, AdmissionYear
-- FROM Students
-- ORDER BY AdmissionYear ASC
-- LIMIT 10;

-- Q3. Using USING in Joins

-- 1. Display student names and their enrolled courses.

-- SELECT s.Name, c.CourseName
-- FROM Students s
-- JOIN Enrollments e USING (StudentID)
-- JOIN Courses c USING (CourseID);


-- 2. List all books issued along with student names.

-- SELECT s.Name, lb.Title
-- FROM Students s
-- JOIN BookIssues bi USING (StudentID)
-- JOIN LibraryBooks lb USING (BookID); 

-- Q4. Using UNION

-- 1. Retrieve all student names who are either enrolled in Computer Science Dept OR staying in Hostels.

-- SELECT Name
-- FROM Students s
-- JOIN Departments d ON s.DeptID = d.DeptID
-- WHERE d.DeptName = 'Computer Science'
-- UNION
-- SELECT s.Name
-- FROM Students s
-- JOIN HostelAllotment ha ON s.StudentID = ha.StudentID;


-- 2. Combine students and faculty names in one list.

-- SELECT Name, 'Student' AS Role
-- FROM Students
-- UNION
-- SELECT Name, 'Faculty' AS Role
-- FROM Faculty;

-- Q5. Using INTERSECT

-- 1. Students who issued books AND have pending payments.

-- SELECT s.StudentID, s.Name
-- FROM Students s
-- JOIN BookIssues bi ON s.StudentID = bi.StudentID 
-- INTERSECT -- This shows error as INTERSECT is not valid at this position, expecting EOF, ';' 
-- SELECT s.StudentID, s.Name
-- FROM Students s
-- JOIN Payments p ON s.StudentID = p.StudentID
-- WHERE p.Payment_Status = 'Pending';

-- Equivalent of INTERSECT

-- SELECT s.StudentID, s.Name
-- FROM Students s
-- JOIN BookIssues bi ON s.StudentID = bi.StudentID
-- WHERE s.StudentID IN (
--     SELECT p.StudentID
--     FROM Payments p
--     WHERE p.Payment_Status = 'Pending'
-- );



-- 2. Students enrolled in more than one course AND appeared in exams.

-- SELECT e.StudentID
-- FROM Enrollments e
-- GROUP BY e.StudentID
-- HAVING COUNT(DISTINCT e.CourseID) > 1
-- INTERSECT -- This shows error as INTERSECT is not valid at this position, expecting EOF, ';' 
-- SELECT er.StudentID
-- FROM ExamResults er;

-- Equivalent of INTERSECT

-- SELECT DISTINCT er.StudentID
-- FROM (
--     SELECT StudentID
--     FROM Enrollments
--     GROUP BY StudentID
--     HAVING COUNT(DISTINCT CourseID) > 1
-- ) AS multi
-- JOIN ExamResults er ON multi.StudentID = er.StudentID;


-- Q6. Using EXCEPT

-- 1. Students enrolled in courses but never appeared in exams.

-- SELECT s.StudentID, s.Name
-- FROM Students s
-- JOIN Enrollments e ON s.StudentID = e.StudentID
-- EXCEPT -- This shows error as Except is not valid at this position, expecting EOF, ';' 
-- SELECT s.StudentID, s.Name
-- FROM Students s
-- JOIN ExamResults er ON s.StudentID = er.StudentID;

-- Equivalent Of EXCEPT

-- SELECT s.StudentID, s.Name
-- FROM Students s
-- JOIN Enrollments e ON s.StudentID = e.StudentID
-- WHERE s.StudentID NOT IN (
--     SELECT er.StudentID
--     FROM ExamResults er
-- );

-- 2. Students who never stayed in any hostel.

-- SELECT StudentID, Name
-- FROM Students
-- EXCEPT -- This shows error as Except is not valid at this position, expecting EOF, ';' 
-- SELECT s.StudentID, s.Name
-- FROM Students s
-- JOIN HostelAllotment ha ON s.StudentID = ha.StudentID;

-- Equivalent of EXCEPT

-- SELECT StudentID, Name
-- FROM Students
-- WHERE StudentID NOT IN (
--     SELECT ha.StudentID
--     FROM HostelAllotment ha
-- );


-- Q7. Using WITH (CTE – Common Table Expressions)

-- 1. Average marks per department, then select the department(s) with highest average.

-- WITH DeptAvg AS (
--     SELECT d.DeptName, AVG(er.MarksObtained) AS AvgMarks
--     FROM Students s
--     JOIN Departments d ON s.DeptID = d.DeptID
--     JOIN ExamResults er ON s.StudentID = er.StudentID
--     GROUP BY d.DeptName
-- )
-- SELECT *
-- FROM DeptAvg
-- WHERE AvgMarks = (SELECT MAX(AvgMarks) FROM DeptAvg);


-- 2. Students with total fees paid > 50,000.

-- WITH FeeTotals AS (
--     SELECT p.StudentID, SUM(p.Amount) AS TotalPaid
--     FROM Payments p
--     WHERE p.Payment_Status = 'Paid'
--     GROUP BY p.StudentID
-- )
-- SELECT s.StudentID, s.Name, f.TotalPaid
-- FROM Students s
-- JOIN FeeTotals f ON s.StudentID = f.StudentID
-- WHERE f.TotalPaid > 50000;

-- Q8. Using MERGE (UPSERT)

-- 1. Merge new student fee payment data into the Payments table.

--                   -- Here MySQL doesn’t support MERGE (that’s an Oracle / SQL Server feature). 
					 -- To achieve the same result in -- MySQL, you should use INSERT ... ON DUPLICATE KEY UPDATE or INSERT ... ON DUPLICATE KEY UPDATE + unique constraints on (StudentID, Payment_Type)
-- MERGE Payments p  
-- USING (SELECT 1001 AS StudentID, 2000 AS Amount, 
--               '2024-04-01' AS Payment_Date,
--               'Tuition' AS Payment_Type, 
--               'Paid' AS Payment_Status) AS new_data
-- ON (p.StudentID = new_data.StudentID AND p.Payment_Type = new_data.Payment_Type)
-- WHEN MATCHED THEN
--      UPDATE SET Amount = p.Amount + new_data.Amount, Payment_Status = 'Paid'
-- WHEN NOT MATCHED THEN
--      INSERT (PaymentID, StudentID, Amount, Payment_Date, Payment_Type, Payment_Status)
--      VALUES (101, new_data.StudentID, new_data.Amount, new_data.Payment_Date,
--              new_data.Payment_Type, new_data.Payment_Status);

-- Equivalent 

-- Step 1: Ensure Unique Constraint
-- ALTER TABLE Payments
-- ADD UNIQUE KEY uq_payment (StudentID, Payment_Type);

-- Step 2: Equivalent MySQL UPSERT
-- INSERT INTO Payments (PaymentID, StudentID, Amount, Payment_Date, Payment_Type, Payment_Status) VALUES 
-- (101, 1001, 2000, '2024-04-01', 'Tuition', 'Paid') AS new_data
-- ON DUPLICATE KEY UPDATE
--     Amount = Payments.Amount + new_data.Amount,
--     Payment_Status = new_data.Payment_Status;