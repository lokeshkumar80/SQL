-- -- Assignment 3


/*Question - 01 */

USE UniversityDB;

CREATE TABLE Courses(
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT CHECK (Credits > 0),
    DeptID INT,
    ProgramID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID),
    FOREIGN KEY (ProgramID) REFERENCES Programs(ProgramID)
);

CREATE TABLE CourseFaculty (
CourseFacultyID INT PRIMARY KEY,
Semester INT NOT NULL,
CourseID INT,
FacultyID INT,
FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID),
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Enrollments(
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Semester INT NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    CHECK (Semester BETWEEN 1 AND 8)
);

CREATE TABLE Exams(
    ExamID INT PRIMARY KEY,
    CourseID INT,
    ExamDate DATE NOT NULL,
    MaxMarks INT CHECK(MaxMarks >= 0),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE ExamResults(
ResultID INT PRIMARY KEY,
ExamID INT,
StudentID INT,
MaxMarks INT,
MarksObtained INT ,
CONSTRAINT MarksObtained CHECK (MarksObtained >=0 AND MarksObtained <= MaxMarks),
FOREIGN KEY (ExamID) REFERENCES Exams(ExamID),
FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

CREATE TABLE Attendance(
    AttendanceID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    A_Date DATE NOT NULL,
    S_Marked ENUM('PRESENT','ABSENT','LATE'),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Hostels(
    HostelID INT PRIMARY KEY,
    HostelName VARCHAR(100) UNIQUE,
    Capacity INT CHECK (Capacity > 0)
);

CREATE TABLE HostelAllotment(
    AllotmentID INT PRIMARY KEY,
    HostelID INT,
    StudentID INT,
    RoomNo INT NOT NULL UNIQUE,
    FOREIGN KEY (HostelID) REFERENCES Hostels(HostelID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

CREATE TABLE LibraryBooks(
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(100) NOT NULL,
    Publisher VARCHAR(100) NOT NULL,
    ISBN VARCHAR(20) UNIQUE,
    DeptID INT,
    CopiesAvailable INT CHECK (CopiesAvailable > 0),
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

CREATE TABLE BookIssues(
    IssueID INT PRIMARY KEY,
    BookID INT,
    StudentID INT,
	Issue_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Return_Date DATE,
    FOREIGN KEY (BookID) REFERENCES LibraryBooks(BookID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

CREATE TABLE Payments(
    PaymentID INT PRIMARY KEY,
    StudentID INT,
    Amount INT CHECK (Amount > 0),
    Payment_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Payment_Type ENUM('Tuition','Hostel','Fine','Other'),
    Payment_Status ENUM('Paid','Pending'),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

/*Question - 02 : Part 01 */

INSERT INTO Courses VALUES
(501,'Data Structures',4,101,201),
(502,'Operating Systems',3,101,201),
(503,'Database Systems',3,101,201),
(504,'Computer Networks',3,101,201),
(505,'Digital Circuits',3,102,202),
(506,'Electrical Machines',4,102,202),
(507,'Power Systems',3,102,202),
(508,'Control Engineering',3,102,202),
(509,'Thermodynamics',4,103,203),
(510,'Fluid Mechanics',3,103,203),
(511,'Strength of Materials',3,103,203),
(512,'Machine Design',3,103,203),
(513,'Marketing Management',3,104,204),
(514,'Organizational Behavior',4,104,204),
(515,'Business Analytics',3,104,204),
(516,'Strategic Management',3,104,204),
(517,'Financial Accounting',3,105,205),
(518,'Investment Banking',4,105,205),
(519,'Corporate Finance',3,105,205),
(520,'Risk Management',3,105,205);

INSERT INTO Faculty (FacultyID, Name, DeptID, Designation, HireDate, Email, Phone) VALUES
(1, 'Dr. Sharma', 101, 'Professor', '2010-07-01', 'sharma@iitj.ac.in', '8880001111'),
(2, 'Dr. Meena', 101, 'Asst Prof', '2015-01-15', 'meena@iitj.ac.in', '8880001112'),
(3, 'Dr. Raghav', 102, 'Professor', '2008-05-20', 'raghav@iitj.ac.in', '8880001113'),
(4, 'Dr. Kapoor', 102, 'Lecturer', '2018-09-01', 'kapoor@iitj.ac.in', '8880001114'),
(5, 'Dr. Banerjee', 104, 'Professor', '2011-03-12', 'banerjee@iitj.ac.in', '8880001115'),
(6, 'Dr. Nair', 106, 'Asst Prof', '2016-04-17', 'nair@iitj.ac.in', '8880001116'),
(7, 'Dr. Iyer', 108, 'Professor', '2009-06-22', 'iyer@iitj.ac.in', '8880001117'),
(8, 'Dr. Rao', 109, 'Professor', '2012-07-19', 'rao@iitj.ac.in', '8880001118'),
(9, 'Dr. Krishnan', 110, 'Asst Prof', '2017-02-01', 'krishnan@iitj.ac.in', '8880001119'),
(10, 'Dr. Singh', 105, 'Professor', '2014-11-11', 'singh@iitj.ac.in', '8880001120');

INSERT INTO CourseFaculty (CourseFacultyID, Semester, CourseID, FacultyID) VALUES
(1, 1, 501, 1), (2, 1, 502, 2), (3, 2, 503, 3), (4, 2, 504, 3), (5, 1, 505, 4),
(6, 1, 506, 4), (7, 2, 507, 5), (8, 2, 508, 4), (9, 1, 509, 7), (10, 1, 510, 8);

INSERT INTO Enrollments (EnrollmentID, Semester, StudentID, CourseID) VALUES
(1, 1, 1001, 501), (2, 1, 1001, 502), (3, 1, 1002, 503), (4, 1, 1002, 507), (5, 1, 1003, 505),
(6, 1, 1003, 506), (7, 1, 1004, 507), (8, 1, 1005, 508), (9, 1, 1006, 509), (10, 1, 1007, 510),
(11, 1, 1008, 511), (12, 1, 1009, 512), (13, 1, 1010, 513), (14, 1, 1001, 514), (15, 1, 1002, 515),
(16, 1, 1003, 516), (17, 1, 1004, 517), (18, 1, 1005, 518), (19, 1, 1006, 519), (20, 1, 1007, 520),
(21, 2, 1008, 509), (22, 2, 1009, 507 ), (23, 2, 1010, 503), (24, 2, 1001, 509), (25, 2, 1002, 505),
(26, 2, 1003, 512), (27, 2, 1004, 512), (28, 2, 1005, 512), (29, 2, 1006, 512), (30, 2, 1007, 510),
(31, 2, 1008, 511), (32, 2, 1009, 512), (33, 2, 1010, 513), (34, 2, 1001, 514), (35, 2, 1002, 515),
(36, 2, 1003, 516), (37, 2, 1004, 517), (38, 2, 1005, 518), (39, 2, 1006, 519), (40, 2, 1007, 520),
(41, 2, 1008, 501), (42, 2, 1009, 502), (43, 2, 1011, 503), (44, 2, 1001, 504), (45, 2, 1002, 509),
(46, 2, 1003, 506), (47, 2, 1004, 507), (48, 2, 1005, 508), (49, 2, 1006, 509), (50, 2, 1007, 512);

INSERT INTO Exams (ExamID, ExamDate, MaxMarks, CourseID) VALUES
(1, '2024-01-10', 100, 501),
(2, '2024-01-11', 100, 502),
(3, '2024-01-12', 100, 503),
(4, '2024-01-13', 100, 504),
(5, '2024-01-14', 100, 505),
(6, '2024-01-15', 100, 506),
(7, '2024-01-16', 100, 507),
(8, '2024-01-17', 100, 508),
(9, '2024-01-18', 100, 509),
(10, '2024-01-19', 100, 510),
(11, '2024-01-20', 100, 511),
(12, '2024-01-21', 100, 512),
(13, '2024-01-22', 100, 513),
(14, '2024-01-23', 100, 514),
(15, '2024-01-24', 100, 515),
(16, '2024-01-25', 100, 516),
(17, '2024-01-26', 100, 517),
(18, '2024-01-27', 100, 518),
(19, '2024-01-28', 100, 519),
(20, '2024-01-29', 100, 520);

INSERT INTO Attendance (AttendanceID, A_Date, StudentID, CourseID, S_Marked) VALUES
(1, '2024-01-10', 1001, 501, 'Present'),
(2, '2024-01-10', 1002, 502, 'Absent'),
(3, '2024-02-20', 1010, 520, 'Present');

INSERT INTO ExamResults (ResultID, ExamID, StudentID, MaxMarks, MarksObtained) VALUES
(1, 1, 1001, 100, 85),
(2, 1, 1002, 100, 78),
(3, 2, 1003, 100, 90),
(4, 20, 1010, 100, 88);

INSERT INTO Hostels (HostelID, HostelName, Capacity) VALUES
(1, 'Hostel A', 100),
(2, 'Hostel B', 100),
(3, 'Hostel C', 100);

INSERT INTO HostelAllotment (AllotmentID, HostelID, StudentID, RoomNo) VALUES
(1, 3, 1001, '101'),
(2, 1, 1002, '102'),
(3, 2, 1050, '510');

INSERT INTO LibraryBooks (BookID, Title, Author, Publisher, ISBN, DeptID, CopiesAvailable) VALUES
(1, 'Intro to Algorithms', 'CLRS', 'MIT Press', 'ISBN001', 101, 5),
(15, 'Organic Chemistry', 'Morrison', 'Pearson', 'ISBN015', 109, 3),
(2, 'Linear Algebra', 'Sartaj', 'Arihant', 'ISBN0023', 102, 4),
(3, 'Circuit Design', 'Badri', 'Pearson', 'ISBN027', 103, 3),
(4, 'Digital Electronics', 'Ashutosh', 'Arihant', 'ISBN050', 103, 5);

INSERT INTO BookIssues (IssueID, BookID, StudentID, Issue_Date, Return_Date) VALUES
(1, 1, 1001, '2024-01-10', NULL),
(30, 15, 1010, '2024-02-05', NULL),
(2, 2, 1001, '2024-03-10', NULL),
(3, 3, 1001, '2024-03-10', NULL),
(4, 1, 1001, '2024-03-10', NULL),
(5, 1, 1001, '2024-03-10', NULL),
(6, 1, 1001, '2024-04-10', NULL),
(5, 4, 1001, '2024-03-10', NULL);


INSERT INTO Payments (PaymentID, StudentID, Amount, Payment_Date, Payment_Type, Payment_Status) VALUES
(1, 1001, 50000, '2024-01-01', 'Tuition', 'Paid'),
(2, 1002, 20000, '2024-01-05', 'Hostel', 'Pending'),
(50, 1010, 1500, '2024-02-15', 'Fine', 'Paid');

/*Question - 02 Part 2 */

INSERT INTO HostelAllotment (AllotmentID, HostelID, StudentID, RoomNo) VALUES 
(5, 3, 1001, '202');  -- it allows multiple allotments for a students in diff rooms

INSERT INTO LibraryBooks (BookID, Title, Author, Publisher, ISBN, DeptID, CopiesAvailable)
VALUES (16, 'Empty Stock Book', 'AuthorX', 'PubX', 'ISBN016', 108, 0); -- But here min 0 copies are not allowed for a book to entry it gives error

INSERT INTO LibraryBooks (BookID, Title, Author, Publisher, ISBN, DeptID, CopiesAvailable) VALUES 
(16, 'Empty Stock Book', 'AuthorX', 'PubX', 'ISBN016', 108, 1);

INSERT INTO BookIssues (IssueID, BookID, StudentID, Issue_Date, Return_Date) VALUES 
(31, 16, 1002, '2024-03-01', NULL);

INSERT INTO ExamResults (ResultID, ExamID, StudentID, MaxMarks, MarksObtained)
VALUES (5, 1, 1003, 100, 120); -- Constraint 'MarksObtained' is violated

/*Question - 03 */

-- -- 1. List students with pending payments.

SELECT s.StudentID, s.Name
FROM Students s
JOIN Payments p ON s.StudentID = p.StudentID
WHERE p.Payment_Status = 'Pending';

-- -- 2. Show faculty teaching more than 2 courses.

SELECT f.FacultyID, f.Name, COUNT(cf.CourseID) AS CourseCount
FROM Faculty f
JOIN CourseFaculty cf ON f.FacultyID = cf.FacultyID
GROUP BY f.FacultyID, f.Name
HAVING COUNT(cf.CourseID) > 2;

-- -- 3. List students who issued more than 3 different books.

SELECT s.StudentID, s.Name, COUNT(b.BookID) AS BookIssues
FROM Students s
JOIN BookIssues b ON s.StudentID = b.StudentID
GROUP BY s.StudentID, s.Name
HAVING COUNT(b.BookID) > 3;