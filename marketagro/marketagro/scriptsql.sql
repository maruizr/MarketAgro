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

--INSERTAR FILAS 
INSERT INTO region VALUES (1,'Aisén del G. Carlos Ibáñez del Campo');
INSERT INTO region VALUES (2,'Antofagasta');
INSERT INTO region VALUES (3,'Arica y Parinacota');
INSERT INTO region VALUES (4,'Atacama');
INSERT INTO region VALUES (5,'Biobío');
INSERT INTO region VALUES (6,'Coquimbo');
INSERT INTO region VALUES (7,'La Araucanía');
INSERT INTO region VALUES (8,'Libertador General Bernardo OHiggins');
INSERT INTO region VALUES (9,'Los Lagos');
INSERT INTO region VALUES (10,'Los Ríos');
INSERT INTO region VALUES (11, 'Magallanes y de la Antártica Chilena');
INSERT INTO region VALUES (12,'Maule');
INSERT INTO region VALUES (13,'Metropolitana de Santiago');
INSERT INTO region VALUES (14,'Ñuble');
INSERT INTO region VALUES (15,'Tarapacá');
INSERT INTO region VALUES (16,'Valparaíso');

INSERT INTO comuna VALUES (1, 'San Nicolás', 14);
INSERT INTO comuna VALUES (2, 'San Fabián', 14);
INSERT INTO comuna VALUES (3, 'Ñiquén', 14);
INSERT INTO comuna VALUES (4, 'Coihueco', 14);
INSERT INTO comuna VALUES (5, 'San Carlos', 14);
INSERT INTO comuna VALUES (6, 'Treguaco', 14);
INSERT INTO comuna VALUES (7, 'Ránquil', 14);
INSERT INTO comuna VALUES (8, 'Portezuelo', 14);
INSERT INTO comuna VALUES (9, 'Ninhue', 14);
INSERT INTO comuna VALUES (10, 'Coelemu', 14);
INSERT INTO comuna VALUES (11, 'Cobquecura', 14);
INSERT INTO comuna VALUES (12, 'Quirihue', 14);
INSERT INTO comuna VALUES (13, 'Yungay', 14);
INSERT INTO comuna VALUES (14, 'San Ignacio', 14);
INSERT INTO comuna VALUES (15, 'Quillón', 14);
INSERT INTO comuna VALUES (16, 'Pinto', 14);
INSERT INTO comuna VALUES (17, 'Pemuco', 14);
INSERT INTO comuna VALUES (18, 'El Carmen', 14);
INSERT INTO comuna VALUES (19, 'Chillán Viejo', 14);
INSERT INTO comuna VALUES (20, 'Bulnes', 14);
INSERT INTO comuna VALUES (21, 'Chillán', 14);
INSERT INTO comuna VALUES (22, 'General Lagos', 3);
INSERT INTO comuna VALUES (23, 'Putre', 3);
INSERT INTO comuna VALUES (24, 'Camarones', 3);
INSERT INTO comuna VALUES (25, 'Arica', 3);
INSERT INTO comuna VALUES (26, 'Río Bueno', 10);
INSERT INTO comuna VALUES (27, 'Lago Ranco', 10);
INSERT INTO comuna VALUES (28, 'Futrono', 10);
INSERT INTO comuna VALUES (29, 'La Unión', 10);
INSERT INTO comuna VALUES (30, 'Panguipulli', 10);
INSERT INTO comuna VALUES (31, 'Paillaco', 10);
INSERT INTO comuna VALUES (32, 'Mariquina', 10);
INSERT INTO comuna VALUES (33, 'Máfil', 10);
INSERT INTO comuna VALUES (34, 'Los Lagos', 10);
INSERT INTO comuna VALUES (35, 'Lanco', 10);
INSERT INTO comuna VALUES (36, 'Corral', 10);
INSERT INTO comuna VALUES (37, 'Valdivia', 10);
INSERT INTO comuna VALUES (38, 'Peñaflor', 13);
INSERT INTO comuna VALUES (39, 'Padre Hurtado', 13);
INSERT INTO comuna VALUES (40, 'Isla de Maipo', 13);
INSERT INTO comuna VALUES (41, 'El Monte', 13);
INSERT INTO comuna VALUES (42, 'Talagante', 13);
INSERT INTO comuna VALUES (43, 'San Pedro', 13);
INSERT INTO comuna VALUES (44, 'María Pinto', 13);
INSERT INTO comuna VALUES (45, 'Curacaví', 13);
INSERT INTO comuna VALUES (46, 'Alhué', 13);
INSERT INTO comuna VALUES (47, 'Melipilla', 13);
INSERT INTO comuna VALUES (48, 'Paine', 13);
INSERT INTO comuna VALUES (49, 'Calera de Tango', 13);
INSERT INTO comuna VALUES (50, 'Buin', 13);
INSERT INTO comuna VALUES (51, 'San Bernardo', 13);
INSERT INTO comuna VALUES (52, 'Til Til', 13);
INSERT INTO comuna VALUES (53, 'Lampa', 13);
INSERT INTO comuna VALUES (54, 'Colina', 13);
INSERT INTO comuna VALUES (55, 'San José de Maipo', 13);
INSERT INTO comuna VALUES (56, 'Pirque', 13);
INSERT INTO comuna VALUES (57, 'Puente Alto', 13);
INSERT INTO comuna VALUES (58, 'Vitacura', 13);
INSERT INTO comuna VALUES (59, 'San Ramón', 13);
INSERT INTO comuna VALUES (60, 'San Miguel', 13);
INSERT INTO comuna VALUES (61, 'San Joaquín', 13);
INSERT INTO comuna VALUES (62, 'Renca', 13);
INSERT INTO comuna VALUES (63, 'Recoleta', 13);
INSERT INTO comuna VALUES (64, 'Quinta Normal', 13);
INSERT INTO comuna VALUES (65, 'Quilicura', 13);
INSERT INTO comuna VALUES (66, 'Pudahuel', 13);
INSERT INTO comuna VALUES (67, 'Providencia', 13);
INSERT INTO comuna VALUES (68, 'Peñalolén', 13);
INSERT INTO comuna VALUES (69, 'Pedro Aguirre Cerda', 13);
INSERT INTO comuna VALUES (70, 'Ñuñoa', 13);
INSERT INTO comuna VALUES (71, 'Maipú', 13);
INSERT INTO comuna VALUES (72, 'Macul', 13);
INSERT INTO comuna VALUES (73, 'Lo Prado', 13);
INSERT INTO comuna VALUES (74, 'Lo Espejo', 13);
INSERT INTO comuna VALUES (75, 'Lo Barnechea', 13);
INSERT INTO comuna VALUES (76, 'Las Condes', 13);
INSERT INTO comuna VALUES (77, 'La Reina', 13);
INSERT INTO comuna VALUES (78, 'La Pintana', 13);
INSERT INTO comuna VALUES (79, 'La Granja', 13);
INSERT INTO comuna VALUES (80, 'La Florida', 13);
INSERT INTO comuna VALUES (81, 'La Cisterna', 13);
INSERT INTO comuna VALUES (82, 'Independencia', 13);
INSERT INTO comuna VALUES (83, 'Huechuraba', 13);
INSERT INTO comuna VALUES (84, 'Estación Central', 13);
INSERT INTO comuna VALUES (85, 'El Bosque', 13);
INSERT INTO comuna VALUES (86, 'Conchalí', 13);
INSERT INTO comuna VALUES (87, 'Cerro Navia', 13);
INSERT INTO comuna VALUES (88, 'Cerrillos', 13);
INSERT INTO comuna VALUES (89, 'Santiago', 13);
INSERT INTO comuna VALUES (90, 'Torres del Paine', 11);
INSERT INTO comuna VALUES (91, 'Natales', 11);
INSERT INTO comuna VALUES (92, 'Timaukel', 11);
INSERT INTO comuna VALUES (93, 'Primavera', 11);
INSERT INTO comuna VALUES (94, 'Porvenir', 11);
INSERT INTO comuna VALUES (95, 'Antártica', 11);
INSERT INTO comuna VALUES (96, 'Cabo de Hornos', 11);
INSERT INTO comuna VALUES (97, 'San Gregorio', 11);
INSERT INTO comuna VALUES (98, 'Río Verde', 11);
INSERT INTO comuna VALUES (99, 'Laguna Blanca', 11);
INSERT INTO comuna VALUES (100, 'Punta Arenas', 11);
INSERT INTO comuna VALUES (101, 'Río Ibáñez', 1);
INSERT INTO comuna VALUES (102, 'Chile Chico', 1);
INSERT INTO comuna VALUES (103, 'Tortel', 1);
INSERT INTO comuna VALUES (104, 'OHiggins', 1);
INSERT INTO comuna VALUES (105, 'Cochrane', 1);
INSERT INTO comuna VALUES (106, 'Guaitecas', 1);
INSERT INTO comuna VALUES (107, 'Cisnes', 1);
INSERT INTO comuna VALUES (108, 'Aysén', 1);
INSERT INTO comuna VALUES (109, 'Lago Verde', 1);
INSERT INTO comuna VALUES (110, 'Coyhaique', 1);
INSERT INTO comuna VALUES (111, 'Palena', 9);
INSERT INTO comuna VALUES (112, 'Hualaihué', 9);
INSERT INTO comuna VALUES (113, 'Futaleufú', 9);
INSERT INTO comuna VALUES (114, 'Chaitén', 9);
INSERT INTO comuna VALUES (115, 'San Pablo', 9);
INSERT INTO comuna VALUES (116, 'San Juan de la Costa', 9);
INSERT INTO comuna VALUES (117, 'Río Negro', 9);
INSERT INTO comuna VALUES (118, 'Puyehue', 9);
INSERT INTO comuna VALUES (119, 'Purranque', 9);
INSERT INTO comuna VALUES (120, 'Puerto Octay', 9);
INSERT INTO comuna VALUES (121, 'Osorno', 9);
INSERT INTO comuna VALUES (122, 'Quinchao', 9);
INSERT INTO comuna VALUES (123, 'Quemchi', 9);
INSERT INTO comuna VALUES (124, 'Quellón', 9);
INSERT INTO comuna VALUES (125, 'Queilén', 9);
INSERT INTO comuna VALUES (126, 'Puqueldón', 9);
INSERT INTO comuna VALUES (127, 'Dalcahue', 9);
INSERT INTO comuna VALUES (128, 'Curaco de Vélez', 9);
INSERT INTO comuna VALUES (129, 'Chonchi', 9);
INSERT INTO comuna VALUES (130, 'Ancud', 9);
INSERT INTO comuna VALUES (131, 'Castro', 9);
INSERT INTO comuna VALUES (132, 'Puerto Varas', 9);
INSERT INTO comuna VALUES (133, 'Maullín', 9);
INSERT INTO comuna VALUES (134, 'Llanquihue', 9);
INSERT INTO comuna VALUES (135, 'Los Muermos', 9);
INSERT INTO comuna VALUES (136, 'Frutillar', 9);
INSERT INTO comuna VALUES (137, 'Fresia', 9);
INSERT INTO comuna VALUES (138, 'Cochamó', 9);
INSERT INTO comuna VALUES (139, 'Calbuco', 9);
INSERT INTO comuna VALUES (140, 'Puerto Montt', 9);
INSERT INTO comuna VALUES (141, 'Victoria', 7);
INSERT INTO comuna VALUES (142, 'Traiguén', 7);
INSERT INTO comuna VALUES (143, 'Renaico', 7);
INSERT INTO comuna VALUES (144, 'Purén', 7);
INSERT INTO comuna VALUES (145, 'Lumaco', 7);
INSERT INTO comuna VALUES (146, 'Los Sauces', 7);
INSERT INTO comuna VALUES (147, 'Lonquimay', 7);
INSERT INTO comuna VALUES (148, 'Ercilla', 7);
INSERT INTO comuna VALUES (149, 'Curacautín', 7);
INSERT INTO comuna VALUES (150, 'Collipulli', 7);
INSERT INTO comuna VALUES (151, 'Angol', 7);
INSERT INTO comuna VALUES (152, 'Cholchol', 7);
INSERT INTO comuna VALUES (153, 'Villarrica', 7);
INSERT INTO comuna VALUES (154, 'Vilcún', 7);
INSERT INTO comuna VALUES (155, 'Toltén', 7);
INSERT INTO comuna VALUES (156, 'Teodoro Schmidt', 7);
INSERT INTO comuna VALUES (157, 'Saavedra', 7);
INSERT INTO comuna VALUES (158, 'Pucón', 7);
INSERT INTO comuna VALUES (159, 'Pitrufquén', 7);
INSERT INTO comuna VALUES (160, 'Perquenco', 7);
INSERT INTO comuna VALUES (161, 'Padre Las Casas', 7);
INSERT INTO comuna VALUES (162, 'Nueva Imperial', 7);
INSERT INTO comuna VALUES (163, 'Melipeuco', 7);
INSERT INTO comuna VALUES (164, 'Loncoche', 7);
INSERT INTO comuna VALUES (165, 'Lautaro', 7);
INSERT INTO comuna VALUES (166, 'Gorbea', 7);
INSERT INTO comuna VALUES (167, 'Galvarino', 7);
INSERT INTO comuna VALUES (168, 'Freire', 7);
INSERT INTO comuna VALUES (169, 'Curarrehue', 7);
INSERT INTO comuna VALUES (170, 'Cunco', 7);
INSERT INTO comuna VALUES (171, 'Carahue', 7);
INSERT INTO comuna VALUES (172, 'Temuco', 7);
INSERT INTO comuna VALUES (173, 'Alto Biobío', 5);
INSERT INTO comuna VALUES (174, 'Yumbel', 5);
INSERT INTO comuna VALUES (175, 'Tucapel', 5);
INSERT INTO comuna VALUES (176, 'Santa Bárbara', 5);
INSERT INTO comuna VALUES (177, 'San Rosendo', 5);
INSERT INTO comuna VALUES (178, 'Quilleco', 5);
INSERT INTO comuna VALUES (179, 'Quilaco', 5);
INSERT INTO comuna VALUES (180, 'Negrete', 5);
INSERT INTO comuna VALUES (181, 'Nacimiento', 5);
INSERT INTO comuna VALUES (182, 'Mulchén', 5);
INSERT INTO comuna VALUES (183, 'Laja', 5);
INSERT INTO comuna VALUES (184, 'Cabrero', 5);
INSERT INTO comuna VALUES (185, 'Antuco', 5);
INSERT INTO comuna VALUES (186, 'Los Ángeles', 5);
INSERT INTO comuna VALUES (187, 'Tirúa', 5);
INSERT INTO comuna VALUES (188, 'Los Álamos', 5);
INSERT INTO comuna VALUES (189, 'Curanilahue', 5);
INSERT INTO comuna VALUES (190, 'Contulmo', 5);
INSERT INTO comuna VALUES (191, 'Cañete', 5);
INSERT INTO comuna VALUES (192, 'Arauco', 5);
INSERT INTO comuna VALUES (193, 'Lebu', 5);
INSERT INTO comuna VALUES (194, 'Hualpén', 5);
INSERT INTO comuna VALUES (195, 'Tomé', 5);
INSERT INTO comuna VALUES (196, 'Talcahuano', 5);
INSERT INTO comuna VALUES (197, 'Santa Juana', 5);
INSERT INTO comuna VALUES (198, 'San Pedro de La Paz', 5);
INSERT INTO comuna VALUES (199, 'Penco', 5);
INSERT INTO comuna VALUES (200, 'Lota', 5);
INSERT INTO comuna VALUES (201, 'Hualqui', 5);
INSERT INTO comuna VALUES (202, 'Florida', 5);
INSERT INTO comuna VALUES (203, 'Chiguayante', 5);
INSERT INTO comuna VALUES (204, 'Coronel', 5);
INSERT INTO comuna VALUES (205, 'Concepción', 5);
INSERT INTO comuna VALUES (206, 'Yerbas Buenas', 12);
INSERT INTO comuna VALUES (207, 'Villa Alegre', 12);
INSERT INTO comuna VALUES (208, 'San Javier', 12);
INSERT INTO comuna VALUES (209, 'Retiro', 12);
INSERT INTO comuna VALUES (210, 'Parral', 12);
INSERT INTO comuna VALUES (211, 'Longaví', 12);
INSERT INTO comuna VALUES (212, 'Colbún', 12);
INSERT INTO comuna VALUES (213, 'Linares', 12);
INSERT INTO comuna VALUES (214, 'Vichuquén', 12);
INSERT INTO comuna VALUES (215, 'Teno', 12);
INSERT INTO comuna VALUES (216, 'Sagrada Familia', 12);
INSERT INTO comuna VALUES (217, 'Romeral', 12);
INSERT INTO comuna VALUES (218, 'Rauco', 12);
INSERT INTO comuna VALUES (219, 'Molina', 12);
INSERT INTO comuna VALUES (220, 'Licantén', 12);
INSERT INTO comuna VALUES (221, 'Hualañé', 12);
INSERT INTO comuna VALUES (222, 'Curicó', 12);
INSERT INTO comuna VALUES (223, 'Pelluhue', 12);
INSERT INTO comuna VALUES (224, 'Chanco', 12);
INSERT INTO comuna VALUES (225, 'Cauquenes', 12);
INSERT INTO comuna VALUES (226, 'San Rafael', 12);
INSERT INTO comuna VALUES (227, 'San Clemente', 12);
INSERT INTO comuna VALUES (228, 'Río Claro', 12);
INSERT INTO comuna VALUES (229, 'Pencahue', 12);
INSERT INTO comuna VALUES (230, 'Pelarco', 12);
INSERT INTO comuna VALUES (231, 'Maule', 12);
INSERT INTO comuna VALUES (232, 'Empedrado', 12);
INSERT INTO comuna VALUES (233, 'Curepto', 12);
INSERT INTO comuna VALUES (234, 'Constitución', 12);
INSERT INTO comuna VALUES (235, 'Talca', 12);
INSERT INTO comuna VALUES (236, 'Santa Cruz', 8);
INSERT INTO comuna VALUES (237, 'Pumanque', 8);
INSERT INTO comuna VALUES (238, 'Placilla', 8);
INSERT INTO comuna VALUES (239, 'Peralillo', 8);
INSERT INTO comuna VALUES (240, 'Palmilla', 8);
INSERT INTO comuna VALUES (241, 'Nancagua', 8);
INSERT INTO comuna VALUES (242, 'Lolol', 8);
INSERT INTO comuna VALUES (243, 'Chimbarongo', 8);
INSERT INTO comuna VALUES (244, 'Chépica', 8);
INSERT INTO comuna VALUES (245, 'San Fernando', 8);
INSERT INTO comuna VALUES (246, 'Paredones', 8);
INSERT INTO comuna VALUES (247, 'Navidad', 8);
INSERT INTO comuna VALUES (248, 'Marchihue', 8);
INSERT INTO comuna VALUES (249, 'Litueche', 8);
INSERT INTO comuna VALUES (250, 'La Estrella', 8);
INSERT INTO comuna VALUES (251, 'Pichilemu', 8);
INSERT INTO comuna VALUES (252, 'San Vicente', 8);
INSERT INTO comuna VALUES (253, 'Requínoa', 8);
INSERT INTO comuna VALUES (254, 'Rengo', 8);
INSERT INTO comuna VALUES (255, 'Quinta de Tilcoco', 8);
INSERT INTO comuna VALUES (256, 'Pichidegua', 8);
INSERT INTO comuna VALUES (257, 'Peumo', 8);
INSERT INTO comuna VALUES (258, 'Olivar', 8);
INSERT INTO comuna VALUES (259, 'Mostazal', 8);
INSERT INTO comuna VALUES (260, 'Malloa', 8);
INSERT INTO comuna VALUES (261, 'Machalí', 8);
INSERT INTO comuna VALUES (262, 'Las Cabras', 8);
INSERT INTO comuna VALUES (263, 'Graneros', 8);
INSERT INTO comuna VALUES (264, 'Doñihue', 8);
INSERT INTO comuna VALUES (265, 'Coltauco', 8);
INSERT INTO comuna VALUES (266, 'Coinco', 8);
INSERT INTO comuna VALUES (267, 'Codegua', 8);
INSERT INTO comuna VALUES (268, 'Rancagua', 8);
INSERT INTO comuna VALUES (269, 'Villa Alemana', 16);
INSERT INTO comuna VALUES (270, 'Olmué', 16);
INSERT INTO comuna VALUES (271, 'Limache', 16);
INSERT INTO comuna VALUES (272, 'Quilpué', 16);
INSERT INTO comuna VALUES (273, 'Santa María', 16);
INSERT INTO comuna VALUES (274, 'Putaendo', 16);
INSERT INTO comuna VALUES (275, 'Panquehue', 16);
INSERT INTO comuna VALUES (276, 'Llay-Llay', 16);
INSERT INTO comuna VALUES (277, 'Catemu', 16);
INSERT INTO comuna VALUES (278, 'San Felipe', 16);
INSERT INTO comuna VALUES (279, 'Santo Domingo', 16);
INSERT INTO comuna VALUES (280, 'El Tabo', 16);
INSERT INTO comuna VALUES (281, 'El Quisco', 16);
INSERT INTO comuna VALUES (282, 'Cartagena', 16);
INSERT INTO comuna VALUES (283, 'Algarrobo', 16);
INSERT INTO comuna VALUES (284, 'San Antonio', 16);
INSERT INTO comuna VALUES (285, 'Nogales', 16);
INSERT INTO comuna VALUES (286, 'La Cruz', 16);
INSERT INTO comuna VALUES (287, 'Hijuelas', 16);
INSERT INTO comuna VALUES (288, 'La Calera', 16);
INSERT INTO comuna VALUES (289, 'Quillota', 16);
INSERT INTO comuna VALUES (290, 'Zapallar', 16);
INSERT INTO comuna VALUES (291, 'Petorca', 16);
INSERT INTO comuna VALUES (292, 'Papudo', 16);
INSERT INTO comuna VALUES (293, 'Cabildo', 16);
INSERT INTO comuna VALUES (294, 'La Ligua', 16);
INSERT INTO comuna VALUES (295, 'San Esteban', 16);
INSERT INTO comuna VALUES (296, 'Rinconada', 16);
INSERT INTO comuna VALUES (297, 'Calle Larga', 16);
INSERT INTO comuna VALUES (298, 'Los Andes', 16);
INSERT INTO comuna VALUES (299, 'Isla de Pascua', 16);
INSERT INTO comuna VALUES (300, 'Viña del Mar', 16);
INSERT INTO comuna VALUES (301, 'Quintero', 16);
INSERT INTO comuna VALUES (302, 'Puchuncaví', 16);
INSERT INTO comuna VALUES (303, 'Juan Fernández', 16);
INSERT INTO comuna VALUES (304, 'Concón', 16);
INSERT INTO comuna VALUES (305, 'Casablanca', 16);
INSERT INTO comuna VALUES (306, 'Valparaíso', 16);
INSERT INTO comuna VALUES (307, 'Río Hurtado', 6);
INSERT INTO comuna VALUES (308, 'Punitaqui', 6);
INSERT INTO comuna VALUES (309, 'Monte Patria', 6);
INSERT INTO comuna VALUES (310, 'Combarbalá', 6);
INSERT INTO comuna VALUES (311, 'Ovalle', 6);
INSERT INTO comuna VALUES (312, 'Salamanca', 6);
INSERT INTO comuna VALUES (313, 'Los Vilos', 6);
INSERT INTO comuna VALUES (314, 'Canela', 6);
INSERT INTO comuna VALUES (315, 'Illapel', 6);
INSERT INTO comuna VALUES (316, 'Vicuña', 6);
INSERT INTO comuna VALUES (317, 'Paihuano', 6);
INSERT INTO comuna VALUES (318, 'La Higuera', 6);
INSERT INTO comuna VALUES (319, 'Andacollo', 6);
INSERT INTO comuna VALUES (320, 'Coquimbo', 6);
INSERT INTO comuna VALUES (321, 'La Serena', 6);
INSERT INTO comuna VALUES (322, 'Huasco', 4);
INSERT INTO comuna VALUES (323, 'Freirina', 4);
INSERT INTO comuna VALUES (324, 'Alto del Carmen', 4);
INSERT INTO comuna VALUES (325, 'Vallenar', 4);
INSERT INTO comuna VALUES (326, 'Diego de Almagro', 4);
INSERT INTO comuna VALUES (327, 'Chañaral', 4);
INSERT INTO comuna VALUES (328, 'Tierra Amarilla', 4);
INSERT INTO comuna VALUES (329, 'Caldera', 4);
INSERT INTO comuna VALUES (330, 'Copiapó', 4);
INSERT INTO comuna VALUES (331, 'María Elena', 2);
INSERT INTO comuna VALUES (332, 'Tocopilla', 2);
INSERT INTO comuna VALUES (333, 'San Pedro de Atacama', 2);
INSERT INTO comuna VALUES (334, 'Ollagüe', 2);
INSERT INTO comuna VALUES (335, 'Calama', 2);
INSERT INTO comuna VALUES (336, 'Taltal', 2);
INSERT INTO comuna VALUES (337, 'Sierra Gorda', 2);
INSERT INTO comuna VALUES (338, 'Mejillones', 2);
INSERT INTO comuna VALUES (339, 'Antofagasta', 2);
INSERT INTO comuna VALUES (340, 'Pica', 15);
INSERT INTO comuna VALUES (341, 'Huara', 15);
INSERT INTO comuna VALUES (342, 'Colchane', 15);
INSERT INTO comuna VALUES (343, 'Camiña', 15);
INSERT INTO comuna VALUES (344, 'Pozo Almonte', 15);
INSERT INTO comuna VALUES (345, 'Alto Hospicio', 15);
INSERT INTO comuna VALUES (346, 'Iquique', 15);

