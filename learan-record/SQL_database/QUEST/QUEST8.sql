-- 検索結果の並び替えができる

-- 昇順の並び替え
SELECT * FROM employees
ORDER BY birth_date ASC
LIMIT 10;

-- 降順の並び替え
SELECT * FROM employees
ORDER BY birth_date DESC
LIMIT 10;

-- 複数条件の並び替え
SELECT * FROM employees
ORDER BY birth_date ASC, hire_date DESC
LIMIT 30;