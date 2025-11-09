
-- -- Assignment 6 -- --

USE UniversityDB;

-- 1. Inner Join 

--  Write a query to list all students along with their department name using INNER 
-- JOIN. (Columns: StudentID, Name, DeptName) 

SELECT s.StudentID, s.Name, d.DeptName
FROM Students s
INNER JOIN Departments d ON s.DeptID = d.DeptID;


--  List all courses along with the faculty name who teaches them (using 
-- CourseFaculty and Faculty tables). 

SELECT c.CourseID, c.CourseName, f.FacultyName
FROM Courses c
INNER JOIN CourseFaculty cf ON c.CourseID = cf.CourseID
INNER JOIN Faculty f ON cf.FacultyID = f.FacultyID;


-- 2. Left Outer Join 

--  List all students along with their program name; for students who are not 
-- enrolled in any program, show NULL for the program name. 

SELECT s.StudentID, s.Name, p.ProgramName
FROM Students s
LEFT JOIN Programs p ON s.ProgramID = p.ProgramID;


--  Show all departments and the names of faculty members who are HOD (display 
-- department even if there is no HOD assigned). 

SELECT d.DeptID, d.DeptName, d.HOD AS HODName
FROM Departments d;

-- 3. Right Outer Join 

--  List all hostel rooms along with the student details assigned to each room (show 
-- hostels even if no student is assigned the room). 

SELECT h.HostelName, ha.RoomNo, s.StudentID, s.Name
FROM Students s
RIGHT JOIN HostelAllotment ha ON s.StudentID = ha.StudentID
RIGHT JOIN Hostels h ON ha.HostelID = h.HostelID;

-- 4. Full Outer Join 

--  List all books and all students who have borrowed them using BookIssues.
-- Display books even if not issued, and students even if they have not borrowed 
-- any book. 

SELECT lb.BookID, lb.Title, s.StudentID, s.Name
FROM LibraryBooks lb
LEFT JOIN BookIssues bi ON lb.BookID = bi.BookID
LEFT JOIN Students s ON bi.StudentID = s.StudentID
UNION
SELECT lb.BookID, lb.Title, s.StudentID, s.Name
FROM Students s
LEFT JOIN BookIssues bi ON s.StudentID = bi.StudentID
LEFT JOIN LibraryBooks lb ON bi.BookID = lb.BookID;

-- 5. Aggregation with Joins 

--  For each department, show the total number of students enrolled (include 
-- departments even if there is no student). 

SELECT d.DeptName, COUNT(s.StudentID) AS TotalStudents
FROM Departments d
LEFT JOIN Students s ON d.DeptID = s.DeptID
GROUP BY d.DeptName;

--  For each course, display the number of students enrolled and the name of the 
-- faculty who taught it. 

SELECT c.CourseName, f.Name, COUNT(e.StudentID) AS NumStudents
FROM Courses c
JOIN CourseFaculty cf ON c.CourseID = cf.CourseID
JOIN Faculty f ON cf.FacultyID = f.FacultyID
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseName, f.Name;


-- 6. Conditional Joins 

--  List students who have attended at least one attendance entry as ’late’ together 
-- with their department name. 

SELECT DISTINCT s.StudentID, s.Name, d.DeptName
FROM Students s
JOIN Departments d ON s.DeptID = d.DeptID
JOIN Attendance a ON s.StudentID = a.StudentID
WHERE a.S_Marked = 'LATE';

--  Display all payments (pending and paid) with student names and payment types,
-- including students without payments.

SELECT s.StudentID, s.Name, p.PaymentID, p.Payment_Type, p.Amount, p.Payment_Status
FROM Students s
LEFT JOIN Payments p ON s.StudentID = p.StudentID;
