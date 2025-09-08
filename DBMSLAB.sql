-- -- Assignment 2


-- /*Question 01*/

-- CREATE DATABASE UniversityDB;

-- USE UniversityDB;

-- /*Question 02*/

-- CREATE TABLE Colleges(
-- CollegeID INT PRIMARY KEY,
--     CollegeName VARCHAR(100) UNIQUE NOT NULL
-- );

-- CREATE TABLE Departments(
-- DeptID INT PRIMARY KEY,
--     DeptName VARCHAR(100) UNIQUE NOT NULL,
--     CollegeID INT,
--     FOREIGN KEY (CollegeID) REFERENCES Colleges(CollegeID),
--     HOD VARCHAR(50)
-- );

-- CREATE TABLE Programs(
-- ProgramID INT PRIMARY KEY,
--     ProgramName VARCHAR(50) NOT NULL,
--     DegreeType VARCHAR(50),
--     DeptID INT,
--     FOREIGN KEY(DeptID) REFERENCES  Departments(DeptID)
-- );
-- create table Faculty (
--     FacultyID int primary key, 
--     Name varchar(100) not null, 
--     DeptID int, 
--     foreign key (DeptID) references Departments(DeptID), 
--     Designation varchar(50), 
--     HireDate date, 
--     Email varchar(100) unique, 
--     Phone varchar(15) unique
-- );
-- CREATE TABLE Students(
-- StudentID INT PRIMARY KEY,
--     Name VARCHAR(50) NOT NULL,
--     DOB DATE,
--     Gender CHAR(1) CHECK (Gender IN ('M','F','O')),
--     AdmissionYear INT,
--     CHECK(AdmissionYear>=2000),
--     EmailID VARCHAR(50) UNIQUE,
--     Phone VARCHAR(15) UNIQUE,
--     DeptID INT,
--     ProgramID INT,
--     FOREIGN KEY (DeptID) REFERENCES Departments(DeptID),
--     FOREIGN KEY (ProgramID) REFERENCES Programs(ProgramID)
-- );

-- /*Question 03 - Part 01*/

-- INSERT INTO Colleges VALUES(1,"Science College");
-- INSERT INTO Colleges VALUES(2,"IIT College");
-- INSERT INTO Colleges VALUES(3,"Arts College");
-- INSERT INTO Colleges VALUES(4,"Law University");
-- INSERT INTO Colleges VALUES(5,"NIFT");
-- INSERT INTO Colleges VALUES(6,"Lovely Professional University");
-- INSERT INTO Colleges VALUES(7,"Manipal University");
-- INSERT INTO Colleges VALUES(8,"IITJmu");
-- INSERT INTO Colleges VALUES(9,"Reyansh College");
-- INSERT INTO Colleges VALUES(10,"Galgotia University");

-- INSERT INTO Departments (DeptID, DeptName, CollegeID, HOD) VALUES
-- (101, "Computer Science", 1, 'Dr.Sharma'),
--     (102, "MNC", 2, 'Dr.Bawane'),
--     (103, "Electrical", 3, 'Dr.Anshak'),
--     (104, "Materials", 4, 'Dr.Owais'),
--     (105, "Civil", 5, 'Dr.Yadav'),
--     (106, "Chemical", 6, 'Dr.Khullar'),
--     (107, "Structual Eng.", 7, 'Dr.Mishra'),
--     (108, "BBA", 8, 'Dr.Soni'),
--     (109, "Physical Education", 9, 'Dr.Gupta'),
--     (110, "HSS", 10, 'Dr.Suchak');

-- INSERT INTO Programs (ProgramID, ProgramName, DegreeType, DeptID) VALUES
-- (201, "DMS","B.Tech", 102),
--     (202, "DBMS", "B.Tech", 102),
--     (203, "Drawing", "B.Tech", 101),
--     (204, "POM", "B.Tech", 103),
--     (205, "ToAC", "B.Tech", 104),
--     (206, "OS", "B.Tech", 105),
--     (207, "Calculus", "B.Tech", 106),
--     (208, "Chemistry", "B.Tech", 107),
--     (209, "Biology","B.Tech", 108),
--     (210, "Signal and System", "B.Tech", 109),
--     (211, "Digital Design", "B.Tech", 110),
--     (212, "Psychology", "B.Tech", 107),
--     (213, "Game Theory", "B.Tech", 105),
--     (214, "Computer Architecture", "B.Tech", 108),
--     (215, "PPL", "B.Tech", 104);

