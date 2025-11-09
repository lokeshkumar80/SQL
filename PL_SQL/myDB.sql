-- Assignment 8 

-- (a) Install and configure the required edition of Oracle Database on your personal
-- system, along with Oracle SQL Developer. Establish a connection to the database and
-- verify access to your default schema. As part of the setup, create a table named students
-- with the following structure (this table will be reused in later questions):
-- roll no NUMBER
-- name VARCHAR2(30)
-- marks NUMBER
-- Confirm that the table is created successfully. Additionally, configure the environ
--ment to ensure proper execution of PL/SQL programs. This includes enabling output
-- functionality using the command SET SERVEROUTPUT ON and verifying that you have the
-- required privileges to execute PL/SQL blocks

SET SERVEROUTPUT ON;

---- 🗒️ Migration Notes
--Established connection between Oracle SQL Developer and MySQL Workbench.
--Configured:
--Source connection: DBMS LAB (MySQL)
--Destination connection: myDB (Oracle)
--Migrated all tables from UniversityDB in MySQL to myDB schema in Oracle.
--Successfully copied the following tables:
--attendance, bookissues, colleges, coursefaculty, courses,
--departments, enrollments, examresults, exams, faculty,
--hostelallotment, hostels, librarybooks, payments,
--programs, students.

--CREATE TABLE students (
--    roll_no NUMBER,
--    name    VARCHAR2(30),
--    marks   NUMBER
--);

--(b) Confirmsystem details by running the following commands within your environment
-- and recording their outputs:

SHOW USER
SHOW PARAMETERS

-- (c) Write and execute an anonymous PL/SQL block that displays a personalized welcome 
--message containing your full name, along with the current system date. Use
-- DBMS_OUTPUT.PUT_LINE to print the output.

BEGIN 
DBMS_OUTPUT.PUT_LINE('Welcome, user! The current system date is: ' || SYSDATE); 
END; 

-- (d) Prepare a portable setup script named setup user.sql that automates the creation
-- of a new schema named lab user with only the minimum required privileges. The script
-- should create the user lab user with appropriate credentials and grant only the essential
-- privileges, including:
-- CREATE SESSION
-- CREATE TABLE
-- EXECUTE on the DBMS
-- OUTPUT package

-- Create common user
CREATE USER C##newuser IDENTIFIED BY 12345;

-- Grant standard privileges
GRANT CONNECT, RESOURCE TO C##newuser;
GRANT CREATE SESSION TO C##newuser;
GRANT CREATE TABLE TO C##newuser;
GRANT EXECUTE ON DBMS_OUTPUT TO C##newuser;

-- Allow tablespace usage
ALTER USER C##newuser QUOTA UNLIMITED ON USERS;

-- Question 2: PL/SQL Basic Syntax and Block Structures

-- (a) Write an anonymous PL/SQL block that declares two variables: v name of type
-- VARCHAR2(30) and v age of type NUMBER. Assign meaningful values to these variables
-- and display their contents using DBMS_OUTPUT.PUT_LINE.

DECLARE
  v_name VARCHAR2(30) := 'John Doe';
  v_age  NUMBER := 25;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
  DBMS_OUTPUT.PUT_LINE('Age: ' || v_age);
END;

--(b) Extend the above block to include an EXCEPTION section. Use the construct
-- WHEN OTHERS to handle unexpected failures gracefully and print a custom error message
-- through DBMS_OUTPUT.PUT_LINE.

DECLARE
  v_name VARCHAR2(30) := 'John Doe';
  v_age  NUMBER := 25;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
  DBMS_OUTPUT.PUT_LINE('Age: ' || v_age);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An unexpected error occurred. Please check the code.');
END;

--(c) Construct a nested PL/SQL block where the outer block declares a variable and
-- passes it to the inner block. Within the inner block, shadow (re-declare) the same variable
-- and modify its value. Print both the outer variable and the inner variable values to
-- illustrate variable scoping and shadowing.

DECLARE
  v_scope_variable VARCHAR2(50) := 'I am the outer variable';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Outer Block (Before Inner): ' || v_scope_variable);
  
  DECLARE
    v_scope_variable VARCHAR2(50) := 'I am the inner variable';
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Inner Block: ' || v_scope_variable);
  END;
  
  DBMS_OUTPUT.PUT_LINE('Outer Block (After Inner): ' || v_scope_variable);
