-- channels テーブルのサンプルデータ
INSERT INTO channels (id, name) VALUES
(1, 'Channel A'),
(2, 'Channel B'),
(3, 'Channel C'),
(4, 'Channel D'),
(5, 'Channel E');

-- genres テーブルのサンプルデータ
INSERT INTO genres (id, name) VALUES
(1, 'Genre A'),
(2, 'Genre B'),
(3, 'Genre C'),
(4, 'Genre D'),
(5, 'Genre E');

-- programs テーブルのサンプルデータ
INSERT INTO programs (id, title, details) VALUES
(1, 'Program A', 'This is Program A.'),
(2, 'Program B', 'This is Program B.'),
(3, 'Program C', 'This is Program C.'),
(4, 'Program D', 'This is Program D.'),
(5, 'Program E', 'This is Program E.');

-- program_genres テーブルのサンプルデータ
INSERT INTO program_genres (program_id, genre_id) VALUES
(1, 1), -- Program A belongs to Genre A
(2, 2), -- Program B belongs to Genre B
(3, 3), -- Program C belongs to Genre C
(4, 4), -- Program D belongs to Genre D
(5, 5); -- Program E belongs to Genre E

-- series テーブルのサンプルデータ
INSERT INTO series (id, title) VALUES
(1, 'Series 1'),
(2, 'Series 2'),
(3, 'Series 3'),
(4, 'Series 4'),
(5, 'Series 5');

-- seasons テーブルのサンプルデータ
INSERT INTO seasons (id, program_id, number) VALUES
(1, 1, 1), -- Season 1 of Program A
(2, 2, 1), -- Season 1 of Program B
(3, 3, 1), -- Season 1 of Program C
(4, 4, 2), -- Season 2 of Program D
(5, 5, 1); -- Season 1 of Program E

-- episodes テーブルのサンプルデータ
INSERT INTO episodes (id, season_id, series_id, number, title, details, duration, release_date) VALUES
(1, 1, 1, 1, 'Episode 1', 'This is Episode 1 of Season 1.', 30, '2023-01-01'),
(2, 1, 1, 2, 'Episode 2', 'This is Episode 2 of Season 1.', 30, '2023-01-08'),
(3, 1, 1, 3, 'Episode 3', 'This is Episode 3 of Season 1.', 30, '2023-01-15'),
(4, 2, 1, 1, 'Episode 1', 'This is Episode 1 of Season 2.', 30, '2023-01-22'),
(5, 3, 1, 1, 'Episode 1', 'This is Episode 1 of Season 1.', 30, '2023-01-01'),
-- Add more episodes
(6, 1, 2, 1, 'Episode 1', 'This is Episode 1 of Season 1.', 30, '2023-02-01'),
(7, 1, 2, 2, 'Episode 2', 'This is Episode 2 of Season 1.', 30, '2023-02-08'),
(8, 1, 2, 3, 'Episode 3', 'This is Episode 3 of Season 1.', 30, '2023-02-15'),
(9, 2, 2, 1, 'Episode 1', 'This is Episode 1 of Season 2.', 30, '2023-02-22'),
(10, 3, 2, 1, 'Episode 1', 'This is Episode 1 of Season 1.', 30, '2023-02-01');

-- time_slots テーブルのサンプルデータ
INSERT INTO time_slots (id, channel_id, episode_id, start_time, end_time) VALUES
(1, 1, 1, '2023-01-01 10:00:00', '2023-01-01 10:30:00'), -- Channel A, Episode 1, Time Slot 1
(2, 2, 2, '2023-01-02 14:00:00', '2023-01-02 14:30:00'), -- Channel B, Episode 2, Time Slot 2
(3, 3, 3, '2023-01-03 18:00:00', '2023-01-03 18:30:00'), -- Channel C, Episode 3, Time Slot 3
(4, 4, 4, '2023-01-04 22:00:00', '2023-01-04 22:30:00'), -- Channel D, Episode 4, Time Slot 4
(5, 5, 5, '2023-05-26 09:00:00', '2023-06-05 09:30:00'), -- Channel E, Episode 5, Time Slot 5
-- Add more time slots
(6, 1, 6, '2023-05-26 10:00:00', '2023-06-01 10:00:00'), -- Channel A, Episode 6, Time Slot 6
(7, 2, 7, '2023-02-02 14:00:00', '2023-02-02 14:30:00'), -- Channel B, Episode 7, Time Slot 7
(8, 3, 8, '2023-02-03 18:00:00', '2023-02-03 18:30:00'), -- Channel C, Episode 8, Time Slot 8
(9, 4, 9, '2023-02-04 22:00:00', '2023-02-04 22:30:00'), -- Channel D, Episode 9, Time Slot 9
(10, 5, 10, '2023-06-01 09:00:00', '2023-06-01 09:30:00'); -- Channel E, Episode 10, Time Slot 10

-- viewership テーブルのサンプルデータ
INSERT INTO viewership (id, episode_id, time_slot_id, program_id, channel_id, view_count) VALUES
(1, 1, 1, 1, 1, 100), -- Episode 1, Time Slot 1, Program A, Channel A, View Count 100
(2, 2, 2, 2, 2, 200), -- Episode 2, Time Slot 2, Program B, Channel B, View Count 200
(3, 3, 3, 3, 3, 300), -- Episode 3, Time Slot 3, Program C, Channel C, View Count 300
(4, 4, 4, 4, 4, 400), -- Episode 4, Time Slot 4, Program D, Channel D, View Count 400
(5, 5, 5, 5, 5, 500), -- Episode 5, Time Slot 5, Program E, Channel E, View Count 500
-- Add more viewership records
(6, 6, 6, 1, 1, 150), -- Episode 6, Time Slot 6, Program A, Channel A, View Count 150
(7, 7, 7, 2, 2, 250), -- Episode 7, Time Slot 7, Program B, Channel B, View Count 250
(8, 8, 8, 3, 3, 350), -- Episode 8, Time Slot 8, Program C, Channel C, View Count 350
(9, 9, 9, 4, 4, 450), -- Episode 9, Time Slot 9, Program D, Channel D, View Count 450
(10, 10, 10, 5, 5, 550); -- Episode 10, Time Slot 10, Program E, Channel E, View Count 550
