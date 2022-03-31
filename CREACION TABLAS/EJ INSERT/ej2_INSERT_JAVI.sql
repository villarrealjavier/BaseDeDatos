CREATE TABLE DEPARTAMENTO
(codigo NUMBER(10),
nombre VARCHAR2(100),
presupuesto NUMBER(8,2),

CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY (codigo)
);

CREATE TABLE EMPLEADO
(codigo NUMBER(10),
nif VARCHAR2(9),
nombre VARCHAR2(100),
apellido1 VARCHAR2(100),
apellido2 VARCHAR2(100),
codigo_departamento NUMBER(10),

CONSTRAINT PK_EMPLEADO PRIMARY KEY (codigo),
CONSTRAINT FK_EMPLEADO FOREIGN KEY (codigo_departamento) REFERENCES DEPARTAMENTO(codigo)
);


ALTER TABLE DEPARTAMENTO ADD (gasto NUMBER(6));

INSERT INTO DEPARTAMENTO (codigo,nombre,presupuesto,gasto) VALUES (1,'Desarrollo',120000.00,6000);
INSERT INTO DEPARTAMENTO (codigo,nombre,presupuesto,gasto) VALUES (2,'Sistemas',150000.00,21000);
INSERT INTO DEPARTAMENTO (codigo,nombre,presupuesto,gasto) VALUES (3,'Recursos Humanos',280000.00,25000);
INSERT INTO DEPARTAMENTO (codigo,nombre,presupuesto,gasto) VALUES (4,'Contabilidad',110000.00,3000);
INSERT INTO DEPARTAMENTO (codigo,nombre,presupuesto,gasto) VALUES (5,'I+D',375000.00,3000);
INSERT INTO DEPARTAMENTO (codigo,nombre,presupuesto,gasto) VALUES (6,'Proyecto',000000.00,000000);
INSERT INTO DEPARTAMENTO (codigo,nombre,presupuesto,gasto) VALUES (7,'Publicidad',000000.00,1000);
SELECT * FROM DEPARTAMENTO;

