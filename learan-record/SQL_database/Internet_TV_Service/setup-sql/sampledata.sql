-- channelsテーブルのサンプルデータ
INSERT INTO channels (name) VALUES
('Channel A'),
('Channel B'),
('Channel C');

-- time_slotsテーブルのサンプルデータ
INSERT INTO time_slots (channel_id, start_time, end_time) VALUES
(1, '2023-05-22 09:00:00', '2023-05-22 10:00:00'),
(2, '2023-05-22 10:00:00', '2023-05-22 11:00:00'),
(3, '2023-05-22 11:00:00', '2023-05-22 12:00:00');

-- genresテーブルのサンプルデータ
INSERT INTO genres (name) VALUES
('Drama'),
('Comedy'),
('Action');

-- programsテーブルのサンプルデータ
INSERT INTO programs (title, details) VALUES
('Program A', 'This is Program A'),
('Program B', 'This is Program B'),
('Program C', 'This is Program C');

-- program_genresテーブルのサンプルデータ
INSERT INTO program_genres (program_id, genre_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- seriesテーブルのサンプルデータ
INSERT INTO series (title) VALUES
('Series X'),
('Series Y'),
('Series Z');

-- seasonsテーブルのサンプルデータ
INSERT INTO seasons (program_id, number) VALUES
(1, 1),
(2, 1),
(3, 1);

-- episodesテーブルのサンプルデータ
INSERT INTO episodes (season_id, series_id, number, title, details, duration, release_date) VALUES
(1, 1, 1, 'Episode 1', 'This is Episode 1', 30, '2023-05-22'),
(1, 1, 2, 'Episode 2', 'This is Episode 2', 30, '2023-05-23'),
(2, 2, 1, 'Episode 1', 'This is Episode 1', 30, '2023-05-22'),
(2, 2, 2, 'Episode 2', 'This is Episode 2', 30, '2023-05-23'),
(3, 3, 1, 'Episode 1', 'This is Episode 1', 30, '2023-05-22'),
(3, 3, 2, 'Episode 2', 'This is Episode 2', 30, '2023-05-23');

-- viewershipテーブルのサンプルデータ
INSERT INTO viewership (episode_id, time_slot_id, channel_id, view_count) VALUES
(1, 1, 1, 100),
(1, 2, 2, 150),
(2, 1, 1, 120),
(2, 2, 2, 180),
(3, 1, 2, 90),
(3, 3, 3, 200),
(4, 2, 2, 170),
(5, 3, 3, 220),
(6, 1, 1, 110),
(6, 3, 3, 190);
