-- =============================================
-- Creación de la Base de Datos
-- =============================================

DROP DATABASE IF EXISTS colegiodb;

CREATE DATABASE colegiodb;


-- =============================================
-- Seleccionar la Base de Datos
-- =============================================

USE colegiodb;


-- ==========================================================
-- Eliminar las tablas en caso existan
-- ==========================================================

   DROP TABLE IF EXISTS Alumnos;
   DROP TABLE IF EXISTS Pagos;
   DROP TABLE IF EXISTS PagoDetalle;
   DROP TABLE IF EXISTS Empleado;



-- =============================================
-- Creación de los Objetos de la Base de Datos
-- =============================================

CREATE TABLE Alumnos (
	chr_codalu       CHAR(3) NOT NULL,
	vch_nombres VARCHAR(40) NOT NULL,
	vch_apellidos      VARCHAR(40) NOT NULL,
	vch_nivel     VARCHAR(20) NOT NULL,
	vch_grado     VARCHAR(20) NOT NULL,
	chr_seccion      CHAR(5) DEFAULT 'A' NOT NULL,
	CONSTRAINT PK_Alumno 
		PRIMARY KEY (chr_codalu),
	KEY idx_codalu (chr_codalu)		
) ENGINE = INNODB ;

CREATE TABLE Pagos (
	chr_codpago       CHAR(3) NOT NULL,
	chr_codalu      VARCHAR(3) NOT NULL,
	vch_tippago      VARCHAR(30) NOT NULL,
	CONSTRAINT PK_Pagos 
		PRIMARY KEY (chr_codpago),
		KEY idx_codpago (chr_codpago),
	CONSTRAINT fk_pagos_alumnos
		FOREIGN KEY (chr_codalu)
		REFERENCES Alumnos (chr_codalu)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
		KEY idx_codalu (chr_codalu)
) ENGINE = INNODB ;

CREATE TABLE PagoDetalle (
	chr_coddet      CHAR(3) NOT NULL,
	chr_codpago      CHAR(3) NOT NULL,
	chr_codalu      VARCHAR(3) NOT NULL,
	vch_desc     VARCHAR(40) NOT NULL,
	vch_monto      VARCHAR(25) NOT NULL,
	vch_fecha       VARCHAR(30) NOT NULL,
	CONSTRAINT PK_PagoDetalle 
		PRIMARY KEY (chr_coddet),
		KEY idx_coddet (chr_coddet),
	CONSTRAINT fk_codpago
		FOREIGN KEY (chr_codpago)
		REFERENCES Pagos (chr_codpago)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
		KEY idx_codpago (chr_codpago)
) ENGINE = INNODB ;

CREATE TABLE Empleado (
       chr_codempleado       CHAR(3) NOT NULL,
       vch_apellido             varchar(30) NOT NULL,
       vch_nombre               varchar(30) NOT NULL,
       vch_usuario              varchar(15) NOT NULL,
       vch_clave                varchar(10) NOT NULL,
       CONSTRAINT pk_empleado PRIMARY KEY (idempleado),
       KEY idx_empleado (idempleado)
   ) ENGINE = INNODB;
   
   
   --Alumnos
   Insert Into Alumnos( chr_codalu,vch_nombres,vch_apellidos,vch_nivel,vch_grado,chr_seccion) 
    Values('001','Marco Antonio','Herrera Chavez','Primaria','Quinto','A');
	Insert Into Alumnos( chr_codalu,vch_nombres,vch_apellidos,vch_nivel,vch_grado,chr_seccion) 
    Values('002','Alex Antonio','Chacon Palomino','Primaria','Segundo','A');
	Insert Into Alumnos( chr_codalu,vch_nombres,vch_apellidos,vch_nivel,vch_grado,chr_seccion) 
    Values('003','Anita Alondra','Castro Rojas','Primaria','Tercero','B');
	Insert Into Alumnos( chr_codalu,vch_nombres,vch_apellidos,vch_nivel,vch_grado,chr_seccion) 
    Values('004','Luciana Maria','Quintana Guia','Primaria','Primero','B');
	Insert Into Alumnos( chr_codalu,vch_nombres,vch_apellidos,vch_nivel,vch_grado,chr_seccion) 
    Values('005','Angel Manuel','Diaz Cueva','Secundaria','Cuarto','A');
	Insert Into Alumnos( chr_codalu,vch_nombres,vch_apellidos,vch_nivel,vch_grado,chr_seccion) 
    Values('006','Martin Alonso','Carpio Chavez','Secundaria','Segundo','B');
	Insert Into Alumnos( chr_codalu,vch_nombres,vch_apellidos,vch_nivel,vch_grado,chr_seccion) 
    Values('007','Cristina Josefina','Yang Estes','Secundaria','Quinto','B');
	Insert Into Alumnos( chr_codalu,vch_nombres,vch_apellidos,vch_nivel,vch_grado,chr_seccion) 
    Values('008','Ben William','Karev Owen','Secundaria','Segundo','A');
	Insert Into Alumnos( chr_codalu,vch_nombres,vch_apellidos,vch_nivel,vch_grado,chr_seccion) 
    Values('009','Joselyn Carla','Flores Tevez','Primaria','Primero','A');
	Insert Into Alumnos( chr_codalu,vch_nombres,vch_apellidos,vch_nivel,vch_grado,chr_seccion) 
    Values('010','Mauricio Gonzalo','Maldonado Rojas','Secundaria','Cuarto','B');
	
	
	


USE MYSQL;
GRANT ALL PRIVILEGES ON *.* TO 'coelgio'@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION;
FLUSH PRIVILEGES;
USE colegiodb;

USE MYSQL;
GRANT ALL PRIVILEGES ON *.* TO 'colegio'@'localhost' IDENTIFIED BY 'admin' WITH GRANT OPTION;
FLUSH PRIVILEGES;
USE colegiodb;
