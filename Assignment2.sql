-- -- Assignment 2

-- /*Question 01*/

CREATE DATABASE UniversityDB;

USE UniversityDB;

-- /*Question 02*/

CREATE TABLE Colleges(
CollegeID INT PRIMARY KEY,
    CollegeName VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Departments(
DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100) UNIQUE NOT NULL,
    CollegeID INT,
    FOREIGN KEY (CollegeID) REFERENCES Colleges(CollegeID),
    HOD VARCHAR(50)
);

CREATE TABLE Programs(
ProgramID INT PRIMARY KEY,
    ProgramName VARCHAR(50) NOT NULL,
    DegreeType VARCHAR(50),
    DeptID INT,
    FOREIGN KEY(DeptID) REFERENCES  Departments(DeptID)
);
create table Faculty (
    FacultyID int primary key, 
    Name varchar(100) not null, 
    DeptID int, 
    foreign key (DeptID) references Departments(DeptID), 
    Designation varchar(50), 
    HireDate date, 
    Email varchar(100) unique, 
    Phone varchar(15) unique
);
CREATE TABLE Students(
StudentID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    DOB DATE,
    Gender CHAR(1) CHECK (Gender IN ('M','F','O')),
    AdmissionYear INT,
    CHECK(AdmissionYear>=2000),
    EmailID VARCHAR(50) UNIQUE,
    Phone VARCHAR(15) UNIQUE,
    DeptID INT,
    ProgramID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID),
    FOREIGN KEY (ProgramID) REFERENCES Programs(ProgramID)
);

-- /*Question 03 - Part 01*/

INSERT INTO Colleges VALUES(1,"Science College");
INSERT INTO Colleges VALUES(2,"IIT College");
INSERT INTO Colleges VALUES(3,"Arts College");
INSERT INTO Colleges VALUES(4,"Law University");
INSERT INTO Colleges VALUES(5,"NIFT");
INSERT INTO Colleges VALUES(6,"Lovely Professional University");
INSERT INTO Colleges VALUES(7,"Manipal University");
INSERT INTO Colleges VALUES(8,"IITJmu");
INSERT INTO Colleges VALUES(9,"Reyansh College");
INSERT INTO Colleges VALUES(10,"Galgotia University");

INSERT INTO Departments (DeptID, DeptName, CollegeID, HOD) VALUES
(101, "Computer Science", 1, 'Dr.Sharma'),
    (102, "MNC", 2, 'Dr.Bawane'),
    (103, "Electrical", 3, 'Dr.Anshak'),
    (104, "Materials", 4, 'Dr.Owais'),
    (105, "Civil", 5, 'Dr.Yadav'),
    (106, "Chemical", 6, 'Dr.Khullar'),
    (107, "Structual Eng.", 7, 'Dr.Mishra'),
    (108, "BBA", 8, 'Dr.Soni'),
    (109, "Physical Education", 9, 'Dr.Gupta'),
    (110, "HSS", 10, 'Dr.Suchak');

INSERT INTO Programs (ProgramID, ProgramName, DegreeType, DeptID) VALUES
(201, "DMS","B.Tech", 102),
    (202, "DBMS", "B.Tech", 102),
    (203, "Drawing", "B.Tech", 101),
    (204, "POM", "B.Tech", 103),
    (205, "ToAC", "B.Tech", 104),
    (206, "OS", "B.Tech", 105),
    (207, "Calculus", "B.Tech", 106),
    (208, "Chemistry", "B.Tech", 107),
    (209, "Biology","B.Tech", 108),
    (210, "Signal and System", "B.Tech", 109),
    (211, "Digital Design", "B.Tech", 110),
    (212, "Psychology", "B.Tech", 107),
    (213, "Game Theory", "B.Tech", 105),
    (214, "Computer Architecture", "B.Tech", 108),
    (215, "PPL", "B.Tech", 104);

