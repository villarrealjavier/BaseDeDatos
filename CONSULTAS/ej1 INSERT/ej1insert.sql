CREATE TABLE DEPART
(DEPT_NO INT (3),
DNOMBRE VARCHAR(20),
LOC VARCHAR (20),

CONSTRAINT PK_DEPART PRIMARY KEY (DEPT_NO)
);



CREATE TABLE EMPLE
(EMP_NO INT (5),
APELLIDO VARCHAR(20),
OFICIO VARCHAR (20),
DIR INT (5),
FECHA_ALT DATE ,
SALARIO INT (10),
COMISION INT (10),
DEPT_NO INT (3),

CONSTRAINT PK_EMPLE PRIMARY KEY (EMP_NO),
CONSTRAINT FK_EMPLE FOREIGN KEY (DEPT_NO) REFERENCES DEPART (DEPT_NO)
);

INSERT INTO DEPART VALUES (10, 'CONTABILIDAD','SEVILLA');
INSERT INTO DEPART VALUES (20, 'INVESTIGACIÓN','MADRID');
INSERT INTO DEPART VALUES (30, 'VENTAS','BARCELONA');
INSERT INTO DEPART VALUES (40, 'PRODUCCIÓN','BILBAO');


INSERT INTO EMPLE (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, DEPT_NO)
VALUES (7369,'SÁNCHEZ', 'EMPLEADO', 7902, '1980/12/17', 104000, 20);
##SELECT * FROM EMPLE e ;
INSERT INTO EMPLE  
VALUES (7499,'ARROYO', 'VENDEDOR', 7698, '1980/02/20', 208000, 39000, 30);
INSERT INTO EMPLE  
VALUES (7521,'SALA', 'VENDEDOR', 7698, '1981/02/22', 162500, 162500, 30);
INSERT INTO EMPLE (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, DEPT_NO)
VALUES (7566,'JIMÉNEZ', 'DIRECTOR', 7839, '1981/04/02', 386750, 20);
INSERT INTO EMPLE  
VALUES (7654,'MARTÍN', 'VENDEDOR', 7698, '1981/09/29', 162500, 182000, 30);
INSERT INTO EMPLE (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, DEPT_NO)
VALUES (7698,'NEGRO', 'DIRECTOR', 7839, '1981/05/01', 370500, 30);
INSERT INTO EMPLE (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, DEPT_NO)
VALUES (7788,'GIL', 'ANALISTA', 7566, '1981/11/09', 390000, 20);
INSERT INTO EMPLE (EMP_NO, APELLIDO, OFICIO, FECHA_ALT, SALARIO, DEPT_NO)
VALUES (7839,'REY', 'PRESIDENTE', '1981/11/17', 650000, 10);
INSERT INTO EMPLE  
VALUES (7844,'TOVAR', 'VENDEDOR', 7698, '1980/09/08', 195000, 0, 30);
INSERT INTO EMPLE (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, DEPT_NO)
VALUES (7876,'ALONSO', 'EMPLEADO', 7788, '1981/09/23', 143000, 20);
INSERT INTO EMPLE (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, DEPT_NO)
VALUES (7900,'JIMENO', 'EMPLEADO', 7698, '1981/12/03', 1235000, 30);
INSERT INTO EMPLE (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, DEPT_NO)
VALUES (7902,'FERNÁNDEZ', 'ANALISTA', 7566, '1981/12/03', 390000, 20);
INSERT INTO EMPLE (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, DEPT_NO)
VALUES (7934,'MUÑOZ', 'EMPLEADO', 7782, '1982/01/23', 169000, 10);

SELECT APELLIDO,OFICIO,DEPT_NO FROM EMPLE;

SELECT * FROM DEPART;

SELECT * FROM EMPLE ;

SELECT * FROM EMPLE 
ORDER BY APELLIDO;

SELECT * FROM EMPLE 
ORDER BY DEPT_NO DESC;

