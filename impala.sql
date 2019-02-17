impala-shell –query ''select * from table_name;

$impala-shell –f myqueryfile.sql



/****** Select Distinc****/

SELECT DISTINCT column_name FROM table_name;
SELECT DISTINCT column_name1, column_name2 FROM table_name;
SELECT COUNT(DISTINCT column_name) FROM table_name;
SELECT SUM(DISTINCT column_name) FROM table_name;SELECT SUM(DISTINCT column_name) FROM table_name WHERE (column_name CONDITION value);


SELECT column_name FROM table_name WHERE column_name LIKE '%';
SELECT column_name from table_name WHERE column_name LIKE '_';
SELECT column_name from table_name WHERE column_name LIKE '_' OR column_name LIKE '%';

SELECT DISTINCT(state_names) from us_state_list WHERE state_name LIKE 'C_';

SELECT DISTINCT(names) from names_list WHERE names LIKE 'Jo%';

/********Functions**************/

SELECT AVG(column_name)  FROM table_name;
SELECT AVG(LENGTH(column_name))  FROM table_name;
SELECT AVG(ISNULL(value1, value2) ) FROM table_name;
SELECT AVG(column_name) FROM table_name WHERE column_value CONDITION;
SELECT column_name1, AVG(column_name2)  FROM table_name GROUP BY column_name1;


SELECT COUNT(*) FROM table_name;
SELECT COUNT(column_name) FROM table_name;
SELECT COUNT(DISTINCT column_name) FROM table_name;
SELECT column_name1, COUNT(column_name2) FROM table_name;
SELECT COUNT(*) FROM table_name WHERE column_value CONDITION;
SELECT column_name1, COUNT(column_name2) FROM table_name GROUP   BY column_name1, column_name2


SELECT MAX(column_name) FROM table_name;


SELECT MAX(days) FROM full_year_data WHERE month='October' and year = '2013';
SELECT MAX(DISTINCT A) FROM table_name;
SELECT column_name1, column_name2, MAX(column_name3) FROM table_name GROUP BY column_name1, column_name2;


SELECT MIN(column_name) FROM table_name;

SELECT MIN(LENGTH(s)) FROM table_name;
SELECT column_name1, MIN(column_name2) FROM table_name ORDER BY column_name1 ;
SELECT MIN(Price) AS Order_Price FROM Items;


WITH myWithEx1 as (SELECT 1), myWithEx2 as (SELECT 2) INSERT intoSELECT * FROM myWithEx1 UNION ALL SELECT * from myWithEx2;



SELECT table1.Name,
COUNT(table2.ID) AS TotalOrders
 FROM table2LEFT 
 JOIN table1
 ON table2.ID=table1.ID
 GROUP BY Name;


 SELECT column_name,column_nameFROM table_nameORDER BY column_name,column_name ASC|DESC;

 SELECT * FROM citizens ORDER BY state;
 SELECT * FROM items ORDER BY price DESC;


 SELECT column_name, aggregate_function(column_name) 
 FROM table_name  WHERE column_name operator value  
 GROUP BY column_name  HAVING aggregate_function(column_name) operator value;



 /***Built-in function support in Impala*******/


 SELECT ABS(-1);
 SELECT CONCAT('NFL ', 'American Football');
 SELECT POWER(3,3);
 SELECT CONCAT('State = ',state_name) FROM states WHERE population > 10000000;
 SELECT SIN(null);SELECT POWER(2,null);
 SELECT MAX(wheels), AVG(windows) FROM automobiles WHERE year <1950;


 /****The type conversion function***/
 CAST (expression as TYPE)
 SELECT CONCAT ('Today is ', 28 , 'October.');
 SELECT CONCAT ('Today is ', CAST(28 as STRING) , 'October.');


 /****HDFS specific commands**/

 [cloudera@localhost ~]$ ls -l *.txt
 -rw-rw-r-- 1 cloudera cloudera 985 Oct 15 18:48 automobiles.txt
 -rw-rw-r-- 1 cloudera cloudera 932 Oct 15 18:49 motorcycles.txt


 /******SQL join operation with the example database****/

 [Hadoop.testdomain:21000] > select automobiles.make, automobiles.model, motorcycles.make,motorcycles.model 
 from automobiles JOIN motorcycles USING (make);Query finished, fetching results ...


 /**********Impala and MapReduce*******/

 