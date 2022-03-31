CREATE TABLE Tema
(cod_tema NUMBER(10),
denominacion VARCHAR2(10),
cod_tema_padre NUMBER(12),
CONSTRAINT PK_TEMA PRIMARY KEY (cod_tema),
CONSTRAINT FK_TEMA FOREIGN KEY (cod_tema_padre) REFERENCES Tema (cod_tema), 
CONSTRAINT restric_Tema CHECK (cod_tema<=cod_tema_padre)

);

CREATE TABLE Autor
(cod_autor VARCHAR2(10),
nombre VARCHAR(20) NOT NULL,
f_nacimiento VARCHAR2(10),
libro_principal VARCHAR2(10),
CONSTRAINT PK_AUTOR PRIMARY KEY (cod_autor)
);


CREATE TABLE Libro
(cod_libro VARCHAR2(10),
titulo VARCHAR2(10) NOT NULL,
f_creacion DATE,
cod_autor VARCHAR2(10) NOT NULL,
autor_principal VARCHAR2(10) NOT NULL,
CONSTRAINT PK_LIBRO PRIMARY KEY (cod_libro),
CONSTRAINT FK_AUTOR FOREIGN KEY (cod_autor) REFERENCES Autor (cod_autor)
);
ALTER TABLE Autor ADD CONSTRAINT FK_Anadida FOREIGN KEY (libro_principal) REFERENCES Libro (cod_libro)

CREATE TABLE Libro_Autor
(cod_libro VARCHAR2(10),
cod_autor VARCHAR2(10),
orden VARCHAR2(20),
CONSTRAINT PK_LIBRO_AUTOR PRIMARY KEY (cod_libro,cod_autor),
CONSTRAINT FK_Libro FOREIGN KEY (cod_libro) REFERENCES Libro (cod_libro),
CONSTRAINT FK_autor_2 FOREIGN KEY (cod_autor) REFERENCES Autor (cod_autor),
CONSTRAINT retris_orden CHECK (orden >= 1 AND orden <= 5),
CONSTRAINT retris_orden2 CHECK (5>=orden)
);

CREATE TABLE Editorial
(cod_editorial VARCHAR2(10),
denominacion VARCHAR(20),
CONSTRAINT PK_Editorial PRIMARY KEY (cod_editorial)

);

CREATE TABLE Publicaciones
(cod_editorial VARCHAR2(10),
cod_libro VARCHAR2(10),
precio NUMBER(5,2) NOT NULL,--Se pone el dos indicando que podemos tener dos decimales
f_publicacion DATE,
CONSTRAINT PK_Publicaciones PRIMARY KEY (cod_editorial,cod_libro),
CONSTRAINT FK_libro_publicaciones FOREIGN KEY (cod_libro) REFERENCES Libro (cod_libro),
CONSTRAINT FK_editorial_publicaciones FOREIGN KEY (cod_editorial) REFERENCES Editorial (cod_editorial) ON DELETE CASCADE,
CONSTRAINT restr_precio CHECK (precio > 0)
);
--SELECT SYSDATE FROM DUAL; (Para obtener la fecha del sistema del dia de hoy)
-- SELECT EXTRACT(YEAR FROM SYSDATE) FROM DUAL (Para obtener el ano solamente de la fecha del sistema)
