----------------- Disco: album / traks: canciones o pistas----------------------------------
----------------- Customer: clientes / Employed: empleados----------------------------------

-- 6 - Nombre del tema, nombre del género y nombre del disco del los temas que valen $0.99
SELECT t.Name /*Tema*/, g.Name/*Género*/, a.Title/*Disco*/, t.UnitPrice/*Precio*/
from tracks t 
INNER join genres g on t.GenreId = g.GenreId
INNER join albums a on t.AlbumId = a.AlbumId
WHERE UnitPrice = 0.99

-- 7 - Nombre del tema, duración, nombre del disco y nombre del artista de los 20 temas más cortos
SELECT t.Name /*Tema*/, t.Milliseconds/*duración*/, a.Title/*Disco*/as album, art.name /*Artista*/as artista
from tracks t 
INNER join albums a on t.AlbumId = a.AlbumId
INNER join artists art on art.ArtistId = a.ArtistId
order by t.Milliseconds/*duración*/ ASC
limit 20

-- 8 - Apellido, puesto, apellido del jefe y cantidad de clientes que atiende de todos los empleados, ordenado desde los que atienden más clientes a los que atienden menos
SELECT e.LastName as Apellido_Jefe/*empleados*/, e.Title/*puesto*/as puesto_jefe, count(cu.CustomerId)as cantidad_clientes, j.LastName as Apellido_empleado
from employees e
INNER JOIN employees j ON e.EmployeeId = j.ReportsTo--Renombrarr una tabla si se quiere volver a usar
INNER join customers cu on cu.SupportRepId = j.EmployeeId
GROUP by j.EmployeeId
order by cantidad_clientes/*cantidad de clientes*/DESC
--Lo que era del jefe pasa a ser del empleado

-- 9 - Insertar cuatro (4) canciones que les gusten.