INSERT INTO Students (StudentID, Name, DOB, Gender, AdmissionYear, EmailID, Phone, DeptID, ProgramID) VALUES
(1001, 'Student1', '1998-05-14', 'M', 2017, 'student1@university.com', '+919876543210', 101, 203),
(1002, 'Student2', '2000-11-23', 'F', 2019, 'student2@university.com', '+919876543211', 102, 201),
(1003, 'Student3', '1999-07-08', 'M', 2018, 'student3@university.com', '+919876543212', 102, 202),
(1004, 'Student4', '1997-03-19', 'F', 2016, 'student4@university.com', '+919876543213', 103, 204),
(1005, 'Student5', '2001-09-30', 'O', 2020, 'student5@university.com', '+919876543214', 104, 205),
(1006, 'Student6', '1996-01-11', 'M', 2015, 'student6@university.com', '+919876543215', 105, 206),
(1007, 'Student7', '1995-12-25', 'F', 2014, 'student7@university.com', '+919876543216', 106, 207),
(1008, 'Student8', '2000-06-07', 'M', 2019, 'student8@university.com', '+919876543217', 107, 208),
(1009, 'Student9', '2002-08-15', 'F', 2021, 'student9@university.com', '+919876543218', 108, 209),
(1010, 'Student10', '1998-10-04', 'M', 2017, 'student10@university.com', '+919876543219', 109, 210),
(1011, 'Student11', '1999-11-22', 'F', 2018, 'student11@university.com', '+919876543220', 110, 211),
(1012, 'Student12', '2001-04-03', 'O', 2020, 'student12@university.com', '+919876543221', 107, 212),
(1013, 'Student13', '1997-05-29', 'M', 2016, 'student13@university.com', '+919876543222', 105, 213),
(1014, 'Student14', '1996-02-17', 'F', 2015, 'student14@university.com', '+919876543223', 108, 214),
(1015, 'Student15', '2003-09-12', 'M', 2022, 'student15@university.com', '+919876543224', 104, 215),
(1016, 'Student16', '1998-01-25', 'F', 2017, 'student16@university.com', '+919876543225', 101, 203),
(1017, 'Student17', '2002-07-19', 'M', 2021, 'student17@university.com', '+919876543226', 102, 201),
(1018, 'Student18', '2000-03-28', 'F', 2019, 'student18@university.com', '+919876543227', 102, 202),
(1019, 'Student19', '1999-09-09', 'O', 2018, 'student19@university.com', '+919876543228', 103, 204),
(1020, 'Student20', '2001-06-16', 'M', 2020, 'student20@university.com', '+919876543229', 104, 205),
(1021, 'Student21', '1998-12-12', 'F', 2017, 'student21@university.com', '+919876543230', 105, 206),
(1022, 'Student22', '1997-07-27', 'M', 2016, 'student22@university.com', '+919876543231', 106, 207),
(1023, 'Student23', '2000-08-02', 'F', 2019, 'student23@university.com', '+919876543232', 107, 208),
(1024, 'Student24', '2002-10-21', 'M', 2021, 'student24@university.com', '+919876543233', 108, 209),
(1025, 'Student25', '1999-02-18', 'F', 2018, 'student25@university.com', '+919876543234', 109, 210),
(1026, 'Student26', '1998-11-05', 'M', 2017, 'student26@university.com', '+919876543235', 110, 211),
(1027, 'Student27', '2001-01-22', 'O', 2020, 'student27@university.com', '+919876543236', 107, 212),
(1028, 'Student28', '1996-03-14', 'M', 2015, 'student28@university.com', '+919876543237', 105, 213),
(1029, 'Student29', '1997-09-01', 'F', 2016, 'student29@university.com', '+919876543238', 108, 214),
(1030, 'Student30', '2003-04-25', 'M', 2022, 'student30@university.com', '+919876543239', 104, 215),
(1031, 'Student31', '1998-02-11', 'F', 2017, 'student31@university.com', '+919876543240', 101, 203),
(1032, 'Student32', '1999-06-19', 'M', 2018, 'student32@university.com', '+919876543241', 102, 201),
(1033, 'Student33', '2000-09-27', 'F', 2019, 'student33@university.com', '+919876543242', 102, 202),
(1034, 'Student34', '1997-04-07', 'M', 2016, 'student34@university.com', '+919876543243', 103, 204),
(1035, 'Student35', '2001-01-18', 'F', 2020, 'student35@university.com', '+919876543244', 104, 205),
(1036, 'Student36', '1998-08-29', 'M', 2017, 'student36@university.com', '+919876543245', 105, 206),
(1037, 'Student37', '1996-10-02', 'F', 2015, 'student37@university.com', '+919876543246', 106, 207),
(1038, 'Student38', '2000-12-14', 'M', 2019, 'student38@university.com', '+919876543247', 107, 208),
(1039, 'Student39', '2002-06-22', 'F', 2021, 'student39@university.com', '+919876543248', 108, 209),
(1040, 'Student40', '1999-03-03', 'M', 2018, 'student40@university.com', '+919876543249', 109, 210),
(1041, 'Student41', '1998-07-15', 'O', 2017, 'student41@university.com', '+919876543250', 110, 211),
(1042, 'Student42', '2001-09-09', 'M', 2020, 'student42@university.com', '+919876543251', 107, 212),
(1043, 'Student43', '1996-11-23', 'F', 2015, 'student43@university.com', '+919876543252', 105, 213),
(1044, 'Student44', '1997-05-30', 'M', 2016, 'student44@university.com', '+919876543253', 108, 214),
(1045, 'Student45', '2003-01-27', 'F', 2022, 'student45@university.com', '+919876543254', 104, 215),
(1046, 'Student46', '1998-10-20', 'M', 2017, 'student46@university.com', '+919876543255', 101, 203),
(1047, 'Student47', '1999-01-11', 'F', 2018, 'student47@university.com', '+919876543256', 102, 201),
(1048, 'Student48', '2000-03-06', 'M', 2019, 'student48@university.com', '+919876543257', 102, 202),
(1049, 'Student49', '1997-07-14', 'F', 2016, 'student49@university.com', '+919876543258', 103, 204),
(1050, 'Student50', '2001-12-18', 'M', 2020, 'student50@university.com', '+919876543259', 104, 205),
(1051, 'Student51', '1998-04-09', 'F', 2017, 'student51@university.com', '+919876543260', 105, 206),
(1052, 'Student52', '1996-09-28', 'M', 2015, 'student52@university.com', '+919876543261', 106, 207),
(1053, 'Student53', '2000-05-19', 'F', 2019, 'student53@university.com', '+919876543262', 107, 208),
(1054, 'Student54', '2002-08-03', 'M', 2021, 'student54@university.com', '+919876543263', 108, 209),
(1055, 'Student55', '1999-02-07', 'F', 2018, 'student55@university.com', '+919876543264', 109, 210),
(1056, 'Student56', '1998-11-14', 'M', 2017, 'student56@university.com', '+919876543265', 110, 211),
(1057, 'Student57', '2001-01-25', 'O', 2020, 'student57@university.com', '+919876543266', 107, 212),
(1058, 'Student58', '1996-02-18', 'M', 2015, 'student58@university.com', '+919876543267', 105, 213),
(1059, 'Student59', '1997-08-22', 'F', 2016, 'student59@university.com', '+919876543268', 108, 214),
(1060, 'Student60', '2003-05-11', 'M', 2022, 'student60@university.com', '+919876543269', 104, 215),
(1061, 'Student61', '1998-01-17', 'F', 2017, 'student61@university.com', '+919876543270', 101, 203),
(1062, 'Student62', '1999-06-29', 'M', 2018, 'student62@university.com', '+919876543271', 102, 201),
(1063, 'Student63', '2000-09-15', 'F', 2019, 'student63@university.com', '+919876543272', 102, 202),
(1064, 'Student64', '1997-04-21', 'M', 2016, 'student64@university.com', '+919876543273', 103, 204),
(1065, 'Student65', '2001-01-09', 'F', 2020, 'student65@university.com', '+919876543274', 104, 205),
(1066, 'Student66', '1998-08-24', 'M', 2017, 'student66@university.com', '+919876543275', 105, 206),
(1067, 'Student67', '1996-10-10', 'F', 2015, 'student67@university.com', '+919876543276', 106, 207),
(1068, 'Student68', '2000-12-02', 'M', 2019, 'student68@university.com', '+919876543277', 107, 208),
(1069, 'Student69', '2002-06-19', 'F', 2021, 'student69@university.com', '+919876543278', 108, 209),
(1070, 'Student70', '1999-03-13', 'M', 2018, 'student70@university.com', '+919876543279', 109, 210),
(1071, 'Student71', '1998-07-23', 'F', 2017, 'student71@university.com', '+919876543280', 110, 211),
(1072, 'Student72', '2001-09-05', 'M', 2020, 'student72@university.com', '+919876543281', 107, 212),
(1073, 'Student73', '1996-11-28', 'F', 2015, 'student73@university.com', '+919876543282', 105, 213),
(1074, 'Student74', '1997-06-16', 'M', 2016, 'student74@university.com', '+919876543283', 108, 214),
(1075, 'Student75', '2003-02-13', 'F', 2022, 'student75@university.com', '+919876543284', 104, 215),
(1076, 'Student76', '1998-10-30', 'M', 2017, 'student76@university.com', '+919876543285', 101, 203),
(1077, 'Student77', '1999-01-07', 'F', 2018, 'student77@university.com', '+919876543286', 102, 201),
(1078, 'Student78', '2000-03-11', 'M', 2019, 'student78@university.com', '+919876543287', 102, 202),
(1079, 'Student79', '1997-07-25', 'F', 2016, 'student79@university.com', '+919876543288', 103, 204),
(1080, 'Student80', '2001-12-29', 'M', 2020, 'student80@university.com', '+919876543289', 104, 205),
(1081, 'Student81', '1998-04-13', 'F', 2017, 'student81@university.com', '+919876543290', 105, 206),
(1082, 'Student82', '1996-09-21', 'M', 2015, 'student82@university.com', '+919876543291', 106, 207),
(1083, 'Student83', '2000-05-15', 'F', 2019, 'student83@university.com', '+919876543292', 107, 208),
(1084, 'Student84', '2002-08-09', 'M', 2021, 'student84@university.com', '+919876543293', 108, 209),
(1085, 'Student85', '1999-02-02', 'F', 2018, 'student85@university.com', '+919876543294', 109, 210),
(1086, 'Student86', '1998-11-17', 'M', 2017, 'student86@university.com', '+919876543295', 110, 211),
(1087, 'Student87', '2001-01-27', 'O', 2020, 'student87@university.com', '+919876543296', 107, 212),
(1088, 'Student88', '1996-02-15', 'M', 2015, 'student88@university.com', '+919876543297', 105, 213),
(1089, 'Student89', '1997-08-30', 'F', 2016, 'student89@university.com', '+919876543298', 108, 214),
(1090, 'Student90', '2003-05-22', 'M', 2022, 'student90@university.com', '+919876543299', 104, 215),
(1091, 'Student91', '1998-01-21', 'F', 2017, 'student91@university.com', '+919876543300', 101, 203),
(1092, 'Student92', '1999-06-07', 'M', 2018, 'student92@university.com', '+919876543301', 102, 201),
(1093, 'Student93', '2000-09-20', 'F', 2019, 'student93@university.com', '+919876543302', 102,205);

