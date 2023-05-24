-- データを絞り込む　

-- 指定した行数のみ取得　10行のみ取得
SELECT * FROM employees LIMIT 10;

-- 等しいデータの絞り込み　女性のデータを10行取得
SELECT * FROM employees 
WHERE gender='F' LIMIT 10;

-- 等しくないデータの絞り込み　女性でないデータを10行取得
SELECT * FROM employees 
WHERE NOT gender='F' LIMIT 10;

-- より大きいデータの絞り込み　誕生日が1960年1月1日以降の人を10行
SELECT * FROM employees
WHERE birth_date >= '1960-01-01' LIMIT 10;

-- あいまいな条件の絞り込み　ファーストネームにviが含まれる10行
SELECT * FROM employees
WHERE first_name LIKE 'vi%' LIMIT 10;

-- 特定の範囲の絞り込み　1960/1/1から1960/1/31までの10行
SELECT * FROM employees
WHERE birth_date 
BETWEEN '1960-01-01' AND '1960-01-31' 
LIMIT 10;

-- かつ　ファーストネームがMaryかつ女性のデータ
SELECT * FROM employees
WHERE first_name='Mary' AND gender='F';

-- または　ファーストネームがMaryまたはラストネームがPeckのデータを10行
SELECT * FROM employees
WHERE first_name='Mary' OR last_name='Peck';

-- 含まれる　従業員番号が10011,10021,10031のいずれかに合致するデータ　ORは使わない
SELECT * FROM employees
WHERE emp_no IN (10011, 10021, 10031);

-- 従業員番号　従業員番号が20,000の人のファーストネームとラストネームを取得
SELECT first_name, last_name FROM employees
WHERE emp_no=20000;

-- 誕生日　1959年一月の人のレコードを取得
SELECT * FROM employees
WHERE birth_date LIKE '1959-01%' ORDER BY birth_date;