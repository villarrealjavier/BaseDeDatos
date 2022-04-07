ALTER SESSION SET "_oracle_script"=TRUE;
CREATE USER MARIPOSAS IDENTIFIED BY MARIPOSAS;
GRANT CONNECT, RESOURCE, DBA TO MARIPOSAS; 

--1 Obtener el nombre y apellidos de la persona o personas que han capturado
--más ejemplares.
SELECT a.*
FROM AFICIONADOS a , (SELECT COUNT(e.NOMBRE_ESPECIE) FROM EJEMPLARESMARIPOSAS e 
					ORDER BY COUNT(e.NOMBRE_ESPECIE) DESC) c
WHERE a.DNI = c.DNI_CAPTURA
AND ROWNUM=1;

--2 Mostrar el nombre de las especies que han sido capturadas, pero que
--nunca han sido liberadas (las especies liberadas tienen una L en el tipo de
--ejemplar).
SELECT e.NOMBRE_ESPECIE 
FROM EJEMPLARESMARIPOSAS e 
WHERE e.TIPO_EJEMPLAR<>'L';

SELECT e.NOMBRE_ESPECIE 
FROM EJEMPLARESMARIPOSAS e 
WHERE e.TIPO_EJEMPLAR = (SELECT e.TIPO_EJEMPLAR FROM EJEMPLARESMARIPOSAS e2
						WHERE e.TIPO_EJEMPLAR<>'L');

--3 Mostrar todos los datos del aficionado que tiene más dinero invertido en
--todas sus colecciones.
SELECT a.*
FROM AFICIONADOS a , (SELECT c.PRECIO_ESTIMADO FROM COLECCIONES c
					ORDER BY c.PRECIO_ESTIMADO) c

WHERE ROWNUM=1;

--4 Muestra el dni de las personas que únicamente han capturado “Saturnia
--Pavonia”.
SELECT e.DNI_CAPTURA 
FROM EJEMPLARESMARIPOSAS e 
WHERE e.NOMBRE_ESPECIE= 'Saturnia Pavonia';

--5  Obtén información sobre las familias, géneros y especies de mariposas que
--nunca hayan sido capturados.
SELECT g.NOMBRE_GENERO,g.NOMBRE_FAMILIA , e.NOMBRE_ESPECIE 
FROM  GENEROS g, ESPECIES e 
WHERE g.NOMBRE_GENERO = e.NOMBRE_GENERO 
AND e.NOMBRE_ESPECIE NOT IN (SELECT e2.NOMBRE_ESPECIE FROM EJEMPLARESMARIPOSAS e2);



--6 Sin utilizar subconsultas y utilizando OUTER JOIN, obtén información
--sobre las familias, géneros y especies de mariposas que nunca hayan sido
--capturados.
SELECT g.NOMBRE_GENERO,g.NOMBRE_FAMILIA , e.NOMBRE_ESPECIE 
FROM  GENEROS g, ESPECIES e, EJEMPLARESMARIPOSAS e2 
WHERE g.NOMBRE_GENERO = e.NOMBRE_GENERO 
AND e.NOMBRE_ESPECIE=e2.NOMBRE_ESPECIE(+)
AND e2.NOMBRE_ESPECIE IS NULL;


--7 Obtén la información de las personas que han capturado algún ejemplar
--pero que esas personas no tengan ninguna colección.
SELECT DISTINCT a.NOMBRE 
FROM EJEMPLARESMARIPOSAS e, AFICIONADOS a  
WHERE e.DNI_CAPTURA = a.DNI 
AND a.DNI NOT IN (SELECT c.DNI FROM COLECCIONES c, EJEMPLARESMARIPOSAS e2
					WHERE e2.DNI_COLECCION=c.DNI);

--8 Mostrar el nombre de la familia, para aquellas familias que tengan más de
--cinco especies y cuyo nombre empiece por a (en mayúscula o en minúscula).
--Los datos deberán aparecer ordenados alfabéticamente.

SELECT g.NOMBRE_FAMILIA 
FROM GENEROS g
WHERE g.NOMBRE_GENERO IN (SELECT e.NOMBRE_GENERO FROM ESPECIES e
							WHERE e.NOMBRE_ESPECIE LIKE 'a%'
							OR e.NOMBRE_ESPECIE LIKE 'A%'
							HAVING COUNT(e.NOMBRE_ESPECIE)>5 
							GROUP BY e.NOMBRE_GENERO);

--9 Obtén la mariposa más pequeña de todas las capturadas, la persona que
--la capturó y a qué colección pertenece.
SELECT 
FROM 
--11 Obtener las provincias en las que nunca se ha capturado un ejemplar.
SELECT z.PROVINCIA
FROM ZONLOCPRO z
WHERE z.NOMBRE_ZONA NOT IN (SELECT e.NOMBRE_ZONA FROM EJEMPLARESMARIPOSAS e);

