-- CREAR LAS TABLAS: Empezar por el que tiene menos referencias

CREATE TABLE "categoria" (
    "id_category"   INTEGER,
    "categoria" varchar(30) NOT NULL UNIQUE,
    PRIMARY KEY("id_category" AUTOINCREMENT)
);

CREATE TABLE "clientes" (
    "id_cliente" INTEGER,
    "name" varchar(30) NOT NULL UNIQUE,
    "apellido" varchar(30) NOT NULL UNIQUE, 
    "genes" INTEGER UNIQUE,--quizas alguien no quiera decir su genero
    "email" varchar(30) NOT NULL UNIQUE,   
    PRIMARY KEY("id_cliente" AUTOINCREMENT)
);

CREATE TABLE "metodos_pagos" (
    "id_metodo_pago" INTEGER,
    "name" varchar(30) NOT NULL UNIQUE,
    PRIMARY KEY("id_metodo_pago" AUTOINCREMENT)
);

CREATE TABLE "clientes_pago" (
    "id_pago" INTEGER,
    "id_cliente" INTEGER,
    "id_metodo_pago" INTEGER,
    PRIMARY KEY("id_pago" AUTOINCREMENT)
    FOREIGN KEY ("id_cliente") REFERENCES clientes("id_cliente")
    FOREIGN KEY ("id_metodo_pago") REFERENCES clientes("id_metodo_pago")
);

CREATE TABLE "productos" (
    "id_producto"   INTEGER,
    "name"  INTEGER NOT NULL,
    "id_categoria" INTEGER NOT NULL,
    "precio" INTEGER NOT NULL,--cantidad fija o variable , si es variable debe ser una tabla intermedia
    PRIMARY KEY("id_producto" AUTOINCREMENT), --DE ESTA TABLA ES EL ID MAS IMPORTANTE, 
    FOREIGN KEY ("id_categoria") REFERENCES categoria("id_category") --SACADA DE OTRA TABLA
);

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

CREATE TABLE "empleados" ( --datos de los empleado
	"id_empleado" 	 INTEGER,
	"nombre"		 VARCHAR(40) NOT null UNIQUE, --Dudoso, podemos rechazar a un empledo por repetir el nombre
	"apellido"		 VARCHAR(40) NOT NULL UNIQUE,
	"id_tienda" 	 INTEGER NOT NULL UNIQUE,
	"puesto_trabajo" VARCHAR(50) NOT NULL,
	"email"			 VARCHAR(50) NOT NULL UNIQUE,
	"teléfono"		 NUMERIC NOT NULL UNIQUE,
	PRIMARY KEY("id_empleado" AUTOINCREMENT),
	FOREIGN KEY("id_tienda") REFERENCES tiendas("id_tienda")
);

CREATE TABLE "cant_productos" (
	"id_cantidad"  INTEGER NOT NULL,
	"id_producto"  INTEGER NOT NULL, --producto
	"cantidad"	   NUMERIC NOT NULL,
	PRIMARY KEY("id_cantidad" AUTOINCREMENT),
	FOREIGN KEY("id_producto") REFERENCES productos("id_producto")
)

CREATE TABLE "ventas" (
	"id_venta"		INTEGER,
	"día"			INTEGER NOT null,	
	"mes"			INTEGER NOT null,
	"año"			INTEGER NOT null,
	"id_pago"		INTEGER NOT NULL,
	"costo_total" 	INTEGER NOT NULL, -- Cuentita: multiplicar precio del producto por la cantidad 
	"id_empleado"	INTEGER NOT NULL,
	"id_tienda" 	INTEGER NOT NULL,
	"id_compra" 	INTEGER,
	PRIMARY KEY("id_venta" AUTOINCREMENT),
	FOREIGN KEY("id_pago") REFERENCES clientes_pago("id_pago"),
	FOREIGN KEY("id_empleado") REFERENCES empleados("id_empleado"),
	FOREIGN KEY("id_compra") REFERENCES compras_clientes("id_compra")
);




