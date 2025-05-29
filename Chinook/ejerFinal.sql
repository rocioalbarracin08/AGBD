----------------- Disco: album / traks: canciones o pistas----------------------------------
--10 - Mostrar las cuatro canciones ingresadas.
SELECT * FROM tracks WHERE TrackId > 3503 --Usamos Id para lograr una busqueda más segura

--11 - Modifiquen dos (2) canciones por otras que se les ocurran.
UPDATE tracks set Milliseconds = 342579 WHERE TrackId = 3505;
UPDATE tracks SET Milliseconds = 360008 WHERE TrackId = 3507;

--12 - Mostrar las dos (2) canciones modificadas.
SELECT * FROM tracks where TrackId IN (3505,3507) --IN es como un for (parecido), "="es para exactitudes

--13 - Borrar dos (2) datos ingresados, realizando un solo delete.
delete FROM tracks WHERE TrackId in ( 3506, 3504 )