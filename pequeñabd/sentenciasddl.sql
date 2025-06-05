CREATE TABLE "registro_de_productos" (
	"id_inventario"	INTEGER,
	"id_producto"	INTEGER NOT NULL,
	"id_tienda"	INTEGER NOT NULL,
	PRIMARY KEY("id_inventario" AUTOINCREMENT),
	FOREIGN KEY("id_producto") REFERENCES productos("id_producto"),
	FOREIGN KEY("id_tienda") REFERENCES tiendas("id_tienda")
);
CREATE TABLE "tiendas" (
	"id_tienda"	INTEGER,
	"nombre"	VARCHAR(40) NOT NULL UNIQUE,
	"ubicación"	VARCHAR(50) NOT NULL UNIQUE,
	PRIMARY KEY("id_tienda" AUTOINCREMENT),
);
CREATE TABLE "empleados" (
	"id_empleado" INTEGER,
	"nombre"	VARCHAR(40) NOT null UNIQUE, --Dudoso, podemos rechazar a un empledo por el nombre
	"apellido"	VARCHAR(40) NOT NULL UNIQUE,
	"id_tienda" INTEGER NOT NULL UNIQUE,
	"puesto_trabajo" VARCHAR(50) NOT NULL,
	"email"	VARCHAR(50) NOT NULL UNIQUE,
	"teléfono"	VARCHAR(50) NOT NULL UNIQUE,
	PRIMARY KEY("id_empleado" AUTOINCREMENT),
	FOREIGN KEY("id_tienda") REFERENCES tiendas("id_tienda")
);
CREATE TABLE "ventas" (
	"id"	INTEGER,
	"nombre"	
	PRIMARY KEY("id_tienda" AUTOINCREMENT),
);