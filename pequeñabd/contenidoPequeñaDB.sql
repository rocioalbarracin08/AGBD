-- CONTENIDO EN TABLAS
--------------------------
-- Tabla: productos
INSERT INTO productos (name, id_categoria, precio) 
VALUES ("Broche hawaiano celeste", 11, 3000),
("Broche hawaiano rosa", 11, 3000),
("Broche flor violeta mate", 11, 3000),
("Broche rectangular verde mate", 11, 3000),
("Broche rectangular amarillo", 11, 3000),
("Broche flor rojo mate", 11, 3000),
--MODIFICAMOS IDs equivocados -> UPDATE productos set id_categoria = 12 WHERE id_categoria = 5
("Scrunchie basica lisa", 13, 600),
("Scrunchie color liso con perlas", 13, 1000),
("Scrunchie estampado con perlas", 13, 900),
("Scrunchie estampado", 13, 600) -- TE FALTA UN DATO DE LA FORYNKEY
 -- AGREGAAAR

----------------------------
-- Tabla: registro_productos

-----------------------------
-- Tabla: tiendas

-----------------------------
-- Tabla: empleados

-----------------------------
-- Tabla: cant_productos

-----------------------------
-- Tabla: registro_productos
INSERT INTO ventas (dia, mes, anio, id_pago, costo_total, id_empleado) 
VALUES (26, 6, 2025, 2, )
-----------------------------
-- Tabla: ventas
INSERT INTO ventas (dia, mes, anio, id_pago, costo_total, id_empleado, id_cantidad) 
VALUES (26, 6, 2025, 2, 6000, 1, 1)
(26, 6, 2025, 2, 6000, 1, 2)
(26, 6, 2025, 2, 6000, 1, 3)
(26, 6, 2025, 2, 6000, 2, 5)
(26, 6, 2025, 2, 6000, 2, 6)
(26, 6, 2025, 2, 6000, 3, 7)
(26, 6, 2025, 2, 6000, 1, 8)