-- INSERT INTO Students (StudentID, Name, DOB, Gender, AdmissionYear, EmailID, Phone, DeptID, ProgramID) VALUES
-- (1001, 'Student1', '1998-05-14', 'M', 2017, 'student1@university.com', '+919876543210', 101, 203),
-- (1002, 'Student2', '2000-11-23', 'F', 2019, 'student2@university.com', '+919876543211', 102, 201),
-- (1003, 'Student3', '1999-07-08', 'M', 2018, 'student3@university.com', '+919876543212', 102, 202),
-- (1004, 'Student4', '1997-03-19', 'F', 2016, 'student4@university.com', '+919876543213', 103, 204),
-- (1005, 'Student5', '2001-09-30', 'O', 2020, 'student5@university.com', '+919876543214', 104, 205),
-- (1006, 'Student6', '1996-01-11', 'M', 2015, 'student6@university.com', '+919876543215', 105, 206),
-- (1007, 'Student7', '1995-12-25', 'F', 2014, 'student7@university.com', '+919876543216', 106, 207),
-- (1008, 'Student8', '2000-06-07', 'M', 2019, 'student8@university.com', '+919876543217', 107, 208),
-- (1009, 'Student9', '2002-08-15', 'F', 2021, 'student9@university.com', '+919876543218', 108, 209),
-- (1010, 'Student10', '1998-10-04', 'M', 2017, 'student10@university.com', '+919876543219', 109, 210),
-- (1011, 'Student11', '1999-11-22', 'F', 2018, 'student11@university.com', '+919876543220', 110, 211),
-- (1012, 'Student12', '2001-04-03', 'O', 2020, 'student12@university.com', '+919876543221', 107, 212),
-- (1013, 'Student13', '1997-05-29', 'M', 2016, 'student13@university.com', '+919876543222', 105, 213),
-- (1014, 'Student14', '1996-02-17', 'F', 2015, 'student14@university.com', '+919876543223', 108, 214),
-- (1015, 'Student15', '2003-09-12', 'M', 2022, 'student15@university.com', '+919876543224', 104, 215),
-- (1016, 'Student16', '1998-01-25', 'F', 2017, 'student16@university.com', '+919876543225', 101, 203),
-- (1017, 'Student17', '2002-07-19', 'M', 2021, 'student17@university.com', '+919876543226', 102, 201),
-- (1018, 'Student18', '2000-03-28', 'F', 2019, 'student18@university.com', '+919876543227', 102, 202),
-- (1019, 'Student19', '1999-09-09', 'O', 2018, 'student19@university.com', '+919876543228', 103, 204),
-- (1020, 'Student20', '2001-06-16', 'M', 2020, 'student20@university.com', '+919876543229', 104, 205),
-- (1021, 'Student21', '1998-12-12', 'F', 2017, 'student21@university.com', '+919876543230', 105, 206),
-- (1022, 'Student22', '1997-07-27', 'M', 2016, 'student22@university.com', '+919876543231', 106, 207),
-- (1023, 'Student23', '2000-08-02', 'F', 2019, 'student23@university.com', '+919876543232', 107, 208),
-- (1024, 'Student24', '2002-10-21', 'M', 2021, 'student24@university.com', '+919876543233', 108, 209),
-- (1025, 'Student25', '1999-02-18', 'F', 2018, 'student25@university.com', '+919876543234', 109, 210),
-- (1026, 'Student26', '1998-11-05', 'M', 2017, 'student26@university.com', '+919876543235', 110, 211),
-- (1027, 'Student27', '2001-01-22', 'O', 2020, 'student27@university.com', '+919876543236', 107, 212),
-- (1028, 'Student28', '1996-03-14', 'M', 2015, 'student28@university.com', '+919876543237', 105, 213),
-- (1029, 'Student29', '1997-09-01', 'F', 2016, 'student29@university.com', '+919876543238', 108, 214),
-- (1030, 'Student30', '2003-04-25', 'M', 2022, 'student30@university.com', '+919876543239', 104, 215),
-- (1031, 'Student31', '1998-02-11', 'F', 2017, 'student31@university.com', '+919876543240', 101, 203),
-- (1032, 'Student32', '1999-06-19', 'M', 2018, 'student32@university.com', '+919876543241', 102, 201),
-- (1033, 'Student33', '2000-09-27', 'F', 2019, 'student33@university.com', '+919876543242', 102, 202),
-- (1034, 'Student34', '1997-04-07', 'M', 2016, 'student34@university.com', '+919876543243', 103, 204),
-- (1035, 'Student35', '2001-01-18', 'F', 2020, 'student35@university.com', '+919876543244', 104, 205),
-- (1036, 'Student36', '1998-08-29', 'M', 2017, 'student36@university.com', '+919876543245', 105, 206),
-- (1037, 'Student37', '1996-10-02', 'F', 2015, 'student37@university.com', '+919876543246', 106, 207),
-- (1038, 'Student38', '2000-12-14', 'M', 2019, 'student38@university.com', '+919876543247', 107, 208),
-- (1039, 'Student39', '2002-06-22', 'F', 2021, 'student39@university.com', '+919876543248', 108, 209),
-- (1040, 'Student40', '1999-03-03', 'M', 2018, 'student40@university.com', '+919876543249', 109, 210),
-- (1041, 'Student41', '1998-07-15', 'O', 2017, 'student41@university.com', '+919876543250', 110, 211),
-- (1042, 'Student42', '2001-09-09', 'M', 2020, 'student42@university.com', '+919876543251', 107, 212),
-- (1043, 'Student43', '1996-11-23', 'F', 2015, 'student43@university.com', '+919876543252', 105, 213),
-- (1044, 'Student44', '1997-05-30', 'M', 2016, 'student44@university.com', '+919876543253', 108, 214),
-- (1045, 'Student45', '2003-01-27', 'F', 2022, 'student45@university.com', '+919876543254', 104, 215),
-- (1046, 'Student46', '1998-10-20', 'M', 2017, 'student46@university.com', '+919876543255', 101, 203),
-- (1047, 'Student47', '1999-01-11', 'F', 2018, 'student47@university.com', '+919876543256', 102, 201),
-- (1048, 'Student48', '2000-03-06', 'M', 2019, 'student48@university.com', '+919876543257', 102, 202),
-- (1049, 'Student49', '1997-07-14', 'F', 2016, 'student49@university.com', '+919876543258', 103, 204),
-- (1050, 'Student50', '2001-12-18', 'M', 2020, 'student50@university.com', '+919876543259', 104, 205),
-- (1051, 'Student51', '1998-04-09', 'F', 2017, 'student51@university.com', '+919876543260', 105, 206),
-- (1052, 'Student52', '1996-09-28', 'M', 2015, 'student52@university.com', '+919876543261', 106, 207),
-- (1053, 'Student53', '2000-05-19', 'F', 2019, 'student53@university.com', '+919876543262', 107, 208),
-- (1054, 'Student54', '2002-08-03', 'M', 2021, 'student54@university.com', '+919876543263', 108, 209),
-- (1055, 'Student55', '1999-02-07', 'F', 2018, 'student55@university.com', '+919876543264', 109, 210),
-- (1056, 'Student56', '1998-11-14', 'M', 2017, 'student56@university.com', '+919876543265', 110, 211),
-- (1057, 'Student57', '2001-01-25', 'O', 2020, 'student57@university.com', '+919876543266', 107, 212),
-- (1058, 'Student58', '1996-02-18', 'M', 2015, 'student58@university.com', '+919876543267', 105, 213),
-- (1059, 'Student59', '1997-08-22', 'F', 2016, 'student59@university.com', '+919876543268', 108, 214),
-- (1060, 'Student60', '2003-05-11', 'M', 2022, 'student60@university.com', '+919876543269', 104, 215),
-- (1061, 'Student61', '1998-01-17', 'F', 2017, 'student61@university.com', '+919876543270', 101, 203),
-- (1062, 'Student62', '1999-06-29', 'M', 2018, 'student62@university.com', '+919876543271', 102, 201),
-- (1063, 'Student63', '2000-09-15', 'F', 2019, 'student63@university.com', '+919876543272', 102, 202),
-- (1064, 'Student64', '1997-04-21', 'M', 2016, 'student64@university.com', '+919876543273', 103, 204),
-- (1065, 'Student65', '2001-01-09', 'F', 2020, 'student65@university.com', '+919876543274', 104, 205),
-- (1066, 'Student66', '1998-08-24', 'M', 2017, 'student66@university.com', '+919876543275', 105, 206),
-- (1067, 'Student67', '1996-10-10', 'F', 2015, 'student67@university.com', '+919876543276', 106, 207),
-- (1068, 'Student68', '2000-12-02', 'M', 2019, 'student68@university.com', '+919876543277', 107, 208),
-- (1069, 'Student69', '2002-06-19', 'F', 2021, 'student69@university.com', '+919876543278', 108, 209),
-- (1070, 'Student70', '1999-03-13', 'M', 2018, 'student70@university.com', '+919876543279', 109, 210),
-- (1071, 'Student71', '1998-07-23', 'F', 2017, 'student71@university.com', '+919876543280', 110, 211),
-- (1072, 'Student72', '2001-09-05', 'M', 2020, 'student72@university.com', '+919876543281', 107, 212),
-- (1073, 'Student73', '1996-11-28', 'F', 2015, 'student73@university.com', '+919876543282', 105, 213),
-- (1074, 'Student74', '1997-06-16', 'M', 2016, 'student74@university.com', '+919876543283', 108, 214),
-- (1075, 'Student75', '2003-02-13', 'F', 2022, 'student75@university.com', '+919876543284', 104, 215),
-- (1076, 'Student76', '1998-10-30', 'M', 2017, 'student76@university.com', '+919876543285', 101, 203),
-- (1077, 'Student77', '1999-01-07', 'F', 2018, 'student77@university.com', '+919876543286', 102, 201),
-- (1078, 'Student78', '2000-03-11', 'M', 2019, 'student78@university.com', '+919876543287', 102, 202),
-- (1079, 'Student79', '1997-07-25', 'F', 2016, 'student79@university.com', '+919876543288', 103, 204),
-- (1080, 'Student80', '2001-12-29', 'M', 2020, 'student80@university.com', '+919876543289', 104, 205),
-- (1081, 'Student81', '1998-04-13', 'F', 2017, 'student81@university.com', '+919876543290', 105, 206),
-- (1082, 'Student82', '1996-09-21', 'M', 2015, 'student82@university.com', '+919876543291', 106, 207),
-- (1083, 'Student83', '2000-05-15', 'F', 2019, 'student83@university.com', '+919876543292', 107, 208),
-- (1084, 'Student84', '2002-08-09', 'M', 2021, 'student84@university.com', '+919876543293', 108, 209),
-- (1085, 'Student85', '1999-02-02', 'F', 2018, 'student85@university.com', '+919876543294', 109, 210),
-- (1086, 'Student86', '1998-11-17', 'M', 2017, 'student86@university.com', '+919876543295', 110, 211),
-- (1087, 'Student87', '2001-01-27', 'O', 2020, 'student87@university.com', '+919876543296', 107, 212),
-- (1088, 'Student88', '1996-02-15', 'M', 2015, 'student88@university.com', '+919876543297', 105, 213),
-- (1089, 'Student89', '1997-08-30', 'F', 2016, 'student89@university.com', '+919876543298', 108, 214),
-- (1090, 'Student90', '2003-05-22', 'M', 2022, 'student90@university.com', '+919876543299', 104, 215),
-- (1091, 'Student91', '1998-01-21', 'F', 2017, 'student91@university.com', '+919876543300', 101, 203),
-- (1092, 'Student92', '1999-06-07', 'M', 2018, 'student92@university.com', '+919876543301', 102, 201),
-- (1093, 'Student93', '2000-09-20', 'F', 2019, 'student93@university.com', '+919876543302', 102,205);