INSERT INTO tipo_producto VALUES (1, 'Alimenticio');
INSERT INTO tipo_producto VALUES (2, 'Industrial');

INSERT INTO tipo_producto VALUES (1, 'Fruta');
INSERT INTO tipo_producto VALUES (2, 'Verdura');
INSERT INTO tipo_producto VALUES (3, 'Legumbre');
INSERT INTO tipo_producto VALUES (4, 'Textil');
INSERT INTO tipo_producto VALUES (5, 'Cereal');
INSERT INTO tipo_producto VALUES (6, 'Planta');

--INSERTAR PROCEDIMIENTOS ALMACENADOS PARA LAS FUNCIONES
create or replace PROCEDURE p_agregar_producto(
        v_id_prod NUMBER,
        v_nom_prod VARCHAR2,
        v_precio NUMBER,
        v_cat VARCHAR2,
        v_tipo_prod VARCHAR2,
        v_prov VARCHAR2,
        v_imagen BLOB,
        v_salida out NUMBER
        
    )is
    BEGIN
        INSERT INTO producto VALUES (v_id_prod,v_nom_prod,v_precio,v_cat,v_tipo_prod,v_prov,v_imagen);
        v_salida:=1;
        COMMIT;
    end;

create or replace PROCEDURE p_lista_productos(producto out SYS_REFCURSOR)
    IS
    BEGIN
        open producto for SELECT  P.*, 
            c.name
    FROM producto P INNER JOIN categoria C 
        ON (P.CATEGORIA_ID_CATE = c.ID_CATE);
    END;