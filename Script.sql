-- DDL (Estructura de tablas) 

CREATE TABLE clientes (
	id_clientes SERIAL PRIMARY KEY,
	nombre_clientes VARCHAR (100) NOT NULL, 
	email_clientes VARCHAR(100) UNIQUE NOT NULL,
	edad_clientes INT CONSTRAINT edad_mayor_18 CHECK (edad_clientes >= 18) NOT NULL 
);

CREATE TABLE productos (
	id_productos SERIAL PRIMARY KEY,
	nombre_productos VARCHAR (100) NOT NULL,
	precio_productos DECIMAL(10,2) CHECK (precio_productos > 0) NOT NULL,
	stock_productos INT CONSTRAINT stock_no_negativo CHECK (stock_productos >= 0) NOT NULL,
	categorias VARCHAR(100) NOT NULL
);

CREATE TABLE ventas (
	id_ventas SERIAL PRIMARY KEY,
	id_clientes INT NOT NULL REFERENCES clientes(id_clientes),
	id_productos INT NOT NULL REFERENCES productos(id_productos),
	fecha_venta DATE NOT NULL
);

--DML (DATOS Y MANTENIMIENTO)

BEGIN; 
INSERT INTO clientes (nombre_clientes, email_clientes, edad_clientes)
VALUES 
('Lucila', 'hoodlucila@gmail.com', 21),
('Agustin', 'agusdellatorre@gmail.com', 22),
('Agustina', 'pipinoagustina@gmail.com', 21),
('Salvador', 'salvacapisto@gmail.com', 22),
('Gael', 'garrazagael@gmail.com', 21); 

INSERT INTO productos (nombre_productos, precio_productos, stock_productos, categorias)
VALUES
('Remera', 35000.00, 17, 'Ropa'),
('Pantalon', 70000.00, 28, 'Ropa'),
('Collar', 15000.00, 12, 'Accesorios'),
('Zapatilla', 50000.00, 10, 'Calzado'),
('Botas', 55000.00, 45, 'Calzado');

INSERT INTO ventas (id_clientes, id_productos, fecha_venta) 
VALUES
(1, 4, '2026-11-05'),
(2, 1, '2026-11-05'),
(3, 5, '2026-11-06'),
(4, 2, '2026-11-07'),
(5, 3, '2026-11-04');

COMMIT; 

UPDATE productos 
SET precio_productos = precio_productos * 1.10 
WHERE categorias = 'Calzado'; 

DELETE FROM ventas
WHERE id_ventas = 3; 

