-- データを集計できる
給与情報 salaries
-- 列の合計値
SELECT SUM(salary) FROM salaries;
-- 列の平均値
SELECT AVG(salary) FROM salaries;
-- 四捨五入
SELECT ROUND(AVG(salary)) FROM salaries;
-- 列の最大値
SELECT MAX(salary) FROM salaries;
-- 列の最小値
SELECT MIN(salary) FROM salaries;
-- 行数
SELECT COUNT(salary) FROM salaries;
-- 絞り込みとの組み合わせ
SELECT MAX(salary) 
FROM salaries
WHERE from_date = '1986-06-26';
-- 小数第１桁
SELECT ROUND(AVG(salary), 1) 
FROM salaries
WHERE to_date = '1991-6-26';