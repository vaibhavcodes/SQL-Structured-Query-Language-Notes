-- Details of content in this file: 
/*
1. Applying `where` clause to filter the row
		1.1. When filter condition is case-insensitive
        1.2. When filter condition is case-sensitive: Using `binary` keyword
2. Alias keyword
3. Update statement
        3.1. Updating based on filter
        3.2. Updating for the whole table
        3.3. Updating a value of a column by adding some value to that column
4. Delete statement
        4.1. Delete all data from the table.ALTER
        4.2. Delete some specified rows.
5. Alter statement
        5.1. Adding of a new column to a table
        5.2. Dropping of a column from a table
        5.3. Changing the data type of a column
        5.4. Dropping a primary key
        5.5. Adding a primary key        
6. DDL vs DML
7. Truncate vs Delete
*/

-- ====================================================================================================
/* For further tasks: */

-- Creation of Employee Table:
> CREATE TABLE Employee(
    id int PRIMARY KEY,
    firstname varchar(20) NOT NULL,
    middlename varchar(20),
    lastname varchar(20) NOT NULL,
    age int NOT NULL,
    salary int NOT NULL,
    location varchar(20) NOT NULL DEFAULT 'Manchester'
    );
    
-- Inserting 3 records into Employee table
> INSERT INTO Employee (id, firstname, lastname, age, salary) VALUES
	(1, 'Ross', 'Geller', 24, 10000),
    (2, 'Phoebe', 'Buffet', 26, 20000),
    (3, 'Jennifer', 'Aniston', 32, 30000);
    
-- ====================================================================================================
 
-- 1. Applying `where` clause to filter the rows 

/* Getting employees whose age is greater than 25 */
> SELECT * from Employee where age >25;
+----+-----------+------------+----------+-----+--------+------------+
| id | firstname | middlename | lastname | age | salary | location   |
+----+-----------+------------+----------+-----+--------+------------+
|  2 | Phoebe    | NULL       | Buffet   |  26 |  20000 | Manchester |
|  3 | Jennifer  | NULL       | Aniston  |  32 |  30000 | Manchester |
+----+-----------+------------+----------+-----+--------+------------+
2 rows in set (0.00 sec)

-- 1.1. When filter condition is case-insensitive
> SELECT * FROM Employee where firstname = 'ross';
+----+-----------+------------+----------+-----+--------+------------+
| id | firstname | middlename | lastname | age | salary | location   |
+----+-----------+------------+----------+-----+--------+------------+
|  1 | Ross      | NULL       | Geller   |  24 |  10000 | Manchester |
+----+-----------+------------+----------+-----+--------+------------+
1 row in set (0.00 sec)

/* As can be seen from above that even though in the filter condition the condition states
to find 'ross' which starts with lowercase letter 'r' but still without considering that a row
is fetched where name starts with capital letter. 

NOTE: Thus, by default "where clause is case-insensitive".

To make it case-sensitive we will make use of 'binary' keyword as shown in next case */

-- 1.2. When filter condition is case-sensitive:
> SELECT * FROM Employee where binary firstname = 'ross';
Empty set (0.00 sec)

/* As entry in the table has capital 'R' so we got 0 rows in result */

> SELECT * FROM Employee where binary firstname = 'Ross';
+----+-----------+------------+----------+-----+--------+------------+
| id | firstname | middlename | lastname | age | salary | location   |
+----+-----------+------------+----------+-----+--------+------------+
|  1 | Ross      | NULL       | Geller   |  24 |  10000 | Manchester |
+----+-----------+------------+----------+-----+--------+------------+
1 row in set (0.00 sec)

/* Here we got 1 row in result as the entry in the data matches exactly with the filter condition case-sensitivise.  */

-- ====================================================================================================

-- 2. Alias keyword

/* Suppose in result instead of firstname we wants Name as column name and instead of lastname
we want Surname as a column name */

> SELECT firstname as Name, lastname as Surname from Employee;
+----------+---------+
| Name     | Surname |
+----------+---------+
| Ross     | Geller  |
| Phoebe   | Buffet  |
| Jennifer | Aniston |
+----------+---------+
3 rows in set (0.00 sec)

-- ====================================================================================================

-- 3. Update statement:

