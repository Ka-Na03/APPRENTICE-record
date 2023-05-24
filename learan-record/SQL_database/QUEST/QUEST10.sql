-- データをグルーピングできる

-- グルーピング
SELECT emp_no, COUNT(salary)
FROM salaries
GROUP BY emp_no
LIMIT 10;

-- グルーピングと集計関数
SELECT emp_no, MAX(salary), MIN(salary)
FROM salaries
WHERE emp_no 
IN (10001,10002,10003,10004,10005,10006,10007,10008,10009,10010)
GROUP BY emp_no;

-- グルーピングと集計関数２
SELECT emp_no, MIN(from_date), MAX(to_date)
FROM salaries
WHERE emp_no 
BETWEEN 10001 AND 10010
GROUP BY emp_no;

-- 絞り込み
SELECT emp_no, MAX(salary) AS max_salary
FROM salaries
WHERE salary >= 140000
GROUP BY emp_no
ORDER BY max_salary DESC;

-- 最小給与
SELECT emp_no, MIN(salary) AS min_salary
FROM salaries
WHERE emp_no
BETWEEN 10001 AND 10010
GROUP BY emp_no
HAVING min_salary <= 40000;

-- 最終勤務日
SELECT emp_no, MAX(to_date) AS work_end_date
FROM salaries
WHERE emp_no
BETWEEN 10001 AND 10010
GROUP BY emp_no
HAVING work_end_date < '9999-01-01';