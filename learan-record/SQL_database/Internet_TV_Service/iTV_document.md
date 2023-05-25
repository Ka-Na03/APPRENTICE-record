
# インターネットTVサービス

<details>
<summary><h2>STEP1. テーブル設計</h2></summary>

## CHANNELS

| カラム名 | データ型 | Null | Key | 初期値 | AUTOINCREMENT |
|------|-------------|------|-----|---------|----------------|
| id   | INT | - | PRI | - | YES |
| name | VARCHAR(50) | - | INDEX | - | - |
- **nameカラムにユニークキー制約を設定**

## TIME_SLOTS
 
| カラム名 | データ型 | Null | Key | 初期値 | AUTOINCREMENT |
|------------|-------------|------|-----|---------|----------------|
| id         | INT | - | PRI | - | YES |
| channel_id | INT | - | INDEX | - | - |
| start_time | DATETIME | - | - | - | - |
| end_time   | DATETIME | - | - | - | - |
- **channel_idカラムは`CHANNELSテーブルのidカラム`を参照**
 
## GENRES
 
| カラム名 | データ型 | Null | Key | 初期値 | AUTOINCREMENT |
|-----|-------------|------|-----|---------|----------------|
| id  | INT | - | PRI | - | YES |
| name| VARCHAR(50) | - | INDEX | - | - |
- **nameカラムにユニークキー制約を設定**

## PROGRAMS
   
| カラム名 | データ型 | Null | Key | 初期値 | AUTOINCREMENT |
|----------|-------------|------|-----|---------|----------------|
| id       | INT | - | PRI | - | YES |
| title    | VARCHAR(50) | - | - | - | - |
| details | TEXT | - | - | - | - |
| genre_id | INT | - | INDEX | - | - |
- **genre_idカラムは`GENRESテーブルのidカラム`を参照** 

## program_genres

| カラム名 | データ型 | Null | Key | 初期値 | AUTOINCREMENT |
|------------|-------------|------|-----|---------|----------------|
| program_id | INT | - | INDEX | - | - |
| genre_id   | INT | - | INDEX | - | - |
- **program_idとgenre_idの複合ユニークキーを設定**
- **program_idカラムは`PROGRAMSテーブルのidカラム`を参照**
- **genre_idカラムは`GENRESテーブルのidカラム`を参照**

## SERIES
 
| カラム名 | データ型 | Null | Key | 初期値 | AUTOINCREMENT |
|-------|-------------|------|-----|---------|----------------|
| id    | INT | - | PRI | - | YES |
| title | VARCHAR(100) | - | - | - | - |
 
## SEASONS

| カラム名 | データ型 | Null | Key | 初期値 | AUTOINCREMENT |
|---------------|-------------|------|-----|---------|----------------|
| id            | INT | - | PRI | - | YES |
| program_id    | INT | - | INDEX | - | - |
| number        | INT | YES | - | - | - |
- **program_idカラムは`PROGRAMSテーブルのidカラム`を参照**

## EPISODES
   
| カラム名 | データ型 | Null | Key | 初期値 | AUTOINCREMENT |
|--------------|-------------|------|-----|---------|----------------|
| id           | INT | - | PRI | - | YES |
| series_id    | INT | - | INDEX | - | - |
| season_id    | INT | - | INDEX | - | - |
| number       | INT | YES | - | - | - |
| title        | VARCHAR(100) | - | - | - | - |
| details      | TEXT | - | - | - | - |
| duration     | INT  | YES | - | - | - |
| release_date | DATE | - | - | - | - |
- **season_idカラムは`SEASONSテーブルのidカラム`を参照** 

## VIEWERSHIP
   
| カラム名 | データ型 | Null | Key | 初期値 | AUTOINCREMENT |
|--------------|-------------|------|-----|---------|----------------|
| id           | INT | - | PRI | - | YES |
| episode_id   | INT | - | INDEX | - | - |
| time_slot_id | INT | - | INDEX | - | - |
| channel_id   | INT | - | INDEX | - | - |
| view_count   | INT | YES | - | 0 | - |
- **episode_idカラムは`EPOSODESテーブルのid`カラムを参照**
- **time_slot_idカラムは`TIME_SLOTSテーブルのid`カラムを参照**
- **channel_idカラムは`CHANNELSテーブルのid`カラムを参照**

</details>

---

<details><summary><h2>STEP2. データベースの構築からサンプルデータの挿入</h2></summary>

### データベースの構築

1\. `MySQLを起動し接続する`  

<dl>
  <dt>MySQLを起動する</dt>
  <dd> net start mysql80 </dd>
  <br>
  <dt>MySQLに接続する</dt>
  <dd> mysql -u [username] -p </dd>
</dl>

2\. `データベースを作成し使用するデータベースを宣言する`

MySQLに接続した状態で以下のクエリを順に実行してください。
<dl>
  <dt>データベースを作成する</dt>
  <dd> <strong>CREATE DATABASE internet_tv;</strong> </dd>
  <br>
  <dt>使用するデータベースを宣言する</dt>
  <dd> <strong>USE internet_tv</strong> </dd>
</dl>

### テーブルの作成

1\. MySQLに接続した状態で`Internet_TV_Service\setup-sql`内にある<strong>`create_table.sql`</strong>ファイルを実行する。

### サンプルデータの挿入

1\. MySQLに接続した状態で`Internet_TV_Service\setup-sql`内にある<strong>`sampledata.sql`</strong>ファイルを実行する。

</details>

---

<details>
<summary><h2>STEP3. データを抽出するクエリ</h2></summary>

### エピソード視聴数トップ３のエピソードタイトルと視聴数を取得する。