-- /*Question 03 - Part 03*/

-- INSERT INTO Students VALUES (1094,'Student94', '2003-12-04','M',2016,'student93@university.com', '+919876543302',102,205);   /*Student with duplicate email and phone*/

-- INSERT INTO Departments VALUES (111,'Mathworks',11,'Dr.Manish');                                                             /*Department with non existing College ID*/

-- INSERT INTO Students VALUES (1095,'Student95', '2003-08-04','I',2016,'student95@university.com', '+919866543302',101,203);   /*Student with gender other than M,F,O*/

-- INSERT INTO Students VALUES (1096,'Student96', '1999-08-04','I',1999,'student96@university.com', '+919866544302',104,215);   /*Student with admission year before 2000*/

-- /*Output of some select queries*/

-- SELECT Name,AdmissionYear From Students where Gender = 'M';

-- SELECT DeptID,DeptName From Departments where HOD = 'Dr.Mishra';






-- -- Assignment 3


/*Question - 01 */

-- USE UniversityDB;

-- CREATE TABLE Courses(
--     CourseID INT PRIMARY KEY,
--     CourseName VARCHAR(100) NOT NULL,
--     Credits INT CHECK (Credits > 0),
--     DeptID INT,
--     ProgramID INT,
--     FOREIGN KEY (DeptID) REFERENCES Departments(DeptID),
--     FOREIGN KEY (ProgramID) REFERENCES Programs(ProgramID)
-- );