--12 Obtener el sexo del que hay menos ejemplares capturados.
SELECT e.SEXO 
FROM EJEMPLARESMARIPOSAS e 



--13  Obtener el nombre de las distintas especies capturadas con un tamaño
--entre 124 y 270 ambos incluidos.
SELECT DISTINCT e.NOMBRE_ESPECIE 
FROM EJEMPLARESMARIPOSAS e 
WHERE e.TAMANO BETWEEN 124 AND 270;


--14 Mostrar el nombre de las distintas familias que ha capturado el aficionado
--con dni 12323459.
SELECT DISTINCT g.NOMBRE_FAMILIA  
FROM EJEMPLARESMARIPOSAS e, ESPECIES e2 , GENEROS g 
WHERE e.NOMBRE_ESPECIE = e2.NOMBRE_ESPECIE 
AND e2.NOMBRE_GENERO = g.NOMBRE_GENERO 
AND e.DNI_CAPTURA = 12323459;

--15 Mostrar el nombre de la especie, junto con el nombre científico y la fecha
--de captura de aquellas especies que se han capturado en la provincia
--de Huesca o en Zaragoza. Los datos deben salir ordenados por nombre de la
--especie y primero las últimas capturas.
SELECT DISTINCT e2.NOMBRE_ESPECIE , e.NOMBRE_CIENTIFICO, e2.FECHA_CAPTURA
FROM ESPECIES e, EJEMPLARESMARIPOSAS e2, ZONLOCPRO z 
WHERE e.NOMBRE_ESPECIE = e2.NOMBRE_ESPECIE 
AND e2.NOMBRE_ZONA = z.NOMBRE_ZONA 
AND UPPER(z.PROVINCIA)='HUESCA'
OR UPPER(z.PROVINCIA)='ZARAGOZA'
ORDER BY e2.NOMBRE_ESPECIE, e2.FECHA_CAPTURA;


--16 Mostrar el nombre de la familia, para aquellas familias que tengan más de
--cinco especies y cuyo nombre empiece por a (en mayúscula o en
--minúscula). Los datos deberán aparecer ordenados alfabéticamente.
SELECT g.NOMBRE_FAMILIA 
FROM GENEROS g, ESPECIES e 
WHERE e.NOMBRE_GENERO = g.NOMBRE_GENERO 
AND e.NOMBRE_ESPECIE LIKE 'a%'
OR e.NOMBRE_ESPECIE LIKE 'A%'
HAVING COUNT(e.NOMBRE_ESPECIE)>5
GROUP BY g.NOMBRE_FAMILIA;

--17 Mostrar el tamaño total de las capturas en cada provincia. Mostrar
--también el nombre de la provincia y ordenar de forma que aparezca primero
--la provincia en la que el tamaño total de las capturas es menor.
SELECT SUM(NVL(e.TAMANO,0)), z.PROVINCIA 
FROM EJEMPLARESMARIPOSAS e , ZONLOCPRO z 
WHERE e.NOMBRE_ZONA = z.NOMBRE_ZONA 
GROUP BY z.PROVINCIA;

--18 Obtener la media del tamaño de las capturas para cada especie y sexo
SELECT AVG(NVL(e.TAMANO,0)), e.NOMBRE_ESPECIE, e.SEXO  
FROM EJEMPLARESMARIPOSAS e 
GROUP BY e.NOMBRE_ESPECIE, e.SEXO;

--19 Mostrar las familias de las mariposas de las que algún ejemplar ha sido
--liberado. (tipo de ejemplar = L)
SELECT DISTINCT g.NOMBRE_FAMILIA
FROM GENEROS g, ESPECIES e , EJEMPLARESMARIPOSAS e2 
WHERE g.NOMBRE_GENERO= e.NOMBRE_GENERO 
AND e.NOMBRE_ESPECIE = e2.NOMBRE_ESPECIE 
AND UPPER(e2.TIPO_EJEMPLAR)='L';

--20 Obtén los diferentes nombres comunes y nombres científicos de cada una
--de las especies cuyos ejemplares hayan sido capturados entre los años 1996
--y 1997, todos ellos ordenados por el nombre de las zonas.
SELECT DISTINCT e3.NOMBRE_COMUN , e2.NOMBRE_CIENTIFICO 
FROM EJEMPLARESMARIPOSAS e, ESPECIES e2 , ESPZONCOM e3 
WHERE e.NOMBRE_ESPECIE = e2.NOMBRE_ESPECIE 
AND e2.NOMBRE_ESPECIE  =  e3.NOMBRE_ESPECIE 
AND EXTRACT(YEAR FROM e.FECHA_CAPTURA) BETWEEN 1996 AND 1997;




BEGIN SENTENCIAS 
	DBMS_OUTPUT.PUT_LINE ('Hola mundo');

END;
/
