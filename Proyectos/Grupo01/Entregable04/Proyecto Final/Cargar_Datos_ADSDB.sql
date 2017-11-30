-- =============================================
-- Seleccionar la Base de Datos
-- =============================================

USE ADS_DB;


-- =============================================
-- CARGAR DATOS
-- =============================================

-- Tabla ROL

INSERT INTO ROL(IDROL,NOMBRE) VALUES(1,'Administrador');
INSERT INTO ROL(IDROL,NOMBRE) VALUES(2,'Operador');
INSERT INTO ROL(IDROL,NOMBRE) VALUES(3,'Usuario');

-- Tabla EMPLEADO

INSERT INTO EMPLEADO(APELLIDO,NOMBRE,DNI,DIRECCION,TELEFONO,EMAIL)
VALUES('CORONEL','GUSTAVO','98546789','SU CASA','555-5555','GUSTAVO@GMAIL.COM');

INSERT INTO EMPLEADO(APELLIDO,NOMBRE,DNI,DIRECCION,TELEFONO,EMAIL)
VALUES('MERCATI','GABRIEL','974625230','COMAS','505-0505','GABO@GMAIL.COM');

INSERT INTO EMPLEADO(APELLIDO,NOMBRE,DNI,DIRECCION,TELEFONO,EMAIL)
VALUES('NACION','ITALO','976589421','SURCO','448-9145','ITALO@GMAIL.COM');


-- Tabla USUARIO

INSERT INTO USUARIO (IDEMPLEADO,IDROL,USUARIO,CLAVE,ESTADO)
VALUES(1,1,'gustavo',HashBytes('SHA1','gustavo'),1);

INSERT INTO USUARIO (IDEMPLEADO,IDROL,USUARIO,CLAVE,ESTADO)
VALUES(2,2,'gabriel',HashBytes('SHA1','gabriel'),1);


-- Tabla NIVEL

insert into NIVEL(IDNIVEL, NOMBRE) values(1,'PRIMARIA');
insert into NIVEL(IDNIVEL, NOMBRE) values(2,'SECUNDARIA');

-- Tabla GRADO

insert into GRADO(IDGRADO, IDNIVEL, NOMBRE) values(101,1,'PRIMER GRADO PRIMARIA');
insert into GRADO(IDGRADO, IDNIVEL, NOMBRE) values(102,1,'SEGUNDO GRADO PRIMARIA');
insert into GRADO(IDGRADO, IDNIVEL, NOMBRE) values(103,1,'TERCER GRADO PRIMARIA');
insert into GRADO(IDGRADO, IDNIVEL, NOMBRE) values(104,1,'CUARTO GRADO PRIMARIA');
insert into GRADO(IDGRADO, IDNIVEL, NOMBRE) values(105,1,'QUINTO GRADO PRIMARIA');
insert into GRADO(IDGRADO, IDNIVEL, NOMBRE) values(106,1,'SEXTO GRADO PRIMARIA');

insert into GRADO(IDGRADO, IDNIVEL, NOMBRE) values(201,2,'PRIMER GRADO SECUNDARIA');
insert into GRADO(IDGRADO, IDNIVEL, NOMBRE) values(202,2,'SEGUNDO GRADO SECUNDARIA');
insert into GRADO(IDGRADO, IDNIVEL, NOMBRE) values(203,2,'TERCER GRADO SECUNDARIA');
insert into GRADO(IDGRADO, IDNIVEL, NOMBRE) values(204,2,'CUARTO GRADO SECUNDARIA');
insert into GRADO(IDGRADO, IDNIVEL, NOMBRE) values(205,2,'QUINTO GRADO SECUNDARIA');


-- Tabla TARIFAPERIODO

insert into TARIFAPERIODO(IDPERIODO,INGRESO,MATRICULA,PENSION,MORA,ACTIVO) 
values(2017,1000.0,500.0,500.0,1,1);

