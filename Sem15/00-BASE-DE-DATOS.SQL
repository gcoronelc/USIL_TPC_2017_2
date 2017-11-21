/*
Empresa        :  EGCC
Software       :  Sistema Financiero de Colegios
DBMS           :  SQL SERVER
Base de Datos  :  BDCOLEGIO
Script         :  Crea la base de datos
Responsable    :  Ing. Eric Gustavo Coronel Castillo
Telefono       :  (511) 9966-64457
Email          :  gcoronelc@gmail.com
Blog           :  http://gcoronelc.blogspot.com
Creado el      :  07-OCT-2017
*/



-- =============================================
-- Creación de la Base de Datos
-- =============================================

USE master;
go

IF( EXISTS ( SELECT name FROM master.sys.databases WHERE name = 'BDCOLEGIO' ) )
BEGIN
	DROP DATABASE BDCOLEGIO;
END;
go

CREATE DATABASE BDCOLEGIO;
go


-- =============================================
-- Seleccionar la Base de Datos
-- =============================================

USE BDCOLEGIO;


