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
-- Creación de Tablas
-- =============================================

CREATE TABLE NIVEL
( 
	NIVEL                integer  NOT NULL ,
	NOMBRE               varchar(60)  NOT NULL ,
	CONSTRAINT XPKNIVEL PRIMARY KEY (NIVEL ASC)
)
go



CREATE TABLE GRADO
( 
	GRADO                integer  NOT NULL ,
	NIVEL                integer  NOT NULL ,
	NOMBRE               varchar(60)  NOT NULL ,
	CONSTRAINT XPKGRADO PRIMARY KEY (GRADO ASC),
	CONSTRAINT FK_GRADO_NIVEL FOREIGN KEY (NIVEL) REFERENCES NIVEL(NIVEL)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go



CREATE TABLE PERIODO
( 
	PERIODO              integer  NOT NULL ,
	INGRESO              numeric(10,2) NOT NULL ,
	MATRICULA            numeric(10,2)  NOT NULL ,
	PENSION              numeric(10,2)  NOT NULL ,
	ACTIVO               integer  NOT NULL DEFAULT (1) CHECK  ( ACTIVO IN (0 , 1) ),
	CONSTRAINT XPKPERIODO PRIMARY KEY (PERIODO ASC)
)
go


CREATE TABLE SECCION
( 
	SECCION              integer IDENTITY ( 1,1 ) ,
	GRADO                integer  NOT NULL ,
	PERIODO              integer  NOT NULL ,
	VACANTES             integer  NOT NULL ,
	MATRICULADOS         integer  NULL ,
	IDEMPLEADO           integer  NOT NULL ,
	CONSTRAINT XPKSECCION PRIMARY KEY (SECCION ASC),
	CONSTRAINT FK_SECCION_GRADO FOREIGN KEY (GRADO) REFERENCES GRADO(GRADO)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT FK_SECCION_PERIODO FOREIGN KEY (PERIODO) REFERENCES PERIODO(PERIODO)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT FK_SECCION_EMPLEADO FOREIGN KEY (IDEMPLEADO) REFERENCES EMPLEADO(IDEMPLEADO)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go

-- =============================================
-- Cargar Datos a Tablas
-- =============================================

-- Tabla NIVEL

insert into NIVEL(NIVEL, NOMBRE) values(1,'PRIMARIA');
insert into NIVEL(NIVEL, NOMBRE) values(2,'SECUNDARIA');

-- Tabla GRADO

insert into GRADO(GRADO, NIVEL, NOMBRE) values(101,1,'PRIMER GRADO PRIMARIA');
insert into GRADO(GRADO, NIVEL, NOMBRE) values(102,1,'SEGUNDO GRADO PRIMARIA');
insert into GRADO(GRADO, NIVEL, NOMBRE) values(103,1,'TERCER GRADO PRIMARIA');
insert into GRADO(GRADO, NIVEL, NOMBRE) values(104,1,'CUARTO GRADO PRIMARIA');
insert into GRADO(GRADO, NIVEL, NOMBRE) values(105,1,'QUINTO GRADO PRIMARIA');
insert into GRADO(GRADO, NIVEL, NOMBRE) values(106,1,'SEXTO GRADO PRIMARIA');

insert into GRADO(GRADO, NIVEL, NOMBRE) values(201,2,'PRIMER GRADO SECUNDARIA');
insert into GRADO(GRADO, NIVEL, NOMBRE) values(202,2,'SEGUNDO GRADO SECUNDARIA');
insert into GRADO(GRADO, NIVEL, NOMBRE) values(203,2,'TERCER GRADO SECUNDARIA');
insert into GRADO(GRADO, NIVEL, NOMBRE) values(204,2,'CUARTO GRADO SECUNDARIA');
insert into GRADO(GRADO, NIVEL, NOMBRE) values(205,2,'QUINTO GRADO SECUNDARIA');


-- Tabla PERIODO

insert into PERIODO(PERIODO,INGRESO,MATRICULA,PENSION,ACTIVO) 
values(2016,1000.0,500.0,500.0,0);

insert into PERIODO(PERIODO,INGRESO,MATRICULA,PENSION,ACTIVO) 
values(2017,1500.0,600.0,600.0,0);

insert into PERIODO(PERIODO,INGRESO,MATRICULA,PENSION,ACTIVO) 
values(2018,2000.0,700.0,700.0,0);


-- Tabla SECCION