INSERT INTO EMPLEADO (codigo,nif,nombre,apellido1,apellido2,codigo_departamento) VALUES (1,'32481596F','Aaron','Rivero','Gomez',1);
INSERT INTO EMPLEADO (codigo,nif,nombre,apellido1,apellido2,codigo_departamento) VALUES (2,'Y5575632D','Adela','Salas','Diaz',2);
INSERT INTO EMPLEADO (codigo,nif,nombre,apellido1,apellido2,codigo_departamento) VALUES (3,'R6970642B','Adolfo','Rubio','Flores',3);
INSERT INTO EMPLEADO (codigo,nif,nombre,apellido1,apellido2,codigo_departamento) VALUES (4,'77705545E','Adrian','Suarez',NULL,4);
INSERT INTO EMPLEADO (codigo,nif,nombre,apellido1,apellido2,codigo_departamento) VALUES (5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO EMPLEADO (codigo,nif,nombre,apellido1,apellido2,codigo_departamento) VALUES (6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO EMPLEADO (codigo,nif,nombre,apellido1,apellido2,codigo_departamento) VALUES (7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO EMPLEADO (codigo,nif,nombre,apellido1,apellido2,codigo_departamento) VALUES (8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO EMPLEADO (codigo,nif,nombre,apellido1,apellido2,codigo_departamento) VALUES (9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO EMPLEADO (codigo,nif,nombre,apellido1,apellido2,codigo_departamento) VALUES (10,'46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO EMPLEADO (codigo,nif,nombre,apellido1,apellido2,codigo_departamento) VALUES (11,'67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO EMPLEADO (codigo,nif,nombre,apellido1,apellido2,codigo_departamento) VALUES (12,'41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO EMPLEADO (codigo,nif,nombre,apellido1,apellido2,codigo_departamento) VALUES (13,'82635162B', 'Juan Antonio','Sáez', 'Guerrero', NULL);

--1
INSERT INTO DEPARTAMENTO (codigo,nombre,presupuesto) VALUES (8,'Arte',120000.00);
--2
--INSERT INTO DEPARTAMENTO (nombre,presupuesto) VALUES ('Mitologia',120000.00); Sería de esta forma pero no se puede porque el codigo al ser clave primaria hay que indicarlo
--Debido a que es lo que lo identifica de forma unica

--3
INSERT INTO DEPARTAMENTO (codigo,nombre,presupuesto,gasto) VALUES (9,'Alimento',000000.00,1000);

--4
INSERT INTO EMPLEADO (codigo,nif,nombre,apellido1,apellido2,codigo_departamento) VALUES (14, '71651490G', 'Javier', 'Gomez', 'Santana', 3);

--5
--INSERT INTO EMPLEADO (nif,nombre,apellido1,apellido2,codigo_departamento) VALUES ('71666631Z', 'Pepe', 'Villa', 'Hino', 3);
-- Sería de esta forma pero no se puede porque el codigo al ser clave primaria hay que indicarlo
--Debido a que es lo que lo identifica de forma unica

--6
CREATE TABLE DEPARTAMENTO_BACKUP
(codigo NUMBER(10),
nombre VARCHAR2(100),
presupuesto NUMBER(8,2),

CONSTRAINT PK_DEPARTAMENTO_BACKUP PRIMARY KEY (codigo)
);

ALTER TABLE DEPARTAMENTO_BACKUP ADD (gasto NUMBER(6));
INSERT INTO DEPARTAMENTO_BACKUP (codigo,nombre,presupuesto,gasto) VALUES (1,'Desarrollo',120000.00,6000);
INSERT INTO DEPARTAMENTO_BACKUP (codigo,nombre,presupuesto,gasto) VALUES (2,'Sistemas',150000.00,21000);
INSERT INTO DEPARTAMENTO_BACKUP (codigo,nombre,presupuesto,gasto) VALUES (3,'Recursos Humanos',280000.00,25000);
INSERT INTO DEPARTAMENTO_BACKUP (codigo,nombre,presupuesto,gasto) VALUES (4,'Contabilidad',110000.00,3000);
INSERT INTO DEPARTAMENTO_BACKUP (codigo,nombre,presupuesto,gasto) VALUES (5,'I+D',375000.00,3000);
INSERT INTO DEPARTAMENTO_BACKUP (codigo,nombre,presupuesto,gasto) VALUES (6,'Proyecto',000000.00,000000);
INSERT INTO DEPARTAMENTO_BACKUP (codigo,nombre,presupuesto,gasto) VALUES (7,'Publicidad',000000.00,1000);
INSERT INTO DEPARTAMENTO_BACKUP (codigo,nombre,presupuesto) VALUES (8,'Arte',120000.00);
SELECT * FROM DEPARTAMENTO_BACKUP;

--7
SELECT * FROM DEPARTAMENTO
WHERE nombre='Proyecto';

DELETE FROM DEPARTAMENTO 
WHERE nombre ='Proyecto';
SELECT * FROM DEPARTAMENTO;

--8
ALTER TABLE EMPLEADO DROP CONSTRAINT FK_EMPLEADO;
ALTER TABLE EMPLEADO ADD CONSTRAINT FK_EMPLEADO FOREIGN KEY (codigo_departamento) REFERENCES DEPARTAMENTO(codigo) ON DELETE CASCADE;
SELECT * FROM EMPLEADO
WHERE nombre='Desarrollo';

DELETE FROM DEPARTAMENTO
WHERE nombre='Desarrollo';
-- No deja pero se haría de la siguiente forma en caso de que lo queramos borrar.

--9
INSERT INTO DEPARTAMENTO (codigo,nombre,presupuesto,gasto) VALUES (30,'Recursos Humanos',280000.00,25000);
DELETE FROM DEPARTAMENTO WHERE codigo=3;
SELECT * FROM DEPARTAMENTO;

/*INSERT INTO DEPARTAMENTO (nombre,presupuesto) VALUES ()*/

--10
UPDATE DEPARTAMENTO SET codigo=40 WHERE nombre='Publicidad';

--11
SELECT * FROM DEPARTAMENTO WHERE presupuesto<20000;
UPDATE DEPARTAMENTO SET presupuesto=presupuesto+50000 WHERE presupuesto<20000;

--12
SELECT * FROM EMPLEADO WHERE codigo_departamento IS NULL;
DELETE FROM EMPLEADO WHERE codigo_departamento IS NULL;


