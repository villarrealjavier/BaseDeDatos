CREATE TABLE FABRICANTE
(codigo INT(10),
nombre VARCHAR(100),

CONSTRAINT PK_FABRICANTE PRIMARY KEY (codigo)
);

CREATE TABLE PRODUCTO 
(codigo INT(10) ,
nombre VARCHAR(100),
precio DOUBLE,
codigo_fabricante INT(10),

CONSTRAINT PK_PRODUCTO PRIMARY KEY (codigo),
CONSTRAINT FK_PRODUCTO FOREIGN KEY (codigo_fabricante) REFERENCES FABRICANTE(codigo)
);

INSERT INTO FABRICANTE (codigo,nombre) VALUES (1,'Asus');
INSERT INTO FABRICANTE (codigo,nombre) VALUES (2,'Lenovo');
INSERT INTO FABRICANTE (codigo,nombre) VALUES (3,'Hewlett-Packard');
INSERT INTO FABRICANTE (codigo,nombre) VALUES (4,'Samsung');
INSERT INTO FABRICANTE (codigo,nombre) VALUES (5,'Seagate');
INSERT INTO FABRICANTE (codigo,nombre) VALUES (6,'Crucial');
INSERT INTO FABRICANTE (codigo,nombre) VALUES (7,'Gigabyte');
INSERT INTO FABRICANTE (codigo,nombre) VALUES (8,'Huawei');
INSERT INTO FABRICANTE (codigo,nombre) VALUES (9,'Xiaomi');
SELECT * FROM FABRICANTE;

INSERT INTO PRODUCTO (codigo,nombre,precio,codigo_fabricante) VALUES (1,'Disco duro SATA3 1TB',86.99,5);
INSERT INTO PRODUCTO (codigo,nombre,precio,codigo_fabricante) VALUES (2,'Memoria RAM DDR4 8GB',120.00,6);
INSERT INTO PRODUCTO (codigo,nombre,precio,codigo_fabricante) VALUES (3,'Disco duro SSD 1TB',150.99,4);
INSERT INTO PRODUCTO (codigo,nombre,precio,codigo_fabricante) VALUES (4,'GeForce GTX 1050Ti',185.00,7);
INSERT INTO PRODUCTO (codigo,nombre,precio,codigo_fabricante) VALUES (5,'GeForce GTX 1080 Xtreme',755.00,6);
INSERT INTO PRODUCTO (codigo,nombre,precio,codigo_fabricante) VALUES (6,'Monitor 24 LED Full HD',202.00,1);
INSERT INTO PRODUCTO (codigo,nombre,precio,codigo_fabricante) VALUES (7,'Monitor 27 LED Full HD',245.99,1);
INSERT INTO PRODUCTO (codigo,nombre,precio,codigo_fabricante) VALUES (8,'Portátil Yoga 520',559.00,2);
INSERT INTO PRODUCTO (codigo,nombre,precio,codigo_fabricante) VALUES (9,'Portatil Ideapd 320',444.00,2);
INSERT INTO PRODUCTO (codigo,nombre,precio,codigo_fabricante) VALUES (10,'Impresora HP Desjet 3720',59.99,3);
INSERT INTO PRODUCTO (codigo,nombre,precio,codigo_fabricante) VALUES (11,'Impresora HP Laserjet Pro M26nw',180.00,3);
INSERT INTO FABRICANTE (codigo,nombre) VALUES (10,'Apple');
INSERT INTO PRODUCTO (codigo,nombre,precio,codigo_fabricante) VALUES (12,'GeForce RTX 3060 12GB',780.00,7);
DELETE FROM FABRICANTE WHERE nombre='Xiaomi';
UPDATE PRODUCTO SET precio=(precio+5);

/*5-->DELETE FROM FABRICANTE WHERE nombre='Asus'; NO SE PODRIA BORRAR DEBIDO A QUE ESTÁ ASOCIADO A VARIOS PRODUCTOS EN LA TABLA PORDUCTO
  7-->UPDATE FABRICANTE SET codigo=20 WHERE nombre='Lenovo'; Para que esto funcionase habría que cambiarlo también en las tablas las cuales están asociadas a este codigo en la tabla PRODUCTO
  2-->No se puede insertar nombre indicando solo este debido a que te va a pedir la clave primaria
  4-->No se puede insertar nombre indicando solo este debido a que te va a pedir la clave primaria*/
DELETE FROM PRODUCTO 
WHERE precio<200 AND Nombre LIKE 'Impresora%';

SELECT * FROM PRODUCTO;

SELECT * FROM PRODUCTO;