END;

--(d) Enhance the nested block by introducing input validation. If the inner variable
-- is assigned an invalid value (for example, a negative age), raise a controlled exception
-- using RAISE_APPLICATION_ERROR. Demonstrate the proper propagation and handling of
-- this error within the program.

DECLARE
  v_outer_age NUMBER := 30;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Outer block age is: ' || v_outer_age);
  
  DECLARE
    v_inner_age NUMBER;
  BEGIN
    v_inner_age := -5;
    
    IF v_inner_age < 0 THEN
      RAISE_APPLICATION_ERROR(-20001, 'Age cannot be negative.');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Inner block age is: ' || v_inner_age);
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error in inner block: ' || SQLERRM);
      RAISE;
  END;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error caught in outer block: ' || SQLERRM);
END;


--Question 3: Data Types and Type Anchoring

-- (a) Write a PL/SQL block that declares a variable using %TYPE, anchored to the students.name column. Insert a record into the students table using this anchored variable
-- and print the inserted record using DBMS_OUTPUT.PUT_LINE
-- (1094, 'Student94', '2000-09-20', 'M', 2020, 'student94@university.com', '+919876543303', 103,206);

DECLARE
  v_student_name students.name%TYPE;
BEGIN
  v_student_name := 'Student94';

  INSERT INTO students (StudentID, Name, DOB, Gender, AdmissionYear, EmailID, Phone, DeptID, ProgramID, Address)
  VALUES (1094,v_student_name,TO_DATE('2000-09-20', 'YYYY-MM-DD'),'M',2020,'student94@university.com','+919876543303',103,206,'Moradabad, Uttar Pradesh');

  COMMIT;

  DBMS_OUTPUT.PUT_LINE(
    'Inserted record: StudentID=1094, Name=' || v_student_name || ', DeptID=103'
  );
END;
/


-- (b) Declare a record variable using %ROWTYPE, anchored to the students table. Using
-- this record variable, insert at least three records into the table. Finally, explain why
-- %ROWTYPE is safer and more reliable when table structures evolve, for example, when
-- additional columns are introduced.

DECLARE
  v_student_record students%ROWTYPE;
BEGIN
  v_student_record.StudentID := 1095;
  v_student_record.Name    := 'Student95';
  v_student_record.DeptID   := 104;
  INSERT INTO students VALUES v_student_record;
  
  v_student_record.StudentID := 1096;
  v_student_record.Name    := 'Student96';
  v_student_record.DeptID   := 105;
  INSERT INTO students VALUES v_student_record;
  
  v_student_record.StudentID := 1097;
  v_student_record.name    := 'Student97';
  v_student_record.DeptID   := 106;
  INSERT INTO students VALUES v_student_record;
  
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Three records inserted into the students table using %ROWTYPE.');
END;

--Question 4: Variables, Constants, and Literals

-- (a) Write a PL/SQL block that declares a constant c pi CONSTANT NUMBER :=3.14159. 
--Accept a radius value from the user (or assign it within the code), compute the
-- area of a circle using this radius, and print the result.

DECLARE
  c_pi     CONSTANT NUMBER := 3.14159;
  v_radius NUMBER := 7;
  v_area   NUMBER;
BEGIN
  v_area := c_pi * (v_radius * v_radius);
  DBMS_OUTPUT.PUT_LINE('The radius is: ' || v_radius);
  DBMS_OUTPUT.PUT_LINE('The area of the circle is: ' || v_area);
END;

--(b) Design a PL/SQL block that simulates dynamic configuration parameters. Declare
-- a package-level constant in the package specification and body, and also declare a mutable
-- variable in the package body. Demonstrate that the constant cannot be modified, while
-- the variable can be changed across multiple executions, and show how the variable persists
-- at the session level.

CREATE OR REPLACE PACKAGE config_pkg AS
  g_app_version CONSTANT VARCHAR2(10) := '1.0';
  PROCEDURE set_session_timeout(p_timeout IN NUMBER);
  FUNCTION get_session_timeout RETURN NUMBER;
END config_pkg;
/

-- Step 2: Create the Package Body
CREATE OR REPLACE PACKAGE BODY config_pkg AS
  g_session_timeout NUMBER := 30;

  PROCEDURE set_session_timeout(p_timeout IN NUMBER) IS
  BEGIN
    g_session_timeout := p_timeout;
    DBMS_OUTPUT.PUT_LINE('Session timeout has been set to: ' || g_session_timeout || ' minutes.');
  END set_session_timeout;

  FUNCTION get_session_timeout RETURN NUMBER IS
  BEGIN
    RETURN g_session_timeout;
  END get_session_timeout;
