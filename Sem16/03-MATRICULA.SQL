/*
Empresa        :  EGCC
Software       :  Sistema Financiero de Colegios
DBMS           :  SQL SERVER
Base de Datos  :  BDCOLEGIO
Script         :  Crea el esquema matricula
Responsable    :  Ing. Eric Gustavo Coronel Castillo
Telefono       :  (511) 9966-64457
Email          :  gcoronelc@gmail.com
Blog           :  http://gcoronelc.blogspot.com
Creado el      :  14-NOV-2017
*/


-- =============================================
-- Seleccionar la Base de Datos
-- =============================================

USE BDCOLEGIO;


-- =============================================
-- Creación de Tablas
-- =============================================


CREATE TABLE TOBLIGACION
( 
	TOBLIGACION          integer  NOT NULL ,
	NOMBRE               varchar(40)  NOT NULL ,
	MORA                 numeric(10,2)  NOT NULL ,
	CONSTRAINT XPKTOBLIGACION PRIMARY KEY  CLUSTERED (TOBLIGACION ASC)
)
go


CREATE TABLE ESTUDIANTE
( 
	ESTUDIANTE           integer  NOT NULL  IDENTITY ( 1,1 ) ,
	APELLIDO             varchar(70)  NOT NULL ,
	NOMBRE               varchar(70)  NOT NULL ,
	DNI                  varchar(20)  NOT NULL ,
	DIRECCION            varchar(100)  NOT NULL ,
	TELEFONO             varchar(20)  NOT NULL ,
	EMAIL                varchar(50)  NOT NULL ,
	CONSTRAINT XPKESTUDIANTE PRIMARY KEY  CLUSTERED (ESTUDIANTE ASC)
)
go


CREATE TABLE MATRICULA
( 
	MATRICULA            integer  NOT NULL  IDENTITY ( 1,1 ) ,
	SECCION              integer  NOT NULL ,
	ESTUDIANTE           integer  NOT NULL ,
	FECHA                datetime NOT NULL ,
	CONFIRMADA           integer  NOT NULL DEFAULT  0 CHECK ( CONFIRMADA IN (0 , 1) ),
	ACTIVA               integer  NOT NULL CHECK ( ACTIVA IN (0 , 1) ),
	OBS                  varchar(200)  NOT NULL ,
	AUDEMPLEADO          integer  NOT NULL ,
	AUDFECHA             datetime  NOT NULL ,
	CONSTRAINT XPKMATRICULA PRIMARY KEY  CLUSTERED (MATRICULA ASC),
	CONSTRAINT FK_MATRICULA_SECCION FOREIGN KEY (SECCION) REFERENCES SECCION(SECCION)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT FK_MATRICULA_ESTUDIANTE FOREIGN KEY (ESTUDIANTE) REFERENCES ESTUDIANTE(ESTUDIANTE)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT FK_MATRICULA_EMPLEADO FOREIGN KEY (AUDEMPLEADO) REFERENCES EMPLEADO(IDEMPLEADO)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go


CREATE TABLE OBLIGACION
( 
	OBLIGACION           integer  NOT NULL  IDENTITY ( 1,1 ) ,
	IMPORTE              numeric(12,2)  NOT NULL ,
	FECVEN               datetime  NOT NULL ,
	ESTUDIANTE           integer  NOT NULL ,
	MATRICULA            integer  NULL ,
	TOBLIGACION          integer  NOT NULL ,
	AUDEMPLEADO          integer  NOT NULL ,
	AUDFECHA             datetime  NOT NULL ,
	CONSTRAINT XPKOBLIGACION PRIMARY KEY  CLUSTERED (OBLIGACION ASC),
	CONSTRAINT FK_OBLIGACION_ESTUDIANTE FOREIGN KEY (ESTUDIANTE) REFERENCES ESTUDIANTE(ESTUDIANTE)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT FK_OBLIGACION_MATRICULA FOREIGN KEY (MATRICULA) REFERENCES MATRICULA(MATRICULA)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT FK_OBLIGACION_TOBLIGACION FOREIGN KEY (TOBLIGACION) REFERENCES TOBLIGACION(TOBLIGACION)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT FK_OBLIGACION_EMPLEADO FOREIGN KEY (AUDEMPLEADO) REFERENCES EMPLEADO(IDEMPLEADO)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go


-- =============================================
-- Datos de Prueba
-- =============================================

-- Tipos de Obligación

insert into TOBLIGACION(tobligacion,nombre,mora) values(1,'Cuota de ingreso',0);
insert into TOBLIGACION(tobligacion,nombre,mora) values(2,'Matricula',0);
insert into TOBLIGACION(tobligacion,nombre,mora) values(3,'Pensión',1);

-- Estudiantes

SET IDENTITY_INSERT dbo.estudiante ON;  
GO 

insert into estudiante(estudiante,apellido,nombre,dni,direccion,telefono,email)
values(1,'MOSCOL','HECTOR','54678923','SU CASA','EL ES','NOTIENE@GMAIL.COM');

insert into estudiante(estudiante,apellido,nombre,dni,direccion,telefono,email)
values(2,'GUERRA','JESUS','89546723','SU CASA','EL ES','ELCIELO@GMAIL.COM');

insert into estudiante(estudiante,apellido,nombre,dni,direccion,telefono,email)
values(3,'MERCATI','GABRIEL','89546723','SU CASA','EL ES','DONGABO@GMAIL.COM');

GO

SET IDENTITY_INSERT dbo.estudiante OFF;
GO 

-- OBLIGACION

SET IDENTITY_INSERT dbo.OBLIGACION ON;  
GO

insert into OBLIGACION(obligacion,estudiante,tobligacion,importe,fecven,
matricula,audempleado,audfecha)
values(1,1,1,2000.0,'20180331',NULL,1,GETDATE());

insert into OBLIGACION(obligacion,estudiante,tobligacion,importe,fecven,
matricula,audempleado,audfecha)
values(2,3,1,2000.0,'20180331',NULL,1,GETDATE());

insert into OBLIGACION(obligacion,estudiante,tobligacion,importe,fecven,
matricula,audempleado,audfecha)
values(3,2,1,2000.0,'20180331',NULL,1,GETDATE());

SET IDENTITY_INSERT dbo.OBLIGACION OFF;  
GO


-- PROCESO MATRICULA

SET IDENTITY_INSERT dbo.MATRICULA ON;  
GO

insert into MATRICULA(matricula,seccion,       
estudiante,fecha,confirmada,activa,        
obs,audempleado,audfecha)
values(1,1,1,GETdate(),0,1,'nose',1,getdate());

insert into MATRICULA(matricula,seccion,       
estudiante,fecha,confirmada,activa,        
obs,audempleado,audfecha)
values(2,1,2,GETdate(),0,1,'nose',1,getdate());

SET IDENTITY_INSERT dbo.MATRICULA OFF;  
GO

SET IDENTITY_INSERT dbo.OBLIGACION ON;  
GO

insert into OBLIGACION(obligacion,estudiante,tobligacion,importe,fecven,
matricula,audempleado,audfecha)
values(4,1,2,700.0,'20180331',1,1,GETDATE());

insert into OBLIGACION(obligacion,estudiante,tobligacion,importe,fecven,
matricula,audempleado,audfecha)
values(5,2,2,700.0,'20180331',2,1,GETDATE());

SET IDENTITY_INSERT dbo.OBLIGACION OFF;  
GO

select * from OBLIGACION where estudiante = 1;