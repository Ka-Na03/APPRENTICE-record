SHOW DATABASES;

SHOW TABLES FROM employees;
-- employees のテーブル一覧
+----------------------+
| Tables_in_employees  |
+----------------------+
| current_dept_emp     |
| departments          |
| dept_emp             |
| dept_emp_latest_date |
| dept_manager         |
| employees            |
| salaries             |
| titles               |
+----------------------+

SHOW COLUMNS FROM departments;
-- 部署テーブルのカラム
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_no   | char(4)     | NO   | PRI | NULL    |       |
| dept_name | varchar(40) | NO   | UNI | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

SHOW COLUMNS FROM employees;
-- 従業員テーブルのカラム
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| emp_no     | int           | NO   | PRI | NULL    |       |
| birth_date | date          | NO   |     | NULL    |       |
| first_name | varchar(14)   | NO   |     | NULL    |       |
| last_name  | varchar(16)   | NO   |     | NULL    |       |
| gender     | enum('M','F') | NO   |     | NULL    |       |
| hire_date  | date          | NO   |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+

 SHOW COLUMNS FROM dept_manager;
 -- 部署マネージャーテーブルのカラム
+-----------+---------+------+-----+---------+-------+
| Field     | Type    | Null | Key | Default | Extra |
+-----------+---------+------+-----+---------+-------+
| emp_no    | int     | NO   | PRI | NULL    |       |
| dept_no   | char(4) | NO   | PRI | NULL    |       |
| from_date | date    | NO   |     | NULL    |       |
| to_date   | date    | NO   |     | NULL    |       |
+-----------+---------+------+-----+---------+-------+

SHOW COLUMNS FROM salaries;
-- 給与テーブルのカラム
+-----------+------+------+-----+---------+-------+
| Field     | Type | Null | Key | Default | Extra |
+-----------+------+------+-----+---------+-------+
| emp_no    | int  | NO   | PRI | NULL    |       |
| salary    | int  | NO   |     | NULL    |       |
| from_date | date | NO   | PRI | NULL    |       |
| to_date   | date | NO   |     | NULL    |       |
+-----------+------+------+-----+---------+-------+

SELECT employees.first_name, employees.last_name, salaries.salary, 
salaries.from_date, salaries.to_date
FROM salaries
INNER JOIN employees 
ON salaries.emp_no = employees.emp_no
WHERE employees.emp_no 
BETWEEN 10001 AND 10010;


SELECT * FROM salaries LIMIT 10;
SELECT SUM(salary) FROM salaries;


SELECT MAX(salary) 
FROM salaries
WHERE from_date IN ('1986-06-26');

emp_no

SELECT emp_no, salary
FROM salaries
WHERE emp_no = '10001';

SELECT * FROM salaries WHERE emp_no = '10001' LIMIT 20;

SELECT emp_no, MAX(salary) AS max_salary
FROM salaries
WHERE salary >= 140000
GROUP BY emp_no
ORDER BY max_salary DESC;


SELECT emp_no, MAX(salary) AS max_salary
FROM salaries
WHERE emp_no 
BETWEEN 10001 AND 10010
GROUP BY emp_no
HAVING max_salary >= 14000;

SELECT emp_no, MIN(salary) AS min_salary
FROM salaries
WHERE emp_no
BETWEEN 10001 AND 10010
GROUP BY emp_no;
FROM employees

EXPLAIN ANALYZE
SELECT *
  FROM employees
 WHERE birth_date = '1961-08-03';