SELECT * FROM EMPLE 
ORDER BY DEPT_NO DESC, APELLIDO ASC;

SELECT * FROM EMPLE WHERE SALARIO>200000;

SELECT * FROM EMPLE WHERE UPPER(OFICIO)='ANALISTA';

SELECT APELLIDO,OFICIO FROM EMPLE WHERE DEPT_NO=20;

SELECT * FROM EMPLE WHERE UPPER(OFICIO)='VENDEDOR'
ORDER BY APELLIDO;

SELECT * FROM EMPLE WHERE DEPT_NO=10 AND UPPER(OFICIO)='ANALISTA'
ORDER BY APELLIDO;

SELECT * FROM EMPLE WHERE SALARIO>200000 OR DEPT_NO=20;

SELECT * FROM EMPLE ORDER BY OFICIO;

SELECT * FROM EMPLE WHERE APELLIDO LIKE 'A%';

SELECT * FROM EMPLE WHERE APELLIDO LIKE '%Z';

SELECT * FROM EMPLE WHERE APELLIDO LIKE 'A%' AND OFICIO LIKE '%E%';

SELECT * FROM EMPLE WHERE SALARIO BETWEEN 100000 AND 200000;

SELECT * FROM EMPLE WHERE OFICIO='VENDEDOR' AND COMISION>100000;

SELECT * FROM EMPLE ORDER BY DEPT_NO,APELLIDO;

SELECT EMP_NO,APELLIDO FROM EMPLE WHERE APELLIDO LIKE '%Z' AND SALARIO>300000;

SELECT * FROM DEPART WHERE LOC LIKE 'B%';

SELECT * FROM EMPLE WHERE UPPER(OFICIO)='EMPLEADO' AND SALARIO>100000  AND DEPT_NO=10;

SELECT APELLIDO FROM EMPLE WHERE COMISION IS NULL OR COMISION=0;

SELECT APELLIDO FROM EMPLE WHERE (COMISION IS NULL OR COMISION=0) AND APELLIDO LIKE 'J%';

SELECT APELLIDO FROM EMPLE WHERE UPPER(OFICIO)='VENDEDOR' OR UPPER(OFICIO)='ANALISTA' OR UPPER(OFICIO)='EMPLEADO';

SELECT APELLIDO FROM EMPLE WHERE UPPER(OFICIO)!='ANALISTA' AND UPPER(OFICIO)!='EMPLEADO';

SELECT * FROM EMPLE WHERE SALARIO BETWEEN 200000 AND 300000;

SELECT APELLIDO,SALARIO,DEPT_NO FROM EMPLE WHERE SALARIO>200000 AND (DEPT_NO = 30 OR DEPT_NO=10);

SELECT DEPT_NO ,APELLIDO FROM EMPLE WHERE SALARIO NOT BETWEEN 100000 AND 200000;

SELECT LOWER(APELLIDO) FROM EMPLE;

SELECT CONCAT(APELLIDO,"->",OFICIO) FROM EMPLE;

SELECT APELLIDO,LENGTH(APELLIDO) FROM EMPLE
ORDER BY LENGTH(APELLIDO) DESC;

SELECT EXTRACT(YEAR FROM FECHA_ALT) FROM EMPLE;


SELECT FECHA_ALT FROM EMPLE;
SELECT * FROM EMPLE WHERE EXTRACT(YEAR FROM FECHA_ALT)=1992;

SELECT * FROM EMPLE WHERE EXTRACT(MONTH FROM FECHA_ALT)=2;

SELECT APELLIDO, MAX(SALARIO),COMISION FROM EMPLE;
##CON UNA FUNCION ESTILO A LA DE MAX, PARA SACAR LOS VALORES MAXIMOS
SELECT FECHA_ALT FROM EMPLE;
SELECT * FROM EMPLE WHERE APELLIDO LIKE 'A%' AND FECHA_ALT=1990;

SELECT * FROM EMPLE WHERE DEPT_NO=10 AND (COMISION IS NULL OR COMISION=0);

