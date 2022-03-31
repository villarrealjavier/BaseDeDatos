CREATE TABLE gama_producto
(gama VARCHAR2(50),
descripcion_texto VARCHAR2(250),
descripcion_html VARCHAR2(250),
imagen VARCHAR(256),
CONSTRAINT pk_producto PRIMARY KEY (gama)
);

CREATE TABLE producto
(codigo_producto VARCHAR2(15),
nombre VARCHAR(70),
gama VARCHAR(50),
dimensiones VARCHAR2(25),
proovedor VARCHAR2(50),
descripcion VARCHAR2(250),
cantidad_en_stock VARCHAR2(6),
precio_venta NUMBER(15,2),
precio_proovedor NUMBER (15,2),
CONSTRAINT pk_producto_unico PRIMARY KEY (codigo_producto),
CONSTRAINT fk_producto FOREIGN KEY (gama) REFERENCES gama_producto(gama)
);

CREATE TABLE oficina
(codigo_oficina VARCHAR2(10),
cuidad VARCHAR2(30),
pais VARCHAR2(50),
region VARCHAR2(50),
codigo_postal VARCHAR2(10),
telefono VARCHAR2(20),
linea_direccion1 VARCHAR2(50),
linea_direccion2 VARCHAR2(50),
CONSTRAINT pk_oficina PRIMARY KEY (codigo_oficina)
);

CREATE TABLE empleado
(nombre VARCHAR2(50),
codigo_empleado NUMBER(11),
apellido1 VARCHAR2(50),
apellido2 VARCHAR2(50),
extension VARCHAR2(10),
codigo_oficina VARCHAR2(10),
codigo_jefe NUMBER(11),
puesto VARCHAR2(50),
CONSTRAINT pk_empleado PRIMARY KEY (codigo_empleado),
CONSTRAINT fk_empleado FOREIGN KEY (codigo_oficina) REFERENCES oficina(codigo_oficina),
CONSTRAINT fk_empleado_refle FOREIGN KEY (codigo_jefe) REFERENCES empleado(codigo_empleado) 
);

CREATE TABLE cliente
(codigo_cliente NUMBER(11),
nombre_cliente VARCHAR2(50),
nombre_contacto VARcHAR2(30),
apellido_contacto VARCHAR2(30),
telefono VARCHAR2(15),
fax VARCHAR2(15),
linea_direccion1 VARCHAR2(50),
linea_direccion2 VARCHAR2(50),
cuidad VARCHAR2(50),
region VARCHAR2(50),
pais VARCHAR2(50),
codigo_postal VARCHAR2(10),
codigo_empleado_rep_ventas NUMBER(11),
limite_credito NUMBER(15,2),
CONSTRAINT pk_cliente PRIMARY KEY (codigo_cliente),
CONSTRAINT fk_cliente FOREIGN KEY (codigo_empleado_rep_ventas) REFERENCES empleado(codigo_empleado)
);

CREATE TABLE pago
(codigo_cliente NUMBER(11),
forma_pago VARCHAR2(40),
id_transaccion VARCHAR2(50),
fecha_pago DATE,
total NUMBER(15,2),
CONSTRAINT pk_pago PRIMARY KEY (id_transaccion),
CONSTRAINT fk_pago FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente)
);

CREATE TABLE pedido
(codigo_pedido NUMBER(11),
fecha_pedido DATE,
fecha_esperada DATE,
fecha_entrega DATE,
estado VARCHAR2(15),
comentarios VARCHAR2(250),
codigo_cliente NUMBER(11),
CONSTRAINT pk_pedido1 PRIMARY KEY (codigo_pedido),
CONSTRAINT fk_pedido1 FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente),
);

CREATE TABLE detalle_pedido
(codigo_producto VARCHAR2(15),
codigo_pedido NUMBER(11),
cantidad NUMBER(11),
precio_unidad NUMBER(15,2),
numero_linea NUMBER(6),
CONSTRAINT pk_pedido_detalle PRIMARY KEY (codigo_pedido),
CONSTRAINT pk_producto_detalle PRIMARY KEY (codigo_producto),
CONSTRAINT fk_detalle1 FOREIGN KEY (codigo_producto) REFERENCES producto(codigo_producto),
CONSTRAINT fk_detalle2 FOREIGN KEY (codigo_pedido) REFERENCES pedido(codigo_pedido)
);