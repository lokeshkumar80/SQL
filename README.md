# The Ultimate SQL Tutorial

A detailed walkthrough of MySQL—from installation to advanced SQL features—based on the blog post by CodeWithHarry. Updated: July 13, 2025. ([codewithharry.com](https://www.codewithharry.com/blogpost/the-ultimate-sql-course?utm_source=chatgpt.com))

---

##  Table of Contents

1. [Overview](#overview)  
2. [Installing MySQL](#installing-mysql)  
   - Windows / macOS  
   - Linux (Ubuntu)  
3. [Getting Started with MySQL](#getting-started-with-mysql)  
   - What is a Database?  
   - Creating a Database  
   - Creating Tables  
   - Dropping a Database  
   - Data Types & Constraints  
4. [Working with Tables](#working-with-tables)  
   - Selecting Data  
   - Renaming Tables  
   - Altering Tables  
5. [Inserting Data](#inserting-data)  
6. [Advanced SQL Concepts](#advanced-sql-concepts)  
   - Foreign Keys  
   - Joins (INNER, Self JOIN)  
   - Views  
   - Indexes  
   - Subqueries  
   - Stored Procedures & Triggers  
7. [Reference](#reference)

---

## Overview

MySQL is a relational **Database Management System (DBMS)** that manages data, facilitating operations like creation, retrieval, updating, and deletion. Knowledge of one DBMS makes transitioning to others easier.

---

## Installing MySQL

### Windows / macOS

Steps:
1. Download from the official MySQL site.  
2. Run the installer; choose **Developer Default**.  
3. Set a **root password** when prompted.  
4. (Optional) Install **MySQL Workbench**—a powerful graphical tool for modeling, executing SQL, and administrative tasks.

### Linux (Ubuntu)

```
sudo apt update
sudo apt install mysql-server
sudo mysql_secure_installation
```

**Create a user:**
```sql
sudo mysql
CREATE USER 'username'@'localhost' IDENTIFIED BY 'yourpassword';
GRANT ALL PRIVILEGES ON *.* TO 'username'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EXIT;
mysql -u harry -p  # then enter the password
```
> Replace `'yourpassword'` with a strong, secure password in production.
---

## Getting Started with MySQL

### What is a Database?

- **Analogy:** Database = Folder, Table = File, Row = File Content  
- **Excel Analogy:** Database = Workbook, Table = Sheet, Row = Spreadsheet Row.
### Create a Database
```sql
CREATE DATABASE startersql;
USE startersql;
```

### Create a Table
```sql
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  gender ENUM('Male','Female','Other'),
  date_of_birth DATE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Drop a Database
```sql
DROP DATABASE startersql;
```
> Use with caution as this deletes all data.

### Data Types & Constraints

- **Data Types:** `INT`, `VARCHAR`, `ENUM`, `DATE`, `TIMESTAMP`, `BOOLEAN`, `DECIMAL(x,y)` (exact numeric)  
- **Constraints:** `AUTO_INCREMENT`, `PRIMARY KEY`, `NOT NULL`, `UNIQUE`, `DEFAULT` values.

---

## Working with Tables

### Selecting Data

```sql
SELECT * FROM users;
SELECT name, email FROM users;
```

### Renaming Tables

```sql
RENAME TABLE users TO customers;
RENAME TABLE customers TO users;
```

### Altering Tables

- **Add Column:**
  ```sql
  ALTER TABLE users ADD COLUMN is_active BOOLEAN DEFAULT TRUE;
  ```
- **Drop Column:**
  ```sql
  ALTER TABLE users DROP COLUMN is_active;
  ```
- **Modify Column:**
  ```sql
  ALTER TABLE users MODIFY COLUMN name VARCHAR(150);
  ```
- **Reorder Columns:**
  ```sql
  ALTER TABLE users MODIFY COLUMN email VARCHAR(100) FIRST;
  ALTER TABLE users MODIFY COLUMN gender ENUM('Male','Female','Other') AFTER name;
  ``` ([codewithharry.com](https://www.codewithharry.com/blogpost/the-ultimate-sql-course?utm_source=chatgpt.com)).

---

## Inserting Data

- **Full Insert:**
  ```sql
  INSERT INTO users VALUES (1, 'Alice', 'alice@example.com', 'Female', '1995‑05‑14', DEFAULT);
  ```
  > Less flexible for schema changes.

- **Column-Specified Insert (preferred):**
  ```sql
  INSERT INTO users (name, email, gender, date_of_birth)
  VALUES ('Bob', 'bob@example.com', 'Male', '1990‑11‑23');
  ```
- **Insert Multiple Rows:**
  ```sql
  INSERT INTO users (name, email, gender, date_of_birth)
  VALUES
    ('Charlie', 'charlie@example.com', 'Other', '1988‑02‑17'),
    ('David', 'david@example.com', 'Male', '2000‑08‑09'),
    ('Eva', 'eva@example.com', 'Female', '1993‑12‑30');
  ``` ([codewithharry.com](https://www.codewithharry.com/blogpost/the-ultimate-sql-course?utm_source=chatgpt.com)).

---

## Advanced SQL Concepts

### Foreign Keys

Create relational integrity:
```sql
CREATE TABLE addresses (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  street VARCHAR(255),
  city VARCHAR(100),
  state VARCHAR(100),
  pincode VARCHAR(10),
  FOREIGN KEY (user_id) REFERENCES users(id)
);
```

- Add name using constraint:
  ```sql
  ALTER TABLE addresses
  ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;
  ```
- Drop foreign key:
  ```sql
  ALTER TABLE addresses DROP FOREIGN KEY fk_user;
  ``` ([codewithharry.com](https://www.codewithharry.com/blogpost/the-ultimate-sql-course?utm_source=chatgpt.com)).

### Joins

- **INNER JOIN:**
  ```sql
  SELECT users.name, addresses.city
  FROM users
  INNER JOIN addresses ON users.id = addresses.user_id;
  ```
- **Self JOIN:**
  ```sql
  SELECT a.id, a.name AS user_name, b.name AS referred_by
  FROM users a
  LEFT JOIN users b ON a.referred_by_id = b.id;
  ``` ([codewithharry.com](https://www.codewithharry.com/blogpost/the-ultimate-sql-course?utm_source=chatgpt.com)).

### Views

Virtual tables:
```sql
CREATE VIEW high_salary_users AS
SELECT id, name, salary FROM users WHERE salary > 70000;
SELECT * FROM high_salary_users;
``` ([codewithharry.com](https://www.codewithharry.com/blogpost/the-ultimate-sql-course?utm_source=chatgpt.com)).

### Indexes

Optimize query performance:
```sql
CREATE INDEX idx_gender_salary ON users(gender, salary);
DROP INDEX idx_email ON users;
```  
Usage must match column order in the index.
### Subqueries

```sql
SELECT id, name, salary
FROM users
WHERE salary > (SELECT AVG(salary) FROM users);

SELECT id, name, referred_by_id
FROM users
WHERE referred_by_id IN (SELECT id FROM users WHERE salary > 75000);
``` ([codewithharry.com](https://www.codewithharry.com/blogpost/the-ultimate-sql-course?utm_source=chatgpt.com)).

### Stored Procedures & Triggers

- **Stored Procedures:** Use `DELIMITER`, `CREATE PROCEDURE`, `CALL`, `DROP PROCEDURE` patterns.
- **Triggers:** Automatically run on events (`INSERT`, `UPDATE`, `DELETE`) with `BEFORE` or `AFTER` options. Useful for logging or enforcing business logic. ([codewithharry.com](https://www.codewithharry.com/blogpost/the-ultimate-sql-course?utm_source=chatgpt.com)).

---

## Reference

- Tutorial source: *The Ultimate SQL Tutorial* by CodeWithHarry — Updated July 13, 2025.  
  [Read the original blog post →](https://www.codewithharry.com/blogpost/the-ultimate-sql-course)
# SQL
