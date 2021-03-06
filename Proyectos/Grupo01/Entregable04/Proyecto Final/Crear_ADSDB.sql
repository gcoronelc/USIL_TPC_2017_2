-- =============================================
-- Creaci�n de la Base de Datos
-- =============================================

USE master;
go

IF( EXISTS ( SELECT name FROM master.sys.databases WHERE name = 'ADS_DB' ) )
BEGIN
	DROP DATABASE ADS_DB;
END;
go

CREATE DATABASE ADS_DB;
go


-- =============================================
-- Seleccionar la Base de Datos
-- =============================================

USE ADS_DB;


-- =============================================
-- Creacion de las Tablas
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
)
go

ALTER TABLE EMPLEADO
ADD CONSTRAINT PK_EMPLEADO
PRIMARY KEY (IDEMPLEADO ASC)
GO

CREATE TABLE ROL
( 
	IDROL                integer  NOT NULL ,
	NOMBRE               varchar(30)  NOT NULL ,
)
go

ALTER TABLE ROL
ADD CONSTRAINT PK_ROL
PRIMARY KEY (IDROL ASC)
GO

CREATE TABLE USUARIO
( 
	IDEMPLEADO           integer  NOT NULL ,
	IDROL                integer  NOT NULL ,
	USUARIO              varchar(20)  NOT NULL ,
	CLAVE                varbinary(100)  NOT NULL ,
	ESTADO               integer  NOT NULL DEFAULT  0 CHECK  ( ESTADO IN (0,1) )
)
go

ALTER TABLE USUARIO
ADD CONSTRAINT PK_USUARIO
PRIMARY KEY (IDEMPLEADO ASC)
GO

ALTER TABLE USUARIO 
ADD CONSTRAINT FK_USUARIO_EMPLEADO
FOREIGN KEY (IDEMPLEADO)
REFERENCES EMPLEADO 
ON DELETE NO ACTION
ON UPDATE NO ACTION
GO

ALTER TABLE USUARIO 
ADD CONSTRAINT FK_USUARIO_ROL
FOREIGN KEY (IDROL)
REFERENCES ROL
ON DELETE NO ACTION
ON UPDATE NO ACTION
GO



CREATE TABLE NIVEL
( 
	IDNIVEL                integer  NOT NULL ,
	NOMBRE               varchar(60)  NOT NULL 
)
GO

ALTER TABLE NIVEL
ADD CONSTRAINT PK_NIVEL
PRIMARY KEY (IDNIVEL ASC)
GO

CREATE TABLE GRADO
( 
	IDGRADO                integer  NOT NULL ,
	IDNIVEL                integer  NOT NULL ,
	NOMBRE               varchar(60)  NOT NULL 
)
go

ALTER TABLE GRADO
ADD CONSTRAINT PK_GRADO
PRIMARY KEY (IDGRADO ASC)
GO

ALTER TABLE GRADO 
ADD CONSTRAINT FK_GRADO_NIVEL
FOREIGN KEY (IDNIVEL)
REFERENCES NIVEL
ON DELETE NO ACTION
ON UPDATE NO ACTION
GO

CREATE TABLE TARIFAPERIODO
(
	IDPERIODO		INTEGER NOT NULL,
	INGRESO			NUMERIC(10,2) NOT NULL,
	MATRICULA		NUMERIC(10,2) NOT NULL,
	PENSION			NUMERIC(10,2) NOT NULL,
	MORA			INTEGER	NOT NULL,
	ACTIVO			INTEGER NOT NULL
)
GO

ALTER TABLE TARIFAPERIODO
ADD CONSTRAINT PK_TARIFAPERIODO
PRIMARY KEY (IDPERIODO)
GO



CREATE TABLE SECCION
(
	IDSECCION		integer IDENTITY ( 1,1 ),
	NOMBRE			VARCHAR(60) NOT NULL,
	IDGRADO			INTEGER	NOT NULL,
	VACANTES	INTEGER NOT NULL DEFAULT 20,
	MATRICULADOS	INTEGER NOT NULL DEFAULT 0,
	IDEMPLEADO		INTEGER NOT NULL,
	IDPERIODO		INTEGER NOT NULL
)
GO

ALTER TABLE SECCION
ADD CONSTRAINT PK_SECCION
PRIMARY KEY (IDSECCION)
GO

ALTER TABLE SECCION
ADD CONSTRAINT FK_SECCION_GRADO
FOREIGN KEY (IDGRADO)
REFERENCES GRADO
ON DELETE NO ACTION
ON UPDATE NO ACTION
GO	

ALTER TABLE SECCION
ADD CONSTRAINT FK_SECCION_TARIFAPERIODO
FOREIGN KEY (IDPERIODO)
REFERENCES TARIFAPERIODO
ON DELETE NO ACTION
ON UPDATE NO ACTION
GO

ALTER TABLE SECCION
ADD CONSTRAINT FK_SECCION_EMPLEADO
FOREIGN KEY (IDEMPLEADO)
REFERENCES EMPLEADO
ON DELETE NO ACTION
ON UPDATE NO ACTION
GO

CREATE TABLE TOBLIGACION
( 
	TOBLIGACION          integer  NOT NULL ,
	NOMBRE               varchar(40)  NOT NULL
)
go

ALTER TABLE TOBLIGACION
ADD CONSTRAINT PK_TOBLIGACION
PRIMARY KEY (TOBLIGACION)
GO