-- 3.1. Updating based on filter
/* Updating the lastname of Ross to Bing */
> UPDATE Employee SET lastname = 'Bing' where firstname = 'Ross';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

/* Checking if the above updation has occured or not */
> SELECT * from Employee;
+----+-----------+------------+----------+-----+--------+------------+
| id | firstname | middlename | lastname | age | salary | location   |
+----+-----------+------------+----------+-----+--------+------------+
|  1 | Ross      | NULL       | Bing     |  24 |  10000 | Manchester |
|  2 | Phoebe    | NULL       | Buffet   |  26 |  20000 | Manchester |
|  3 | Jennifer  | NULL       | Aniston  |  32 |  30000 | Manchester |
+----+-----------+------------+----------+-----+--------+------------+
3 rows in set (0.00 sec)

/* NOTE: If no "where" clause is put, then update would happen for the whole table */

-- 3.2. Updating fro the whole table

-- Changing all location to London
> UPDATE Employee SET location = 'London';
Query OK, 3 rows affected (0.01 sec)

/* Checking if the above updation has occured or not */
> SELECT * from Employee;
+----+-----------+------------+----------+-----+--------+----------+
| id | firstname | middlename | lastname | age | salary | location |
+----+-----------+------------+----------+-----+--------+----------+
|  1 | Ross      | NULL       | Bing     |  24 |  10000 | London   |
|  2 | Phoebe    | NULL       | Buffet   |  26 |  20000 | London   |
|  3 | Jennifer  | NULL       | Aniston  |  32 |  30000 | London   |
+----+-----------+------------+----------+-----+--------+----------+
3 rows in set (0.00 sec)

-- 3.3. Updating a value of a column by adding some value to that column
> UPDATE Employee SET salary = salary + 100 where firstname = 'Phoebe' and age = 26;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

/* Checking if the above updation has occured or not */
> SELECT * from Employee;
+----+-----------+------------+----------+-----+--------+----------+
| id | firstname | middlename | lastname | age | salary | location |
+----+-----------+------------+----------+-----+--------+----------+
|  1 | Ross      | NULL       | Bing     |  24 |  10000 | London   |
|  2 | Phoebe    | NULL       | Buffet   |  26 |  20100 | London   |
|  3 | Jennifer  | NULL       | Aniston  |  32 |  30000 | London   |
+----+-----------+------------+----------+-----+--------+----------+
3 rows in set (0.00 sec)

-- ====================================================================================================

-- 4. Delete statement:

-- 4.1. To delete all records from a table
> DELETE from Employee;

-- 4.2. To delete a specified record from a table
> DELETE from Employee where id = 2;

-- ====================================================================================================

-- 5. Alter statement: Used to alter the schema of the table.

/* NOTE:
Update deals with the data manipulation,
			and 
Alter deals with the table structure manipulation. 
*/

-- 5.1. Adding a column 'project' to the table Employee:
> ALTER TABLE Employee ADD COLUMN project varchar(50);
Query OK, 0 rows affected (0.23 sec)
Records: 0  Duplicates: 0  Warnings: 0

/* Checking if the above alteration has occured or not */
> DESC Employee;
+------------+-------------+------+-----+------------+-------+
| Field      | Type        | Null | Key | Default    | Extra |
+------------+-------------+------+-----+------------+-------+
| id         | int(11)     | NO   | PRI | NULL       |       |
| firstname  | varchar(20) | NO   |     | NULL       |       |
| middlename | varchar(20) | YES  |     | NULL       |       |
| lastname   | varchar(20) | NO   |     | NULL       |       |
| age        | int(11)     | NO   |     | NULL       |       |
| salary     | int(11)     | NO   |     | NULL       |       |
| location   | varchar(20) | NO   |     | Manchester |       |
| project    | varchar(50) | YES  |     | NULL       |       |
+------------+-------------+------+-----+------------+-------+
8 rows in set (0.00 sec)


-- 5.2. Dropping the above created 'project' column from the Employee table:
> ALTER TABLE Employee DROP COLUMN project;
Query OK, 0 rows affected (0.31 sec)
Records: 0  Duplicates: 0  Warnings: 0

