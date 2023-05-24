--使用するデータベースを宣言
USE employees;

--全カラムの取得
SELECT * FROM dept_manager;

--カラムの選択
SELECT emp_no FROM dept_manager;

--カラム名の別名
SELECT emp_no AS employee_no FROM dept_manager;

--重複行の削除
SELECT DISTINCT dept_no FROM dept_manager;

SELECT DISTINCT * FROM dept_manager ORDER BY from_date;