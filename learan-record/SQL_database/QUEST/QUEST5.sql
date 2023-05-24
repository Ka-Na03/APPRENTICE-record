--データを登録・検索・更新・削除できる

--データの登録
INSERT INTO user VALUES (1, 'kaito', 24);
INSERT INTO user (id, name)
VALUES (2, 'inu');

--データの検索
SELECT * FROM user

--データの更新
UPDATE user SET name='neko' WHERE id=2;

--データの削除
--すべてのデータを削除する場合
DELETE FROM user; --この場合、AUTO_INCREMENTがリセットされない。
TRUNCATE TABLE user; --これだとリセットされる、データの量が多い場合こっちの方が処理が速い

--特定のデータを削除する場合はWHERE文をつかう
DELETE FROM user WHERE id=2;