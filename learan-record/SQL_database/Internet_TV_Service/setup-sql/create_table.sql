
-- データベースの作成

CREATE DATABASE internet_tv;

-- 使用するデータベースの宣言

USE internet_tv;

-- 各テーブルの作成

CREATE TABLE channels (
  PRIMARY KEY (id),
  UNIQUE (name),
  id   INT          NOT NULL AUTO_INCREMENT,
  name VARCHAR(50)  NOT NULL
);

CREATE TABLE genres(
  PRIMARY KEY (id),
  UNIQUE (name),
  id   INT         NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE programs(
  PRIMARY KEY (id),
  id        INT         NOT NULL AUTO_INCREMENT,
  title     VARCHAR(50) NOT NULL,
  details   TEXT        NOT NULL
);

CREATE TABLE program_genres(
  PRIMARY KEY (program_id, genre_id),
  FOREIGN KEY (program_id) REFERENCES programs(id),
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  program_id INT,
  genre_id INT
);

CREATE TABLE series(
  PRIMARY KEY (id),
  id    INT          NOT NULL AUTO_INCREMENT,
  title VARCHAR(100) NOT NULL
);

CREATE TABLE seasons(
  PRIMARY KEY (id),
  FOREIGN KEY (program_id) REFERENCES programs(id),
  id         INT NOT NULL AUTO_INCREMENT,
  program_id INT NOT NULL,
  number     INT
);

CREATE TABLE episodes(
  PRIMARY KEY (id),
  FOREIGN KEY (season_id) REFERENCES seasons(id),
  FOREIGN KEY (series_id) REFERENCES series(id),
  id           INT          NOT NULL AUTO_INCREMENT,
  season_id    INT          NOT NULL,
  series_id    INT          NOT NULL,
  number       INT,
  title        VARCHAR(100) NOT NULL,
  details      TEXT         NOT NULL,
  duration     INT,
  release_date DATE         NOT NULL
);

CREATE TABLE time_slots(
  PRIMARY KEY (id),
  FOREIGN KEY (channel_id) REFERENCES channels(id),
  FOREIGN KEY (episode_id) REFERENCES episodes(id),
  id          INT       NOT NULL AUTO_INCREMENT,
  channel_id  INT       NOT NULL,
  episode_id    INT       NOT NULL,
  start_time  DATETIME  NOT NULL,
  end_time    DATETIME  NOT NULL
);

CREATE TABLE viewership(
  PRIMARY KEY (id),
  FOREIGN KEY (episode_id) REFERENCES episodes(id),
  FOREIGN KEY (time_slot_id) REFERENCES time_slots(id),
  FOREIGN KEY (program_id) REFERENCES programs(id),
  FOREIGN KEY (channel_id) REFERENCES channels(id),
  id            INT NOT NULL AUTO_INCREMENT,
  episode_id    INT NOT NULL,
  time_slot_id  INT NOT NULL,
  program_id    INT NOT NULL,
  channel_id    INT NOT NULL,
  view_count    INT DEFAULT 0
);

-- テーブルが作成されているかの確認

SHOW TABLES FROM internet_tv;