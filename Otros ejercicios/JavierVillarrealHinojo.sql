--ALTER SESSION SET "_oracle_script"=TRUE;
--CREATE USER PRUEBARAW IDENTIFIED BY PRUEBARAW;
--GRANT CONNECT, RESOURCE, DBA TO PRUEBARAW;  




--APARTADO 1: Realiza las siguientes inserciones (los datos puedes inventarlos
--pero se deben rellenar todos los campos).

--2 Directores:
INSERT INTO DIRECTOR VALUES ('Juan','España');
INSERT INTO DIRECTOR VALUES ('Antonio','España');

SELECT * FROM DIRECTOR;

--4 Peliculas:
INSERT INTO PELICULA VALUES ('1','Spiderman','Lucia','España',TO_DATE('22/02/2001','DD/MM/YYYY'),'Juan');
INSERT INTO PELICULA VALUES ('2','Ironman','Marta','España',TO_DATE('22/05/2007','DD/MM/YYYY'),'Juan');
INSERT INTO PELICULA VALUES ('3','Vengadores','Miriam','España',TO_DATE('11/01/2010','DD/MM/YYYY'),'Juan');
INSERT INTO PELICULA VALUES ('4','Venom','Antonia','España',TO_DATE('15/08/2012','DD/MM/YYYY'),'Juan');

SELECT * FROM PELICULA;

--2 Ejemplares cada pelicula:

INSERT INTO EJEMPLAR VALUES ('1','1','Realizada');
INSERT INTO EJEMPLAR VALUES ('1','2','En proceso');

INSERT INTO EJEMPLAR VALUES ('2','1','Realizada');
INSERT INTO EJEMPLAR VALUES ('2','2','En produccion');


INSERT INTO EJEMPLAR VALUES ('3','1','Realizada');
INSERT INTO EJEMPLAR VALUES ('3','2','Realizada');

INSERT INTO EJEMPLAR VALUES ('4','1','Realizada');
INSERT INTO EJEMPLAR VALUES ('4','2','Planteada');

SELECT * FROM EJEMPLAR;

--- Inserta 4 socios.
INSERT INTO SOCIO VALUES ('11223344L','Javier','Burgos','656666888','11223344L');
INSERT INTO SOCIO VALUES ('44556677X','Julian','Plaza','633455888','44556677X');
INSERT INTO SOCIO VALUES ('90126754H','Ricardo','Lorca','677654788','90126754H');
INSERT INTO SOCIO VALUES ('83468590P','Vicente','Constitucion','677544900','83468590P');

SELECT * FROM SOCIO;

--- Inserta como mínimo 6 actores.
INSERT INTO ACTORES VALUES ('Sergio','Rumania','H');
INSERT INTO ACTORES VALUES ('Cosmin','Rumania','H');
INSERT INTO ACTORES VALUES ('Mcgregor','Irlanda','H');
INSERT INTO ACTORES VALUES ('Belen','España','M');
INSERT INTO ACTORES VALUES ('Jhonny','Suiza','H');
INSERT INTO ACTORES VALUES ('Omar','Rusia','H');

--- Cada película debe tener al menos el actor/atriz protagonista asociado.
INSERT INTO ACTUA VALUES ('Sergio','1','S');
INSERT INTO ACTUA VALUES ('Belen','2','S');
INSERT INTO ACTUA VALUES ('Cosmin','3','S');
INSERT INTO ACTUA VALUES ('Mcgregor','4','S');

--- Todos los ejemplares deben tener al menos 1 alquiler.
INSERT INTO ALQUILA VALUES ('11223344L','1','1',TO_DATE('21/03/2018','DD/MM/YYYY'),TO_DATE('28/03/2018','DD/MM/YYYY'));
INSERT INTO ALQUILA VALUES ('11223344L','1','2',TO_DATE('01/01/2019','DD/MM/YYYY'),TO_DATE('08/01/2019','DD/MM/YYYY'));


INSERT INTO ALQUILA VALUES ('44556677X','2','1',TO_DATE('11/04/2018','DD/MM/YYYY'),TO_DATE('20/04/2018','DD/MM/YYYY'));
INSERT INTO ALQUILA VALUES ('44556677X','2','2',TO_DATE('11/04/2018','DD/MM/YYYY'),TO_DATE('20/04/2018','DD/MM/YYYY'));

