/**/
/*TABLAS RELACIONADAS - Relación(tiene flechitas)*/

/*Nombre de las tablas segun la base datos usada*/
SELECT name 
FROM sqlite_master   /*El nombre de la tabla*/
where type = 'table' /*Traer tablas en un tipo de tabla*/

/*Encontrar o para saber la estructura (lo que guarda en sus columnas - el dato que da la tabla) de la tabla*/
SELECT sql 
FROM sqlite_master
where name = 'solution' /*Su funcionamiento depende de la tecnologia de base de datos que use*/

/*Filtrar por los datos que tengo
DATOS : fecha(date) - tipo de crimen (type) - ciudad (city)*/
SELECT * FROM crime_scene_report where date = "20180115" and type = "murder" and  city = "SQL City"

/* DATOS OBTENIDOS: Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".*/

/*Buscar en otra tabla - en este caso datos de la persona (Segun los datos recibidos anteriormente de la otra tabla)*/
SELECT * FROM person
SELECT * FROM person where name = "Annabel" and address_street_name = "Franklin Ave" /*Reemplzar con LIKE " = " */
SELECT * FROM person 
where name like "Annabel%" and address_street_name like "Franklin Ave"
/*LIKE: Perminte que este en mayúscula o en minúscula lo ingresado y ademas permite indicar si arranca (%...),termina(...%) y contiene(%...%)*/

/*DATOS OBTENIDOS
id: 16371	
name: Annabel Miller	(Testigo 1)
license_id: 490173	
address_numbre: 103	
address_street_name: Franklin Ave	
ssn: 318771143         (identificador)

id: 14887	
name: Morty Schapiro	(Testigo 2)
license_id: 118009	
address_number: 4919	
address_street_name: Northwestern Dr	
ssn: 111564949
*/

/*Ordenar la lista - ORDER BY ... DESC (limit (num.): limitar la cantidad de resultados que aparezcan)
Ascendente: de abajo arriba (menor a mayor)
Descendente: de arriba abajo (mayor a menor)*/
SELECT * FROM person 
where address_street_name like "Northwestern Dr" /*dRespuestas solo del pueblito que busco*/
ORDER BY address_number  DESC limit 1;


/*JOIN parecdido al "join inner" */
SELECT * FROM interview i JOIN person p /*Comparando y nombrando las dos tablas / Darle un nombre abreviado a la tabla (al lado de su nombre)*/ 
ON i.person_id = p.id /*Columnas a usar de esas dos tablas (usando la abreviacion creada como nombre)*/
where address_street_name like "Northwestern Dr" /*Datos a buscar como datos de cada columna*/
and address_number = 4919

SELECT * FROM interview i JOIN person p 
ON i.person_id = p.id
where address_street_name like "Franklin Ave" 
and address_number = 103
/*TESTIMONIOS
(Testigo 2)
I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".
(Testigo 1)
I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.
*/



