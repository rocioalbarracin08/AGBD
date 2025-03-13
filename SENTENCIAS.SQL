SENTENCIAS RECOMENDADAS EN " tinyurl.com/AGBD-5to-ETEC "

/*Bucar en todas las columnas "SELECT *" (de la tabla "FROM INHABITANT")
  segun la cantidad de datos dados "WHERE state ="friendly" AND job = "weaponsmith" 
  (sin el AND puede ser un solo dato)*/

SELECT * FROM INHABITANT WHERE state = "friendly" AND job = "weaponsmith"

/*LIKE = Encontrar la palbra buscada (sea en minúscula o en mayúscula)
  % = Segun donde este ubicado el "%" la palabra tiene que ser encontrada
  en el lugar de espacio:
  (%_  = en el final)
  (_%  = en el inicio)
  (%_% = en el en medio)*/

SELECT * FROM INHABITANT WHERE  job LIKE '%smith' AND state = "friendly"

/*Si necesito saber un dato en la lista y solo tengo el nombre
- Puedo buscar el nombre " WHERE name = "Stranger" ", 
  indicando la columna de la que necesito el dato " SELECT personid "
  e indicando la lista que voy a usar para sacar la columna " FROM INHABITANT " */
SELECT personid FROM INHABITANT WHERE name = "Stranger"  /*Buscar ID*/
SELECT gold FROM INHABITANT WHERE name = "Stranger"      /*Buscar Cantidad de oro*/

/*Llamar otra lista pero VACIA
   NULL : Sin dueño*/
SELECT * FROM ITEM WHERE owner IS NULL

/*Para que los objetos tengan propietario cambiamos el valor de su owner "owner = 20"
  UPDATE : De la lista ITEM para modificarla(El from solo llama a la tabla) 
  Diferencia -> Modifica en la tabla
  SET    : Cambiar el valor de algo (en est caso de owner)*/
UPDATE item SET owner = 20 WHERE owner IS NULL
UPDATE item SET owner = 20 /*Cambiar valor, referencia de una columna, con su nombre 
                             (en este caso "owner")*/

/*¿Los objetos de que propietario busco?*/
SELECT * FROM ITEM WHERE owner = 20 /* Llamar, mostrar la lista modificada anteriormente 
"WHERE owner = 20" items que le pertenecen al propiertario 20 */

/*Primero cumplir con una condicion Y luego con otra para encontrar lo PEDIDO 
  Colocar parentesis () (IMPORTANTE para diferenciarlo)*/
SELECT * FROM INHABITANT WHERE (job = "dealer" OR job = "merchant") AND state = "friendly" 

/*En esta respuesta usamos el UPDATE para modificar el propietario de cualquiera de 
  los ndos objetos pedidos - CAMBIAR de propietario "owner" */
UPDATE item SET owner = 15 WHERE item = "teapot" OR item = "ring"
UPDATE inhabitant SET name = "Gonzalo" WHERE personid = 20 /*Modifico el nombre falso del
                                                             protagonista, por uno verdadero*/



