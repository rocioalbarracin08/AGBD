/**/

/*Conigna: ¿Cuántas películas hay en cada tipo de "rating" (g, pg, pg13, r, nc17)?*/
SELECT count(*), rating from film /*EspecifiCAR A QUE CATEGORIA PERTENECE CADA VALOR DADO*/
GROUP BY rating /*Agrupa según loas distintas categorias que encuntra en la columna (en este caso "rating")*/

/*Consigna: ¿Cuántas películas hay en cada "categoría"?*/
SELECT count(*), c.name from film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
GROUP BY c.category_id/*El "cuantas" indica usar count()*/
/* "Group BY" forma grupos de lo pedido (ej: un grupo con los que tengan este numero, o este color)*/
/*"count()" cuenta la cantidad de integrantes que formo el group by, sino contaria toda la tabla. Contar el número de filas que cumplen con una
condición o el número total de filas en una columna.*/

/*Consigna: Cuales son los 10 actores/actrices que más aparecen en las películas*/
SELECT count(*), a.first_name, a.last_name /*sin ordenar de mayor a menor, formamos grupos segun el id de cada actor por la cant_de_films*/
from film f 
INNER JOIN film_actor fa ON f.film_id = fa.film_id
INNER JOIN actor a ON fa.actor_id = a.actor_id
GROUP BY f.film_id 

SELECT count(a.actor_id), a.first_name, a.last_name 
from film f 
INNER JOIN film_actor fa ON f.film_id = fa.film_id
INNER JOIN actor a ON fa.actor_id = a.actor_id
GROUP BY f.film_id
ORDER BY count(a.actor_id) DESC LIMIT 10 /*DESC: Descendente(de arriba abajo) / LIMIT: llamar solo los primeros 10 que aparezcan*/

/*Cambiar de nombre a una columna*/
SELECT columna1 AS nombre_avreviado_de_la_columna1, columna2 /* "AS" -> Sirve para renombrar COLUMNAS, en "from" se le pone el cambio de nombre al lado */

SELECT count(a.actor_id) AS nombre_avreviado, a.first_name, a.last_name 
from film f 
INNER JOIN film_actor fa ON f.film_id = fa.film_id
INNER JOIN actor a ON fa.actor_id = a.actor_id
GROUP BY f.film_id
ORDER BY count(a.actor_id) DESC LIMIT 10 /*MEJOR RESPUESTA*/

