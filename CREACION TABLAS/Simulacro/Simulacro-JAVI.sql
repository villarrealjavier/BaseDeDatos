--APARTADO 1:
--ALTER SESSION SET "_oracle_script"=TRUE;
--CREATE USER PRUEBAEVALUABLE IDENTIFIED BY PRUEBAEVALUABLE;
--GRANT CONNECT, RESOURCE, DBA TO PRUEBAEVALUABLE;  

CREATE TABLE ALUMNO 
(num_matricula NUMBER(5),
nombre VARCHAR2(25),
fecha_nacimiento DATE,
telefono VARCHAR2(9),

CONSTRAINT PK_ALUMNO PRIMARY KEY (num_matricula)
);

CREATE TABLE PROFESOR
(idprofesor NUMBER(5),
nif_p VARCHAR2(9),
nombre VARCHAR2(25),
especialidad VARCHAR2(30),
telefono VARCHAR2(9),

CONSTRAINT PK_PROFESOR PRIMARY KEY (idprofesor)
);

CREATE TABLE ASIGNATURA 
(codasignatura VARCHAR2(5),
nombre VARCHAR2(25),
idprofesor NUMBER(5),

CONSTRAINT PK_ASIGNATURA PRIMARY KEY (codasignatura),
CONSTRAINT FK_ASIGNATURA FOREIGN KEY (idprofesor) REFERENCES PROFESOR(idprofesor)
);

CREATE TABLE RECIBE 
(num_matricula NUMBER(5),
codasignatura VARCHAR2(5),
cursoescolar VARCHAR2(5),

CONSTRAINT PK_RECIBE PRIMARY KEY (num_matricula,codasignatura,cursoescolar),
CONSTRAINT FK_RECIBE FOREIGN KEY (num_matricula) REFERENCES ALUMNO(num_matricula),
CONSTRAINT FK2_RECIBE FOREIGN KEY (codasignatura) REFERENCES ASIGNATURA (codasignatura)
);

--APARTADO 2:
--Tabla profesor:
INSERT INTO PROFESOR (idprofesor,nif_p,nombre,especialidad,telefono) VALUES ('7755','775566L','Paco','Matematicas','656645790');
INSERT INTO PROFESOR (idprofesor,nif_p,nombre,especialidad,telefono) VALUES ('7756','793244L','Julio','Lengua','656645790');

--Tabla asignaturas:
INSERT INTO ASIGNATURA (codasignatura,nombre,idprofesor) VALUES ('A101','Matematicas','7755');
INSERT INTO ASIGNATURA (codasignatura,nombre,idprofesor) VALUES ('A102','Lengua','7756');
INSERT INTO ASIGNATURA (codasignatura,nombre,idprofesor) VALUES ('A103','Lectura','7756');
INSERT INTO ASIGNATURA (codasignatura,nombre,idprofesor) VALUES ('A104','Tecnologia','7755');

