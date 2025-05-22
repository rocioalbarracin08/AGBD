----------------- Disco: album / traks: canciones o pistas----------------------------------

-- 1 - Nombre y Apellido de todos los empleados, en orden alfabético.
SELECT FirstName, LastName FROM employees
order by FirstName ASC , LastName ASC /*Ordenamos los NOMBRES PRIMERO y luego los apellido de forma ascendente, sube hasta la Z*/

-- 2 - Nombre y duración de todas las canciones del álbum "Big Ones" ordenados del más largo al más corto
SELECT Name, Milliseconds, t.AlbumId FROM tracks t
INNER JOIN albums a on t.AlbumId = a.AlbumId
WHERE title = "Big Ones"
ORDER by t.Milliseconds DESC

-- 3 - Nombre de todos los géneros con la cantidad de canciones de cada uno
SELECT count(TrackId)as cant_canciones, g.name 
FROM tracks t
INNER JOIN genres g on g.GenreId = t.GenreId
GROUP by g.GenreId

-- 4 - Nombre de los discos con al menos 5 canciones
SELECT a.Title, count(TrackId) as cantidad_canciones
FROM tracks t
INNER JOIN albums a on t.AlbumId = a.AlbumId
GROUP by a.Title --Agrupamos por disco
HAVING cantidad_canciones >=5
order by cantidad_canciones ASC /*PREGUNTAR SI ESTA BIEN*/

-- 5 - Nombre y precio total de los 10 discos más baratos
SELECT a.Title, sum(UnitPrice) as precioTotal_album
FROM tracks t 
INNER join albums a on a.AlbumId = t.AlbumId
GROUP by a.AlbumId --No es lo mismo agrupar por título que por ID, el id ("AlbumId") es único
ORDER by precioTotal_album ASC
limit 10
