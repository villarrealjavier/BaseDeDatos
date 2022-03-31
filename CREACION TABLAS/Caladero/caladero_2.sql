CREATE TABLE barcos
(matricula VARCHAR2 (7),
nombre VARCHAR2 (20),
clase VARCHAR2 (10),
armador VARCHAR2 (10),
capacidad NUMBER (20),
nacionalidad VARCHAR2 (20),

CONSTRAINT PK_barcos PRIMARY KEY (matricula),
CONSTRAINT chk_barcos CHECK (regexp_like(matricula, '[A-Z]{2}[-]{1}[0-9]{4}'))
);

INSERT INTO barcos (nacionalidad) VALUES ('español');

CREATE TABLE especie
(codigo VARCHAR2 (10),
nombre VARCHAR2 (20),
tipo VARCHAR2 (20),
cupoporbarco NUMBER (20),
caladero_principal VARCHAR2 (20),

CONSTRAINT PK_especie PRIMARY KEY (codigo)
);


INSERT INTO especie (nombre) VALUES ('loco');
ALTER TABLE especie ADD CONSTRAINT FK_especie FOREIGN KEY (caladero_principal) REFERENCES caladero (codigo) ON DELETE SET NULL;

CREATE TABLE caladero
(codigo VARCHAR2 (10),
nombre VARCHAR2 (20),
ubicacion VARCHAR2 (20),
especie_principal VARCHAR2 (20),


CONSTRAINT FK_caladero FOREIGN KEY (especie_principal) REFERENCES especie (codigo) ON DELETE SET NULL,
CONSTRAINT PK_caladero PRIMARY KEY (codigo),
CONSTRAINT chk_caladero CHECK (nombre = UPPER(NOMBRE)),
CONSTRAINT chk_caladero2 CHECK (ubicacion = UPPER(UBICACION))

);

ALTER TABLE caladero ADD nombre_cientifico VARCHAR2 (10);




CREATE TABLE lotes
(codigo VARCHAR2 (10),
matricula VARCHAR2 (7),
numkilos NUMBER (38),
precioporkilosalida NUMBER (38),
precioporkiloadjudicado NUMBER (38),
fechaventa DATE NOT NULL,
cod_especie VARCHAR2 (10),

CONSTRAINT PK_lotes PRIMARY KEY (codigo),
CONSTRAINT FK_lote FOREIGN KEY (matricula) REFERENCES barcos(matricula) ON DELETE CASCADE,
CONSTRAINT FK_lotesegunda FOREIGN KEY (cod_especie) REFERENCES especie(codigo) ON DELETE CASCADE,
CONSTRAINT chk_lote CHECK (precioporkiloadjudicado > precioporkilosalida),
CONSTRAINT chk_lotes2 CHECK ((numkilos >0) AND (precioporkiloadjudicado >0) AND (precioporkilosalida >0))

);

CREATE TABLE fechas_capturaspermitidas
(cod_especie VARCHAR2 (10),
cod_caladero VARCHAR (10),
fecha_inicial DATE,
fecha_final DATE,

CONSTRAINT PK_fechas_capturaspermitidas PRIMARY KEY (cod_especie),
CONSTRAINT FK_fechas_capturaspermitidas FOREIGN KEY (cod_especie) REFERENCES especie(codigo),
CONSTRAINT FK_fechas_capturaspermitidas2 FOREIGN KEY (cod_caladero) REFERENCES caladero(codigo),
CONSTRAINT CH_fechas_capturaspermitidas3 CHECK (TO_CHAR(fecha_inicial,'dd/mm') < '02/02' OR to_char(fecha_inicial, 'dd/mm') < '28/03'),
CONSTRAINT chk_fechas_capturaspermitidas4 CHECK (TO_CHAR(fecha_final,'dd/mm') < '02/02' OR to_char(fecha_final, 'dd/mm') < '28/03')
);

ALTER TABLE barcos DROP (armador);
ALTER TABLE barcos DROP COLUMN (armador);
DROP TABLE barcos CASCADE CONSTRAINT;
DROP TABLE especie CASCADE CONSTRAINT;
DROP TABLE caladero CASCADE CONSTRAINT;
DROP TABLE lotes CASCADE CONSTRAINT;
DROP TABLE fechas_capturaspermitidas CASCADE CONSTRAINT;
-- DROP --BORRA TODO
--TRUNCATE --BORRA PERO DEJA LA ESTRUCTURA SOLO QUITA EL CONTENIDO
--ALTER TABLE fechas_capturaspermitidas DISABLE o ENABLE CONSTRAINT (fecha_inicial)
