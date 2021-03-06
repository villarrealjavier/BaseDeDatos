CREATE TABLE PROFESOR
(dni VARCHAR2(9),
nombre VARCHAR2(20) UNIQUE NOT NULL,
sueldo NUMBER(4) NOT NULL,
titulacion VARCHAR2(30),
direccion VARCHAR2(40),

CONSTRAINT pk_PROFESOR PRIMARY KEY (dni)
);

 CREATE TABLE CURSO
 (cod_Id VARCHAR2(3),
 fecha_finalizacion DATE NOT NULL,
 nombre VARCHAR2(20) UNIQUE NOT NULL,
 fecha_inicio DATE NOT NULL,
 n_maximo NUMBER(3) NOT NULL,
 n_curso NUMBER(3),
 dni VARCHAR2(9),
 
 CONSTRAINT pk_CURSO PRIMARY KEY (cod_Id),
 CONSTRAINT fk_CURSO FOREIGN KEY (dni) REFERENCES PROFESOR(dni)
 );
 
CREATE TABLE ALUMNO 
(dni VARCHAR2(9),
nombre VARCHAR2(20) UNIQUE,
apellidos VARCHAR2(40),
direccion VARCHAR2(40),
fecha_nacimiento DATE,
sexo VARCHAR(1),
cod_Id VARCHAR2(3),

CONSTRAINT pk_ALUMNO PRIMARY KEY (dni),
CONSTRAINT fk_ALUMNO FOREIGN KEY (cod_Id) REFERENCES CURSO(cod_Id),
CONSTRAINT chk_alumno CHECK (regexp_like(sexo, '[H|M]{1}'))
);

ALTER TABLE CURSO ADD CONSTRAINT chk_curso CHECK (fecha_finalizacion>fecha_inicio); 