-----------------------------------------------------
--COLOCAMOS LAS SENTENCIAS EN CONJUNTO EN EL EJECUTOR
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "categoria" (
	"id_category"	INTEGER,
	"categoria"	varchar(30) NOT NULL UNIQUE,
	PRIMARY KEY("id_category" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "productos" (
	"id_producto"	INTEGER,
	"name"	varchar(30) NOT NULL,
	"id_categoria"	INTEGER NOT NULL,
	"precio"	INTEGER NOT NULL,
	PRIMARY KEY("id_producto" AUTOINCREMENT),
	FOREIGN KEY("id_categoria") REFERENCES "categoria"("id_category")
);
CREATE TABLE IF NOT EXISTS "registro_productos" (
	"id_inventario"	INTEGER,
	"id_producto"	INTEGER NOT NULL,
	"id_tienda"	INTEGER NOT NULL,
	PRIMARY KEY("id_inventario" AUTOINCREMENT),
	FOREIGN KEY("id_producto") REFERENCES "productos"("id_producto"),
	FOREIGN KEY("id_tienda") REFERENCES "tiendas"("id_tienda")
);
CREATE TABLE IF NOT EXISTS "tiendas" (
	"id_tienda"	INTEGER,
	"nombre"	VARCHAR(40) NOT NULL UNIQUE,
	"ubicación"	VARCHAR(50) NOT NULL UNIQUE,
	PRIMARY KEY("id_tienda" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "empleados" (
	"id_empleado"	INTEGER,
	"nombre"	VARCHAR(40) NOT NULL UNIQUE,
	"apellido"	VARCHAR(40) NOT NULL UNIQUE,
	"id_tienda"	INTEGER NOT NULL UNIQUE,
	"puesto_trabajo"	VARCHAR(50) NOT NULL,
	"email"	VARCHAR(50) NOT NULL UNIQUE,
	"telefono"	NUMERIC NOT NULL UNIQUE,
	PRIMARY KEY("id_empleado" AUTOINCREMENT),
	FOREIGN KEY("id_tienda") REFERENCES "tiendas"("id_tienda")
);
CREATE TABLE IF NOT EXISTS "cant_productos" (
	"id_cantidad"	INTEGER NOT NULL,
	"id_producto"	INTEGER NOT NULL,
	"cantidad"	NUMERIC NOT NULL,
	FOREIGN KEY("id_producto") REFERENCES "productos"("id_producto"),
	PRIMARY KEY("id_cantidad" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "metodos_pagos" (
	"id_metodo_pago"	INTEGER,
	"name"	varchar(30) NOT NULL UNIQUE,
	PRIMARY KEY("id_metodo_pago" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "ventas" (
	"id_venta"	INTEGER,
	"dia"	NUMERIC NOT NULL,
	"mes"	NUMERIC NOT NULL,
	"anio"	NUMERIC NOT NULL,
	"id_pago"	INTEGER NOT NULL,
	"costo_total"	INTEGER NOT NULL,
	"id_empleado"	INTEGER NOT NULL,
	"id_tienda"	INTEGER NOT NULL,
	"id_cantidad"	INTEGER,
	FOREIGN KEY("id_cantidad") REFERENCES "cant_productos"("id_cantidad"), --Ya no es "compras cliente" sino cantidad
	PRIMARY KEY("id_venta" AUTOINCREMENT),
	FOREIGN KEY("id_empleado") REFERENCES "empleados"("id_empleado"),
	FOREIGN KEY("id_pago") REFERENCES "clientes_pago"("id_pago")
);
CREATE TABLE IF NOT EXISTS "clientes" (
	"id_cliente"	INTEGER,
	"name"	varchar(30) NOT NULL,
	"apellido"	varchar(30) NOT NULL,
	"genero"	varchar(15) NOT NULL,
	"email"	varchar(30) NOT NULL UNIQUE,
	PRIMARY KEY("id_cliente" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "clientes_pago" (
	"id_pago"	INTEGER,
	"id_cliente"	INTEGER,
	"id_metodo_pago"	INTEGER,
	FOREIGN KEY("id_metodo_pago") REFERENCES "metodos_pagos"("id_metodo_pago"),
	PRIMARY KEY("id_pago" AUTOINCREMENT),
	FOREIGN KEY("id_cliente") REFERENCES "clientes"("id_cliente")
);
INSERT INTO "categoria" VALUES (1,'carteras');
INSERT INTO "categoria" VALUES (2,'uñas');
INSERT INTO "categoria" VALUES (3,'guantes');
INSERT INTO "categoria" VALUES (4,'bufanda');
INSERT INTO "categoria" VALUES (5,'gorras');
INSERT INTO "categoria" VALUES (6,'lentes');
INSERT INTO "categoria" VALUES (7,'reloj');
INSERT INTO "categoria" VALUES (8,'anillos');
INSERT INTO "categoria" VALUES (9,'collares');
INSERT INTO "categoria" VALUES (10,'pulseras');
INSERT INTO "categoria" VALUES (11,'broches');
INSERT INTO "categoria" VALUES (12,'vinchas');
INSERT INTO "categoria" VALUES (13,'scrunchies');
INSERT INTO "productos" VALUES (1,'Broche hawaiano celeste',11,3000);
INSERT INTO "productos" VALUES (2,'Broche hawaiano rosa',11,3000);
INSERT INTO "productos" VALUES (3,'Broche flor violeta mate',11,3000);
INSERT INTO "productos" VALUES (4,'Broche rectangular verde mate',11,3000);
INSERT INTO "productos" VALUES (5,'Broche rectangular amarillo',11,3000);
INSERT INTO "productos" VALUES (6,'Broche flor rojo mate',11,3000);
INSERT INTO "productos" VALUES (7,'Diadema trenza de flor dorada',12,2700);
INSERT INTO "productos" VALUES (8,'Diadema trenza de flor plateada',12,2700);
INSERT INTO "productos" VALUES (9,'Diadema con perlas',12,2700);
INSERT INTO "productos" VALUES (10,'Vincha en trenza tejida color negro',12,2900);
INSERT INTO "productos" VALUES (11,'Vincha en tela básica color blanco',12,2900);
INSERT INTO "productos" VALUES (12,'Vincha en tela básica color beige',12,2900);
INSERT INTO "productos" VALUES (13,'Scrunchie basica lisa',13,600);
INSERT INTO "productos" VALUES (14,'Scrunchie color liso con perlas',13,1000);
INSERT INTO "productos" VALUES (15,'Scrunchie estampado con perlas',13,900);
INSERT INTO "productos" VALUES (16,'Scrunchie estampado',13,600);
INSERT INTO "metodos_pagos" VALUES (1,'Efectivo');
INSERT INTO "metodos_pagos" VALUES (2,'mercado pago');
INSERT INTO "metodos_pagos" VALUES (3,'Tarjeta debito');
INSERT INTO "metodos_pagos" VALUES (4,'Tarjeta credito');
INSERT INTO "metodos_pagos" VALUES (5,'Transferencia');
INSERT INTO "clientes" VALUES (1,'ayelen','quispe','F','ayelenquispe@etec.uba.ar');
INSERT INTO "clientes" VALUES (2,'fernanda','fernandez','F','ferfer22@etec.uba.ar');
INSERT INTO "clientes" VALUES (3,'thiago','decena','M','thiago77@etec.uba.ar');
INSERT INTO "clientes" VALUES (4,'agustina','dominguez','F','agusdominguez@etec.uba.ar');
INSERT INTO "clientes" VALUES (5,'leonel','ordoñez','M','ordoñezleo@etec.uba.ar');
INSERT INTO "clientes" VALUES (6,'juan','esculpidero','M','juancito77@etec.uba.ar');
INSERT INTO "clientes" VALUES (7,'antonela','gonzales','F','antogonzales22@etec.uba.ar');
INSERT INTO "clientes" VALUES (8,'pedro','martinez','M','pedrimar@etec.uba.ar');
INSERT INTO "clientes" VALUES (9,'rocio','albarracin','F','ralbarracintrab@etec.uba.ar');
INSERT INTO "clientes_pago" VALUES (1,1,5);
INSERT INTO "clientes_pago" VALUES (2,2,3);
INSERT INTO "clientes_pago" VALUES (3,3,1);
INSERT INTO "clientes_pago" VALUES (4,4,3);
INSERT INTO "clientes_pago" VALUES (5,5,2);
INSERT INTO "clientes_pago" VALUES (6,6,5);
INSERT INTO "clientes_pago" VALUES (7,7,4);
INSERT INTO "clientes_pago" VALUES (8,8,1);
INSERT INTO "clientes_pago" VALUES (9,9,4);
COMMIT;