INSERT INTO ALQUILA VALUES ('90126754H','3','1',TO_DATE('15/06/2020','DD/MM/YYYY'),TO_DATE('20/06/2020','DD/MM/YYYY'));
INSERT INTO ALQUILA VALUES ('90126754H','3','2',TO_DATE('21/06/2020','DD/MM/YYYY'),TO_DATE('30/06/2020','DD/MM/YYYY'));


INSERT INTO ALQUILA VALUES ('83468590P','4','1',TO_DATE('20/12/2020','DD/MM/YYYY'),TO_DATE('30/12/2020','DD/MM/YYYY'));
INSERT INTO ALQUILA VALUES ('83468590P','4','2',TO_DATE('31/12/2020','DD/MM/YYYY'),TO_DATE('06/01/2021','DD/MM/YYYY'));

SELECT * FROM ALQUILA;

--2. (0,5 puntos) Cambia la nacionalidad para los directores. Por ejemplo de
--'Estadounidense' a 'USA' o similar, dependiendo de los valores que hayas
--introducido.
SELECT * FROM DIRECTOR WHERE NACIONALIDAD='España';
UPDATE DIRECTOR SET NACIONALIDAD='ESP' WHERE NACIONALIDAD='España';

--3. (1 punto) Modifica los datos de todos los socios para que el avalista sea un único
--socio, siempre el mismo para todos, excepto para el avalista mismo que no dispone
--de ninguno.

UPDATE SOCIO SET AVALADOR='83468590P';
SELECT * FROM SOCIO;
UPDATE SOCIO SET AVALADOR='' WHERE DNI='83468590P'; 
SELECT * FROM SOCIO;

--4. (0,5 puntos) Elimina los socios cuyo número de teléfono empiece por 5. ¿Qué
--sucede?¿Por qué?.
SELECT * FROM SOCIO WHERE TELEFONO LIKE '5%';
SELECT * FROM SOCIO WHERE DNI='90126754H';
UPDATE SOCIO SET TELEFONO='566555444' WHERE DNI='90126754H';
--DELETE FROM SOCIO WHERE TELEFONO LIKE '5%';
-- COMO NO TENGO NINGUNO QUE EMPIECE POR 5, HE METIDO UN UPDATE PARA ACTUALIZAR UN NUMERO Y COMPROBAR QUE PASABA, EFECTIVAMENTE
--NO ME DEJA BORRALO YA QUE HAY TABLAS QUE DEPENDEN DE ESTE CAMPO, Y ADEMÁS NO SE BORRRA EN CASCADA,


--5. (0,5 puntos) ¿Cómo lo solucionarías en el problema anterior? ¿Podría
--haberse evitado el problema con otro diseño físico?¿Cómo? 

--PODRÍA HABERSE EVITADO AÑADIENDO EL ON DELETE CASCADE, PARA QUE DE ESTA MANERA AL BORRARSE EN LA TABLA SE BORRASE
-- DE FORMA CORRESPONDIENTE TAMBIÉN EN LAS DEMÁS TABLAS, SIN NINGÚN TIPO DE PROBLEMA.

--6. (0,5 puntos) Elimina 2 películas, las que desees.¿Qué sucede?¿Por
--qué?¿Cómo lo solucionarías? ¿Podría haberse evitado el problema con otro
--diseño físico?¿Cómo?.


-- DE NUEVO NO DEJA BORRARLA PORQUE HAY CAMPOS EN ESTA MISMA TABLA, DE LOS CUALES DEPENDEN OTRAS TABLAS, PARA ELLO HABRÍA QUE
--PRIMERO BORRAR LOS EJEMPLARES Y DE LA TABLA ALQUILA YA QUE DEPENDEN DE ESTA MISMA PELICULA, YA QUE DEPENDEN DE ESTA O PONER UN ON DELETE CASCADE, DE MANERA
--QUE SI BORRAS UNA PELICULA, SE BORRA EN LAS DEMÁS TABLAS.
--ASI SE SOLUCIONARIA:
--ALTER TABLE EJEMPLAR DROP CONSTRAINT FK_EJEMPLAR;
--ALTER TABLE EJEMPLAR ADD CONSTRAINT FK_EJEMPLAR FOREIGN KEY(IDPELICULA) REFERENCES PELICULA(ID) ON DELETE CASCADE;
--ALTER TABLE ALQUILA DROP CONSTRAINT FK2_PELI;
--ALTER TABLE ALQUILA ADD CONSTRAINT FK2_PELI FOREIGN KEY (IDPELICULA, NUMERO) REFERENCES EJEMPLAR(IDPELICULA, NUMERO) ON DELETE CASCADE;
--SELECT * FROM PELICULA WHERE TITULO='Spiderman';
--DELETE FROM PELICULA WHERE TITULO='Spiderman';


