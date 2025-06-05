CREATE TABLE "registro_productos" ( --inventory
	"id_inventario"	INTEGER,
	"id_producto"	INTEGER NOT NULL,
	"id_tienda"		INTEGER NOT NULL,
	PRIMARY KEY("id_inventario" AUTOINCREMENT),
	FOREIGN KEY("id_producto")	REFERENCES productos("id_producto"), --Tablas a unir proximamente
	FOREIGN KEY("id_tienda") 	REFERENCES tiendas("id_tienda")
);
CREATE TABLE "tiendas" ( --locales (página vitual cuenta?)
	"id_tienda"	INTEGER,
	"nombre"	VARCHAR(40) NOT NULL UNIQUE,
	"ubicación"	VARCHAR(50) NOT NULL UNIQUE,
	PRIMARY KEY("id_tienda" AUTOINCREMENT)
);
CREATE TABLE "empleados" ( --datos de los epleado
	"id_empleado" INTEGER,
	"nombre"	VARCHAR(40) NOT null UNIQUE, --Dudoso, podemos rechazar a un empledo por repetir el nombre
	"apellido"	VARCHAR(40) NOT NULL UNIQUE,
	"id_tienda" INTEGER NOT NULL UNIQUE,
	"puesto_trabajo" VARCHAR(50) NOT NULL,
	"email"	VARCHAR(50) NOT NULL UNIQUE,
	"teléfono"	VARCHAR(50) NOT NULL UNIQUE,
	PRIMARY KEY("id_empleado" AUTOINCREMENT),
	FOREIGN KEY("id_tienda") REFERENCES tiendas("id_tienda")
);
CREATE TABLE "ventas" (
	"id_venta"		INTEGER,
	"fecha"			INTEGER NOT null,	
	"mes"			INTEGER NOT null,
	"año"			INTEGER NOT null,
	"id_pago"		INTEGER NOT NULL,
	"monto" 		INTEGER NOT NULL,
	"id_empleado"	INTEGER,
	"id_tienda" 	INTEGER,
	"id_compra" 	INTEGER,
	PRIMARY KEY("id_venta" AUTOINCREMENT),
	FOREIGN KEY("id_pago") REFERENCES clientes_pago("id_pago"),
	FOREIGN KEY("id_empleado") REFERENCES empleados("id_empleado")
	FOREIGN KEY("id_compra") REFERENCES clientes_compras("id_compra") --Fijarse como esta escrito en el de Eve (al unir todo)
);