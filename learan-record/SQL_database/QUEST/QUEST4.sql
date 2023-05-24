--テーブルを作成・修正・削除できる

--テーブルの作成
CREATE TABLE mydb.user (id int, name varchar(20));

--テーブルの表示
SHOW TABLES FROM mydb;

--カラムの追加
ALTER TABLE mydb.user
ADD COLUMN age int;

--カラムの表示
SHOW COLUMNS FROM user;

--カラムの削除
ALTER TABLE mydb.user
DROP age;

--テーブルの削除
DROP TABLE user;

--テーブルの再作成
CREATE TABLE mydb.user (id int, name varchar(20));
ALTER TABLE mydb.user
ADD COLUMN age int;