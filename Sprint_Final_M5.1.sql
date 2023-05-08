create database Sprint_final;

use Sprint_final;

CREATE TABLE proveedores ( 
-- Este código crea una tabla llamada "proveedores
    id INT AUTO_INCREMENT PRIMARY KEY,
    --  La columna "id" es una clave primaria que se autonumera para identificar de manera única a cada proveedor.
	-- > Int permite ingresar numeros, en este caso el id del usuario,
    -- > Not null me indica que el dato no puede estar vacio 
    -- > AUTO_INCREMENT El valor se incrementa de forma automatica 
    -- > Primary keye mi identificador unico de la tabla, lo que me permite relacionarla para otras tablas 

    representante_legal VARCHAR(255) NOT NULL,
    -- > VARCHAR permite ingresar un texto con maximo de 255 caracteres, en este caso representate_legal 
    -- > not null me indica que el dato no puede estar vacio 
    
    nombre_corporativo VARCHAR(255) NOT NULL,
	-- > VARCHAR permite ingresar un texto con maximo de 255 caracteres, en este caso nombre_corporativo 
    -- > not null me indica que el dato no puede estar vacio 
    
    telefono1 VARCHAR(20) NOT NULL,
	-- > VARCHAR permite ingresar un texto con maximo de 20 caracteres, en este caso telefono1
    -- > not null me indica que el dato no puede estar vacio 
    
    contacto1 VARCHAR(255) NOT NULL,
	-- > VARCHAR permite ingresar un texto con maximo de 255 caracteres, en este caso contacto1
    -- > not null me indica que el dato no puede estar vacio 
    
    telefono2 VARCHAR(20), 
	-- > VARCHAR permite ingresar un texto con maximo de 20 caracteres, en este caso telefono2

    contacto2 VARCHAR(255),
	-- > VARCHAR permite ingresar un texto con maximo de 255 caracteres, en este caso contacto2

    categoria VARCHAR(50) NOT NULL,
	-- > VARCHAR permite ingresar un texto con maximo de 50 caracteres, en este caso categoria
    -- > not null me indica que el dato no puede estar vacio 
    
    correo_facturacion VARCHAR(255) NOT NULL
    	-- > VARCHAR permite ingresar un texto con maximo de 255 caracteres, en este caso correo_facturacion
	    -- > not null me indica que el dato no puede estar vacio 
);

INSERT INTO proveedores (representante_legal, nombre_corporativo, telefono1, contacto1, telefono2, contacto2, categoria, correo_facturacion)
 VALUES
('Javiera Sanchez', 'Abarrotes S.A.', '920223232', 'Javiera', '940232322', 'Maria', 'Ventas', 'facturacion@abarrotes-plus.com'),
('María Rodríguez', 'Tecnología Total S.A.', '943234539', 'María', '932343322', 'Pedro', 'Tecnología', 'facturacion@tecnologia-total.com'),
('Carlos Garay', 'Carnes S.A.', '9232345', 'Carlos', '93434539', 'Ana', 'Recepcopnista', 'facturacion@carneschile.com'),
('Marcelo Cartagena', 'Accesorios Electrónicos S.A.', '92232394', 'Marcelo', '932333235', 'Pedro', 'Electrónica', 'facturacion@accesorioselectronicos.com'),
('Pedro Jiménez', 'Smart Home S.A.', '555-3333', 'Pedro', '555-4444', 'María', 'Hogar inteligente', 'facturacion@smart-home.com');


--  se crea tabla clientes con los atributos solicitados


CREATE TABLE Clientes (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
-- La columna "id" es una clave primaria que se autonumera para identificar de manera única a cada cliente.
-- Int permite ingresar numeros, en este caso el id del cliente,
-- AUTO_INCREMENT El valor se incrementa de forma automatica 
-- Primary key es el identificador unico de la tabla, lo que me permite relacionarla para otras tablas 
Nombre VARCHAR(50),
-- VARCHAR permite ingresar un texto con maximo de 255 caracteres, en este caso Nombre
Apellido VARCHAR(50),
-- VARCHAR permite ingresar un texto con maximo de 255 caracteres, en este caso Apellido
Direccion VARCHAR(100) UNIQUE
-- VARCHAR permite ingresar un texto con maximo de 255 caracteres, en este caso Direccion
-- UNIQUE genera la restriccion de que el usuario pueda tener solo un registro de direccion y este no se repita 
);

