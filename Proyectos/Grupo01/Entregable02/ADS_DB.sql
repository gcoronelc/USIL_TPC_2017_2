Create database ADS_DB
go

Create Table Alumno
(
	IdAlumno             char(4) NOT NULL,
    ApeAlumno            varchar(30) NOT NULL,
    NomAlumno            varchar(30) NOT NULL,
    DirAlumno            varchar(50) NULL,
    TelAlumno            varchar(20) NULL,
	IdSeccion			 char(4) NOT NULL,
    EmailAlumno          varchar(40) NOT NULL,
    CodigoAlu            varchar(15) NOT NULL,
	IdUsuario			 char(4) NOT NULL
)
go

Alter Table Alumno
Add Constraint PK_Alumno
Primary key (IdAlumno)
go

Create Table Profesores
(
	IdProfesor           char(4) NOT NULL,
	ApeProfesor          varchar(30) NOT NULL,
	NomProfesor          varchar(30) NOT NULL,
	DirProfesor          varchar(50) NULL,
	TelProfesor          varchar(20) NULL,
	EmailProfesor        varchar(40) NULL,
	CodigoPro            varchar(15) NOT NULL,
	IdUsuario			 char(4) NOT NULL
)
go

ALTER TABLE Profesores
ADD Constraint PK_Profesor
PRIMARY KEY (IdProfesor)
go

CREATE TABLE Empleado 
(
       IdEmpleado           char(4) NOT NULL,
       Clave                varchar(30) NOT NULL,
       ApeEmpleado          varchar(30) NOT NULL,
       NomEmpleado          varchar(30) NOT NULL,
       DirEmpleado          varchar(50) NULL,
       TelEmpleado          varchar(20) NULL,
       EmailEmpleado        varchar(40) NOT NULL 
)
go

ALTER TABLE Empleado
ADD CONSTRAINT PK_Empleado
PRIMARY KEY (IdEmpleado)
go

Create Table Usuario
(
	IdUsuario		char(4)	NOT NULL,
	Clave			varchar(30)	NOT NULL,
	Tipo			varchar(15) NOT NULL
)
go

ALTER TABLE Usuario
ADD CONSTRAINT PK_Usuario
PRIMARY KEY (IdUsuario)
go

CREATE TABLE Secciones
(
	IdSeccion		char(4)	NOT NULL,
	Vacantes		int		NOT NULL DEFAULT 20,
	Matriculados	int		NOT NULL,
	IdProfesor		char(4) NOT NULL,
	Grado			varchar(20)	NOT NULL,
	Nivel			varchar(20)	NOT NULL
)
go

ALTER TABLE Secciones
ADD CONSTRAINT PK_Secciones
PRIMARY KEY (IdSeccion)
go

CREATE TABLE Matriculas
(	
	IdMatricula		char(4)	NOT NULL,
	IdAlumno		char(4) NOT NULL,
	FecMatricula	datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	Tarifa			money	NOT NULL,
	Estado			varchar(10)	NOT NULL	DEFAULT	'PENDIENTE'
)
go

ALTER TABLE Matriculas
ADD CONSTRAINT PK_Matriculas
PRIMARY KEY (IdMatricula)
go

CREATE TABLE PagoIngreso
(
	IdPago			char(4)	NOT NULL,
	IdAlumno		char(4) NOT NULL,
	Monto			money	NOT NULL,
	FecPago			datetime	NOT NULL
)
go

ALTER TABLE PagoIngreso
ADD CONSTRAINT PK_PagoIngreso
PRIMARY KEY (IdPago)
go

CREATE TABLE EstadoPagos
(
	IdCronograma	char(4)	NOT NULL,
	IdAlumno		char(4)	NOT NULL,
	PagoIngreso		varchar(10)	NOT NULL DEFAULT 'PENDIENTE',
	PagoMatricula	varchar(10)	NOT NULL DEFAULT 'PENDIENTE',
	PagoMarzo		varchar(10)	NOT NULL DEFAULT 'PENDIENTE',
	PagoAbril		varchar(10)	NOT NULL DEFAULT 'PENDIENTE',
	PagoMayo		varchar(10)	NOT NULL DEFAULT 'PENDIENTE',
	PagoJunio		varchar(10)	NOT NULL DEFAULT 'PENDIENTE',
	PagoJulio		varchar(10)	NOT NULL DEFAULT 'PENDIENTE',
	PagoAgosto		varchar(10)	NOT NULL DEFAULT 'PENDIENTE',
	PagoSeptiembre		varchar(10)	NOT NULL DEFAULT 'PENDIENTE',
	PagoOctubre		varchar(10)	NOT NULL DEFAULT 'PENDIENTE',
	PagoNoviembre		varchar(10)	NOT NULL DEFAULT 'PENDIENTE',
	PagoDiciembre		varchar(10)	NOT NULL DEFAULT 'PENDIENTE',
)
go

ALTER TABLE EstadoPagos
ADD CONSTRAINT PK_EstadoPagos
PRIMARY KEY (IdCronograma)
go


--------------------------------------------------------------------------------------------------
-- FOREIGN KEYS
--------------------------------------------------------------------------------------------------

ALTER TABLE Alumno
ADD CONSTRAINT FK_Alumno_Usuario
FOREIGN KEY (IdUsuario)
REFERENCES Usuario
go

ALTER TABLE Alumno
ADD CONSTRAINT FK_Alumno_Seccion
FOREIGN KEY (IdSeccion)
REFERENCES Secciones
go

ALTER TABLE Profesores
ADD CONSTRAINT FK_Profesores_Usuario
FOREIGN KEY (IdUsuario)
REFERENCES Usuario
go

ALTER TABLE Secciones
ADD CONSTRAINT FK_Secciones_Profesores
FOREIGN KEY (IdProfesor)
REFERENCES Profesores
go

ALTER TABLE Matriculas
ADD CONSTRAINT FK_Matriculas_Alumno
FOREIGN KEY (IdAlumno)
REFERENCES Alumno
go

ALTER TABLE PagoIngreso
ADD CONSTRAINT FK_PagoIngreso_Alumno
FOREIGN KEY (IdAlumno)
REFERENCES Alumno
go

ALTER TABLE EstadoPagos 
ADD CONSTRAINT FK_EstadoPagos_Alumno
FOREIGN KEY (IdAlumno)
REFERENCES Alumno
go
	


	drop table Alumno
	drop table Profesores
	drop table PagoIngreso
	drop table Matriculas
	drop table EstadoPagos
	drop table Secciones
	drop table Usuario
	drop table Empleado
	go
