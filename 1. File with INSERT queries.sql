INSERT INTO Genres (name)
VALUES
     ('Pop'),
     ('Rock'),
     ('Hip-Hop');

INSERT INTO Artists (name)
VALUES
     ('Исполнитель 1'),
     ('Исполнитель 2'),
     ('Исполнитель 3'),
     ('Исполнитель 4');

INSERT INTO Albums (title, release_year)
VALUES
     ('Альбом 1', 2019),
     ('Альбом 2', 2020),
     ('Альбом 3', 2021);

INSERT INTO Tracks (title, album_id, duration)
VALUES
     ('Трек 1', 1, 210),  -- 3:30
     ('Трек 2', 1, 240),  -- 4:00
     ('Трек 3', 2, 210),  -- 3:30
     ('Трек 4', 2, 330),  -- 5:30
     ('Трек 5', 3, 150),  -- 2:30
     ('Трек 6', 3, 300);  -- 5:00

INSERT INTO Compilations (title, release_year)
VALUES
     ('Сборник 1', 2018),
     ('Сборник 2', 2019),
     ('Сборник 3', 2020),
     ('Сборник 4', 2021);

INSERT INTO Artists_Genres (artist_id, genre_id)
VALUES
     (1, 1),
     (1, 2),
     (2, 1),
     (3, 2),
     (4, 3);

INSERT INTO Artists_Albums (artist_id, album_id)
VALUES
     (1, 1),
     (1, 2),
     (2, 2),
     (3, 3),
     (4, 1);

INSERT INTO Compilation_Tracks (compilation_id, track_id)
VALUES
     (1, 1),
     (2, 2),
     (3, 3),
     (3, 4),
     (4, 5),
     (4, 6);