-- CREATE TABLE CourseFaculty (
-- CourseFacultyID INT PRIMARY KEY,
-- Semester INT NOT NULL,
-- CourseID INT,
-- FacultyID INT,
-- FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID),
-- FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
-- );

-- CREATE TABLE Enrollments(
--     EnrollmentID INT PRIMARY KEY,
--     StudentID INT,
--     CourseID INT,
--     Semester INT NOT NULL,
--     FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
--     FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
--     CHECK (Semester BETWEEN 1 AND 8)
-- );

-- CREATE TABLE Exams(
--     ExamID INT PRIMARY KEY,
--     CourseID INT,
--     ExamDate DATE NOT NULL,
--     MaxMarks INT CHECK(MaxMarks >= 0),
--     FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
-- );

-- CREATE TABLE ExamResults(
-- ResultID INT PRIMARY KEY,
-- ExamID INT,
-- StudentID INT,
-- MaxMarks INT,
-- MarksObtained INT ,
-- CONSTRAINT MarksObtained CHECK (MarksObtained >=0 AND MarksObtained <= MaxMarks),
-- FOREIGN KEY (ExamID) REFERENCES Exams(ExamID),
-- FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
-- );

-- CREATE TABLE Attendance(
--     AttendanceID INT PRIMARY KEY,
--     StudentID INT,
--     CourseID INT,
--     A_Date DATE NOT NULL,
--     S_Marked ENUM('PRESENT','ABSENT','LATE'),
--     FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
--     FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
-- );

