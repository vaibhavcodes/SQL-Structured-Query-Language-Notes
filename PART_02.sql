-- Details of content in this file: CRUD operations
/*
1. Creation of table.
2. Insertion of data in a table.
3. Creating table with `NOT NULL` column.
4. Creating a table with a default values to a column.
5. Combination of NOT NULL and DEFAULT
*/

-- ====================================================================================================

-- CRUD Operations:
/*
Create- Create and Insert operations 
Read- Select operations
Update- Update operations
Delete- Delete operations
*/

-- ====================================================================================================


-- 1. Creation of table

/* Table Creation */
> CREATE TABLE employee(
    firstname varchar(30),
    middlename varchar(30),
    lastname varchar(30),
    age int,
    salary int,
    location varchar(30)
    );
    
-- ====================================================================================================

-- 2. Insertion of data in a table.
/*
If you are not giving values to all the columns of the table then, you must mention the column name otherwise
error will occur, but if you want to give values to all the columns then, it's optional to mention the column 
names.
*/

/* Inserting Values for all the columns */
-- Putting column names
> INSERT INTO employee (firstname, middlename, lastname, age, salary, location) 
VALUES ('Robert', 'Downey', 'Junior', 45, 24000, 'California');

> SELECT * FROM employee;
+-----------+------------+----------+------+--------+------------+
| firstname | middlename | lastname | age  | salary | location   |
+-----------+------------+----------+------+--------+------------+
| Robert    | Downey     | Junior   |   45 |  24000 | California |
+-----------+------------+----------+------+--------+------------+
1 row in set (0.00 sec)

-- Wihout putting column names
> INSERT INTO employee VALUES ('Olivia', 'Cockburn', 'Wilde', 35, 34000, 'San Francisco');

> SELECT * from employee;
+-----------+------------+----------+------+--------+---------------+
| firstname | middlename | lastname | age  | salary | location      |
+-----------+------------+----------+------+--------+---------------+
| Robert    | Downey     | Junior   |   45 |  24000 | California    |
| Olivia    | Cockburn   | Wilde    |   35 |  34000 | San Francisco |
+-----------+------------+----------+------+--------+---------------+
2 rows in set (0.00 sec)


/* Inserting Values for few of the columns */
-- When putting column names
/* We are not giving values to `middlename` and `age` */
> INSERT INTO employee (firstname, lastname, salary, location) 
VALUES ('The', 'Rock', 75000, 'Vegas');

> SELECT * FROM employee;
+-----------+------------+----------+------+--------+---------------+
| firstname | middlename | lastname | age  | salary | location      |
+-----------+------------+----------+------+--------+---------------+
| Robert    | Downey     | Junior   |   45 |  24000 | California    |
| Olivia    | Cockburn   | Wilde    |   35 |  34000 | San Francisco |
| Oliv'ia   | Coc'kburn  | Wil\de   |   35 |  34000 | San Francisco |
| The       | NULL       | Rock     | NULL |  75000 | Vegas         |
+-----------+------------+----------+------+--------+---------------+
4 rows in set (0.00 sec)

-- When not putting column names: We will get an error
> INSERT INTO employee VALUES ('The', 'Rock', 75000, 'Vegas');
-- ERROR 1136 (21S01): Column count doesn't match value count at row 1

-- ====================================================================================================

-- 3. Creating table with `NOT NULL` column
/* Sometimes, there comes the situation when we don't want a column like `firstname` and `age` in the above 
case, so we can prevent that by making `age` column as NOT NULL so that a user if not put any value to it 
will get an error. */

> CREATE TABLE employee(
    firstname varchar(30) NOT NULL,
    middlename varchar(30),
    lastname varchar(30),
    age int NOT NULL,
    salary int,
    location varchar(30)
    );
    
-- Trying to insert no values to `firstname` and `age` column
INSERT INTO employee (middlename, lastname, salary, location) VALUES ('Mid1', 'Last1', 24000, 'Berkeley');
-- ERROR 1364 (HY000): Field 'firstname' doesn't have a default value 

-- ====================================================================================================

-- 4. Creating a table with a default values to a column.
/*
Suppose we are hiring people only from `Manchester`, then in that case we can put the default value of the 
`location` column as `Manchester`, instead of writing it time and again when entering the data into the 
`employee` table.
*/

> CREATE TABLE employee(
    firstname varchar(30) NOT NULL,
    middlename varchar(30),
    lastname varchar(30) NOT NULL,
    age int NOT NULL,
    salary int NOT NULL,
    location varchar(30) DEFAULT 'Manchester'
    );

-- Inserting data into table without giving any value to the `location` column
> INSERT INTO employee (firstname, lastname, age, salary) VALUES ('Robert', 'Junior', 45, 24000);

> SELECT * FROM employee;
+-----------+------------+----------+-----+--------+------------+
| firstname | middlename | lastname | age | salary | location   |
+-----------+------------+----------+-----+--------+------------+
| Robert    | NULL       | Junior   |  45 |  24000 | Manchester |
+-----------+------------+----------+-----+--------+------------+
1 row in set (0.00 sec)

-- Inserting data into table explicitly giving any value to the `location` column
> INSERT INTO employee (firstname, lastname, age, salary, location) VALUES ('Dwayne', 'Johnson', 55, 97000, 'UK');

> SELECT * FROM employee;
+-----------+------------+----------+-----+--------+------------+
| firstname | middlename | lastname | age | salary | location   |
+-----------+------------+----------+-----+--------+------------+
| Robert    | NULL       | Junior   |  45 |  24000 | Manchester |
| Dwayne    | NULL       | Johnson  |  55 |  97000 | UK         |
+-----------+------------+----------+-----+--------+------------+
2 rows in set (0.00 sec)

-- Giving NULL as a value to the `location` column:
> INSERT INTO employee (firstname, lastname, age, salary, location) VALUES ('Simon', 'Cowell', 35, 77000, NULL);

> SELECT * FROM employee;
+-----------+------------+----------+-----+--------+------------+
| firstname | middlename | lastname | age | salary | location   |
+-----------+------------+----------+-----+--------+------------+
| Robert    | NULL       | Junior   |  45 |  24000 | Manchester |
| Dwayne    | NULL       | Johnson  |  55 |  97000 | UK         |
| Simon     | NULL       | Cowell   |  35 |  77000 | NULL       |
+-----------+------------+----------+-----+--------+------------+
3 rows in set (0.00 sec)

-- ====================================================================================================

-- 5. Combination of NOT NULL and DEFAULT

/* As can be seen from the above table data that we can manually add NULL as a value to the `location` column. So, to prevent 
this we need to make this column as NOT NULL */
> CREATE TABLE employee(
    firstname varchar(30) NOT NULL,
    middlename varchar(30),
    lastname varchar(30) NOT NULL,
    age int NOT NULL,
    salary int NOT NULL,
    location varchar(30) NOT NULL DEFAULT 'Manchester'
    );
    
> INSERT INTO employee (firstname, lastname, age, salary, location) VALUES ('Simon', 'Cowell', 35, 77000, NULL);
ERROR 1048 (23000): Column 'location' cannot be null

-- ====================================================================================================