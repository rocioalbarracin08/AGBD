/**/
/*Título de la película a elección*/
select * from film where title like "Roc%" /*Pelicula de la lista...que su titulo empieza con "Roc"*/

/*Ejercicio: Dirección, ciudad y país del local de película a elección
Incluir y relacionar dato de distintas tablas*/
select * from film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN store s ON i.store_id = s.store_id
INNER JOIN address a ON s.address_id = a.address_id
INNER JOIN city c ON a.city_id = c.city_id
INNER JOIN country ct ON c.country_id = ct.country_id
/*Tip: Ir verificando los Join mientras se van agregando. Buscar coincidencias en ides*/
 
select c.country_id from film f /*Primero nombre de la tabla y luego nombre de la columna (separado por un punto) - mostrar datos especificos de cada tabla*/
select c.country_id, f.title, a.address, c.city from film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN store s ON i.store_id = s.store_id
INNER JOIN address a ON s.address_id = a.address_id
INNER JOIN city c ON a.city_id = c.city_id
INNER JOIN country ct ON c.country_id = ct.country_id
where f.title like "roc%"/*Se puede utilizar sin el % (iDEA PARA BUSCAR C/DESCRIPCION PERSONALIZADA). "f"El nombre de la tabla (¿Donde se encuentra esa columna?) */

/*ROCKETEER MOTHER Nombre elegido*/

/*Ejercico: Mostrar título, categoría, idioma, rating y duración de las películas que estén entre 1 hs y 2 hs.*/
select c.country_id, f.title, a.address, c.city from film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN store s ON i.store_id = s.store_id
INNER JOIN address a ON s.address_id = a.address_id
INNER JOIN city c ON a.city_id = c.city_id
INNER JOIN country ct ON c.country_id = ct.country_id  /*De todas las peliculas*/


