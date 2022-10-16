-- Details of content in this file: mysql-ctl cli
/*
1. What is Database and Table?
2. Why do we need tables over excel spreadsheets then?
3. Types of databases
4. What is SQL?
5. To see all the databases connected to the mysql server.
6. To create a database.
7. To see the created `testDB` database.
8. Delete the created `testDB` database.
9. To see if the database `testDB` is deleted or not.
10. To get into testDB database, so that we can create table inside it.
11. To see in which database I am currently in.
12. Creation of table.
13. To see the structure of any table: We can use DESCRIBE or DES.
14.To see all the tables available under current database `testDB`.
15.To drop the created table.
16.Create a table without entering into the database.
*/

-- ====================================================================================================

-- 1. What is Database and Table?
/*
Database is a collection of data, which stores the data in form of tables.
Table stores the data in form of row and columns, and thus it can be compared to that of excel spreadsheet.
*/

-- ====================================================================================================

-- 2. Why do we need tables over excel spreadsheets then?
/*
If you consider a case of having 1000 spreadsheets and each sheet having approx 100000 data, then it 
would be very hard and cumbersome to deal with such a large amount of data. 

Also, with database, we will also get some other functionalities like capability to access our data and 
data manipulation to make our task easier.
*/

-- ====================================================================================================

-- 3. Types of Databases:
/*
There are 2 types of databases: Relational and Non-Relational

>> Relational Database: 
----> Data is stored in tables in form of rows and columns, and tables have relation between them. 
----> Example: MySQL, SQLServer, SQLite, PostgreSQL, MariaDB
----> SQL can be used to interact with all the Relational database, with only a slight difference in the syntax.

>> Non-Relational Database:
----> It's also known as No-SQL Database.
----> Here, data is stored in form of key value store, document store, graph store, etc.
----> Example: Hbase, MongoDB, Cassandra
----> All Non-Relational databases have their own language to interact with it.
*/

-- ====================================================================================================

-- 4. What is SQL?
/*
SQL is a Structures Query Language used to query structured data stored in relational database.
*/

-- ====================================================================================================

-- 5. To see all the databases connected to the mysql server:
> SHOW databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.00 sec)

-- ====================================================================================================

-- 6. To create a database: `testDB` 
> CREATE DATABASE testDB;
Query OK, 1 row affected (0.00 sec)

-- ====================================================================================================

-- 7. To see the created `testDB` database
> SHOW databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| testDB             |
+--------------------+
5 rows in set (0.01 sec)

-- ====================================================================================================

-- 8. Delete the created `testDB` database
> DROP DATABASE testDB;
Query OK, 0 rows affected (0.01 sec)

-- ====================================================================================================

-- 9. To see if the database `testDB` is deleted or not
> SHOW databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.00 sec)

-- ====================================================================================================

-- 10. To get into testDB database, so that we can create table inside it
> USE testDB;
Database changed

-- ====================================================================================================

-- 11. To see in which database I am currently in
> SELECT database();
+------------+
| database() |
+------------+
| testDB     |
+------------+
1 row in set (0.00 sec)

-- ====================================================================================================

-- 12. Creation of table: 'EmTable`:
/* 
Note: Regarding Data Type:
int -> It accomodates whole number.
varchar(n) -> It can accomodate upto n=255 characters
*/
> CREATE TABLE EmTable(
     name varchar(30),
     age int,
     salary int
     );
Query OK, 0 rows affected (0.16 sec)

-- ====================================================================================================

-- 13. To see the structure of any table: We can use DESCRIBE or DES
> DESCRIBE EmTable;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| name   | varchar(30) | YES  |     | NULL    |       |
| age    | int(11)     | YES  |     | NULL    |       |
| salary | int(11)     | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

> DESC EmTable;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| name   | varchar(30) | YES  |     | NULL    |       |
| age    | int(11)     | YES  |     | NULL    |       |
| salary | int(11)     | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

-- ====================================================================================================

-- 14. To see all the tables available under current database `testDB`
> SHOW tables;
+------------------+
| Tables_in_testDB |
+------------------+
| EmTable          |
+------------------+
1 row in set (0.00 sec)

-- ====================================================================================================

-- 15. To drop the created table `EmTable`
> DROP table EmTable;
Query OK, 0 rows affected (0.04 sec)

> SHOW tables;
Empty set (0.00 sec)

-- ====================================================================================================

-- 16. Create table `EmTable` inside `testDB` database, without entering into the database.
> CREATE TABLE testDB.EmTable(
       name varchar(30),
       age int,
       salary int
       );
    
-- ==================================================================================================== 