--7. (0,5 puntos) Crea una tabla que se llame DIRECTORES_BACKUP y que
--almacene los datos de todos los directores.

CREATE TABLE DIRECTORES_BACKUP
(
NOMBRE VARCHAR2(40),
NACIONALIDAD VARCHAR2(40) ,
CONSTRAINT PK_DIRECTOR_BACKUP PRIMARY KEY(NOMBRE)
);

INSERT INTO DIRECTORES_BACKUP SELECT * FROM DIRECTOR;
SELECT * FROM DIRECTORES_BACKUP;


--8. (0,5 puntos) A la tabla DIRECTORES_BACKUP añade un nuevo campo que
--se llame VALORACIÓN que será un de tipo cadena de 50. Para aquellos
--directores cuya nacionalidad sea ‘Española’ vamos a indicar en el nuevo
--campo valoración el siguiente texto ‘Muy buena trayectoria profesional’.

ALTER TABLE DIRECTORES_BACKUP ADD VALORACION VARCHAR2(50);
SELECT * FROM DIRECTORES_BACKUP;

--Antes se cambio la nacionalidad de 'Española' a ESP, pero como la nacionalidad sigue siendo española, aunque sea ESP
--Lo voy a hacer de la siguiente manera:
SELECT * FROM DIRECTORES_BACKUP WHERE NACIONALIDAD='ESP';
UPDATE DIRECTORES_BACKUP SET VALORACION='Muy buena trayectoria profesional' WHERE NACIONALIDAD='ESP';
SELECT * FROM DIRECTORES_BACKUP;


--9. (0,5 puntos) Adapta el script de creación de tablas proporcionado para que
--funcione en MySQL.

--FUNCIONAMIENTO EN MYSQL:
CREATE TABLE DIRECTOR
(
NOMBRE VARCHAR(40),
NACIONALIDAD VARCHAR(40) ,
CONSTRAINT PK_DIRECTOR PRIMARY KEY(NOMBRE)
);

CREATE TABLE PELICULA
(
ID INT,
TITULO VARCHAR(40),
PRODUCTORA VARCHAR(40),
NACIONALIDAD VARCHAR(40),
FECHA DATE,
DIRECTOR VARCHAR(40),
CONSTRAINT FK_DIRECTOR FOREIGN KEY (DIRECTOR) REFERENCES DIRECTOR(NOMBRE) ,
CONSTRAINT PK_PELICULA PRIMARY KEY (ID)
);
CREATE TABLE EJEMPLAR
(
IDPELICULA INT,
NUMERO INT(2),
ESTADO VARCHAR(40),
CONSTRAINT PK_EJEMPLAR PRIMARY KEY(IDPELICULA, NUMERO),
CONSTRAINT FK_EJEMPLAR FOREIGN KEY(IDPELICULA) REFERENCES PELICULA(ID)
);
CREATE TABLE ACTORES
(
NOMBRE VARCHAR(40),
NACIONALIDAD VARCHAR(40),
SEXO ENUM('H','M'),
CONSTRAINT PK_ACTORES PRIMARY KEY(NOMBRE)
);

CREATE TABLE SOCIO
(
DNI VARCHAR(9),
NOMBRE VARCHAR(40) NOT NULL,
DIRECCION VARCHAR(40),
TELEFONO VARCHAR(9),
AVALADOR VARCHAR(9),
CONSTRAINT PK_SOCIO PRIMARY KEY(DNI),
CONSTRAINT FK_SOCIO FOREIGN KEY(AVALADOR) REFERENCES SOCIO(DNI)
);
CREATE TABLE ACTUA
(
ACTOR VARCHAR(40),
IDPELICULA INT,
PROTAGONISTA ENUM ('S','N'),
CONSTRAINT PK_ACTUA PRIMARY KEY(ACTOR, IDPELICULA),
CONSTRAINT FK1_ACTUA FOREIGN KEY(ACTOR )REFERENCES ACTORES(NOMBRE) ON DELETE
CASCADE,
CONSTRAINT FK2_ACTUA FOREIGN KEY (IDPELICULA) REFERENCES PELICULA(ID) ON DELETE
CASCADE
);
CREATE TABLE ALQUILA
(
DNI VARCHAR(9),
IDPELICULA INT(10),
NUMERO INT(2),
FECHA_ALQUILER DATE,
FECHA_DEVOLUCION DATE,
CONSTRAINT PK_ALQUILA PRIMARY KEY(DNI, IDPELICULA, NUMERO,FECHA_ALQUILER),
CONSTRAINT FK1_DNI FOREIGN KEY(DNI) REFERENCES SOCIO(DNI), CONSTRAINT
FK2_PELI FOREIGN KEY(IDPELICULA, NUMERO)
REFERENCES EJEMPLAR(IDPELICULA, NUMERO),
CONSTRAINT CK_FECHAS CHECK (FECHA_DEVOLUCION > FECHA_ALQUILER) );


