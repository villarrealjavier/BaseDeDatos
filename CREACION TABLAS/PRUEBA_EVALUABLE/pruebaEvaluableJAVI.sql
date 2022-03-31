CREATE TABLE EMPRESA
(codigo NUMBER(10),
nombre VARCHAR2(100),
presupuesto NUMBER(8,2),

CONSTRAINT PK_EMPRESA PRIMARY KEY (codigo)
);

INSERT INTO EMPRESA (codigo,nombre,presupuesto) VALUES (1,'Desarrollo',120000.00);
INSERT INTO EMPRESA (codigo,nombre,presupuesto) VALUES (2,'Sistemas',150000.00);
INSERT INTO EMPRESA (codigo,nombre,presupuesto) VALUES (3,'Recursos Humanos',280000.00);
INSERT INTO EMPRESA (codigo,nombre,presupuesto) VALUES (4,'Contabilidad',110000.00);
INSERT INTO EMPRESA (codigo,nombre,presupuesto) VALUES (5,'I+D',375000.00);
INSERT INTO EMPRESA (codigo,nombre,presupuesto) VALUES (6,'Proyecto',000000.00);
INSERT INTO EMPRESA (codigo,nombre,presupuesto) VALUES (7,'Publicidad',000000.00);
SELECT * FROM EMPRESA;

CREATE TABLE EMPRESA_BACKUP
(codigo NUMBER(10),
nombre VARCHAR2(100),
presupuesto NUMBER(8,2),

CONSTRAINT PK_DEPARTAMENTO_BACKUP PRIMARY KEY (codigo)
);

INSERT INTO EMPRESA_BACKUP
SELECT * FROM EMPRESA;
SELECT * FROM EMPRESA_BACKUP;
