
-- 1 - Nombre y Apellido de todos los empleados, en orden alfabético.
SELECT FirstName, LastName FROM employees
order by FirstName ASC , LastName ASC /*Ordenamos los NOMBRES PRIMERO y luego los apellido de forma ascendente, sube hasta la Z*/

-- 2 - Nombre y duración de todas las canciones del álbum "Big Ones" ordenados del más largo al más corto
SELECT Name, Milliseconds, t.AlbumId FROM tracks t
INNER JOIN albums a on t.AlbumId = a.AlbumId
WHERE title = "Big Ones"
ORDER by t.Milliseconds DESC

-- 3 - Nombre de todos los géneros con la cantidad de canciones de cada uno
-- 4 - Nombre de los discos con al menos 5 canciones
-- 5 - Nombre y precio total de los 10 discos más baratos
-- 6 - Nombre del tema, nombre del género y nombre del disco del los temas que valen $0.99
-- 7 - Nombre del tema, duración, nombre del disco y nombre del artista de los 20 temas más cortos
-- 8 - Apellido, puesto, apellido del jefe y cantidad de clientes que atiende de todos los empleados, ordenado desde los que atienden más clientes a los que atienden menos
-- 9 - Insertar cuatro (4) canciones que les gusten.
--10 - Mostrar las cuatro canciones ingresadas.
--11 - Modifiquen dos (2) canciones por otras que se les ocurran.
--12 - Mostrar las dos (2) canciones modificadas.
--13 - Borrar dos (2) datos ingresados, realizando un solo delete.