--10.(1,5 puntos) En Oracle, se desea que el campo ID de la tabla película se
--incremente de forma automática para que al realizar una inserción en la tabla
--no tenga que preocuparme de su campo ID. Realiza las modificaciones
--necesarias para ello e incluye 2 instrucciones para insertar datos y comprobar
--que funciona correctamente.

--Para no tener que borrar datos y empezar por el 1 de nuevo, como ya tengo datos escritos anteriormente, he usado
--la secuencia para que se aplique a partir de la pelicula con Id 4, que es lam última que escribí, y a partir de ahí
--que funcione la secuencia para todo.
SELECT * FROM PELICULA;
CREATE SEQUENCE Secuencia_idpelicula
START WITH 5
INCREMENT BY 1

INSERT INTO PELICULA VALUES (Secuencia_idpelicula.nextval,'Doraemon','Lucia','España',TO_DATE('22/02/2001','DD/MM/YYYY'),'Juan');
INSERT INTO PELICULA VALUES (Secuencia_idpelicula.nextval,'Harry Potter','Lucia','España',TO_DATE('22/02/2001','DD/MM/YYYY'),'Juan');
SELECT * FROM PELICULA;

--11. (1 punto) En Mysql, se desea que el campo ID de la tabla película se
--incremente de forma automática para que al realizar una inserción en la tabla
--no tenga que preocuparme de su campo ID. Realiza las modificaciones
--necesarias para ello e incluye 2 instrucciones para insertar datos y comprobar
--que funciona correctamente. Realiza captura de pantalla del modelo resultante

ALTER TABLE PELICULA MODIFY ID AUTO_INCREMENT;



--12. (1 punto) Suponiendo que tenemos el AUTOCOMMIT
--desactivado, ¿Qué pasaría en las siguientes situaciones?

	/*(0,15 puntos) Si creo una nueva tabla llamada TAQUILLA en la base de
	datos y posteriormente inserto datos sobre ella. ¿Podrá ver esos datos
	otro programador/a que trabaje en tu equipo de desarrollo y que tenga
	acceso a la misma basede datos?. Justifica la respuesta.
	
	Respuesta:
	No tan sólo podrá ver la tabla creada debido a que cada sentencia DDL, como la creación de tablas lleva 
	un AUTOCOMMIT en él mismo, con lo cual se verá la tabla creada, pero sin los datos insertados.
	
	(0,15 puntos) Creo una nueva tabla FANS en la base de datos.
	Posteriormente nos damos cuenta que alguno de los datos que
	inserté en la tabla TAQUILLA no son correctos. ¿Puedo volver a la
	situación inicial con alguna operación? Indica cuál en caso de
	ser posible y justifica la respuesta
	
	Respuesta: Si no has realizado un COMMIT después de insertar los datos en la tabla taquilla, podrás volver al inicio de la tabla taquilla
	con un ROLLBACK, si después de haber insertado los datos has vuelto a hacer un COMMIT, tan sólo podrás volver con el ROLLBACK al último COMMIT
	realizado, es decir al de la tabla taquilla con los datos insertados. El ROLLBACK es la instrucción que deberás
	usar en todo caso para volver hacia los puntos, ya sea COMMIT O SAVEPOINT.
	
	
	(0,15 puntos) Inserto datos en la tabla FANS y quiero que los datos
	queden persistidos en la base de datos. ¿Qué operación necesito realizar?.
	Justifica la respuesta.
	
	Respuesta:
	Deberás realizar un COMMIT que guarde los datos los cuales has metido en esa misma tabla.
	
	● (0,15 puntos) Posteriormente quiero borrar solo algunos datos de la
	tabla FANS pero por error he borrado todos los datos de la tabla. ¿Puedo
	realizar algo para recuperar los datos que borré?. Justifícalo y en caso de ser
	posible indica cómo actuarías.
	
	Respuesta:
	Si tienes un SAVEPOINT realizado podrás volver atrás con un ROLLBACK TO SAVEPOINT (Nombre_SAVEPOINT).
	
	
	


