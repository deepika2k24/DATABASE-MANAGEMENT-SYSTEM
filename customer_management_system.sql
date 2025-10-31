
mysql>  create comp1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'comp1' at line 1
mysql> create database comp1;
Query OK, 1 row affected (0.04 sec)

mysql> use comp1;
Database changed
mysql> create table customers(ID INT NOT NULL,NAME VARCHAR,AGE INT NOT NULL,ADDRESSS CHAR(25),SALARY DECIMAL(18,2),PRIMARY KEY(ID));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',AGE INT NOT NULL,ADDRESSS CHAR(25),SALARY DECIMAL(18,2),PRIMARY KEY(ID))' at line 1
mysql> create table customers(ID INT PRIMARY KEY NOT NULL,NAME VARCHAR,AGE INT NOT NULL,ADDRESSS CHAR(25),SALARY DECIMAL(18,2));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',AGE INT NOT NULL,ADDRESSS CHAR(25),SALARY DECIMAL(18,2))' at line 1
mysql> create table customers(ID INT PRIMARY KEY NOT NULL,NAME VARCHAR,AGE INT NOT NULL,ADDRESSS CHAR(25),SALARY DECIMAL(18,2));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',AGE INT NOT NULL,ADDRESSS CHAR(25),SALARY DECIMAL(18,2))' at line 1
mysql> CREATE TABLE CUSTOMERS (
    ->     ID INT NOT NULL,
    ->     NAME VARCHAR(20) NOT NULL,
    ->     AGE INT NOT NULL,
    ->     ADDRESS CHAR(25),
    ->     SALARY DECIMAL(18,2),
    ->     PRIMARY KEY(ID)
    -> );
Query OK, 0 rows affected (0.20 sec)

mysql> -- Alternative way with column names specified
mysql> INSERT INTO CUSTOMERS (ID, NAME, AGE, ADDRESS, SALARY) VALUES
    -> (1, 'Ramesh', 32, 'Ahmedabad', 2000.00),
    -> (2, 'Miklau', 25, 'Dalki', 1500.00),
    -> (3, 'Kaushiki', 23, 'Idea', 2000.00),
    -> (4, 'ChatItali', 25, 'Humanai', 6500.00),
    -> (5, 'Hardiki', 27, 'Bhopal', 8500.00),
    -> (6, 'Komal', 22, 'Hyderabad', 6500.00),
    -> (7, 'Refry', 24, 'Indoree', 10000.00);
