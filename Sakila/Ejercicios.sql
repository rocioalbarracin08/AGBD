
/*----------------- Consignas Sakila -----------------*/
--------------------------------------------
/*Consigna 9: ¿Cuántos ejemplares (inventory) en total hay en cada local?  Como no hay nombre del local, poner en su lugar la dirección incluyendo ciudad y país además de la cantidad*/
SELECT count(film_id) 
from inventory i
inner join store s on i.store_id = s.store_id
group by s.store_id --Por ahora Cuenta la cantidad de ejemplares

SELECT count(i.film_id), a.address, c.city, co.country /*En el select lo que queremos mostrar*/
from inventory i
inner join store s on i.store_id = s.store_id
inner join address a on s.address_id = a.address_id
inner join city c on a.city_id = c.city_id
inner join country co on c.country_id = co.country_id
group by s.store_id /*En este caso store fue la unica tabla por la que solo pase por encima, tratando de ser un medio para encotrar coincidencia por las otras tablas*/

/*......................................................
 "Cuantos/as" -> Si count nos da un numero grande es porque más adelante vamos a tener que agrupar, para agrupar usamos el id de las tiendas 
......................................................*/

--------------------------------------------
/*Consigna 10: ¿Cuántas películas distintas hay en cada local? Como no hay nombre del local, poner en su lugar la dirección incluyendo ciudad y país además de la cantidad*/
/*---Usamos una nueva función "DISTINCT"---*/
SELECT count(DISTINCT i.film_id) AS cant_peli_dif, a.address, c.city, co.country
from inventory i
inner join store s on i.store_id = s.store_id
inner join address a on s.address_id = a.address_id
inner join city c on a.city_id = c.city_id
inner join country co on c.country_id = co.country_id
group by s.store_id
--Distint elige las peliculas repetidas - una copia de cada pelicula

--------------------------------------------
/*Consigna 11: Calcular el costo de alquiler promedio de las película de cada categoría.*/
SELECT avg(rental_duration * rental_rate)AS promedio, c.name FROM film f
inner join film_category fc on f.film_id = fc.film_id
inner join category c on fc.category_id = c.category_id
group by fc.category_id -- Agrupar por categoria y no por pelicula (film_id)
-- Rental_duration: Dias de duracion del alquiler /Length: horas de duracion / rental_rate: precio por dia

--------------------------------------------
/*Consigna 12: De la película “ALABAMA DEVIL” mostrar de cada alquiler: el costo total, los días, costo por día, el día que se alquiló y que día se devolvió ordenado por algún criterio a elección*/
SELECT r.rental_date/*dia incicio rentado*/, r.return_date/*dia devolución*/, rental_duration/*dias de duracion*/, rental_rate /*costo por día*/, f.title , rental_duration*rental_rate AS costo_total
from film f
INNER JOIN inventory i on f.film_id = i.film_id
INNER JOIN rental r on i.inventory_id = r.inventory_id
where title = "ALABAMA DEVIL";-- Tener cuidado al usar comillas (color rosa si son correctas)

--------------------------------------------
/*Consigna 13: Nombre, duración y categoria de todas las peliculas ordenados del más largo al más corto.*/
select f.title, rental_duration ,fc.category_id
FROM film f
INNER JOIN film_category fc on f.film_id = fc.film_id
inner join category c on fc.category_id = c.category_id
order by fc.category_id, rental_duration DESC

--------------------------------------------
/*Consigna 14: Nombre de las peliculas que arranquen‘’w’’ con al menos 5 actores (agrupar POR peliculas).*/
SELECT title, count(fa.actor_id) as cantActores
from film f
INNER JOIN film_actor fa on fa.film_id = f.film_id
where title like "w%" 
group by f.film_id --no por actores_id
HAVING cantActores > 5
ORDER BY cantActores ASC
--------------------------------------------
/*Consigna 15: Calcular la suma total de los pagos (amount) con nombre y apellido de cada cliente.*/
SELECT sum(amount) as precioTotal, c.first_name, c.last_name FROM payment p
INNER JOIN customer c on p.customer_id = c.customer_id
GROUP by c.customer_id

--------------------------------------------
/*Consigna 16: Nombre de la pelicula, duración y nombre del actor de las peliculas más cortas.*/
select f.title, f.length, a.first_name
from film f
INNER JOIN film_actor fa on f.film_id = fa.film_id
INNER JOIN actor a on fa.actor_id = a.actor_id
order by f.length asc

--------------------------------------------
/*Consigna 17: apellido del cliente con su ciudad, pais, direccion, sus alquileres y pagos, ordenado los pagos de menor a mayor.*/
SELECT last_name, c.city, co.country, a.address, p.amount, r.rental_date 
FROM customer cu
INNER JOIN address a on a.address_id = cu.address_id 
INNER JOIN city c on a.city_id = c.city_id
INNER JOIN country co on co.country_id = c.country_id
INNER JOIN rental r on r.customer_id = cu.customer_id
INNER JOIN payment p on cu.customer_id = p.payment_id
group by cu.last_name --El orden importa (primero agrupar y luego ordenar)
order by p.amount asc

--------------------------------------------
/*Consigna 18: Insertarse uno mismo como actor con todos sus campos.*/
INSERT INTO actor (actor_id, first_name, last_name, last_update) 
VALUES (201, "Rocío", "Albarracín", "2020-12-23 07:12:31");

--------------------------------------------
/*Consigna 19: Insertar 2 amigos o nombres que consideren.*/
INSERT INTO actor (actor_id, first_name, last_name, last_update) 
VALUES (204, "Celedonio", "Alvarez", "2025-05-15 07:12:31"), 
       (205, "Ariana", "Villa", "2025-05-15 07:12:31") --Una vez insertado, no se puede volver a insertar el mismo registro (solo es modificable)/ No se pone ";" al final

--------------------------------------------
/*Consigna 20: Modificar los 3 datos ingresados por datos nuevos o de gente famosa.*/ 
update actor set first_name = 'Lupe', last_name = 'Reifo'
WHERE actor_id = 204; 
--No se pueden poner dos datos (para cambiar) en una sola columna (intencion de abreviar->X)
--Cada columna solo recibe un dato para cambiar, por eso hacemos 2 updates
UPDATE actor set first_name = 'Pepita', last_name = 'Ofier'
WHERE actor_id = 205; --Al final de un update se pone ";" obligatoriamente para ejecutarlo

--------------------------------------------
/*Consigna 21: Borrar todos los datos ingresados finalmente.*/
 DELETE from actor WHERE actor_id > 200 -- Borramos los que agregamos, los que agregamos eran luego del id 200