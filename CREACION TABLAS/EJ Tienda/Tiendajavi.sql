CREATE TABLE fabricantes 
(cod_fabricante NUMBER(3),
Nombre VARCHAR2(15),
Pais VARCHAR2(15),

CONSTRAINT pk_fabricantes PRIMARY KEY (Cod_fabricante),
CONSTRAINT chk_fabricantes CHECK (Nombre = UPPER(NOMBRE)),
CONSTRAINT chk_fabricantes2 CHECK (Pais = UPPER(PAIS))
);

CREATE TABLE tienda
(Nif VARCHAR2(10) NOT NULL,
Nombre VARCHAR2(20),
Direccion VARCHAR2(20),
Poblacion VARCHAR2(20),
provincia VARCHAR2(20),
codpostal NUMBER(5),

CONSTRAINT pk_tienda PRIMARY KEY (Nif),
CONSTRAINT chk_tienda CHECK (Provincia = UPPER(PROVINCIA))
);

CREATE TABLE articulos
(articulo VARCHAR2(20) NOT NULL,
cod_fabricante NUMBER(3) NOT NULL,
Peso NUMBER(3) NOT NULL,
Categoria VARCHAR2(10) NOT NULL,
Precio_venta NUMBER(4,2),
Precio_costo NUMBER(4,2),
Existencias NUMBER(5),

CONSTRAINT pk_articulos PRIMARY KEY (articulo,Cod_fabricante,Peso,Categoria),
CONSTRAINT fk_articulos FOREIGN KEY (Cod_fabricante) REFERENCES fabricantes(Cod_fabricante),
CONSTRAINT chk_articulos CHECK (Precio_venta>0),
CONSTRAINT chk_articulos2 CHECK (Precio_costo>0),
CONSTRAINT chk_articulos3 CHECK (Peso>0),
CONSTRAINT chk4_articulos CHECK (Categoria IN ('PRIMERA', 'SEGUNDA','TERCERA'))
--CONSTRAINT chk_articulos4 CHECK (regexp_like(Categoria, '[A-Z]{3}[a-z]{7]')),
--CONSTRAINT chk_artiuclos5 CHECK (Categoria=UPPER(CATEGORIA))

);



CREATE TABLE pedidos
(Nif VARCHAR2(10),
articulo VARCHAR2(20) NOT NULL,
cod_fabricante NUMBER(3) NOT NULL,
Peso NUMBER(3) NOT NULL,
Categoria VARCHAR2(10) NOT NULL,
Fecha_pedido DATE NOT NULL,
Unidade_pedidos NUMBER(4),

CONSTRAINT pk_pedidos01 PRIMARY KEY (Nif, articulo, cod_fabricante, Peso, Categoria, Fecha_pedido),
CONSTRAINT fk_pedidos01 FOREIGN KEY (cod_fabricante) REFERENCES fabricantes(cod_fabricante) ON DELETE CASCADE,
CONSTRAINT fk_pedidos2 FOREIGN KEY (articulo, cod_fabricante, Peso, Categoria) REFERENCES articulos (articulo, cod_Fabricante, Peso, Categoria) ON DELETE CASCADE,
CONSTRAINT fk_pedidos3 FOREIGN KEY (Nif) REFERENCES tienda(Nif),
CONSTRAINT chk_pedidos2 CHECK (Unidade_pedidos>0)
);

CREATE TABLE Ventas
(Nif VARCHAR2(10) NOT NULL,
articulo VARCHAR2(20) NOT NULL,
cod_fabricante NUMBER(3) NOT NULL,
Peso NUMBER(3) NOT NULL,
Categoria VARCHAR2(10) NOT NULL,
Fecha_venta DATE DEFAULT SYSDATE NOT NULL,
Unidade_vendidas NUMBER(4),

CONSTRAINT pk_ventas PRIMARY KEY (Nif,articulo,cod_fabricante,Peso,Categoria,Fecha_venta),
CONSTRAINT fk_venta FOREIGN KEY (cod_fabricante) REFERENCES fabricantes(cod_fabricante),
CONSTRAINT chk_venta CHECK (Unidade_vendidas>0),
CONSTRAINT fk_ventas2 FOREIGN KEY (articulo, cod_fabricante, Peso, Categoria) REFERENCES articulos (articulo, cod_Fabricante, Peso, Categoria) ON DELETE CASCADE,
CONSTRAINT fk_ventas3 FOREIGN KEY (Nif) REFERENCES tienda(Nif)
);

ALTER TABLE pedidos MODIFY Unidade_pedidos NUMBER(6);
ALTER TABLE Ventas MODIFY Unidade_vendidas NUMBER(6);
ALTER TABLE pedidos ADD PVP NUMBER(10);
ALTER TABLE Ventas ADD PVP NUMBER(10);
ALTER TABLE fabricantes DROP (Pais);
ALTER TABLE Ventas ADD CONSTRAINT chk_u CHECK (Unidade_vendidas >= 100);
ALTER TABLE Ventas DROP CONSTRAINT chk_u;
DROP TABLE articulos CASCADE CONSTRAINT;
DROP TABLE pedidos CASCADE CONSTRAINT;
DROP TABLE fabricantes CASCADE CONSTRAINT;
DROP TABLE Ventas CASCADE CONSTRAINT;
DROP TABLE tienda CASCADE CONSTRAINT;

