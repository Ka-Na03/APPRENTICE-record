-- テーブルを結合できる

-- 内部結合
SELECT *
  FROM dept_manager
       INNER JOIN employees 
       ON dept_manager.emp_no = employees.emp_no;

-- 列の選択
SELECT dept_manager.dept_no, dept_manager.emp_no, employees.first_name, employees.last_name
  FROM dept_manager
       INNER JOIN employees
       ON dept_manager.emp_no = employees.emp_no;

-- 複数の内部結合
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.first_name, employees.last_name
  FROM departments
       INNER JOIN dept_manager 
       ON departments.dept_no = dept_manager.dept_no

       INNER JOIN employees 
       ON dept_manager.emp_no = employees.emp_no;

-- 絞り込み
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.first_name, employees.last_name
  FROM departments
       INNER JOIN dept_manager 
       ON departments.dept_no = dept_manager.dept_no

       INNER JOIN employees 
       ON dept_manager.emp_no = employees.emp_no
 WHERE dept_manager.to_date = '9999-01-01';

-- 給与
-- 従業員番号も含む場合。salaries.*
 SELECT employees.first_name, employees.last_name, salaries.*
   FROM salaries
        INNER JOIN employees 
        ON salaries.emp_no = employees.emp_no
  WHERE employees.emp_no 
BETWEEN 10001 AND 10010;
-- 含まない場合、個別に指定している
 SELECT employees.first_name, employees.last_name,
        salaries.salary, salaries.from_date, salaries.to_date
   FROM salaries
        INNER JOIN employees 
        ON salaries.emp_no = employees.emp_no
  WHERE employees.emp_no 
BETWEEN 10001 AND 10010;

-- 内部結合と外部結合の違い

-- 内部結合は互いのテーブル同士で共通する値をもつデータを取得します。
-- 内部結合は共通のデータのみを取得するので、データの整合性を保ちつつ情報を取得できます。
-- 外部結合は共通するデータ以外にも結合できるので、テーブル同士のデータに特定の条件を満たさないデータや、
-- 関連するデータがない場合にも結果として取得できます。