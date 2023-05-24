--データベースへの接続は管理者実行のコマンドライン上で
--`net start mysql80`で起動し、
--`mysql --user=root --password`でrootユーザーでログインできる。

--データベースの作成  
create database mydb;

--データベースの一覧表示
show databases;
show create database mydb\G

--データベースの指定
use mydb;

--データベースの削除
drop database test;