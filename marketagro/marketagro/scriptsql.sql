--CREAR USUARIO EN USUARIO SYSTEM DE SQL DEVELOPER

CREATE USER C##AGRO IDENTIFIED BY 1234
DEFAULT TABLESPACE USERS
QUOTA UNLIMITED ON USERS;

GRANT CONNECT, RESOURCE TO C##AGRO;

--INSERTAR TABLAS A CONTINUACIÓN EN EL USUARIO C##AGRO

CREATE TABLE categoria (
    id_cate     NUMBER(5) NOT NULL,
    name        VARCHAR2(150) NOT NULL

);

ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY (id_cate);

CREATE TABLE proveedor (
    rut         NUMBER(9) NOT NULL,
    nombre      VARCHAR2(150) NOT NULL,
    apellido    VARCHAR2(150) NOT NULL,
    apellido_m  VARCHAR2(150) NOT NULL,
    nombre_tienda VARCHAR2(50) NOT NULL,
    direccion   VARCHAR2(150) NOT NULL,
    username    VARCHAR2(30) NOT NULL,
    contraseña  VARCHAR2(20) NOT NULL,
    correo      VARCHAR2(100) NOT NULL
);

ALTER TABLE proveedor ADD CONSTRAINT proveedor_pk PRIMARY KEY (rut);

CREATE TABLE tipo_producto(
    id_tipo     NUMBER(5) NOT NULL,
    nom_tipo    VARCHAR2(150) NOT NULL
);

ALTER TABLE tipo_producto ADD CONSTRAINT tipo_producto_pk PRIMARY KEY (id_tipo);

CREATE TABLE producto(
    id_prod     NUMBER(10) NOT NULL,
    nom_prod    VARCHAR2(150) NOT NULL,
    precio      NUMBER(8) NOT NULL,
    categoria_id_cate NUMBER(5) NOT NULL,
    tipo_producto_id_tipo NUMBER(5) NOT NULL,
    proveedor_rut   NUMBER(9) NOT NULL,
    imagen      BLOB
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY (id_prod);

CREATE TABLE region(
    id_region   NUMBER(5) NOT NULL,
    region      VARCHAR2(150) NOT NULL
);

ALTER TABLE region ADD CONSTRAINT region_pk PRIMARY KEY (id_region);

CREATE TABLE comuna(
    id_comu     NUMBER(5) NOT NULL,
    comuna      VARCHAR2(150) NOT NULL,
    region_id_region NUMBER(5) NOT NULL
);

ALTER TABLE comuna ADD CONSTRAINT comuna_pk PRIMARY KEY (id_comu);

CREATE TABLE usuario(
    rut     NUMBER(9) NOT NULL,
    nombre      VARCHAR2(150) NOT NULL,
    apellido    VARCHAR2(150) NOT NULL,
    apellido_m  VARCHAR2(150) NOT NULL,
    direccion   VARCHAR2(200) NOT NULL,
    region_id_region NUMBER(5) NOT NULL,
    comuna_id_comu  NUMBER(5) NOT NULL,
    username    VARCHAR2(30) NOT NULL,
    contraseña  NUMBER(20) NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY (rut);

CREATE TABLE carro(
    id_carro    NUMBER(20) NOT NULL,
    producto_id_prod NUMBER(10) NOT NULL,
    usuario_rut NUMBER(9) NOT NULL,
    total       NUMBER(20) NOT NULL
);

ALTER TABLE carro ADD CONSTRAINT carro_pk PRIMARY KEY (id_carro);

ALTER TABLE producto
    ADD CONSTRAINT producto_categoria_fk FOREIGN KEY (categoria_id_cate)
        REFERENCES categoria (id_cate);

ALTER TABLE producto
    ADD CONSTRAINT producto_tipo_producto_fk FOREIGN KEY (tipo_producto_id_tipo)
        REFERENCES tipo_producto (id_tipo);

ALTER TABLE producto
    ADD CONSTRAINT producto_proveedor_fk FOREIGN KEY (proveedor_rut)
        REFERENCES proveedor (rut);

ALTER TABLE comuna
    ADD CONSTRAINT comuna_region_fk FOREIGN KEY (region_id_region)
        REFERENCES region (id_region);

ALTER TABLE usuario
    ADD CONSTRAINT usuario_region_fk FOREIGN KEY (region_id_region)
        REFERENCES region (id_region);

ALTER TABLE usuario 
    ADD CONSTRAINT usuario_comuna_fk FOREIGN KEY (comuna_id_comu)
        REFERENCES comuna (id_comu);

ALTER TABLE carro
    ADD CONSTRAINT carro_producto_fk FOREIGN KEY (producto_id_prod)
        REFERENCES producto (id_prod);

ALTER TABLE carro
    ADD CONSTRAINT carro_usuario_fk FOREIGN KEY (usuario_rut)
        REFERENCES usuario (rut);

COMMIT;

--INSERTAR PROCEDIMIENTOS ALMACENADOS PARA LAS FUNCIONES