insert into TARIFAPERIODO(IDPERIODO,INGRESO,MATRICULA,PENSION,MORA,ACTIVO) 
values(2018,1500.0,600.0,600.0,1,0);

insert into TARIFAPERIODO(IDPERIODO,INGRESO,MATRICULA,PENSION,MORA,ACTIVO) 
values(2019,2000.0,700.0,700.0,1,0);



--Tabla SECCION




-- Tipos de Obligación

insert into TOBLIGACION(tobligacion,nombre) values(1,'Cuota de ingreso');
insert into TOBLIGACION(tobligacion,nombre) values(2,'Matricula');
insert into TOBLIGACION(tobligacion,nombre) values(3,'Pensión');

-- Estudiantes

SET IDENTITY_INSERT dbo.ALUMNO ON;  
GO 

insert into ALUMNO(CODALUMNO,apellido,nombre,dni,direccion,telefono,email)
values(1,'MOSCOL','HECTOR','54678923','SU CASA','EL ES','NOTIENE@GMAIL.COM');

insert into ALUMNO(CODALUMNO,apellido,nombre,dni,direccion,telefono,email)
values(2,'GUERRA','JESUS','89546723','SU CASA','EL ES','ELCIELO@GMAIL.COM');

insert into ALUMNO(CODALUMNO,apellido,nombre,dni,direccion,telefono,email)
values(3,'GARCIA','JOSE','89546723','SU CASA','EL ES','DONJOSE@GMAIL.COM');

GO

SET IDENTITY_INSERT dbo.ALUMNO OFF;
GO 

-- OBLIGACION

SET IDENTITY_INSERT dbo.OBLIGACION ON;  
GO

insert into OBLIGACION(idobligacion,descrip,codalumno,tobligacion,importe,fecven,
idmatricula,audempleado,audfecha,ESTADO)
values(1,'Pago de Ingreso',1,1,1000.0,'20170220',NULL,1,GETDATE(),'CANCELADO');

insert into OBLIGACION(idobligacion,descrip,codalumno,tobligacion,importe,fecven,
idmatricula,audempleado,audfecha,ESTADO)
values(2,'Pago de Ingreso',3,1,1000.0,'20170220',NULL,1,GETDATE(),'CANCELADO');

insert into OBLIGACION(idobligacion,descrip,codalumno,tobligacion,importe,fecven,
idmatricula,audempleado,audfecha,ESTADO)
values(3,'Pago de Ingreso',2,1,1000.0,'20170220',NULL,1,GETDATE(),'CANCELADO');

SET IDENTITY_INSERT dbo.OBLIGACION OFF;  
GO


-- PROCESO MATRICULA

SET IDENTITY_INSERT dbo.MATRICULA ON;  
GO

insert into MATRICULA(idmatricula,idseccion,       
codalumno,fecha,confirmada,activa,        
obs,audempleado,audfecha)
values(1,'P0001',1,GETdate(),0,1,'nose',1,getdate());

insert into MATRICULA(idmatricula,idseccion,       
codalumno,fecha,confirmada,activa,        
obs,audempleado,audfecha)
values(2,'S0001',2,GETdate(),0,1,'nose',1,getdate());

SET IDENTITY_INSERT dbo.MATRICULA OFF;  
GO

SET IDENTITY_INSERT dbo.OBLIGACION ON;  
GO

insert into OBLIGACION(idobligacion,descrip,codalumno,tobligacion,importe,fecven,
idmatricula,audempleado,audfecha)
values(4,'Pago de Matricula',1,2,500.0,'20170228',1,1,GETDATE());

insert into OBLIGACION(idobligacion,descrip,codalumno,tobligacion,importe,fecven,
idmatricula,audempleado,audfecha)
values(5,'Pago de Matricula',2,2,500.0,'20170228',2,1,GETDATE());

SET IDENTITY_INSERT dbo.OBLIGACION OFF;  
GO