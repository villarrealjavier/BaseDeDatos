CREATE TABLE CABALLOS
(codcaballo VARCHAR2(4),
nombre VARCHAR2(20) NOT NULL,
peso NUMBER(3),
fecha_nacimiento DATE,
propietario VARCHAR2(25),
nacionalidad VARCHAR2(20),

CONSTRAINT PK_CABALLOS PRIMARY KEY (codcaballo),
CONSTRAINT CHK1_CABALLO CHECK (peso BETWEEN '240' AND '300'),
CONSTRAINT CHK2_CABALLO CHECK  (EXTRACT(YEAR FROM fecha_nacimiento)>2000),
CONSTRAINT CHK3_CABALLO CHECK (nacionalidad=UPPER(nacionalidad))
);



CREATE TABLE CARRERAS 
(codcarrera VARCHAR2(4),
fecha_hora DATE,
importe_premio NUMBER(6),
apuesta_limite NUMBER(7,2),

CONSTRAINT PK_CARRERAS PRIMARY KEY (codcarrera)
);

CREATE TABLE PARTICIPACIONES
(codcaballo VARCHAR2(4),
codcarrera VARCHAR2(4),
dorsal NUMBER(2) NOT NULL,
jockey VARCHAR2(10) NOT NULL,
posicionfinal NUMBER(2),

CONSTRAINT PK_PARTICIPACIONES PRIMARY KEY (codcaballo,codcarrera),
CONSTRAINT FK_PARTICIPACIONES FOREIGN KEY (codcaballo) REFERENCES CABALLOS(codcaballo),
CONSTRAINT FK2_PARTICIPACIONES FOREIGN KEY (codcarrera) REFERENCES CARRERAS(codcarrera),
CONSTRAINT CHK1_PARTICIPACIONES CHECK (posicionfinal>0) 
);


CREATE TABLE CLIENTE 
(dni VARCHAR2(10),
nombre VARCHAR2(20),
nacionalidad VARCHAR2(20),

CONSTRAINT PK_CLIENTE PRIMARY KEY (dni),
CONSTRAINT CHK1_CLIENTE CHECK (regexp_like(dni, '^[1-9]{8}[A-Z]{1}')),
CONSTRAINT CHK2_CLIENTE CHECK (nacionalidad=UPPER(nacionalidad))
);

CREATE TABLE APUESTAS 
(dnicliente VARCHAR2(10),
codcaballo VARCHAR2(4),
codcarrera VARCHAR2(4),
importe NUMBER(6),
tantoporuno NUMBER(6,2),

CONSTRAINT PK_APUESTAS PRIMARY KEY (dnicliente,codcaballo,codcarrera),
CONSTRAINT FK_APUESTAS1 FOREIGN KEY (dnicliente) REFERENCES CLIENTE(dni) ON DELETE CASCADE,
CONSTRAINT FK_APUESTAS2 FOREIGN KEY (codcaballo) REFERENCES CABALLOS(codcaballo) ON DELETE CASCADE,
CONSTRAINT FK_APUESTAS3 FOREIGN KEY (codcarrera) REFERENCES CARRERAS(codcarrera) ON DELETE CASCADE
);

INSERT INTO CLIENTE(dni,nombre,nacionalidad) VALUES ('12345678N','PACO','ESCOCES');