-- /*Question 03 - Part 03*/

INSERT INTO Students VALUES (1094,'Student94', '2003-12-04','M',2016,'student93@university.com', '+919876543302',102,205);   /*Student with duplicate email and phone*/

INSERT INTO Departments VALUES (111,'Mathworks',11,'Dr.Manish');                                                             /*Department with non existing College ID*/

INSERT INTO Students VALUES (1095,'Student95', '2003-08-04','I',2016,'student95@university.com', '+919866543302',101,203);   /*Student with gender other than M,F,O*/

INSERT INTO Students VALUES (1096,'Student96', '1999-08-04','I',1999,'student96@university.com', '+919866544302',104,215);   /*Student with admission year before 2000*/

ALTER TABLE Students
ADD COLUMN Address VARCHAR(150);

UPDATE Students SET Address = 'Lucknow, Uttar Pradesh' WHERE StudentID = 1001;
UPDATE Students SET Address = 'Varanasi, Uttar Pradesh' WHERE StudentID = 1002;
UPDATE Students SET Address = 'Patna, Bihar' WHERE StudentID = 1003;
UPDATE Students SET Address = 'Gorakhpur, Uttar Pradesh' WHERE StudentID = 1004;
UPDATE Students SET Address = 'Muzaffarpur, Bihar' WHERE StudentID = 1005;
UPDATE Students SET Address = 'Prayagraj, Uttar Pradesh' WHERE StudentID = 1006;
UPDATE Students SET Address = 'Gaya, Bihar' WHERE StudentID = 1007;
UPDATE Students SET Address = 'Kanpur, Uttar Pradesh' WHERE StudentID = 1008;
UPDATE Students SET Address = 'Bhagalpur, Bihar' WHERE StudentID = 1009;
UPDATE Students SET Address = 'Noida, Uttar Pradesh' WHERE StudentID = 1010;
UPDATE Students SET Address = 'Darbhanga, Bihar' WHERE StudentID = 1011;
UPDATE Students SET Address = 'Agra, Uttar Pradesh' WHERE StudentID = 1012;
UPDATE Students SET Address = 'Sasaram, Bihar' WHERE StudentID = 1013;
UPDATE Students SET Address = 'Meerut, Uttar Pradesh' WHERE StudentID = 1014;
UPDATE Students SET Address = 'Siwan, Bihar' WHERE StudentID = 1015;
UPDATE Students SET Address = 'Jhansi, Uttar Pradesh' WHERE StudentID = 1016;
UPDATE Students SET Address = 'Chapra, Bihar' WHERE StudentID = 1017;
UPDATE Students SET Address = 'Bareilly, Uttar Pradesh' WHERE StudentID = 1018;
UPDATE Students SET Address = 'Hajipur, Bihar' WHERE StudentID = 1019;
UPDATE Students SET Address = 'Moradabad, Uttar Pradesh' WHERE StudentID = 1020;
UPDATE Students SET Address = 'Arrah, Bihar' WHERE StudentID = 1021;
UPDATE Students SET Address = 'Aligarh, Uttar Pradesh' WHERE StudentID = 1022;
UPDATE Students SET Address = 'Katihar, Bihar' WHERE StudentID = 1023;
UPDATE Students SET Address = 'Faizabad, Uttar Pradesh' WHERE StudentID = 1024;
UPDATE Students SET Address = 'Begusarai, Bihar' WHERE StudentID = 1025;
UPDATE Students SET Address = 'Saharanpur, Uttar Pradesh' WHERE StudentID = 1026;
UPDATE Students SET Address = 'Sitamarhi, Bihar' WHERE StudentID = 1027;
UPDATE Students SET Address = 'Etawah, Uttar Pradesh' WHERE StudentID = 1028;
UPDATE Students SET Address = 'Purnia, Bihar' WHERE StudentID = 1029;
UPDATE Students SET Address = 'Ballia, Uttar Pradesh' WHERE StudentID = 1030;
UPDATE Students SET Address = 'Motihari, Bihar' WHERE StudentID = 1031;
UPDATE Students SET Address = 'Rampur, Uttar Pradesh' WHERE StudentID = 1032;
UPDATE Students SET Address = 'Madhubani, Bihar' WHERE StudentID = 1033;
UPDATE Students SET Address = 'Firozabad, Uttar Pradesh' WHERE StudentID = 1034;
UPDATE Students SET Address = 'Nalanda, Bihar' WHERE StudentID = 1035;
UPDATE Students SET Address = 'Sultanpur, Uttar Pradesh' WHERE StudentID = 1036;
UPDATE Students SET Address = 'Samastipur, Bihar' WHERE StudentID = 1037;
UPDATE Students SET Address = 'Basti, Uttar Pradesh' WHERE StudentID = 1038;
UPDATE Students SET Address = 'Sitamarhi, Bihar' WHERE StudentID = 1039;
UPDATE Students SET Address = 'Banda, Uttar Pradesh' WHERE StudentID = 1040;
UPDATE Students SET Address = 'Aurangabad, Bihar' WHERE StudentID = 1041;
UPDATE Students SET Address = 'Deoria, Uttar Pradesh' WHERE StudentID = 1042;
UPDATE Students SET Address = 'Khagaria, Bihar' WHERE StudentID = 1043;
UPDATE Students SET Address = 'Ayodhya, Uttar Pradesh' WHERE StudentID = 1044;
UPDATE Students SET Address = 'Sheohar, Bihar' WHERE StudentID = 1045;
UPDATE Students SET Address = 'Azamgarh, Uttar Pradesh' WHERE StudentID = 1046;
UPDATE Students SET Address = 'Rohtas, Bihar' WHERE StudentID = 1047;
UPDATE Students SET Address = 'Mathura, Uttar Pradesh' WHERE StudentID = 1048;
UPDATE Students SET Address = 'Buxar, Bihar' WHERE StudentID = 1049;
UPDATE Students SET Address = 'Lucknow, Uttar Pradesh' WHERE StudentID = 1050;
UPDATE Students SET Address = 'Muzaffarpur, Bihar' WHERE StudentID = 1051;
UPDATE Students SET Address = 'Kanpur, Uttar Pradesh' WHERE StudentID = 1052;
UPDATE Students SET Address = 'Patna, Bihar' WHERE StudentID = 1053;
UPDATE Students SET Address = 'Gorakhpur, Uttar Pradesh' WHERE StudentID = 1054;
UPDATE Students SET Address = 'Gaya, Bihar' WHERE StudentID = 1055;
UPDATE Students SET Address = 'Varanasi, Uttar Pradesh' WHERE StudentID = 1056;
UPDATE Students SET Address = 'Darbhanga, Bihar' WHERE StudentID = 1057;
UPDATE Students SET Address = 'Agra, Uttar Pradesh' WHERE StudentID = 1058;
UPDATE Students SET Address = 'Sasaram, Bihar' WHERE StudentID = 1059;
UPDATE Students SET Address = 'Meerut, Uttar Pradesh' WHERE StudentID = 1060;
UPDATE Students SET Address = 'Chapra, Bihar' WHERE StudentID = 1061;
UPDATE Students SET Address = 'Jhansi, Uttar Pradesh' WHERE StudentID = 1062;
UPDATE Students SET Address = 'Siwan, Bihar' WHERE StudentID = 1063;
UPDATE Students SET Address = 'Noida, Uttar Pradesh' WHERE StudentID = 1064;
UPDATE Students SET Address = 'Hajipur, Bihar' WHERE StudentID = 1065;
UPDATE Students SET Address = 'Bareilly, Uttar Pradesh' WHERE StudentID = 1066;
UPDATE Students SET Address = 'Arrah, Bihar' WHERE StudentID = 1067;
UPDATE Students SET Address = 'Aligarh, Uttar Pradesh' WHERE StudentID = 1068;
UPDATE Students SET Address = 'Katihar, Bihar' WHERE StudentID = 1069;
UPDATE Students SET Address = 'Faizabad, Uttar Pradesh' WHERE StudentID = 1070;
UPDATE Students SET Address = 'Begusarai, Bihar' WHERE StudentID = 1071;
UPDATE Students SET Address = 'Saharanpur, Uttar Pradesh' WHERE StudentID = 1072;
UPDATE Students SET Address = 'Sitamarhi, Bihar' WHERE StudentID = 1073;
UPDATE Students SET Address = 'Etawah, Uttar Pradesh' WHERE StudentID = 1074;
UPDATE Students SET Address = 'Purnia, Bihar' WHERE StudentID = 1075;
UPDATE Students SET Address = 'Ballia, Uttar Pradesh' WHERE StudentID = 1076;
UPDATE Students SET Address = 'Motihari, Bihar' WHERE StudentID = 1077;
UPDATE Students SET Address = 'Rampur, Uttar Pradesh' WHERE StudentID = 1078;
UPDATE Students SET Address = 'Madhubani, Bihar' WHERE StudentID = 1079;
UPDATE Students SET Address = 'Firozabad, Uttar Pradesh' WHERE StudentID = 1080;
UPDATE Students SET Address = 'Nalanda, Bihar' WHERE StudentID = 1081;
UPDATE Students SET Address = 'Sultanpur, Uttar Pradesh' WHERE StudentID = 1082;
UPDATE Students SET Address = 'Samastipur, Bihar' WHERE StudentID = 1083;
UPDATE Students SET Address = 'Basti, Uttar Pradesh' WHERE StudentID = 1084;
UPDATE Students SET Address = 'Sitamarhi, Bihar' WHERE StudentID = 1085;
UPDATE Students SET Address = 'Banda, Uttar Pradesh' WHERE StudentID = 1086;
UPDATE Students SET Address = 'Aurangabad, Bihar' WHERE StudentID = 1087;
UPDATE Students SET Address = 'Deoria, Uttar Pradesh' WHERE StudentID = 1088;
UPDATE Students SET Address = 'Khagaria, Bihar' WHERE StudentID = 1089;
UPDATE Students SET Address = 'Ayodhya, Uttar Pradesh' WHERE StudentID = 1090;
UPDATE Students SET Address = 'Sheohar, Bihar' WHERE StudentID = 1091;
UPDATE Students SET Address = 'Azamgarh, Uttar Pradesh' WHERE StudentID = 1092;
UPDATE Students SET Address = 'Rohtas, Bihar' WHERE StudentID = 1093;



-- /*Output of some select queries*/

SELECT Name,AdmissionYear From Students where Gender = 'M';

SELECT DeptID,DeptName From Departments where HOD = 'Dr.Mishra';
-- 