Query OK, 7 rows affected (0.03 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> select ID,NAME,SALARY FROM CUSTOMERS WHERE SALARY>200 AND AGE<25;
+----+----------+----------+
| ID | NAME     | SALARY   |
+----+----------+----------+
|  3 | Kaushiki |  2000.00 |
|  6 | Komal    |  6500.00 |
|  7 | Refry    | 10000.00 |
+----+----------+----------+
3 rows in set (0.00 sec)

mysql> SELECT *FROM CUSTOMERS WHERE NAME LIKE'k%' AND AGE>=22 AND SALARY<3700;
+----+----------+-----+---------+---------+
| ID | NAME     | AGE | ADDRESS | SALARY  |
+----+----------+-----+---------+---------+
|  3 | Kaushiki |  23 | Idea    | 2000.00 |
+----+----------+-----+---------+---------+
1 row in set (0.01 sec)

mysql> SELECT ID,NAME,AGE FROM CUSTOMERS WHERE SALARY>2000 OR AGE<25;
+----+-----------+-----+
| ID | NAME      | AGE |
+----+-----------+-----+
|  3 | Kaushiki  |  23 |
|  4 | ChatItali |  25 |
|  5 | Hardiki   |  27 |
|  6 | Komal     |  22 |
|  7 | Refry     |  24 |
+----+-----------+-----+
5 rows in set (0.00 sec)

mysql> SELECT *FROM CUSTOMERS WHERE NAME LIKE'R%' OR SALARY >10000 OR AGE >25;
+----+---------+-----+-----------+----------+
| ID | NAME    | AGE | ADDRESS   | SALARY   |
+----+---------+-----+-----------+----------+
|  1 | Ramesh  |  32 | Ahmedabad |  2000.00 |
|  5 | Hardiki |  27 | Bhopal    |  8500.00 |
|  7 | Refry   |  24 | Indoree   | 10000.00 |
+----+---------+-----+-----------+----------+
3 rows in set (0.00 sec)

mysql> SELECT *FROM CUSTOMERS WHERE NOT(SALARY>4000);
+----+----------+-----+-----------+---------+
| ID | NAME     | AGE | ADDRESS   | SALARY  |
+----+----------+-----+-----------+---------+
|  1 | Ramesh   |  32 | Ahmedabad | 2000.00 |
|  2 | Miklau   |  25 | Dalki     | 1500.00 |
|  3 | Kaushiki |  23 | Idea      | 2000.00 |
+----+----------+-----+-----------+---------+
3 rows in set (0.01 sec)

mysql> SELECT *FROM CUSTOMERS WHERE AGE NOT IN(25,26,27);
+----+----------+-----+-----------+----------+
| ID | NAME     | AGE | ADDRESS   | SALARY   |
+----+----------+-----+-----------+----------+
|  1 | Ramesh   |  32 | Ahmedabad |  2000.00 |
|  3 | Kaushiki |  23 | Idea      |  2000.00 |
|  6 | Komal    |  22 | Hyderabad |  6500.00 |
|  7 | Refry    |  24 | Indoree   | 10000.00 |
+----+----------+-----+-----------+----------+
4 rows in set (0.01 sec)

mysql> SELECT *FROM CUSTOMERS WHERE AGE IS NULL;
Empty set (0.00 sec)

mysql> INSERT INTO CUSTOMERS VALUES(8,'KHUSHI',NULL,NULL);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> SELECT *FROM SALARY WHERE SALARY NOT BETWEEN 1500.00 AND 2500.00;
ERROR 1146 (42S02): Table 'comp1.salary' doesn't exist
mysql> SELECT *FROM CUSTOMERS WHERE SALARY NOT BETWEEN 1500.00 AND 2500.00;
+----+-----------+-----+-----------+----------+
| ID | NAME      | AGE | ADDRESS   | SALARY   |
+----+-----------+-----+-----------+----------+
|  4 | ChatItali |  25 | Humanai   |  6500.00 |
|  5 | Hardiki   |  27 | Bhopal    |  8500.00 |
|  6 | Komal     |  22 | Hyderabad |  6500.00 |
|  7 | Refry     |  24 | Indoree   | 10000.00 |
+----+-----------+-----+-----------+----------+
4 rows in set (0.00 sec)

mysql> SELECT *FROM CUSTOMERS WHERE SALARY  BETWEEN 1500.00 AND 5500.00;
+----+----------+-----+-----------+---------+
| ID | NAME     | AGE | ADDRESS   | SALARY  |
+----+----------+-----+-----------+---------+
|  1 | Ramesh   |  32 | Ahmedabad | 2000.00 |
|  2 | Miklau   |  25 | Dalki     | 1500.00 |
|  3 | Kaushiki |  23 | Idea      | 2000.00 |
+----+----------+-----+-----------+---------+
3 rows in set (0.00 sec)

mysql> CREATE TABLE ORDERS(
    ->     OID INT NOT NULL,
    ->     DATE VARCHAR(20) NOT NULL,
    ->     CUSTOMER_ID INT NOT NULL,
    ->     AMOUNT DECIMAL(18,2)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO ORDERS VALUES
    -> (102, '2009-10-08 00:00:00', 3, 3000.00),
    -> (108, '2009-10-08 00:00:00', 3, 1500.00),
    -> (101, '2009-11-20 00:00:00', 2, 1560.00),
    -> (103, '2008-05-20 00:00:00', 4, 2060.00);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT *FROM ORDERS;
+-----+---------------------+-------------+---------+
| OID | DATE                | CUSTOMER_ID | AMOUNT  |
+-----+---------------------+-------------+---------+
| 102 | 2009-10-08 00:00:00 |           3 | 3000.00 |
| 108 | 2009-10-08 00:00:00 |           3 | 1500.00 |
| 101 | 2009-11-20 00:00:00 |           2 | 1560.00 |
| 103 | 2008-05-20 00:00:00 |           4 | 2060.00 |
+-----+---------------------+-------------+---------+
4 rows in set (0.00 sec)

mysql> SELECT *FROM CUSTOMERS WHERE NOT EXISTS(SELECT CUSTOMER_ID FROM ORDERS.CUSTOMER_ID=CUSTOMER_ID);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '=CUSTOMER_ID)' at line 1
mysql> SELECT * FROM CUSTOMERS
    -> WHERE NOT EXISTS(SELECT CUSTOMER_ID FROM ORDERS.CUSTOMER_ID=CUSTOMER_ID);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '=CUSTOMER_ID)' at line 2
mysql> SELECT * FROM CUSTOMERS
    -> WHERE NOT EXISTS(
    ->     SELECT 1 FROM ORDERS
    ->     WHERE ORDERS.CUSTOMER_ID = CUSTOMERS.ID
    -> );
+----+---------+-----+-----------+----------+
| ID | NAME    | AGE | ADDRESS   | SALARY   |
+----+---------+-----+-----------+----------+
|  1 | Ramesh  |  32 | Ahmedabad |  2000.00 |
|  5 | Hardiki |  27 | Bhopal    |  8500.00 |
|  6 | Komal   |  22 | Hyderabad |  6500.00 |
|  7 | Refry   |  24 | Indoree   | 10000.00 |
+----+---------+-----+-----------+----------+
4 rows in set (0.01 sec)

mysql> SELECT *FROM CUSTOMERS ORDER BY NAME ASC;
+----+-----------+-----+-----------+----------+
| ID | NAME      | AGE | ADDRESS   | SALARY   |
+----+-----------+-----+-----------+----------+
|  4 | ChatItali |  25 | Humanai   |  6500.00 |
|  5 | Hardiki   |  27 | Bhopal    |  8500.00 |
|  3 | Kaushiki  |  23 | Idea      |  2000.00 |
|  6 | Komal     |  22 | Hyderabad |  6500.00 |
|  2 | Miklau    |  25 | Dalki     |  1500.00 |
|  1 | Ramesh    |  32 | Ahmedabad |  2000.00 |
|  7 | Refry     |  24 | Indoree   | 10000.00 |
+----+-----------+-----+-----------+----------+
7 rows in set (0.01 sec)

mysql> SELECT *FROM CUSTOMERS ORDER BY AGE ASC ,SALARY DESC;
+----+-----------+-----+-----------+----------+
| ID | NAME      | AGE | ADDRESS   | SALARY   |
+----+-----------+-----+-----------+----------+
|  6 | Komal     |  22 | Hyderabad |  6500.00 |
|  3 | Kaushiki  |  23 | Idea      |  2000.00 |
|  7 | Refry     |  24 | Indoree   | 10000.00 |
|  4 | ChatItali |  25 | Humanai   |  6500.00 |
|  2 | Miklau    |  25 | Dalki     |  1500.00 |
|  5 | Hardiki   |  27 | Bhopal    |  8500.00 |
|  1 | Ramesh    |  32 | Ahmedabad |  2000.00 |
+----+-----------+-----+-----------+----------+
7 rows in set (0.00 sec)

mysql> SELECT *FROM CUSTOMERS WHERE AGE=25 ORDER BY NAME DESC;
+----+-----------+-----+---------+---------+
| ID | NAME      | AGE | ADDRESS | SALARY  |
+----+-----------+-----+---------+---------+
|  2 | Miklau    |  25 | Dalki   | 1500.00 |
|  4 | ChatItali |  25 | Humanai | 6500.00 |
+----+-----------+-----+---------+---------+
2 rows in set (0.00 sec)

mysql> SELECT AGE,COUNT(NAME) FROM CUSTOMERS GROUPBY AGE;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'AGE' at line 1
mysql> SELECT AGE,COUNT(NAME) FROM CUSTOMERS GROUP BY AGE;
+-----+-------------+
| AGE | COUNT(NAME) |
+-----+-------------+
|  32 |           1 |
|  25 |           2 |
|  23 |           1 |
|  27 |           1 |
|  22 |           1 |
|  24 |           1 |
+-----+-------------+
6 rows in set (0.00 sec)

mysql> SELECT AGE,MAX(SALARY) AS MAX_SALARY FROM CUSTOMERS GROUP BY AGE;
+-----+------------+
| AGE | MAX_SALARY |
+-----+------------+
|  32 |    2000.00 |
|  25 |    6500.00 |
|  23 |    2000.00 |
|  27 |    8500.00 |
|  22 |    6500.00 |
|  24 |   10000.00 |
+-----+------------+
6 rows in set (0.00 sec)

mysql> SELECT ADDRESS,AVG(SALARY) AS AVG_SALARY FROM CUSTOMERS GROUP BY ADDRESS;
+-----------+--------------+
| ADDRESS   | AVG_SALARY   |
+-----------+--------------+
| Ahmedabad |  2000.000000 |
| Dalki     |  1500.000000 |
| Idea      |  2000.000000 |
| Humanai   |  6500.000000 |
| Bhopal    |  8500.000000 |
| Hyderabad |  6500.000000 |
| Indoree   | 10000.000000 |
+-----------+--------------+
7 rows in set (0.01 sec)

mysql> SELECT ADDRESS,AGE,SUM(SALARY) AS TOTAL_SALARY FROM CUSTOMERS GROUP BY ADDRESS,AGE;
+-----------+-----+--------------+
| ADDRESS   | AGE | TOTAL_SALARY |
+-----------+-----+--------------+
| Ahmedabad |  32 |      2000.00 |
| Dalki     |  25 |      1500.00 |
| Idea      |  23 |      2000.00 |
| Humanai   |  25 |      6500.00 |
| Bhopal    |  27 |      8500.00 |
| Hyderabad |  22 |      6500.00 |
| Indoree   |  24 |     10000.00 |
+-----------+-----+--------------+
7 rows in set (0.00 sec)

mysql> SELECT AGE , MIN(AGE),MAX(AGE),SUM(SALARY),AVG(SALARY) FROM CUSTOMERS;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'comp1.CUSTOMERS.AGE'; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT COUNT(AGE) FROM CUSTOMERS;
+------------+
| COUNT(AGE) |
+------------+
|          7 |
+------------+
1 row in set (0.03 sec)

mysql> SELECT MIN(AGE), MAX(AGE), SUM(SALARY), AVG(SALARY)
    -> FROM CUSTOMERS;
+----------+----------+-------------+-------------+
| MIN(AGE) | MAX(AGE) | SUM(SALARY) | AVG(SALARY) |
+----------+----------+-------------+-------------+
|       22 |       32 |    37000.00 | 5285.714286 |
+----------+----------+-------------+-------------+
1 row in set (0.00 sec)

mysql> SELECT ADDRESS,MAX(SALARY) FROM CUSTOMERS GROUP BY ADDRESS HAVING MAX(SALARY)>2000;
+-----------+-------------+
| ADDRESS   | MAX(SALARY) |
+-----------+-------------+
| Humanai   |     6500.00 |
| Bhopal    |     8500.00 |
| Hyderabad |     6500.00 |
| Indoree   |    10000.00 |
+-----------+-------------+
4 rows in set (0.01 sec)

mysql> SELECT ADDRESS,AGE,NAME FROM CUSTOMERS GROUP BY ADDRESS HAVING MIN(AGE)<27;
ERROR 1055 (42000): Expression #2 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'comp1.CUSTOMERS.AGE' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT ADDRESS,AGE,NAME FROM CUSTOMERS GROUP BY ADDRESS HAVING MIN(AGE)<27;
ERROR 1055 (42000): Expression #2 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'comp1.CUSTOMERS.AGE' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT ADDRESS, AGE, NAME FROM CUSTOMERS
    -> GROUP BY ADDRESS, AGE, NAME
    -> HAVING MIN(AGE) < 27;
+-----------+-----+-----------+
| ADDRESS   | AGE | NAME      |
+-----------+-----+-----------+
| Dalki     |  25 | Miklau    |
| Idea      |  23 | Kaushiki  |
| Humanai   |  25 | ChatItali |
| Hyderabad |  22 | Komal     |
| Indoree   |  24 | Refry     |
+-----------+-----+-----------+
5 rows in set (0.00 sec)

mysql> SELECT ADDRESS,AGE,NAME FROM CUSTOMERS GROUP BY ADDRESS HAING MIN(AGE)<27
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'HAING MIN(AGE)<27' at line 1
mysql> UPDATE CUSTOMERS SET AGE=AGE+4,SALARY=SALARY+200 WHERE NAME='KOMAL';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT *FROM CUSTOMERS;
+----+-----------+-----+-----------+----------+
| ID | NAME      | AGE | ADDRESS   | SALARY   |
+----+-----------+-----+-----------+----------+
|  1 | Ramesh    |  32 | Ahmedabad |  2000.00 |
|  2 | Miklau    |  25 | Dalki     |  1500.00 |
|  3 | Kaushiki  |  23 | Idea      |  2000.00 |
|  4 | ChatItali |  25 | Humanai   |  6500.00 |
|  5 | Hardiki   |  27 | Bhopal    |  8500.00 |
|  6 | Komal     |  26 | Hyderabad |  6700.00 |
|  7 | Refry     |  24 | Indoree   | 10000.00 |
+----+-----------+-----+-----------+----------+
7 rows in set (0.00 sec)

mysql> UDATE CUSTOMERS SET ID=10 WHERE ADDRESS='HYDERABAD';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'UDATE CUSTOMERS SET ID=10 WHERE ADDRESS='HYDERABAD'' at line 1
mysql> UPDATE CUSTOMERS SET ID=10 WHERE ADDRESS='HYDERABAD';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM CUSTOMERS;
+----+-----------+-----+-----------+----------+
| ID | NAME      | AGE | ADDRESS   | SALARY   |
+----+-----------+-----+-----------+----------+
|  1 | Ramesh    |  32 | Ahmedabad |  2000.00 |
|  2 | Miklau    |  25 | Dalki     |  1500.00 |
|  3 | Kaushiki  |  23 | Idea      |  2000.00 |
|  4 | ChatItali |  25 | Humanai   |  6500.00 |
|  5 | Hardiki   |  27 | Bhopal    |  8500.00 |
|  7 | Refry     |  24 | Indoree   | 10000.00 |
| 10 | Komal     |  26 | Hyderabad |  6700.00 |
+----+-----------+-----+-----------+----------+
7 rows in set (0.00 sec)

mysql> create table CARS( ID INT NOT NULL, NAME VARCHAR(20) NOT NULL, PRICE INT NOT NULL, PRIMARY KEY(ID) );
Query OK, 0 rows affected (0.14 sec)

mysql> insert INTO CARS VALUES (2, 'Maruti Swift', 450000), (4, 'VOLVO', 2250000), (7, 'Toyota', 2400000);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT *FROM CARS;
+----+--------------+---------+
| ID | NAME         | PRICE   |
+----+--------------+---------+
|  2 | Maruti Swift |  450000 |
|  4 | VOLVO        | 2250000 |
|  7 | Toyota       | 2400000 |
+----+--------------+---------+
3 rows in set (0.00 sec)

mysql> SELECT *FROM CUSTOMERS WHERE EXISTS(SELECT *FROM CARS WHERE CARS.ID=CUSTOMERS.ID);
+----+-----------+-----+---------+----------+
| ID | NAME      | AGE | ADDRESS | SALARY   |
+----+-----------+-----+---------+----------+
|  2 | Miklau    |  25 | Dalki   |  1500.00 |
|  4 | ChatItali |  25 | Humanai |  6500.00 |
|  7 | Refry     |  24 | Indoree | 10000.00 |
+----+-----------+-----+---------+----------+
3 rows in set (0.02 sec)

mysql> SELECT AGE FROM CUSTOMERS WHERE EXISTS(SELECT *FROM CARS WHERE CARS.ID=CUSTOMERS.ID);
+-----+
| AGE |
+-----+
|  25 |
|  25 |
|  24 |
+-----+
3 rows in set (0.00 sec)

mysql> SELECT AGE FROM CUSTOMERS WHERE NOT EXISTS(SELECT *FROM CARS WHERE CARS.ID=CUSTOMERS.ID);
+-----+
| AGE |
+-----+
|  32 |
|  23 |
|  27 |
|  26 |
+-----+
4 rows in set (0.01 sec)

mysql> SELECT NAME,ID FROM CUSTOMERS WHERE NOT EXISTS(SELECT *FROM CARS WHERE CARS.ID=CUSTOMERS.ID);
+----------+----+
| NAME     | ID |
+----------+----+
| Ramesh   |  1 |
| Kaushiki |  3 |
| Hardiki  |  5 |
| Komal    | 10 |
+----------+----+
4 rows in set (0.00 sec)

mysql> CREATE VIEW CUSTOMER_VIEW AS SELECT NAME,ID FROM CUSTOMERS;
Query OK, 0 rows affected (0.03 sec)

mysql> SELECT *FROM CUSTOMER_VIEW;
+-----------+----+
| NAME      | ID |
+-----------+----+
| Ramesh    |  1 |
| Miklau    |  2 |
| Kaushiki  |  3 |
| ChatItali |  4 |
| Hardiki   |  5 |
| Refry     |  7 |
| Komal     | 10 |
+-----------+----+
7 rows in set (0.02 sec)

mysql> CREATE VIEW BUYERS_VIEW AS SELECT NAME FROM CUSTOMERS WHERE SALARY >4000;
Query OK, 0 rows affected (0.01 sec)

mysql> SELECT *FROM BUYERS_VIEW;
+-----------+
| NAME      |
+-----------+
| ChatItali |
| Hardiki   |
| Refry     |
| Komal     |
+-----------+
4 rows in set (0.02 sec)

mysql> CREATE VIEW MY_VIEW AS SELCT NAME,AGE FROM CUSTOMERS WHERE AGE>=25;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELCT NAME,AGE FROM CUSTOMERS WHERE AGE>=25' at line 1
mysql> CREATE VIEW MY_VIEW AS SELECT NAME,AGE FROM CUSTOMERS WHERE AGE>=25;
Query OK, 0 rows affected (0.02 sec)

mysql> SELECT *FROM MY_VIEW;
+-----------+-----+
| NAME      | AGE |
+-----------+-----+
| Ramesh    |  32 |
| Miklau    |  25 |
| ChatItali |  25 |
| Hardiki   |  27 |
| Komal     |  26 |
+-----------+-----+
5 rows in set (0.00 sec)

mysql> UPDATE MY_VIEW SET AGE=30 WHERE NAME='RAMESH';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT *FROM CUSTOMERS;
+----+-----------+-----+-----------+----------+
| ID | NAME      | AGE | ADDRESS   | SALARY   |
+----+-----------+-----+-----------+----------+
|  1 | Ramesh    |  30 | Ahmedabad |  2000.00 |
|  2 | Miklau    |  25 | Dalki     |  1500.00 |
|  3 | Kaushiki  |  23 | Idea      |  2000.00 |
|  4 | ChatItali |  25 | Humanai   |  6500.00 |
|  5 | Hardiki   |  27 | Bhopal    |  8500.00 |
|  7 | Refry     |  24 | Indoree   | 10000.00 |
| 10 | Komal     |  26 | Hyderabad |  6700.00 |
+----+-----------+-----+-----------+----------+
7 rows in set (0.00 sec)

mysql> UPDATE MY_VIEW SET NAME='RAJESH' WHERE AGE=30;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT *FROM MY_VIEW;
+-----------+-----+
| NAME      | AGE |
+-----------+-----+
| RAJESH    |  30 |
| Miklau    |  25 |
| ChatItali |  25 |
| Hardiki   |  27 |
| Komal     |  26 |
+-----------+-----+
5 rows in set (0.00 sec)

mysql> SELECT *FROM CUSTOMERS;
+----+-----------+-----+-----------+----------+
| ID | NAME      | AGE | ADDRESS   | SALARY   |
+----+-----------+-----+-----------+----------+
|  1 | RAJESH    |  30 | Ahmedabad |  2000.00 |
|  2 | Miklau    |  25 | Dalki     |  1500.00 |
|  3 | Kaushiki  |  23 | Idea      |  2000.00 |
|  4 | ChatItali |  25 | Humanai   |  6500.00 |
|  5 | Hardiki   |  27 | Bhopal    |  8500.00 |
|  7 | Refry     |  24 | Indoree   | 10000.00 |
| 10 | Komal     |  26 | Hyderabad |  6700.00 |
+----+-----------+-----+-----------+----------+
7 rows in set (0.00 sec)

mysql> SELECT *FROM MY_VIEW WHERE AGE=25;
+-----------+-----+
| NAME      | AGE |
+-----------+-----+
| Miklau    |  25 |
| ChatItali |  25 |
+-----------+-----+
2 rows in set (0.00 sec)

mysql> SELECT MIN(AGE) FROM MY_VIEW;
+----------+
| MIN(AGE) |
+----------+
|       25 |
+----------+
1 row in set (0.01 sec)
