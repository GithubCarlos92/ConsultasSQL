---Vamos a crear una base de datos en con consultas sql 
---para todo que quiera practicar bases de datos.


DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;

CREATE TABLE FABRICANTE (
    CODIGO INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR (50) NOT NULL
)

CREATE TABLE PRODUCTO (
    CODIGO INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(50) NOT NULL,
    PRECIO DOUBLE NOT NULL,
    CODIGO_FABRICANTE INT UNSIGNED NOT NULL,
    FOREIGN KEY (CODIGO_FABRICANTE)
    REFERENCES FABRICANTE(CODIGO)
);

---INSERTAR VALOR A LA BD A LA TABLA FABRICANTE

INSERT INTO FABRICANTE VALUES (1,'ASUS');
INSERT INTO FABRICANTE VALUES (2,'LENOVO');
INSERT INTO FABRICANTE VALUES(3,'HEWLETT-PACKARD');
INSERT INTO FABRICANTE VALUES(4, 'SAMSUNG');
INSERT INTO FABRICANTE VALUES(5,'SEAGATE');
INSERT INTO FABRICANTE VALUES(6,'CRUCIAL');

---INSERTAMOS VALORES A LA BD A LA TABLA PRODUCTO

INSERT INTO PRODUCTO VALUES(1,'DISCO DURO SATA3',210.50,5);
INSERT INTO PRODUCTO VALUES(2,'MEMORIA RAM DDR4 8GB',120.00,6);
INSERT INTO PRODUCTO VALUES(3,'DISCO SSD 1 TB',150.99,4);


---CONSULTAS SQL
--Lista el nombre de todos los productos que hay en la tabla producto.
SELECT NOMBRE FROM PRODUCTO

--Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT NOMBRE, PRECIO FROM PRODUCTO

--Lista todas las columnas de la tabla producto.
SELECT * FROM PRODUCTO

--Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT NOMBRE, PRECIO*4.45 , PRECIO*3.30 
FROM PRODUCTO

--Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
-- Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT NOMBRE AS NOMBRE_PRODUCTO, PRECIO*4.45 AS EUROS, PRECIO*3.30 AS DOLARES
FROM PRODUCTO

--Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(NOMBRE), PRECIO FROM PRODUCTO

--Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(NOMBRE), PRECIO FROM 

--Lista el nombre de todos los fabricantes en una columna, 
--y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT NOMBRE, UPPER(SUBSTRING(NOMBRE,1,2))
FROM FABRICANTE

--Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT NOMBRE, ROUND(PRECIO,0), CEILING(PRECIO)
FROM PRODUCTO

--Lista los nombres y los precios de todos los productos de la tabla producto, 
--truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT NOMBRE, FLOOR(PRECIO)
FROM PRODUCTO

--Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT CODIGO   FROM FABRICANTE 
WHERE CODIGO IN (SELECT CODIGO_FABRICANTE FROM PRODUCTO)

--Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT CODIGO   FROM FABRICANTE
WHERE CODIGO IN (SELECT CODIGO_FABRICANTE FROM PRODUCTO)

--Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT NOMBRE   FROM FABRICANTE
ORDER BY NOMBRE ASC; 

--Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT NOMBRE FROM FABRICANTE 
ORDER BY NOMBRE DESC;

--Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y 
--en segundo lugar por el precio de forma descendente.
SELECT NOMBRE,PRECIO    FROM PRODUCTO
ORDER BY NOMBRE ASC, PRECIO DESC;

--Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT TOP 5 * FROM FABRICANTE

--Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT * FROM FABRICANTE LIMIT 3,2

--Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT NOMBRE, PRECIO   FROM PRODUCTO ORDER BY PRECIO ASC LIMIT 1

--Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT NOMBRE, PRECIO   FROM PRODUCTO ORDER BY PRECIO DESC LIMIT 1

--Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT NOMBRE
FROM PRODUCTO 
WHERE CODIGO_FABRICANTE = 2

--Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT NOMBRE   FROM PRODUCTO
WHERE PRECIO <= 120

--Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT  NOMBRE  FROM PRODUCTO
WHERE PRECIO >= 400

--Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT NOMBRE   FROM PRODUCTO
WHERE PRECIO <> 400

--Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
SELECT *    FROM PRODUCTO
WHERE PRECIO >= 80 AND PRECIO <= 300 

--Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT *    FROM PRODUCTO 
WHERE PRECIO BETWEEN 60 AND 200

--Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
SELECT *    FROM PRODUCTO
WHERE PRECIO > 200 AND CODIGO_FABRICANTE = 6

--Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
SELECT *    FROM PRODUCTO
WHERE CODIGO_FABRICANTE = 1 OR CODIGO_FABRICANTE = 3 OR CODIGO_FABRICANTE = 5

--Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT *    FROM PRODUCTO
WHERE CODIGO_FABRICANTE IN (1,3,5)

--Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio).
--Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT NOMBRE, PRECIO*100   FROM PRODUCTO

--Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT NOMBRE   FROM FABRICANTE
WHERE NOMBRE LIKE 's%'

--Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT NOMBRE   FROM FABRICANTE
WHERE NOMBRE LIKE '%e'

--Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT NOMBRE   FROM FABRICANTE
WHERE NOMBRE LIKE '%w%'

--Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT NOMBRE   FROM FABRICANTE
WHERE NOMBRE LIKE '____'

--Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT NOMBRE   FROM FABRICANTE
WHERE NOMBRE LIKE '%portatil%'

--Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
SELECT NOMBRE   FROM PRODUCTO
WHERE NOMBRE LIKE '%monitor%' AND PRECIO < 215

--Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€.
--Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT NOMBRE,PRECIO    FROM PRODUCTO
WHERE PRECIO >= 180
ORDER BY PRECIO DESC, NOMBRE ASC