--Tabla alumno:
INSERT INTO ALUMNO (num_matricula,nombre,fecha_nacimiento,telefono) VALUES ('00001','Julian',TO_DATE('28/08/2005','dd/mm/yyyy'),'690900666');
INSERT INTO ALUMNO (num_matricula,nombre,fecha_nacimiento,telefono) VALUES ('00002','Javier',TO_DATE('02/01/2005','dd/mm/yyyy'),'665556777');
INSERT INTO ALUMNO (num_matricula,nombre,fecha_nacimiento,telefono) VALUES ('00003','Vicente',TO_DATE('06/01/2005','dd/mm/yyyy'),'699812456');
INSERT INTO ALUMNO (num_matricula,nombre,fecha_nacimiento,telefono) VALUES ('00004','Antonio',TO_DATE('12/03/2005','dd/mm/yyyy'),'677564321');
INSERT INTO ALUMNO (num_matricula,nombre,fecha_nacimiento,telefono) VALUES ('00005','Pablo',TO_DATE('12/09/2005','dd/mm/yyyy'),'645321789');
INSERT INTO ALUMNO (num_matricula,nombre,fecha_nacimiento,telefono) VALUES ('00006','Maria',TO_DATE('09/05/2005','dd/mm/yyyy'),'768463215');
INSERT INTO ALUMNO (num_matricula,nombre,fecha_nacimiento,telefono) VALUES ('00007','Laura',TO_DATE('31/12/2005','dd/mm/yyyy'),'644657892');
INSERT INTO ALUMNO (num_matricula,nombre,fecha_nacimiento,telefono) VALUES ('00008','Pilar',TO_DATE('09/07/2005','dd/mm/yyyy'),'657489043');
INSERT INTO ALUMNO (num_matricula,nombre,fecha_nacimiento,telefono) VALUES ('00009','Marta',TO_DATE('09/09/2005','dd/mm/yyyy'),'654890612');
INSERT INTO ALUMNO (num_matricula,nombre,fecha_nacimiento,telefono) VALUES ('00010','Agustina',TO_DATE('11/11/2005','dd/mm/yyyy'),'677999000');
-- CADA ALUMNO MATRICULADO EN UNA ASIGNATURA:
INSERT INTO RECIBE (num_matricula,codasignatura,cursoescolar) VALUES ('00001','A101','1C');
INSERT INTO RECIBE (num_matricula,codasignatura,cursoescolar) VALUES ('00002','A101','1C');
INSERT INTO RECIBE (num_matricula,codasignatura,cursoescolar) VALUES ('00003','A101','1C');
INSERT INTO RECIBE (num_matricula,codasignatura,cursoescolar) VALUES ('00004','A101','1C');
INSERT INTO RECIBE (num_matricula,codasignatura,cursoescolar) VALUES ('00005','A101','1C');
INSERT INTO RECIBE (num_matricula,codasignatura,cursoescolar) VALUES ('00006','A101','1C');
INSERT INTO RECIBE (num_matricula,codasignatura,cursoescolar) VALUES ('00007','A101','1C');
INSERT INTO RECIBE (num_matricula,codasignatura,cursoescolar) VALUES ('00008','A101','1C');
INSERT INTO RECIBE (num_matricula,codasignatura,cursoescolar) VALUES ('00009','A101','1C');
INSERT INTO RECIBE (num_matricula,codasignatura,cursoescolar) VALUES ('00010','A101','1C');
--------------------------------------------
INSERT INTO RECIBE (num_matricula,codasignatura,cursoescolar) VALUES ('00001','A102','1B');
INSERT INTO RECIBE (num_matricula,codasignatura,cursoescolar) VALUES ('00002','A102','1B');
INSERT INTO RECIBE (num_matricula,codasignatura,cursoescolar) VALUES ('00003','A102','1B');
INSERT INTO RECIBE (num_matricula,codasignatura,cursoescolar) VALUES ('00004','A102','1B');
INSERT INTO RECIBE (num_matricula,codasignatura,cursoescolar) VALUES ('00005','A102','1B');
INSERT INTO RECIBE (num_matricula,codasignatura,cursoescolar) VALUES ('00006','A102','1B');
INSERT INTO RECIBE (num_matricula,codasignatura,cursoescolar) VALUES ('00007','A102','1B');
INSERT INTO RECIBE (num_matricula,codasignatura,cursoescolar) VALUES ('00008','A102','1B');
INSERT INTO RECIBE (num_matricula,codasignatura,cursoescolar) VALUES ('00009','A102','1B');
INSERT INTO RECIBE (num_matricula,codasignatura,cursoescolar) VALUES ('00010','A102','1B');
SELECT * FROM RECIBE;



-- APARTADO 3:
INSERT INTO ALUMNO (num_matricula,nombre,fecha_nacimiento,telefono) VALUES ('00011','Julia',TO_DATE('11/11/2005','dd/mm/yyyy'),'677999999');

--INSERT INTO ALUMNO (num_matricula,nombre,fecha_nacimiento,telefono) VALUES ('00011','Paca',TO_DATE('11/11/2005','dd/mm/yyyy'),'666000666');
-- No podemos debido a que pone que he violado la restricción para ello bien o tendré que crear otro campo con el codigo que no esté siendo usado como por ejemplo:
--INSERT INTO ALUMNO (num_matricula,nombre,fecha_nacimiento,telefono) VALUES ('00012','Paca',TO_DATE('11/11/2005','dd/mm/yyyy'),'666000666');

