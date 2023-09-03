CREATE TABLE sucursal (
	id SERIAL PRIMARY KEY,
	nombre TEXT,
	dirección TEXT
);

CREATE TABLE categoria (
	id SERIAL PRIMARY KEY,
	nombre TEXT
);

CREATE TABLE producto (
	id SERIAL PRIMARY KEY,
	nombre TEXT,
	marca TEXT,
	categoria_id INTEGER,
	precio_unitario INTEGER,
	FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

CREATE TABLE stock (
	id SERIAL PRIMARY KEY,
	sucursal_id INTEGER,
	producto_id INTEGER,
	cantidad INTEGER, 
	UNIQUE (sucursal_id, producto_id),
	FOREIGN KEY (sucursal_id) REFERENCES sucursal(id),
	FOREIGN KEY (producto_id) REFERENCES producto(id)
);

CREATE TABLE cliente (
	id SERIAL PRIMARY KEY,
	nombre TEXT,
	telefono INTEGER
);

CREATE TABLE orden (
	id SERIAL PRIMARY KEY,
	cliente_id INTEGER,
	sucursal_id INTEGER,
	fecha DATE,
	total INTEGER,
	FOREIGN KEY (cliente_id) REFERENCES cliente(id),
	FOREIGN KEY (sucursal_id) REFERENCES sucursal(id)	
);

CREATE TABLE item (
	id SERIAL PRIMARY KEY,
	orden_id INTEGER,
	producto_id INTEGER,
	cantidad INTEGER,
	monto_venta INTEGER,
	FOREIGN KEY (orden_id) REFERENCES orden(id),
	FOREIGN KEY (producto_id) REFERENCES producto(id)	
);

