CREATE TABLE gama_producto
(gama VARCHAR(50),
descripcion_texto TEXT,
descripcion_html TEXT,
imagen VARCHAR(256),
CONSTRAINT pk_producto PRIMARY KEY (gama)
);

CREATE TABLE producto
(codigo_producto VARCHAR(15),
nombre VARCHAR(70),
gama VARCHAR(50),
dimensiones VARCHAR(25),
proovedor VARCHAR(50),
descripcion TEXT,
cantidad_en_stock SMALLINT(6),
precio_venta DECIMAL(15,2),
precio_proovedor DECIMAL(15,2),
CONSTRAINT pk_producto_unico PRIMARY KEY (codigo_producto),
CONSTRAINT fk_producto FOREIGN KEY (gama) REFERENCES gama_producto(gama)
);

CREATE TABLE oficina
(codigo_oficina VARCHAR(10),
cuidad VARCHAR(30),
pais VARCHAR(50),
region VARCHAR(50),
codigo_postal VARCHAR(10),
telefono VARCHAR(20),
linea_direccion1 VARCHAR(50),
linea_direccion2 VARCHAR(50),
CONSTRAINT pk_oficina PRIMARY KEY (codigo_oficina)
);

CREATE TABLE empleado
(nombre VARCHAR(50),
codigo_empleado INT(11),
apellido1 VARCHAR(50),
apellido2 VARCHAR(50),
extension VARCHAR(10),
codigo_oficina VARCHAR(10),
codigo_jefe INT(11),
puesto VARCHAR(50),
CONSTRAINT pk_empleado PRIMARY KEY (codigo_empleado),
CONSTRAINT fk_empleado FOREIGN KEY (codigo_oficina) REFERENCES oficina(codigo_oficina),
CONSTRAINT fk_empleado_refle FOREIGN KEY (codigo_jefe) REFERENCES empleado(codigo_empleado) 
);

CREATE TABLE cliente
(codigo_cliente INT(11),
nombre_cliente VARCHAR(50),
nombre_contacto VARcHAR(30),
apellido_contacto VARCHAR(30),
telefono VARCHAR(15),
fax VARCHAR(15),
linea_direccion1 VARCHAR(50),
linea_direccion2 VARCHAR(50),
cuidad VARCHAR(50),
region VARCHAR(50),
pais VARCHAR(50),
codigo_postal VARCHAR(10),
codigo_empleado_rep_ventas INT(11),
limite_credito DECIMAL(15,2),
CONSTRAINT pk_cliente PRIMARY KEY (codigo_cliente),
CONSTRAINT fk_cliente FOREIGN KEY (codigo_empleado_rep_ventas) REFERENCES empleado(codigo_empleado)
);

CREATE TABLE pago
(codigo_cliente INT(11),
forma_pago VARCHAR(40),
id_transaccion VARCHAR(50),
fecha_pago DATE,
total DECIMAL(15,2),
CONSTRAINT pk_pago PRIMARY KEY (id_transaccion),
CONSTRAINT fk_pago FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente)
);

CREATE TABLE pedido
(codigo_pedido INT(11),
fecha_pedido DATE,
fecha_esperada DATE,
fecha_entrega DATE,
estado VARCHAR(15),
comentarios TEXT,
codigo_cliente INT(11),
CONSTRAINT pk_pedido1 PRIMARY KEY (codigo_pedido),
CONSTRAINT fk_pedido1 FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente),
);

CREATE TABLE detalle_pedido
(codigo_producto VARCHAR(15),
codigo_pedido INT(11),
cantidad INT(11),
precio_unidad DECIMAL(15,2),
numero_linea SMALLINT(6),
CONSTRAINT pk_pedido_detalle PRIMARY KEY (codigo_pedido),
CONSTRAINT pk_producto_detalle PRIMARY KEY (codigo_producto),
CONSTRAINT fk_detalle1 FOREIGN KEY (codigo_producto) REFERENCES producto(codigo_producto),
CONSTRAINT fk_detalle2 FOREIGN KEY (codigo_pedido) REFERENCES pedido(codigo_pedido)
);