-- CREATE TABLE Hostels(
--     HostelID INT PRIMARY KEY,
--     HostelName VARCHAR(100) UNIQUE,
--     Capacity INT CHECK (Capacity > 0)
-- );

-- CREATE TABLE HostelAllotment(
--     AllotmentID INT PRIMARY KEY,
--     HostelID INT,
--     StudentID INT,
--     RoomNo INT NOT NULL UNIQUE,
--     FOREIGN KEY (HostelID) REFERENCES Hostels(HostelID),
--     FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
-- );

-- CREATE TABLE LibraryBooks(
--     BookID INT PRIMARY KEY,
--     Title VARCHAR(255),
--     Author VARCHAR(100) NOT NULL,
--     Publisher VARCHAR(100) NOT NULL,
--     ISBN VARCHAR(20) UNIQUE,
--     DeptID INT,
--     CopiesAvailable INT CHECK (CopiesAvailable > 0),
--     FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
-- );

-- CREATE TABLE BookIssues(
--     IssueID INT PRIMARY KEY,
--     BookID INT,
--     StudentID INT,
-- 	Issue_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     Return_Date DATE,
--     FOREIGN KEY (BookID) REFERENCES LibraryBooks(BookID),
--     FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
-- );

-- CREATE TABLE Payments(
--     PaymentID INT PRIMARY KEY,
--     StudentID INT,
--     Amount INT CHECK (Amount > 0),
--     Payment_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     Payment_Type ENUM('Tuition','Hostel','Fine','Other'),
--     Payment_Status ENUM('Paid','Pending'),
--     FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
-- );

/*Question - 02 : Part 01 */

-- INSERT INTO Courses VALUES
-- (501,'Data Structures',4,101,201),
-- (502,'Operating Systems',3,101,201),
-- (503,'Database Systems',3,101,201),
-- (504,'Computer Networks',3,101,201),
-- (505,'Digital Circuits',3,102,202),
-- (506,'Electrical Machines',4,102,202),
-- (507,'Power Systems',3,102,202),
-- (508,'Control Engineering',3,102,202),
-- (509,'Thermodynamics',4,103,203),
-- (510,'Fluid Mechanics',3,103,203),
-- (511,'Strength of Materials',3,103,203),
-- (512,'Machine Design',3,103,203),
-- (513,'Marketing Management',3,104,204),
-- (514,'Organizational Behavior',4,104,204),
-- (515,'Business Analytics',3,104,204),
-- (516,'Strategic Management',3,104,204),
-- (517,'Financial Accounting',3,105,205),
-- (518,'Investment Banking',4,105,205),
-- (519,'Corporate Finance',3,105,205),
-- (520,'Risk Management',3,105,205);