END config_pkg;
/

-- Step 3: Demonstrate the package usage
BEGIN
  DBMS_OUTPUT.PUT_LINE('Application Version (Constant): ' || config_pkg.g_app_version);
  DBMS_OUTPUT.PUT_LINE('Default Session Timeout (Variable): ' || config_pkg.get_session_timeout() || ' minutes.');
  config_pkg.set_session_timeout(60);
  DBMS_OUTPUT.PUT_LINE('New Session Timeout (Variable): ' || config_pkg.get_session_timeout() || ' minutes.');
END;



-- ASSIGNMENT 9


--Question 1 – Conditional Student Insert
--  Write a PL/SQL block to insert a new student into the Students table only if:
--• The department exists in the Departments table.
--• The student’s email is not used by any student.
--Display an appropriate message in each case like(inserted successfully / department not
--found / email id already exists).

DECLARE
    dept_count  NUMBER;
    email_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO dept_count
    FROM Departments
    WHERE DeptID = 102;
    SELECT COUNT(*) INTO email_count
    FROM Students
    WHERE EmailID = 'vinit@iitjammu.ac.in';
    IF dept_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Department not found.');
    ELSIF email_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Email ID already exists.');
    ELSE
        INSERT INTO Students (StudentID, Name, DOB, Gender, DeptID, ProgramID,
                              AdmissionYear, Address, EmailID, Phone)
        VALUES (1097, 'Vinit Mehra', DATE '2004-09-17', 'M', 104, 207, 2022, 'Punjab', 'vinit@iitjammu.ac.in', '9998887774');
        DBMS_OUTPUT.PUT_LINE('Student inserted successfully.');
    END IF;
END;


--Question 2 – Update Faculty Email Domain
--Write a PL/SQL program to update all faculty email IDs so that the domain becomes
--@iitjammu.ac.in. Use a CURSOR and string manipulation functions.

DECLARE
    CURSOR c_faculty IS
        SELECT FacultyID, Email FROM faculty;
    v_local_part VARCHAR2(100);
    v_new_email  VARCHAR2(150);
BEGIN
    FOR rec IN c_faculty LOOP
        v_local_part := SUBSTR(rec.Email, 1, INSTR(rec.Email, '@') - 1);
        v_new_email  := v_local_part || '@iitjammu.ac.in';
        UPDATE faculty
        SET Email = v_new_email
        WHERE FacultyID = rec.FacultyID;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Faculty email domains updated to @iitjammu.ac.in.');
END;

--
--Question 3 – Delete Inactive Students
--Write a PL/SQL block to delete students from the Students Table who have not enrolled
--in any course in the Enrollments table. Display how many records were deleted.



--
--Question 4 – Calculate Average Marks per Course
--Write a PL/SQL block that computes the average marks obtained by students in each
--course from the ExamResults table and displays them.
--
--Question 5 – Conditional Grade Update
--Using IF-ELSE control statements, write a PL/SQL block that updates the grade in
--Enrollments based on each student’s average marks:
--• Grade A: Average ≥ 85
--• Grade B: Average ≥ 70
--• Grade C: Average ≥ 50
--• Grade F: Average < 50
--
--3
--
--Database Systems Lab PL/SQL Assignment
--
--Question 6 – Display Top Scoring Student per Course
--Write a PL/SQL program to display the student name who scored the highest marks in
--each course using nested SELECT queries.
--
--Question 7 – Bonus Marks for Department Students
--
--Add 5 marks to all students’ exam results who belong to the Computer Science depart-
--ment.
--
--Question 8 – Library Stock Check using Operators
--Write a PL/SQL block to list all books having fewer than 3 copies available and belonging
--to departments with an odd DeptID. Use arithmetic and comparison operators.
--
--Question 9 – Update Hostel Room Numbers
--Increase the room number of all students in hostel ID = 2 by 100. Use a cursor and
--arithmetic operators.
--
--Question 10 – Display Students Older Than Given Age
--Write a PL/SQL block to input an age (e.g., 21) and display all students whose age is
--greater than the input value using arithmetic and comparison operators on the date of
--birth.