-- se ingresan los registros a la tabla clientes 

INSERT INTO Clientes (Nombre, Apellido, Direccion)
VALUES 
('Diego', 'Hernandez', 'Avenida Providencia 1760'),
('Catalina', 'Garcia', 'Calle Libertad 240'),
('Sebastian', 'Rojas', 'Pasaje Los Geranios 453'),
('María', 'Silva', 'Calle Los Tucanes 345'),
('Felipe', 'Gonzalez', 'Avenida Los Pajaritos 1301');

-- 

CREATE TABLE Productos (
  id_producto INT PRIMARY KEY,
    -- INT permite ingresar numeros, en este caso el id del producto
    -- Primary key es el identificador unico de la tabla, lo que me permite relacionarla para otras tablas 
  Precio DECIMAL(10,2),
  -- DECIMAL nos permite utilizar un numero con dos decimales, es la setnencia recomendada para guardar registros de precios 
  Categoria VARCHAR(50),
  -- VARCHAR permite ingresar un texto con maximo de 255 caracteres, en este caso Categoria
  Proveedor VARCHAR(50),
  -- VARCHAR permite ingresar un texto con maximo de 255 caracteres, en este caso Proveedor
  Color VARCHAR(50),
  -- VARCHAR permite ingresar un texto con maximo de 255 caracteres, en este caso Color
  Stock INT DEFAULT 0 
  -- INT permite ingresar numeros, en este caso el Stock
  -- DEFAULT se utiliza para que el resgitro comience en 0 si no hay información para el campo
);

-- Se agregan los registros a la tabla productos 

INSERT INTO Productos (id_producto, Precio, Categoria, Proveedor, Color, Stock)
VALUES 
(2345, 150000, 'Electrónica', 'Tecnología Total S.A.', 'Negro', 10),
(4567 ,95000, 'Hogar', 'Smart Home S.A.', 'Blanco', 20),
(2098 ,35000, 'Fiambreria', 'Abarrotes S.A.', 'Rosado', 15),
(1908 ,75000, 'Alimentos', 'Carnes S.A.', 'Rojo', 5),
(0123 ,450000, 'Electrónica', 'Tecnología Total S.A.', 'Plateado', 8),
(0005 ,15000, 'Hogar', 'Accesorios Electrónicos S.A.', 'Gris', 12),
(0987 ,7500, 'Hogar', 'Smart Home S.A.', 'Verde', 25),
(1345 ,50000, 'Alimentos', 'Carnes S.A.', 'Rojo', 4),
(2379 ,350000, 'Electrónica', 'Accesorios Electrónicos S.A.', 'Blanco', 18),
(5678 ,25000, 'Hogar', 'Smart Home S.A.', 'Beige', 9)
;

-- Cuál es la categoría de productos que más se repite.
select Categoria,count(Categoria) from Productos group by Categoria limit 1;
-- la categoria que mas se repite es la categoria "Hogar" 

-- Cuáles son los productos con mayor stock.
SELECT id_producto, Stock
FROM Productos
ORDER BY Stock DESC
LIMIT 3;
-- Los productos con mayor stock son los del id 937, 4567, 2379

-- Qué color de producto es más común en nuestra tienda.
SELECT Color, COUNT(*) as Cantidad
FROM Productos
GROUP BY Color
ORDER BY Cantidad DESC
LIMIT 2;
-- Los colores que mas se repiten con Rojo y Blanco

-- Cual o cuales son los proveedores con menor stock de productos.
SELECT Proveedor, SUM(Stock) as Total_Stock
FROM Productos
GROUP BY Proveedor
HAVING SUM(Stock) = (SELECT MIN(Total_Stock) FROM (SELECT SUM(Stock) as Total_Stock FROM Productos GROUP BY Proveedor) as Stocks)
-- El proveedor con menor stock es Carnes S.A

-- Cambien la categoría de productos más popular por ‘Electrónica y computación’.
UPDATE productos SET Categoria = 'Electrónica y computación' WHERE Categoria = 'Hogar'
-- Se actualiza la Categoria por "Electrónica y computación" mientras la Categoria sea "Hogar" 