-- INSERT INTO Faculty (FacultyID, Name, DeptID, Designation, HireDate, Email, Phone) VALUES
-- (1, 'Dr. Sharma', 101, 'Professor', '2010-07-01', 'sharma@iitj.ac.in', '8880001111'),
-- (2, 'Dr. Meena', 101, 'Asst Prof', '2015-01-15', 'meena@iitj.ac.in', '8880001112'),
-- (3, 'Dr. Raghav', 102, 'Professor', '2008-05-20', 'raghav@iitj.ac.in', '8880001113'),
-- (4, 'Dr. Kapoor', 102, 'Lecturer', '2018-09-01', 'kapoor@iitj.ac.in', '8880001114'),
-- (5, 'Dr. Banerjee', 104, 'Professor', '2011-03-12', 'banerjee@iitj.ac.in', '8880001115'),
-- (6, 'Dr. Nair', 106, 'Asst Prof', '2016-04-17', 'nair@iitj.ac.in', '8880001116'),
-- (7, 'Dr. Iyer', 108, 'Professor', '2009-06-22', 'iyer@iitj.ac.in', '8880001117'),
-- (8, 'Dr. Rao', 109, 'Professor', '2012-07-19', 'rao@iitj.ac.in', '8880001118'),
-- (9, 'Dr. Krishnan', 110, 'Asst Prof', '2017-02-01', 'krishnan@iitj.ac.in', '8880001119'),
-- (10, 'Dr. Singh', 105, 'Professor', '2014-11-11', 'singh@iitj.ac.in', '8880001120');

-- INSERT INTO CourseFaculty (CourseFacultyID, Semester, CourseID, FacultyID) VALUES
-- (1, 1, 501, 1), (2, 1, 502, 2), (3, 2, 503, 3), (4, 2, 504, 3), (5, 1, 505, 4),
-- (6, 1, 506, 4), (7, 2, 507, 5), (8, 2, 508, 4), (9, 1, 509, 7), (10, 1, 510, 8);

-- INSERT INTO Enrollments (EnrollmentID, Semester, StudentID, CourseID) VALUES
-- (1, 1, 1001, 501), (2, 1, 1001, 502), (3, 1, 1002, 503), (4, 1, 1002, 507), (5, 1, 1003, 505),
-- (6, 1, 1003, 506), (7, 1, 1004, 507), (8, 1, 1005, 508), (9, 1, 1006, 509), (10, 1, 1007, 510),
-- (11, 1, 1008, 511), (12, 1, 1009, 512), (13, 1, 1010, 513), (14, 1, 1001, 514), (15, 1, 1002, 515),
-- (16, 1, 1003, 516), (17, 1, 1004, 517), (18, 1, 1005, 518), (19, 1, 1006, 519), (20, 1, 1007, 520),
-- (21, 2, 1008, 509), (22, 2, 1009, 507 ), (23, 2, 1010, 503), (24, 2, 1001, 509), (25, 2, 1002, 505),
-- (26, 2, 1003, 512), (27, 2, 1004, 512), (28, 2, 1005, 512), (29, 2, 1006, 512), (30, 2, 1007, 510),
-- (31, 2, 1008, 511), (32, 2, 1009, 512), (33, 2, 1010, 513), (34, 2, 1001, 514), (35, 2, 1002, 515),
-- (36, 2, 1003, 516), (37, 2, 1004, 517), (38, 2, 1005, 518), (39, 2, 1006, 519), (40, 2, 1007, 520),
-- (41, 2, 1008, 501), (42, 2, 1009, 502), (43, 2, 1011, 503), (44, 2, 1001, 504), (45, 2, 1002, 509),
-- (46, 2, 1003, 506), (47, 2, 1004, 507), (48, 2, 1005, 508), (49, 2, 1006, 509), (50, 2, 1007, 512);

-- INSERT INTO Exams (ExamID, ExamDate, MaxMarks, CourseID) VALUES
-- (1, '2024-01-10', 100, 501),
-- (2, '2024-01-11', 100, 502),
-- (3, '2024-01-12', 100, 503),
-- (4, '2024-01-13', 100, 504),
-- (5, '2024-01-14', 100, 505),
-- (6, '2024-01-15', 100, 506),
-- (7, '2024-01-16', 100, 507),
-- (8, '2024-01-17', 100, 508),
-- (9, '2024-01-18', 100, 509),
-- (10, '2024-01-19', 100, 510),
-- (11, '2024-01-20', 100, 511),
-- (12, '2024-01-21', 100, 512),
-- (13, '2024-01-22', 100, 513),
-- (14, '2024-01-23', 100, 514),
-- (15, '2024-01-24', 100, 515),
-- (16, '2024-01-25', 100, 516),
-- (17, '2024-01-26', 100, 517),
-- (18, '2024-01-27', 100, 518),
-- (19, '2024-01-28', 100, 519),
-- (20, '2024-01-29', 100, 520);

-- INSERT INTO Attendance (AttendanceID, A_Date, StudentID, CourseID, S_Marked) VALUES
-- (1, '2024-01-10', 1001, 501, 'Present'),
-- (2, '2024-01-10', 1002, 502, 'Absent'),
-- (3, '2024-02-20', 1010, 520, 'Present');

