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
(nombre_curso VARCHAR2(20),
cod_curso NUMBER(3),
dni_profesor VARCHAR2(10),
maximo_alumno NUMBER(5),
fecha_inicio DATE,
fecha_fin DATE,
num_horas NUMBER(5),

CONSTRAINT PK_CURSOS PRIMARY KEY (cod_curso),
CONSTRAINT FK_CURSOS FOREIGN KEY (dni_profesor) REFERENCES PROFESOR(dni)
);

CREATE TABLE ALUMNO
(
nombre VARCHAR2(25),
apellido1 VARCHAR2(50),
apellido2 VARCHAR2(50),
dni VARCHAR2(10),
sexo VARCHAR2(1),
fecha_nacimiento DATE,
curso NUMBER(2),

CONSTRAINT PK_ALUMNO PRIMARY KEY (dni),
CONSTRAINT FK_ALUMNO FOREIGN KEY (curso) REFERENCES CURSOS(cod_curso)
);


ALTER TABLE ALUMNO ADD CONSTRAINT CHK1_ALUMNO CHECK (sexo IN ('H','M'));
INSERT INTO PROFESOR(nombre,apellido1,apellido2,dni,direccion,titulo,gana) VALUES ('Juan','Arch','Lopez',32432455,'Puerta Negra, 4','Ing.Informatica',7500);
INSERT INTO PROFESOR(nombre,apellido1,apellido2,dni,direccion,titulo,gana) VALUES ('Maria','Olivia','Rubio',43215643,'Juan Alfonso 32',' Lda. Fil. Inglesa ',5400);
SELECT * FROM PROFESOR;

INSERT INTO CURSOS(nombre_curso,cod_curso,dni_profesor,maximo_alumno,fecha_inicio,fecha_fin,num_horas) VALUES ('Inglés Básico',1,43215643,15,to_date('01/11/00','DD/MM/YY'),to_date('22-DIC-00','DD-MONTH-YY'),120);







