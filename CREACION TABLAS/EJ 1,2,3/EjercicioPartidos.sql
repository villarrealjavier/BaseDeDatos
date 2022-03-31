CREATE TABLE Equipos
(CodEquipo VARCHAR2(4),
Nombre VARCHAR2(30) NOT NULL,
Localidad VARCHAR2(15),
CONSTRAINT PK_Equipos PRIMARY KEY (CodEquipo)
);
ALTER TABLE Equipos ADD GolesMarcados NUMBER(3);
ALTER TABLE Equipos ADD CONSTRAINT chk_equipo_num CHECK (regexp_like(CodEquipo, '^[0-9]{1}'));

CREATE TABLE Jugadores
(CodJugador VARCHAR2(4),
Nombre VARCHAR2(30),
Fecha_Nacimiento DATE,
Demarcacion VARCHAR2(10),
CodEquipo VARCHAR2(4),
CONSTRAINT pk_jugador PRIMARY KEY (CodJugador),
CONSTRAINT fk_jugador FOREIGN KEY (CodEquipo) REFERENCES Equipos(CodEquipo)
);
ALTER TABLE Jugadores ADD CONSTRAINT chk_demarcacion CHECK (Demarcacion IN ('Portero','Defensa','Medio','Delantero'));
ALTER TABLE Jugadores ADD CONSTRAINT chk_nombrejugador CHECK (Nombre = initcap(Nombre));

CREATE TABLE Partidos
(CodPartido VARCHAR2(4),
CodEquipoLocal VARCHAR(4),
CodEquipoVisitante VARCHAR2(4),
Fecha DATE,
Competicion VARCHAR2(4),
Jornada VARCHAR2(20),
CONSTRAINT pk_partidos PRIMARY KEY (CodPartido),
CONSTRAINT fk_local FOREIGN KEY (CodEquipoLocal) REFERENCES Equipos(CodEquipo),
CONSTRAINT fk_visitante FOREIGN KEY (CodEquipoVisitante) REFERENCES Equipos(CodEquipo),
CONSTRAINT chk_fcha CHECK (EXTRACT(MONTH FROM Fecha)!=7 OR EXTRACT(MONTH FROM Fecha)!=8),
CONSTRAINT chk_competicion CHECK (Competicion IN ('liga','copa'))
);
CREATE TABLE Incidencias
(Numincidencia VARCHAR2(6),
CodPartido VARCHAR2(4),
CodJugador VARCHAR(4),
Minuto NUMBER(2),
Tipo VARCHAR2(20) NOT NULL,
CONSTRAINT pk_incidencias PRIMARY KEY (Numincidencia),
CONSTRAINT fk_partido_in FOREIGN KEY (CodPartido) REFERENCES Partidos(CodPartido),
CONSTRAINT fk_jugador_in FOREIGN KEY (CodJugador) REFERENCES Jugadores(CodJugador),
CONSTRAINT chk_minuto CHECK (Minuto BETWEEN 1 AND 99)
);
ALTER TABLE Equipos ADD CONSTRAINT ck3_equipo CHECK (regexp_like(CodEquipo,'^[0-9]{1}'));