-- INSERT INTO ExamResults (ResultID, ExamID, StudentID, MaxMarks, MarksObtained) VALUES
-- (1, 1, 1001, 100, 85),
-- (2, 1, 1002, 100, 78),
-- (3, 2, 1003, 100, 90),
-- (4, 20, 1010, 100, 88);

-- INSERT INTO Hostels (HostelID, HostelName, Capacity) VALUES
-- (1, 'Hostel A', 100),
-- (2, 'Hostel B', 100),
-- (3, 'Hostel C', 100);

-- INSERT INTO HostelAllotment (AllotmentID, HostelID, StudentID, RoomNo) VALUES
-- (1, 3, 1001, '101'),
-- (2, 1, 1002, '102'),
-- (3, 2, 1050, '510');

-- INSERT INTO LibraryBooks (BookID, Title, Author, Publisher, ISBN, DeptID, CopiesAvailable) VALUES
-- (1, 'Intro to Algorithms', 'CLRS', 'MIT Press', 'ISBN001', 101, 5),
-- (15, 'Organic Chemistry', 'Morrison', 'Pearson', 'ISBN015', 109, 3),
-- (2, 'Linear Algebra', 'Sartaj', 'Arihant', 'ISBN0023', 102, 4),
-- (3, 'Circuit Design', 'Badri', 'Pearson', 'ISBN027', 103, 3),
-- (4, 'Digital Electronics', 'Ashutosh', 'Arihant', 'ISBN050', 103, 5);

-- INSERT INTO BookIssues (IssueID, BookID, StudentID, Issue_Date, Return_Date) VALUES
-- (1, 1, 1001, '2024-01-10', NULL),
-- (30, 15, 1010, '2024-02-05', NULL),
-- (2, 2, 1001, '2024-03-10', NULL),
-- (3, 3, 1001, '2024-03-10', NULL),
-- (4, 1, 1001, '2024-03-10', NULL),
-- (5, 1, 1001, '2024-03-10', NULL),
-- (6, 1, 1001, '2024-04-10', NULL),
-- (5, 4, 1001, '2024-03-10', NULL);


-- INSERT INTO Payments (PaymentID, StudentID, Amount, Payment_Date, Payment_Type, Payment_Status) VALUES
-- (1, 1001, 50000, '2024-01-01', 'Tuition', 'Paid'),
-- (2, 1002, 20000, '2024-01-05', 'Hostel', 'Pending'),
-- (50, 1010, 1500, '2024-02-15', 'Fine', 'Paid');

/*Question - 02 Part 2 */

-- INSERT INTO HostelAllotment (AllotmentID, HostelID, StudentID, RoomNo) VALUES 
-- (5, 3, 1001, '202');  -- it allows multiple allotments for a students in diff rooms

-- INSERT INTO LibraryBooks (BookID, Title, Author, Publisher, ISBN, DeptID, CopiesAvailable)
-- VALUES (16, 'Empty Stock Book', 'AuthorX', 'PubX', 'ISBN016', 108, 0); -- But here min 0 copies are not allowed for a book to entry it gives error

-- INSERT INTO LibraryBooks (BookID, Title, Author, Publisher, ISBN, DeptID, CopiesAvailable) VALUES 
-- (16, 'Empty Stock Book', 'AuthorX', 'PubX', 'ISBN016', 108, 1);

-- INSERT INTO BookIssues (IssueID, BookID, StudentID, Issue_Date, Return_Date) VALUES 
-- (31, 16, 1002, '2024-03-01', NULL);

-- INSERT INTO ExamResults (ResultID, ExamID, StudentID, MaxMarks, MarksObtained)
-- VALUES (5, 1, 1003, 100, 120); -- Constraint 'MarksObtained' is violated

/*Question - 03 */

-- -- 1. List students with pending payments.

-- SELECT s.StudentID, s.Name
-- FROM Students s
-- JOIN Payments p ON s.StudentID = p.StudentID
-- WHERE p.Payment_Status = 'Pending';

-- -- 2. Show faculty teaching more than 2 courses.

-- SELECT f.FacultyID, f.Name, COUNT(cf.CourseID) AS CourseCount
-- FROM Faculty f
-- JOIN CourseFaculty cf ON f.FacultyID = cf.FacultyID
-- GROUP BY f.FacultyID, f.Name
-- HAVING COUNT(cf.CourseID) > 2;

-- -- 3. List students who issued more than 3 different books.