--APARTADO 4:
INSERT INTO ALUMNO (num_matricula,nombre,fecha_nacimiento,telefono) VALUES ('00013','Juan',TO_DATE('10/12/2005','dd/mm/yyyy'),'');
INSERT INTO ALUMNO (num_matricula,nombre,fecha_nacimiento,telefono) VALUES ('00014','Ivan',TO_DATE('30/07/2005','dd/mm/yyyy'),'');
INSERT INTO ALUMNO (num_matricula,nombre,fecha_nacimiento,telefono) VALUES ('00015','Manuel',TO_DATE('25/06/2005','dd/mm/yyyy'),'');
SELECT * FROM ALUMNO;

--APARTADO 5:
UPDATE ALUMNO SET telefono='677777777' WHERE nombre='Juan';
UPDATE ALUMNO SET telefono='600111222' WHERE nombre='Ivan';
UPDATE ALUMNO SET telefono='622333444' WHERE nombre='Manuel';

--APARTADO 6:
UPDATE ALUMNO SET fecha_nacimiento =to_date('22/07/1981','dd/mm/yyyy') WHERE EXTRACT(YEAR FROM fecha_nacimiento) >2000;
SELECT * FROM ALUMNO;

--APARTADO 7:
INSERT INTO PROFESOR (idprofesor,nif_p,nombre,especialidad,telefono) VALUES ('7757','775566L','lolo','Matematicas','');

UPDATE PROFESOR SET especialidad='Informatica' WHERE telefono IS NOT NULL AND (nif_p NOT LIKE '9%');
SELECT * FROM PROFESOR;

--APARTADO 8:
SELECT * FROM RECIBE;
DELETE FROM RECIBE WHERE codasignatura ='A102';

--APARTADO 9:
DELETE FROM ASIGNATURA WHERE codasignatura='A102';

--APARTADO 10:
SELECT * FROM ASIGNATURA;
--No dejaria por que tenemos alumnos los cuales en la tabla recibe están matriculados en dicha asignatura, para borrar las asignaturas primero deberiamos borrar los registros
--de esta misma tabla, ya que todos los alumnos están matriculados a una asignatura.
--Para solucionarlo deberiamos hacer lo siguiente:
DELETE FROM RECIBE WHERE codasignatura ='A101';
DELETE FROM ASIGNATURA WHERE codasignatura ='A101';
DELETE FROM ASIGNATURA WHERE codasignatura ='A103';
DELETE FROM ASIGNATURA WHERE codasignatura ='A104';

--APARTADO 11:
--A mi me ha dejado perfectamente.
SELECT * FROM PROFESOR;
DELETE FROM PROFESOR WHERE idprofesor ='7757';
DELETE FROM PROFESOR WHERE idprofesor ='7755';
DELETE FROM PROFESOR WHERE idprofesor ='7756';
--APARTADO 12:
SELECT * FROM ALUMNO;

UPDATE ALUMNO SET nombre=UPPER(nombre);  
SELECT * FROM ALUMNO; 

--APARTADO 13

CREATE TABLE ALUMNO_BACKUP
(num_matricula NUMBER(5),
nombre VARCHAR2(25),
fecha_nacimiento DATE,
telefono VARCHAR2(9),

CONSTRAINT PK_ALUMNOBACKUP PRIMARY KEY (num_matricula)
);

INSERT INTO ALUMNO_BACKUP SELECT * FROM ALUMNO;
SELECT * FROM ALUMNO_BACKUP;

ALTER TABLE ALUMNO_BACKUP ADD especialidad VARCHAR2(20);
UPDATE ALUMNO_BACKUP 
SET especialidad='Informatica' WHERE EXTRACT(YEAR FROM fecha_nacimiento)=1981;
SELECT * FROM ALUMNO_BACKUP WHERE EXTRACT(YEAR FROM fecha_nacimiento)=1981;
INSERT INTO ALUMNO_BACKUP (num_matricula,nombre,fecha_nacimiento,telefono) VALUES ('00030','Agustina',TO_DATE('11/11/2005','dd/mm/yyyy'),'677999000');

SELECT * FROM ALUMNO_BACKUP WHERE EXTRACT(YEAR FROM fecha_nacimiento)!=1981;
SELECT * FROM ALUMNO_BACKUP WHERE especialidad IS NULL;
UPDATE ALUMNO_BACKUP SET especialidad='No especialidad' WHERE especialidad IS NULL;