CREATE TABLE ALUMNO
( 
	CODALUMNO           integer  NOT NULL  IDENTITY ( 1,1 ) ,
	APELLIDO             varchar(70)  NOT NULL ,
	NOMBRE               varchar(70)  NOT NULL ,
	DNI                  varchar(20)  NOT NULL ,
	DIRECCION            varchar(100)  NOT NULL ,
	TELEFONO             varchar(20)  NOT NULL ,
	EMAIL                varchar(50)  NOT NULL
)
go

ALTER TABLE ALUMNO
ADD CONSTRAINT PK_ALUMNO
PRIMARY KEY (CODALUMNO)
GO

CREATE TABLE MATRICULA
( 
	IDMATRICULA            integer  NOT NULL  IDENTITY ( 1,1 ) ,
	IDSECCION              INTEGER  NOT NULL ,
	CODALUMNO			integer  NOT NULL ,
	FECHA                datetime NOT NULL ,
	CONFIRMADA           integer  NOT NULL DEFAULT  0 CHECK ( CONFIRMADA IN (0 , 1) ),
	ACTIVA               integer  NOT NULL CHECK ( ACTIVA IN (0 , 1) ),
	OBS                  varchar(200)  NOT NULL ,
	AUDEMPLEADO          integer  NOT NULL ,
	AUDFECHA             datetime  NOT NULL 
)
go

ALTER TABLE MATRICULA 
ADD CONSTRAINT PK_MATRICULA
PRIMARY KEY (IDMATRICULA)
GO

ALTER TABLE MATRICULA
ADD CONSTRAINT FK_MATRICULA_SECCION
FOREIGN KEY (IDSECCION)
REFERENCES SECCION
ON DELETE NO ACTION
ON UPDATE NO ACTION
GO

ALTER TABLE MATRICULA
ADD CONSTRAINT FK_MATRICULA_ALUMNO
FOREIGN KEY (CODALUMNO)
REFERENCES ALUMNO
ON DELETE NO ACTION
ON UPDATE NO ACTION
GO

ALTER TABLE MATRICULA
ADD CONSTRAINT FK_MATRICULA_EMPLEADO
FOREIGN KEY (AUDEMPLEADO)
REFERENCES EMPLEADO(IDEMPLEADO)
ON DELETE NO ACTION
ON UPDATE NO ACTION
GO

CREATE TABLE OBLIGACION
( 
	IDOBLIGACION           integer  NOT NULL  IDENTITY ( 1,1 ) ,
	DESCRIP				  varchar(50)	NOT NULL,
	IMPORTE              numeric(12,2)  NOT NULL ,
	FECVEN               datetime  NOT NULL ,
	CODALUMNO           integer  NOT NULL ,
	IDMATRICULA            integer  NULL ,
	TOBLIGACION          integer  NOT NULL ,
	ESTADO				varchar(20) NOT NULL,
	AUDEMPLEADO          integer  NOT NULL ,
	AUDFECHA             datetime  NOT NULL
)
go

ALTER TABLE OBLIGACION 
ADD CONSTRAINT PK_OBLIGACION
PRIMARY KEY (IDOBLIGACION)
GO

ALTER TABLE OBLIGACION
ADD CONSTRAINT FK_OBLIGACION_ALUMNO
FOREIGN KEY (CODALUMNO)
REFERENCES ALUMNO
ON DELETE NO ACTION
ON UPDATE NO ACTION
GO

ALTER TABLE OBLIGACION
ADD CONSTRAINT FK_OBLIGACION_MATRICULA
FOREIGN KEY (IDMATRICULA)
REFERENCES MATRICULA
ON DELETE NO ACTION
ON UPDATE NO ACTION
GO

ALTER TABLE OBLIGACION
ADD CONSTRAINT FK_OBLIGACION_TOBLIGACION
FOREIGN KEY (TOBLIGACION)
REFERENCES TOBLIGACION
ON DELETE NO ACTION
ON UPDATE NO ACTION
GO

ALTER TABLE OBLIGACION
ADD CONSTRAINT FK_OBLIGACION_EMPLEADO
FOREIGN KEY (AUDEMPLEADO)
REFERENCES EMPLEADO(IDEMPLEADO)
ON DELETE NO ACTION
ON UPDATE NO ACTION
GO


CREATE TABLE PAGOS
( 
	IDPAGO           	integer  NOT NULL  IDENTITY ( 1,1 ) ,
	IDOBLIGACION		INTEGER	NOT NULL,
	FECPAGO              DATETIME  NOT NULL ,
	IMPORTE				NUMERIC(12,2) NOT NULL,
	MORA               	NUMERIC(12,2)  NOT NULL ,
	TOTAL           	NUMERIC(12,2)  NULL ,
	AUDEMPLEADO          integer  NOT NULL ,
	AUDFECHA             datetime  NOT NULL
)
go

ALTER TABLE PAGOS
ADD CONSTRAINT PK_PAGOS
PRIMARY KEY (IDPAGO)
GO

ALTER TABLE PAGOS
ADD CONSTRAINT FK_PAGOS_OBLIGACION
FOREIGN KEY (IDOBLIGACION)
REFERENCES OBLIGACION
ON DELETE NO ACTION
ON UPDATE NO ACTION
GO


ALTER TABLE PAGOS
ADD CONSTRAINT FK_PAGOS_EMPLEADO
FOREIGN KEY (AUDEMPLEADO)
REFERENCES EMPLEADO(IDEMPLEADO)
ON DELETE NO ACTION
ON UPDATE NO ACTION
GO