/* Checking if the above alteration has occured or not */
> DESC Employee;
+------------+-------------+------+-----+------------+-------+
| Field      | Type        | Null | Key | Default    | Extra |
+------------+-------------+------+-----+------------+-------+
| id         | int(11)     | NO   | PRI | NULL       |       |
| firstname  | varchar(20) | NO   |     | NULL       |       |
| middlename | varchar(20) | YES  |     | NULL       |       |
| lastname   | varchar(20) | NO   |     | NULL       |       |
| age        | int(11)     | NO   |     | NULL       |       |
| salary     | int(11)     | NO   |     | NULL       |       |
| location   | varchar(20) | NO   |     | Manchester |       |
+------------+-------------+------+-----+------------+-------+
7 rows in set (0.00 sec)


-- 5.3. Altering the data type of 'firstname' column from varchar(20) to varchar(35)
> ALTER TABLE Employee MODIFY COLUMN firstname varchar(35);
Query OK, 0 rows affected (0.24 sec)
Records: 0  Duplicates: 0  Warnings: 0

/* Checking if the above alteration has occured or not */
> DESC Employee;
+------------+-------------+------+-----+------------+-------+
| Field      | Type        | Null | Key | Default    | Extra |
+------------+-------------+------+-----+------------+-------+
| id         | int(11)     | NO   | PRI | NULL       |       |
| firstname  | varchar(35) | YES  |     | NULL       |       |
| middlename | varchar(20) | YES  |     | NULL       |       |
| lastname   | varchar(20) | NO   |     | NULL       |       |
| age        | int(11)     | NO   |     | NULL       |       |
| salary     | int(11)     | NO   |     | NULL       |       |
| location   | varchar(20) | NO   |     | Manchester |       |
+------------+-------------+------+-----+------------+-------+
7 rows in set (0.00 sec)

-- 5.4. Dropping column 'id' as the primary key
> ALTER TABLE Employee DROP primary key;
Query OK, 3 rows affected (0.26 sec)
Records: 3  Duplicates: 0  Warnings: 0

/* Checking if the above alteration has occured or not */
> DESC Employee;
+------------+-------------+------+-----+------------+-------+
| Field      | Type        | Null | Key | Default    | Extra |
+------------+-------------+------+-----+------------+-------+
| id         | int(11)     | NO   |     | NULL       |       |
| firstname  | varchar(35) | YES  |     | NULL       |       |
| middlename | varchar(20) | YES  |     | NULL       |       |
| lastname   | varchar(20) | NO   |     | NULL       |       |
| age        | int(11)     | NO   |     | NULL       |       |
| salary     | int(11)     | NO   |     | NULL       |       |
| location   | varchar(20) | NO   |     | Manchester |       |
+------------+-------------+------+-----+------------+-------+
7 rows in set (0.00 sec)


-- 5.5. Adding a Primary Key
> ALTER TABLE Employee ADD primary key(id);
Query OK, 0 rows affected (0.33 sec)
Records: 0  Duplicates: 0  Warnings: 0

/* Checking if the above alteration has occured or not */
> DESC Employee;
+------------+-------------+------+-----+------------+-------+
| Field      | Type        | Null | Key | Default    | Extra |
+------------+-------------+------+-----+------------+-------+
| id         | int(11)     | NO   | PRI | NULL       |       |
| firstname  | varchar(35) | YES  |     | NULL       |       |
| middlename | varchar(20) | YES  |     | NULL       |       |
| lastname   | varchar(20) | NO   |     | NULL       |       |
| age        | int(11)     | NO   |     | NULL       |       |
| salary     | int(11)     | NO   |     | NULL       |       |
| location   | varchar(20) | NO   |     | Manchester |       |
+------------+-------------+------+-----+------------+-------+
7 rows in set (0.00 sec)


-- ====================================================================================================

-- 6. DDL vs DML:
/*
DDL: Data Definition Language :-> Deals with the table structure : Create, Alter, Drop, Truncate
DML: Data Manipulation Language :-> Deals with the data directly : Insert, Update, Delete
*/

-- ====================================================================================================

-- 7. Truncate vs Delete:
/* Delete Operation: DML */
> DELETE from Employee;

/* Truncate operation: DDL */
> TRUNCATE table Employee;

/* 
Both DELETE and TRUNCATE removes all the records from table.

DELETE removes the record one by one from the table.
				WHERE AS
TRUNCATE internally drops the table and recreates it. Thus, it is fast as compared to DELETE.
*/
-- ====================================================================================================
