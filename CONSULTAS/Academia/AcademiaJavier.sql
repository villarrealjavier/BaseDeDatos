CREATE TABLE PROFESOR 
(
nombre VARCHAR2(25),
apellido1 VARCHAR2(50),
apellido2 VARCHAR2(50),
dni VARCHAR2(10),
direccion VARCHAR2(40),
titulo VARCHAR2(30),
gana VARCHAR2(20),

CONSTRAINT PK_PROFESOR PRIMARY KEY (dni)
);

CREATE TABLE CURSOS
(nombre_curso VARCHAR2(25),
cod_curso NUMBER(3),
dni_profesor VARCHAR2(10),
maximo_alumno NUMBER(5),
fecha_inicio DATE,
fecha_fin DATE,
num_horas NUMBER(5),

CONSTRAINT PK_CURSOS PRIMARY KEY (cod_curso),
CONSTRAINT FK_CURSOS FOREIGN KEY (dni_profesor) REFERENCES PROFESOR(dni)
);

CREATE TABLE ALUMNOS(
nombre	VARCHAR2(20),
apellido1 VARCHAR2(20),
apellido2 VARCHAR2(20),
dni	NUMBER(20),
direccion VARCHAR2(20),
sexo VARCHAR2(20),
fecha_nacimiento DATE,
curso NUMBER(5),

CONSTRAINT PK_dni_alumnos PRIMARY KEY(dni),
CONSTRAINT FK_curso FOREIGN KEY(curso) REFERENCES CURSOS(cod_curso),
CONSTRAINT CK_sexo CHECK(sexo IN('H','M'))
);


INSERT INTO PROFESOR(nombre,apellido1,apellido2,dni,direccion,titulo,gana) VALUES ('Juan','Arch','Lopez',32432455,'Puerta Negra, 4','Ing.Informatica',7500);
INSERT INTO PROFESOR(nombre,apellido1,apellido2,dni,direccion,titulo,gana) VALUES ('Maria','Olivia','Rubio',43215643,'Juan Alfonso 32',' Lda. Fil. Inglesa ',5400);
SELECT * FROM PROFESOR;

INSERT INTO CURSOS(nombre_curso, cod_curso, dni_profesor, maximo_alumno, fecha_inicio, fecha_fin, num_horas) VALUES('Inglés Básico', 1, 43215643, 15, TO_DATE('01/11/2000','DD/MM/YYYY'), TO_DATE('22/12/2000','DD/MM/YYYY'), 120);
INSERT INTO CURSOS(nombre_curso, cod_curso, dni_profesor, fecha_inicio, num_horas) VALUES('Administración Linux', 2, 32432455, TO_DATE('01/09/2000','DD/MM/YYYY'), 80);

INSERT INTO ALUMNOS(nombre, apellido1, apellido2, dni, direccion, sexo, fecha_nacimiento, curso) VALUES('Lucas', 'Manilva', 'López', 123523, 'Alhamar,3', 'H', TO_DATE('01/11/1979','DD/MM/YYYY'), 1);
INSERT INTO ALUMNOS(nombre, apellido1, apellido2, dni, direccion, sexo, curso) VALUES('Antonia', 'López', 'Alcantara', 2567567, 'Maniqui,21', 'M', 2);
INSERT INTO ALUMNOS(nombre, apellido1, apellido2, dni, direccion, sexo, curso) VALUES('Manuel', 'Alcantara', 'Pedrós', 3123689, 'Julian,2', 'H', 1);
INSERT INTO ALUMNOS(nombre, apellido1, apellido2, dni, direccion, sexo, fecha_nacimiento, curso) VALUES('José', 'Pérez', 'Caballar', 4896765, 'Jarcha,5', 'H', TO_DATE('03/02/1977','DD/MM/YYYY'), 2);
SELECT * FROM ALUMNOS;

INSERT INTO ALUMNOS(nombre, apellido1, apellido2, dni, sexo, curso) VALUES('Sergio','Navas','Retal',123524,'H',1);
INSERT INTO PROFESOR(nombre, apellido1, apellido2, dni, direccion, titulo, gana) VALUES('Juan','Arch','López',32432456,'Puerta Negra,4','Ing. Informatica', NULL);
INSERT INTO ALUMNOS(nombre, apellido1, apellido2, dni, direccion, sexo, curso) VALUES('Maria', 'Jaén', 'Sevilla', 789678, 'Martos,5', 'M', 1);

UPDATE ALUMNOS 
SET fecha_nacimiento = TO_DATE('23/12/1976','DD/MM/YYYY') WHERE dni = 2567567;

--No se puede por que ninguno tiene el codigo 5 por lo cual debemos crear uno con el codigo 5 y asignarselo
INSERT INTO CURSOS(nombre_curso, cod_curso, dni_profesor, maximo_alumno, fecha_inicio, fecha_fin, num_horas) VALUES('Lenguaje de Marcas', 5, 43215643, 21, TO_DATE('01/11/2000','DD/MM/YYYY'), TO_DATE('22/12/2000','DD/MM/YYYY'), 120);

UPDATE ALUMNOS
SET curso = 5
WHERE dni = 2567567;

SELECT * FROM ALUMNOS;
SELECT * FROM CURSOS;

--8 No se puede borrar a una persona la cual no se encuentra insertada en la base de datos.

--9 No se puede borrar debido a que el cogido 1 esta asignado a varios campos, habria que moverlos todos a otro codigo y borrar el 1.
UPDATE ALUMNOS
SET curso = 2 WHERE curso = 1;

DELETE FROM CURSOS WHERE cod_curso = 1;

--10
ALTER TABLE CURSOS ADD numerodealumnos NUMBER(10);

--11
UPDATE ALUMNOS
SET fecha_nacimiento = TO_DATE('01/01/2012','DD/MM/YYYY') WHERE fecha_nacimiento IS NULL;

--12
ALTER TABLE ALUMNOS DROP COLUMN sexo;

--13

UPDATE PROFESOR
SET gana = gana + (gana*0.20) WHERE titulo = 'Ing. Informatica';

--14
UPDATE PROFESOR
SET dni = 1234567 WHERE dni = 32432456;
--15
UPDATE PROFESORES
SET dni = 7654321 WHERE dni=%;

--16
--Como hemos borrado la columna sexo, la deberíamos crear y añadir esta informacion al campo
ALTER TABLE ALUMNOS ADD (sexo VARCHAR2(1));
UPDATE ALUMNOS 
SET sexo ='F' WHERE nombre='Maria';

SELECT * FROM ALUMNOS;

CREATE TABLE PROFESORBACKIUP
(
nombre VARCHAR2(25),
apellido1 VARCHAR2(50),
apellido2 VARCHAR2(50),
dni VARCHAR2(10),
direccion VARCHAR2(40),
titulo VARCHAR2(30),
gana VARCHAR2(20),

CONSTRAINT PK_PROFESORBACKUP PRIMARY KEY (dni)
);
