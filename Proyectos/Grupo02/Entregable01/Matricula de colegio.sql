--Proyecto: Matricula de Colegio

-- Creacion de la base de datos
create database BD_Matricula

-- Seleccionar la base de datos
use BD_Matricula

--autorizacion

Alter authorization on database::bd_matricula to sa
-- Eliminar las tablas en caso existan

	DROP TABLE IF EXISTS alumno;



-- Creación de tablas 

create table alumno 
(
	cod_alum varchar(20) not null primary key,
	nom_alum varchar(30) not null,
	ape_pat_alum varchar(30) not null,
	ape_mat_alum varchar(30) not null,
	fec_nac datetime not null,
	dni_alum int not null,
	cod_pago varchar(20) not null,
	direc_alum varchar(50) not null,
	cod_padres varchar(20) not null,
	grado varchar(20) not null,
	secc varchar(20) not null,
	nivel varchar(20) not null,
	cod_turno varchar(20) not null,
	horario_alum varchar(20) not null,
	cod_dist varchar(20) not null,
	cod_curso varchar(20) not null,

	constraint fk_alumno_pago
	foreign key (cod_pago)
	references pago (cod_pago),

	constraint fk_alumno_grados
	foreign key (grado)
	references grados (grado),

	constraint fk_alumno_cursos
	foreign key (cod_curso)
	references cursos (cod_curso),

	constraint fk_alumno_padres
	foreign key (cod_padres)
	references padres (cod_padres),

	constraint fk_alumno_distrito
	foreign key (cod_dist)
	references distrito (cod_dist),

	constraint fk_alumno_turno
	foreign key (cod_turno)
	references turno (cod_turno)
)


create table Pago
(
	cod_pago varchar(20) not null primary key,
	tipo_pago varchar(20) not null,
	pago_matricula_unica decimal(10,2) not null,
	pago_matricula_anual decimal(10,2) not null,
	pago_mes decimal(10,2) not null,

	constraint fk_Pago_detallepago
	foreign key (tipo_pago)
	references detallepago (tipo_pago)

)


create table DetallePago
(
	 tipo_pago varchar(20) not null primary key,
	 cod_alum varchar(20) not null,
	 fec_pago datetime not null,

	constraint fk_detallepago_alumno
	foreign key (cod_alum)
	references alumno (cod_alum)
)


create table Profesor
(
	cod_prof varchar(20) not null primary key,
	nom_prof varchar(30) not null,
	ape_pat_prof varchar(30) not null,
	ape_mat_prof varchar(30) not null,
	dni_prof int not null,
	cod_dist varchar(20) not null,
	dirección varchar(30) not null,
	horario_prof varchar(20) not null,
	sueldo_prof decimal(10,2) not null,
	cod_turno varchar(20) not null,

	constraint fk_profesor_distrito
	foreign key (cod_dist)
	references distrito (cod_dist),

	constraint fk_profesor_turno
	foreign key (cod_turno)
	references turno (cod_turno)

)


create table Grados
(
	grado varchar(20) not null primary key,
	secc varchar(20) not null,
	cod_turno varchar(20) not null,
	nivel varchar(20) not null,


)


create table Cursos
(
	cod_curso varchar(20) not null primary key,
	cod_prof varchar(20) not null,
	grado varchar(20) not null,
	cod_turno varchar(20) not null,
	dias varchar(20) not null,
	horario_alum varchar(20) not null,
	horario_prof varchar(20) not null,

	constraint fk_cursos_profesor
	foreign key (cod_prof)
	references profesor (cod_prof),

	constraint fk_cursos_grados
	foreign key (grado)
	references grados (grado),

	constraint fk_cursos_turno
	foreign key (cod_turno)
	references turno (cod_turno)

)


create table Padres
(
	cod_padres varchar(20) not null primary key,
	nom_papa varchar(30) not null,
	ape_pat_papa varchar(30) not null,
	ape_mat_papa varchar(30) not null,
	direc_papa varchar(50) not null,
	dni_papa int not null,
	cel_papa varchar(9) null,
	nom_mama varchar(30) not null,
	ape_pat_mama varchar(30) not null,
	ape_mat_mama varchar(30) not null,
	direc_mama varchar(50) not null,
	dni_mama int not null,
	cel_mama varchar(9) null
	
)


create table Distrito
(
	cod_dist varchar(20) not null primary key,
	nombre_dist varchar(20) not null,
)


create table Turno
(
	cod_turno varchar(20) not null primary key,
	tipo_turno varchar(20) not null,
)




