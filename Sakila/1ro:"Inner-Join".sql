--------------------------------------------
/*Ejercicio 1: Título de la película, dirección, ciudad y país del local del nombre de una película a elección.*/
select title, a.address, c.city, ct.country from film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN store s ON i.store_id = s.store_id
INNER JOIN address a ON s.address_id = a.address_id
INNER JOIN city c ON a.city_id = c.city_id
INNER JOIN country ct ON c.country_id = ct.country_id
where title = "AFRICAN EGG"--Pelicula de la lista...que su titulo empieza con "Roc"

/*Tip: Ir verificando los Join mientras se van agregando. Buscar coincidencias en ides*/
where f.title like "roc%"/*Se puede utilizar sin el % (IDEA PARA BUSCAR C/DESCRIPCION PERSONALIZADA). "f" El nombre de la tabla (¿Donde se encuentra esa columna?) */

--------------------------------------------
/*Ejercico 2: Mostrar título, categoría, idioma, rating y duración de las películas que estén entre 1 hs y 2 hs.*/
select f.title, f.rating, f.length, l.name, c.name FROM film f
INNER JOIN film_category fc on f.film_id = fc.film_id
INNER JOIN language l on f.language_id = l.language_id
INNER JOIN category c on fc.category_id = c.category_id
WHERE f.length BETWEEN 60 and 120 -- BETWEEN: entre
ORDER by f.length ASC --Odenar de forma Ascendente

--------------------------------------------
/*Ejercicio 3: Mostrar nombre, apellido y dirección (con ciudad y país) de los encargados del local*/
SELECT first_name, last_name, a.address, c.city, co.country
FROM staff st
INNER join address a on st.address_id = a.address_id --Direccion
INNER join city c on a.city_id = c.city_id --Ciudad
INNER join country co on c.country_id = co.country_id --País

--------------------------------------------
/*Ejercicio 4: Mostrar el título, la fecha mínima y máxima de devolución de una película.*/
SELECT f.title, min(r.rental_date), max(r.return_date) FROM film f
INNER join inventory i on f.film_id = i.film_id
INNER JOIN rental r on i.inventory_id = r.inventory_id

--------------------------------------------
/*Ejercicio 5: ¿Se puede realizar una unión de todas las tablas? En caso de que se pueda realizar la sentencia que corresponde para unir las tablas. Seleccionando los datos que ustedes consideren necesarios de cada tabla.
*/