--ユーザーの作成
create user 'pochi'@'localhost' identified by 'omochi';

--特定のユーザー情報を取得
select * from mysql.user where user='pochi'\G

--作成済みユーザーの一覧を取得、userカラムとhostカラムの情報を取得して見やすく
select user, host from mysql.user;

--ユーザーに現在設定されている権限を確認
SHOW GRANTS for kaito@localhost;

--ユーザーへの権限付与
GRANT ALL PRIVILEGES ON *.* to kaito@localhost

--権限のリロード
FLUSH PRIVILEGES;

--ユーザーの削除
DROP USER pochi@localhost;

