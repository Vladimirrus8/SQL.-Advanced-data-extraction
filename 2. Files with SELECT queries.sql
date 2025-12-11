2. File with SELECT queries

SELECT 
     title, duration
FROM 
     Tracks
ORDER BY duration DESC
LIMIT 1;

SELECT 
     title
FROM 
     Tracks
WHERE 
     duration >= 210;

SELECT 
     title
FROM 
     Compilations
WHERE 
     release_year BETWEEN 2018 AND 2020;

SELECT 
     name
FROM 
     Artists
WHERE 
     name NOT LIKE '% %';

SELECT 
     title
FROM 
     Tracks
WHERE 
     title 
LIKE '%мой%' 
     OR title LIKE '%my%';



3. File with SELECT queries

SELECT 
     g.name, COUNT(ag.artist_id) AS artist_count
FROM 
     Genres g
LEFT JOIN 
     Artists_Genres ag 
     ON g.id = ag.genre_id
GROUP BY g.name;

SELECT 
     a.title, COUNT(t.id) AS track_count
FROM 
     Albums a
LEFT JOIN 
     Tracks t 
     ON a.id = t.album_id
WHERE 
     a.release_year BETWEEN 2019 AND 2020
GROUP BY a.title;

SELECT 
     a.title, AVG(t.duration) AS average_duration
FROM 
     Albums a
JOIN 
     Tracks t 
     ON a.id = t.album_id
GROUP BY a.title;

SELECT 
     name
FROM 
     Artists
WHERE id NOT IN (SELECT artist_id FROM Artists_Albums WHERE album_id IN (SELECT id FROM Albums WHERE release_year = 2020));

SELECT 
     c.title
FROM 
     Compilations c
JOIN 
     Compilation_Tracks ct 
     ON c.id = ct.compilation_id
JOIN 
     Tracks t 
     ON ct.track_id = t.id
JOIN 
     Artists_Albums aa 
     ON t.album_id = aa.album_id
WHERE 
     aa.artist_id = (SELECT id FROM Artists WHERE name = 'Исполнитель 1');



4. File with SELECT queries

SELECT 
     a.title
FROM 
     Albums a
JOIN 
     Tracks t 
     ON a.id = t.album_id
JOIN 
     Artists_Albums aa 
     ON a.id = aa.album_id
JOIN 
     Artists_Genres ag 
     ON aa.artist_id = ag.artist_id
GROUP BY a.title
HAVING COUNT(DISTINCT ag.genre_id) > 1;

SELECT 
     t.title
FROM 
     Tracks t
LEFT JOIN 
     Compilation_Tracks ct 
     ON t.id = ct.track_id
WHERE 
     ct.compilation_id IS NULL;

SELECT DISTINCT 
     a.name
FROM 
     Artists a
JOIN 
     Artists_Albums aa 
     ON a.id = aa.artist_id
JOIN 
     Albums al ON aa.album_id = al.id
JOIN 
     Tracks t 
     ON al.id = t.album_id
WHERE 
     t.duration = (SELECT MIN(duration) FROM Tracks);

SELECT 
     a.title
FROM 
     Albums a
JOIN 
     Tracks t ON a.id = t.album_id
GROUP BY a.title
HAVING COUNT(t.id) = (
    SELECT MIN(track_count)
    FROM (
        SELECT COUNT(*) AS track_count
        FROM Tracks
        GROUP BY album_id
    ) AS track_counts
);