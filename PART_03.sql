-- Details of content in this file: 
/*
1. What's the use of a column to be declared as Primary Key?
2. Another syntax of creation of PRIMARY kEY.
3. What is Composite key?
4. Declaring a column as AUTO_INCREMENT
5. What's the use of a column to be declared as Unique?
*/

-- ====================================================================================================

-- 1. What's the use of a column to be declared as Primary Key?

/* 
Primary Key is used to uniquely identifies each record in a table.
A column declared as a primary key does not allow "NULL" and "Duplicacy".
A table can have only 1 primary key.

So, a CustomerID in a Customer table, EmployeeID in a Employee table, and RollNo in a class table are some
examples of the column which are declared as primary key.
*/

/* Employee Table Creation */
> CREATE TABLE employee(
    empId int PRIMARY KEY,
    firstname varchar(30),
    middlename varchar(30),
    lastname varchar(30),
    age int,
    salary int,
    location varchar(30)
    );
    
-- When Inserting two records with the same empId:
> INSERT INTO employee VALUES 
	(1, 'Olivia', 'Cockburn', 'Wilde', 35, 34000, 'San Francisco'),
	(1, 'Robert', 'Downey', 'Junior', 25, 55000, 'California');
ERROR 1062 (23000): Duplicate entry '1' for key 'PRIMARY'

/* As two employees can not have same EmployeeId so we are getting the error.*/

-- ====================================================================================================

-- 2. Another syntax of creation of PRIMARY KEY.

> CREATE TABLE employee(
    empId int,
    firstname varchar(30),
    middlename varchar(30),
    lastname varchar(30),
    age int,
    salary int,
    location varchar(30),
    PRIMARY KEY(empId)
    );

> DESC employee;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| empId      | int(11)     | NO   | PRI | NULL    |       |
| firstname  | varchar(30) | YES  |     | NULL    |       |
| middlename | varchar(30) | YES  |     | NULL    |       |
| lastname   | varchar(30) | YES  |     | NULL    |       |
| age        | int(11)     | YES  |     | NULL    |       |
| salary     | int(11)     | YES  |     | NULL    |       |
| location   | varchar(30) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

-- ====================================================================================================

-- 3. What is Composite key?
/* When two or more columns are used as a primary key to uniquely identifies a record in a table. */

-- Using a combination of firstname and lastname to uniquely identify records in a table
/* So now, no two employees can have same `firstname-lastname` concatenated value */
> CREATE TABLE employee(
    empId int,
    firstname varchar(30),
    lastname varchar(30),
    age int,
    PRIMARY KEY(firstname, lastname)
    );
Query OK, 0 rows affected (0.11 sec)

> DESC employee;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| empId     | int(11)     | YES  |     | NULL    |       |
| firstname | varchar(30) | NO   | PRI | NULL    |       |
| lastname  | varchar(30) | NO   | PRI | NULL    |       |
| age       | int(11)     | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

-- ====================================================================================================

-- 4. Declaring a column as AUTO_INCREMENT
/* Suppose a column contains value which increments in each record. If today you added any record and the value
to that column in the end record is 20, and you know the next record would contain 21 for this column. Now you 
come tomorrow and add a record but forgot the last value in that column. So, to prevent such thing, we make 
a column as AUTO_INCREMENT */

-- Creating `empId` column in `employee` table as AUTO_INCREMENT
> CREATE TABLE employee(
    empId int AUTO_INCREMENT,
    firstname varchar(30),
    middlename varchar(30),
    lastname varchar(30),
    age int,
    salary int,
    location varchar(30),
    PRIMARY KEY(empId)
    );

-- Adding first record in the table with empId AS 1
> INSERT INTO employee (empId, firstname, middlename, lastname, age, salary, location)
  VALUES (1, 'Olivia', 'Cockburn', 'Wilde', 35, 34000, 'San Francisco');

-- Adding another record but without putting the value for empId
> INSERT INTO employee (firstname, middlename, lastname, age, salary, location)
  VALUES ('Robert', 'Downey', 'Junior', 45, 89000, 'Texas');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM employee;
+-------+-----------+------------+----------+------+--------+---------------+
| empId | firstname | middlename | lastname | age  | salary | location      |
+-------+-----------+------------+----------+------+--------+---------------+
|     1 | Olivia    | Cockburn   | Wilde    |   35 |  34000 | San Francisco |
|     2 | Robert    | Downey     | Junior   |   45 |  89000 | Texas         |
+-------+-----------+------------+----------+------+--------+---------------+
2 rows in set (0.00 sec)

-- ====================================================================================================

-- 5. What's the use of a column to be declared as Unique?

/*
The purpose of defining any column or a combination of different columns as Unique is to ensure that we don't 
get any duplicacy, but a column defined as Unique can have any number of NULL values.

Also, any number of columns can be defined as Unique.

In short, we can have only 1 primary key column but any number of Unique key columns in a table.

Example: In a employee table: empId can be a Primary Key and emp_EmailId can be Unique.
*/

CREATE TABLE employee(
    empId int,
    firstname varchar(30),
    middlename varchar(30),
    lastname varchar(30),
    emailId varchar(30),
    age int,
    salary int,
    location varchar(30),
    PRIMARY KEY(empId),
    UNIQUE(emailId)
    );
    
> DESC employee;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| empId      | int(11)     | NO   | PRI | NULL    |       |
| firstname  | varchar(30) | YES  |     | NULL    |       |
| middlename | varchar(30) | YES  |     | NULL    |       |
| lastname   | varchar(30) | YES  |     | NULL    |       |
| emailId    | varchar(30) | YES  | UNI | NULL    |       |
| age        | int(11)     | YES  |     | NULL    |       |
| salary     | int(11)     | YES  |     | NULL    |       |
| location   | varchar(30) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

-- ====================================================================================================