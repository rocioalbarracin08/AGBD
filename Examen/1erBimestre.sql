-- Cuántas canciones tiene el álbum unplugged?
SELECT a.Title, count(t.AlbumId) FROM tracks t
INNER JOIN albums a on t.AlbumId = a.AlbumId
WHERE title = "Unplugged"
GROUP by t.AlbumId 

-- Mostrar los artistas que tienen 30 o más canciones ordenadas del que tiene más al que tiene menos.
SELECT a.Title, ar.name, count(t.TrackId) as canciones FROM tracks t
INNER JOIN albums a on t.AlbumId = a.AlbumId
INNER JOIN artists ar ON a.ArtistId = ar.ArtistId
GROUP by ar.ArtistId
HAVING canciones >= 30 
ORDER BY canciones DESC
  
-- Insertar 6 canciones que elijan, con sus respectivos datos.(fijense en la estructura de la tabla que datos tiene que usar)
INSERT INTO tracks(Name, MediaTypeId, Milliseconds, UnitPrice)
VALUES("Pretty Woman", 5, 34567, 0.5),
("Pedropiedra", 5, 34567, 0.5),
("DídimosThomas", 4, 34569, 0.6),
("MagdalenMaria", 2, 34507, 0.7),
("JohnLov", 1, 34566, 0.8),
("SimonLucha", 4, 34567, 0.9);
/*Para ver resultados: SELECT name FROM tracks WHERE name = "Pretty Woman"*/

-- Modificar el nombre de una canción insertada, y al segundo registro ingresado modificar los milisegundos.
UPDATE tracks SET name = "Sugar" WHERE trackId =  3501; --";" al final para dar inicio a otro update
UPDATE tracks SET Milliseconds = 7654 WHERE trackId =  3502;

-- Borrar dos datos agregados y modificados con una sola sentencia de borrar. DELETE
DELETE FROM tracks WHERE TrackId >= 3514 and TrackId<=3516   

-- :)

