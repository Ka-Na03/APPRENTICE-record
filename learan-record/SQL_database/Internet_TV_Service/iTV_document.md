
# インターネットTVサービス

<details>
<summary><h2>STEP1. テーブル設計</h2></summary>

## CHANNELS

| カラム名 | データ型 | Null | Key | 初期値 | AUTOINCREMENT |
|------|-------------|------|-----|---------|----------------|
| id   | INT | - | PRI | - | YES |
| name | VARCHAR(50) | - | INDEX | - | - |
- **nameカラムにユニークキー制約を設定**
 
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
| season_id    | INT | - | INDEX | - | - |
| series_id    | INT | - | INDEX | - | - |
| number       | INT | YES | - | - | - |
| title        | VARCHAR(100) | - | - | - | - |
| details      | TEXT | - | - | - | - |
| duration     | INT  | YES | - | - | - |
| release_date | DATE | - | - | - | - |
- **season_idカラムは`SEASONSテーブルのidカラム`を参照** 
- **series_idカラムは`SERIESテーブルのidカラム`を参照**

## TIME_SLOTS
 
| カラム名 | データ型 | Null | Key | 初期値 | AUTOINCREMENT |
|------------|-------------|------|-----|---------|----------------|
| id         | INT | - | PRI | - | YES |
| channel_id | INT | - | INDEX | - | - |
| episode_id | INT | - | INDEX | - | - |
| start_time | DATETIME | - | - | - | - |
| end_time   | DATETIME | - | - | - | - |
- **channel_idカラムは`CHANNELSテーブルのidカラム`を参照**
- **episode_idカラムは`EPISODESテーブルのidカラム`を参照**

## VIEWERSHIP
   
| カラム名 | データ型 | Null | Key | 初期値 | AUTOINCREMENT |
|--------------|-------------|------|-----|---------|----------------|
| id           | INT | - | PRI | - | YES |
| episode_id   | INT | - | INDEX | - | - |
| time_slot_id | INT | - | INDEX | - | - |
| program_id   | INT | - | INDEX | - | - |
| channel_id   | INT | - | INDEX | - | - |
| view_count   | INT | YES | - | 0 | - |
- **episode_idカラムは`EPOSODESテーブルのid`カラムを参照**
- **time_slot_idカラムは`TIME_SLOTSテーブルのid`カラムを参照**
- **program_idカラムは`PROGRAMSテーブルのid`カラムを参照**
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

### 1.エピソード視聴数トップ３のエピソードタイトルと視聴数を取得する。

```sql
SELECT e.title, v.view_count
  FROM episodes AS e
  JOIN viewership AS v
    ON e.id = v.episode_id
 ORDER BY view_count DESC
 LIMIT 3;
```

### 2.エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得する。

```sql
SELECT p.title AS PROGRAM_title,
       s.number AS Season_NUM,
       e.number AS Episode_NUM,
       e.title AS Episode_title,
       v.view_count AS viwes
  FROM programs AS p
       JOIN seasons AS s
       ON p.id = s.program_id

       JOIN episodes AS e
       ON s.id = e.season_id

       JOIN viewership AS v
       ON e.id = v.episode_id

 ORDER BY view_count DESC
 LIMIT 3;
```

### 3.本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得

```sql
SELECT c.name AS Channel,
       t.start_time AS Start_DATE,
       t.end_time AS END_DATE,
       s.number AS Season_NUM,
       e.number AS Episode_NUM,
       e.title AS Episode_title,
       e.details AS Episode_details

  FROM time_slots AS t
       JOIN channels AS c
       ON t.channel_id = c.id

       JOIN episodes AS e
       ON t.episode_id = e.id

       JOIN seasons AS s
       ON s.id = e.season_id

 WHERE DATE(t.start_time) = CURDATE()
 ORDER BY t.start_time;
```

### 4.ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得

```sql
SELECT t.start_time AS '放送開始時刻',
       t.end_time AS '放送終了時刻',
       s.number AS 'シーズ数',
       e.number AS 'エピソード数',
       e.title AS 'タイトル',
       e.details AS '詳細'

  FROM time_slots AS t
       JOIN channels AS c
       ON t.channel_id = c.id

       JOIN episodes AS e
       ON t.episode_id = e.id

       JOIN seasons AS s
       ON s.id = e.season_id

       JOIN programs AS p
       ON s.program_id = p.id
 WHERE c.name = 'Channel A'
   AND t.start_time >= CURDATE()
   AND t.start_time < DATE_ADD(CURDATE(), INTERVAL 7 DAY)
 ORDER BY t.start_time;
 ```