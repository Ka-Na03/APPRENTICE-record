SHOW DATABASES;

USE internet_tv

SHOW TABLES FROM internet_tv;
/*
+-----------------------+
| Tables_in_internet_tv |
+-----------------------+
| channels              |
| episodes              |
| genres                |
| program_genres        |
| programs              |
| seasons               |
| series                |
| time_slots            |
| viewership            |
+-----------------------+
*/

SHOW COLUMNS FROM channels;
/*
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int         | NO   | PRI | NULL    | auto_increment |
| name  | varchar(50) | NO   | UNI | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
*/
SHOW COLUMNS FROM episodes;
/*
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| id           | int          | NO   | PRI | NULL    | auto_increment |
| season_id    | int          | NO   | MUL | NULL    |                |
| series_id    | int          | NO   | MUL | NULL    |                |
| number       | int          | YES  |     | NULL    |                |
| title        | varchar(100) | NO   |     | NULL    |                |
| details      | text         | NO   |     | NULL    |                |
| duration     | int          | YES  |     | NULL    |                |
| release_date | date         | NO   |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
*/
SHOW COLUMNS FROM genres;
/*
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int         | NO   | PRI | NULL    | auto_increment |
| name  | varchar(50) | NO   | UNI | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
*/
SHOW COLUMNS FROM program_genres;
/*
+------------+------+------+-----+---------+-------+
| Field      | Type | Null | Key | Default | Extra |
+------------+------+------+-----+---------+-------+
| program_id | int  | NO   | PRI | NULL    |       |
| genre_id   | int  | NO   | PRI | NULL    |       |
+------------+------+------+-----+---------+-------+
*/
SHOW COLUMNS FROM programs;
/*
+---------+-------------+------+-----+---------+----------------+
| Field   | Type        | Null | Key | Default | Extra          |
+---------+-------------+------+-----+---------+----------------+
| id      | int         | NO   | PRI | NULL    | auto_increment |
| title   | varchar(50) | NO   |     | NULL    |                |
| details | text        | NO   |     | NULL    |                |
+---------+-------------+------+-----+---------+----------------+
*/
SHOW COLUMNS FROM seasons;
/*
+------------+------+------+-----+---------+----------------+
| Field      | Type | Null | Key | Default | Extra          |
+------------+------+------+-----+---------+----------------+
| id         | int  | NO   | PRI | NULL    | auto_increment |
| program_id | int  | NO   | MUL | NULL    |                |
| number     | int  | YES  |     | NULL    |                |
+------------+------+------+-----+---------+----------------+
*/
SHOW COLUMNS FROM series;
/*
+-------+--------------+------+-----+---------+----------------+
| Field | Type         | Null | Key | Default | Extra          |
+-------+--------------+------+-----+---------+----------------+
| id    | int          | NO   | PRI | NULL    | auto_increment |
| title | varchar(100) | NO   |     | NULL    |                |
+-------+--------------+------+-----+---------+----------------+
*/
SHOW COLUMNS FROM time_slots;
/*
+------------+----------+------+-----+---------+----------------+
| Field      | Type     | Null | Key | Default | Extra          |
+------------+----------+------+-----+---------+----------------+
| id         | int      | NO   | PRI | NULL    | auto_increment |
| channel_id | int      | NO   | MUL | NULL    |                |
| start_time | datetime | NO   |     | NULL    |                |
| end_time   | datetime | NO   |     | NULL    |                |
+------------+----------+------+-----+---------+----------------+
*/
SHOW COLUMNS FROM viewership;
/*
+--------------+------+------+-----+---------+----------------+
| Field        | Type | Null | Key | Default | Extra          |
+--------------+------+------+-----+---------+----------------+
| id           | int  | NO   | PRI | NULL    | auto_increment |
| episode_id   | int  | NO   | MUL | NULL    |                |
| time_slot_id | int  | NO   | MUL | NULL    |                |
| channel_id   | int  | NO   | MUL | NULL    |                |
| view_count   | int  | YES  |     | 0       |                |
+--------------+------+------+-----+---------+----------------+
*/

SELECT e.title, v.view_count
  FROM episodes AS e
  JOIN viewership AS v
    ON e.id = v.episode_id
 ORDER BY view_count DESC
 LIMIT 3;

SELECT 
    p.title AS PROGRAM_title,
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

SELECT * FROM time_slots;

SELECT * FROM channels;

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

UPDATE time_slots
   SET start_time = '2023-05-26 10:00:00', end_time = '2023-06-01 10:00:00'
 WHERE id = 6;