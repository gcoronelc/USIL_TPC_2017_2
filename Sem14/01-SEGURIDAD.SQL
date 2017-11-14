/*
Empresa        :  EGCC
Software       :  Sistema Financiero de Colegios
DBMS           :  SQL SERVER
Base de Datos  :  BDCOLEGIO
Script         :  Crea el esquema seguridad
Responsable    :  Ing. Eric Gustavo Coronel Castillo
Telefono       :  (511) 9966-64457
Email          :  gcoronelc@gmail.com
Blog           :  http://gcoronelc.blogspot.com
Creado el      :  07-OCT-2017
*/


-- =============================================
-- Seleccionar la Base de Datos
-- =============================================

USE BDCOLEGIO;




-- =============================================
-- Creación de los objetos del esquema
-- =============================================

CREATE TABLE EMPLEADO
( 
	IDEMPLEADO           integer IDENTITY ( 1,1 ) ,
	APELLIDO             varchar(70)  NOT NULL ,
	NOMBRE               varchar(70)  NOT NULL ,
	DNI                  varchar(20)  NOT NULL ,
	DIRECCION            varchar(100)  NOT NULL ,
	TELEFONO             varchar(20)  NOT NULL ,
	EMAIL                varchar(50)  NOT NULL ,
	CONSTRAINT XPKEMPLEADO PRIMARY KEY (IDEMPLEADO ASC)
)
go



CREATE TABLE ROL
( 
	IDROL                integer  NOT NULL ,
	NOMBRE               varchar(30)  NOT NULL ,
	CONSTRAINT XPKROL PRIMARY KEY (IDROL ASC)
)
go



CREATE TABLE USUARIO
( 
	IDEMPLEADO           integer  NOT NULL ,
	IDROL                integer  NOT NULL ,
	USUARIO              varchar(20)  NOT NULL ,
	CLAVE                varbinary(100)  NOT NULL ,
	ESTADO               integer  NOT NULL DEFAULT  0 CHECK  ( ESTADO IN (0,1) ),
	CONSTRAINT XPKUSUARIO PRIMARY KEY (IDEMPLEADO ASC),
	CONSTRAINT FK_USUARIO_EMPLEADO 
		FOREIGN KEY (IDEMPLEADO) REFERENCES EMPLEADO(IDEMPLEADO)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
CONSTRAINT FK_USUARIO_ROL 
		FOREIGN KEY (IDROL) REFERENCES ROL(IDROL)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go


-- =============================================
-- Cargar datos de prueba
-- =============================================

-- Tabla ROL

INSERT INTO ROL(IDROL,NOMBRE) VALUES(1,'Administrador');
INSERT INTO ROL(IDROL,NOMBRE) VALUES(2,'Operador');
INSERT INTO ROL(IDROL,NOMBRE) VALUES(3,'Usuario');

-- Tabla EMPLEADO

INSERT INTO EMPLEADO(APELLIDO,NOMBRE,DNI,DIRECCION,TELEFONO,EMAIL)
VALUES('CORONEL','GUSTAVO','98546789','SU CASA','555-5555','GUSTAVO@GMAIL.COM');

INSERT INTO EMPLEADO(APELLIDO,NOMBRE,DNI,DIRECCION,TELEFONO,EMAIL)
VALUES('A','A','1','A','A','A');

INSERT INTO EMPLEADO(APELLIDO,NOMBRE,DNI,DIRECCION,TELEFONO,EMAIL)
VALUES('A','A','1','A','A','A');

INSERT INTO EMPLEADO(APELLIDO,NOMBRE,DNI,DIRECCION,TELEFONO,EMAIL)
VALUES('A','A','1','A','A','A');

INSERT INTO EMPLEADO(APELLIDO,NOMBRE,DNI,DIRECCION,TELEFONO,EMAIL)
VALUES('A','A','1','A','A','A');

-- Tabla USUARIO

INSERT INTO USUARIO (IDEMPLEADO,IDROL,USUARIO,CLAVE,ESTADO)
VALUES(1,1,'gustavo',HashBytes('SHA1','gustavo'),1);

INSERT INTO USUARIO (IDEMPLEADO,IDROL,USUARIO,CLAVE,ESTADO)
VALUES(2,2,'panchito',HashBytes('SHA1','panchito'),1);