-- SELECT s.StudentID, s.Name, COUNT(b.BookID) AS BookIssues
-- FROM Students s
-- JOIN BookIssues b ON s.StudentID = b.StudentID
-- GROUP BY s.StudentID, s.Name
-- HAVING COUNT(b.BookID) > 3;


                                                 -- -- Assignment 4 


/*Question - 01 */ -- Grouping, Ordering, Aggregates

-- -- 1. Group by Age and count students in each age group, ordering by count in descending order.
-- SELECT YEAR(CURDATE())- YEAR(dob) AS age, COUNT(*) AS student_count
-- FROM students
-- GROUP BY age
-- ORDER BY student_count DESC;

-- -- 2. Group by Department, calculate the maximum score for each department, and order by maximum score in descending order.
-- SELECT d.deptname, MAX(er.marksobtained) AS max_score
-- FROM students s
-- JOIN departments d ON s.deptid = d.deptid
-- JOIN examresults er ON s.studentid = er.studentid
-- GROUP BY d.deptname
-- ORDER BY max_score DESC;

-- -- 3. Group by Gender, calculate the average age for each gender, and order by average age in ascending order.
-- SELECT gender, AVG(YEAR(CURDATE())- YEAR(dob)) AS avg_age
-- FROM students
-- GROUP BY gender
-- ORDER BY avg_age ASC;

/*Question - 02 */  -- Arithmetic and Comparison Operators

 -- -- 1. Retrieve students with a score greater than or equal to 90.
--  SELECT s.studentid, s.name, er.marksobtained
--  FROM students s
--  JOIN examresults er ON s.studentid = er.
--  studentid
--  WHERE er.marksobtained >= 90;
 
 -- -- 2. Retrieve students in Department1 with scores above 80.
--  SELECT s.studentid, s.name, d.deptname, er.marksobtained
--  FROM students s
--  JOIN departments d ON s.deptid = d.deptid
--  JOIN examresults er ON s.studentid = er.studentid
--  WHERE d.deptname = 'MNC' AND er.marksobtained > 80;
 
 -- -- 3. Retrieve students between the ages of 20 and 25.
--  SELECT studentid, name, YEAR(CURDATE())- YEAR(dob) AS age
--  FROM students
--  WHERE YEAR(CURDATE())- YEAR(dob) BETWEEN 20 AND 25;
 
 -- -- 4. Retrieve students with a score less than or equal to 60.
--  SELECT s.studentid, s.name, er.marksobtained
--  FROM students s
--  JOIN examresults er ON s.studentid = er.studentid
--  WHERE er.marksobtained <= 60;
 
 -- -- 5. Retrieve students not named “your name”.
--  SELECT studentid, name
--  FROM students
--  WHERE name <> 'Rahul';
 
 
-- -- Question 3: Logical Operators


 -- -- 1. Retrieve students who are both older than 18 and have a score greater than 90.
--  SELECT s.studentid, s.name, er.marksobtained
--  FROM students s
--  JOIN examresults er ON s.studentid = er.studentid
--  WHERE (YEAR(CURDATE())- YEAR(dob)) > 18 AND er.marksobtained > 90;
 
 -- -- 2. Retrieve students who are either older than 25 or have a score greater than 95.
--  SELECT s.studentid, s.name, er.marksobtained
--  FROM students s
--  JOIN examresults er ON s.studentid = er.studentid
--  WHERE (YEAR(CURDATE())- YEAR(dob)) > 25 OR er.marksobtained > 95;
 
 -- -- 3. Retrieve students who have a score greater than 80 and are not older than 25.
--  SELECT s.studentid, s.name, er.marksobtained
--  FROM students s
--  JOIN examresults er ON s.studentid = er.studentid
--  WHERE er.marksobtained > 80 AND (YEAR(CURDATE())- YEAR(dob)) <= 25;
 
 -- -- 4. Retrieve students whose name starts with “first letter of your name”.
--  SELECT studentid, name
--  FROM students
--  WHERE name LIKE 'R%';
 
 -- -- 5. Retrieve students who have scores between 70 and 90 (inclusive).
--  SELECT s.studentid, s.name, er.marksobtained
--  FROM students s
--  JOIN examresults er ON s.studentid = er.studentid
--  WHERE er.marksobtained BETWEEN 70 AND 90;
 
-- -- 6. Retrieve students who have no assigned department.
--  SELECT studentid, name
--  FROM students
--  WHERE deptid IS NULL;
 
 -- -- 7. Retrieve students who belong to a department.
--  SELECT studentid, name, deptid
--  FROM students
--  WHERE deptid IS NOT NULL

                                           -- -- Assignment 5 - Advanced SQL Clauses 
                                           
-- Q1. Using DISTINCT

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




-- 
