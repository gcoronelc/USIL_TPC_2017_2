--=======================================================
--Proyecto: Matricula de Colegio
--=======================================================

--=======================================================
-- Creacion de la base de datos
--=======================================================

create database BD_Matricula

--=======================================================
-- Seleccionar la base de datos
--=======================================================

use BD_Matricula

--=======================================================
--autorizacion
--=======================================================

Alter authorization on database::bd_matricula to sa

--=======================================================
-- Eliminar las tablas en caso existan
--=======================================================


	DROP TABLE alumno;
	DROP TABLE Pago;
	DROP TABLE DetallePago;
	DROP TABLE Profesor;
	DROP TABLE Cursos;
	DROP TABLE Padres;
	DROP TABLE Distrito
	DROP TABLE Turno;
	DROP TABLE nivel;


--=======================================================
-- Creación de tablas 
--=======================================================

create table alumno 
(
	cod_alum varchar(5) not null primary key,
	nom_alum varchar(20) not null,
	ape_pat_alum varchar(20) not null,
	ape_mat_alum varchar(20) not null,
	fec_nac datetime not null,
	dni_alum int not null,
	direc_alum varchar(50) not null,
	grado varchar(5) not null,
	secc varchar(3) not null,
)

alter table	alumno
add
cod_nivel varchar(2) not null foreign key (cod_nivel) references nivel(cod_nivel),
cod_pago varchar(5) not null foreign key (cod_pago) references pago (cod_pago),
cod_padres varchar(5) not null foreign key (cod_padres) references padres (cod_padres),
cod_turno varchar(5) not null foreign key (cod_turno) references turno (cod_turno),
cod_dist varchar(5) not null foreign key (cod_dist) references distrito (cod_dist),
cod_curso varchar(5) not null foreign key (cod_curso) references cursos (cod_curso)

--==========================================================================================================

create table Pago
(
	cod_pago varchar(5) not null primary key,
	pago_matricula decimal(10,2) not null,
	pago_menesual decimal(10,2) not null,
	tipo_pago varchar(20) not null
)

--==========================================================================================================

create table DetallePago
(
	 tipo_pago varchar(20) not null primary key,
	 fec_pago datetime not null,
)

alter table detallepago
add
cod_pago varchar(5) not null foreign key (cod_pago) references pago (cod_pago),
cod_alum varchar(5) not null foreign key (cod_alum) references alumno (cod_alum)

--==========================================================================================================

create table Profesor
(
	cod_prof varchar(5) not null primary key,
	nom_prof varchar(30) not null,
	ape_pat_prof varchar(30) not null,
	ape_mat_prof varchar(30) not null,
	dni_prof varchar(8) not null,
	dirección varchar(30) not null,
	sueldo_prof decimal(10,2) not null,
)

alter table profesor
add
cod_dist varchar(5) not null foreign key (cod_dist) references distrito (cod_dist)

--==========================================================================================================

create table Cursos
(
	cod_curso varchar(5) not null primary key,
	dias varchar(20) not null,
	horario_alum varchar(20) not null,
	horario_prof varchar(20) not null,
)

alter table cursos
add 
cod_prof varchar(5) not null foreign key (cod_prof) references profesor (cod_prof),
cod_turno varchar(5) not null foreign key (cod_turno) references turno (cod_turno)

--==========================================================================================================

create table Padres
(
	cod_padres varchar(5) not null primary key,
	nom_papa varchar(30) not null,
	ape_pat_papa varchar(30) not null,
	direc_papa varchar(50) not null,
	dni_papa varchar(8) not null,
	cel_papa varchar(9) null,
	nom_mama varchar(30) not null,
	ape_pat_mama varchar(30) not null,
	direc_mama varchar(50) not null,
	dni_mama varchar(8) not null,
	cel_mama varchar(9) null
)

--==========================================================================================================

create table Distrito
(
	cod_dist varchar(5) not null primary key,
	nombre_dist varchar(30) not null,
)

--==========================================================================================================

create table Turno
(
	cod_turno varchar(5) not null primary key,
	tipo_turno varchar(10) not null,
)

--==========================================================================================================

create table nivel
(
	cod_nivel varchar(2) not null primary key,
	nom_nivel varchar(10) not null,
)

--=======================================================
-- Insertamos datos a las tablas 
--=======================================================

insert into Padres values('P0001','Alberto','quiñones','jr andes 658','76354909','984765789','Monica','Morales','jr andes 658','98767858','988999987')
insert into Padres values('P0002','Juan','Medrano','AV aviación 1029','56674563','633629995','Carolina','Sandoval','Av Aviación 1029','98876432','999000232')
insert into Padres values('P0003','Oliverio','Jojolete','Jr colca 123','56646123','987475839','Cristina','Malaver','Jr Colca 123','98358858','998773432')
insert into Padres values('P0004','Paul','Piedra','Jr Eliverto 124','09879908','900084564','Maria','Tarazona','Jr Eliverto 124','90991232','983827327')
insert into Padres values('P0005','Hector','Moscol','Av Las cucas 666','02946663','977346664','Manuela','Pajares','Av los Tronchos 666','97734823','788863423')
insert into Padres values('P0006','Scot','Guerrero','Av Olvios 345','77856724','988999993','Paula','Cordova','Av Olvios 345','98777483','988811283')
insert into Padres values('P0007','Jacinto','Silva','Jr Amazonas 606','99987742','977747382','Michelle','Cinta','Jr Amazonas 606','98322343','993929987')
insert into Padres values('P0008','Pinocho','Velez','Av String 366','14445344','922345234','Susy','Morelia','Av String 366','98000302','988922733')
insert into Padres values('P0009','Manuel','Madrid','Jr Muñecos 908','98263445','974663845','Sonia','Cisneros','Jr tristeza 443','23452412','992732187')
insert into Padres values('P0010','Michael','Raymondi','Av Peitos 887','27364443','988994832','Sandra','pirueta','Av Peitos 887','98000232','988372645')
insert into Padres values('P0011','Bonifacio','velazques','Jr Peru 675','09990832','900023432','Stefannia','Piturris','Jr Peru 675','98828120','999312345')
insert into Padres values('P0012','Fabricio','Uriarte','Av Titi 430','77739456','477384758','Silvia','Cornejo','Av Titi 430','92335432','988234222')
insert into Padres values('P0013','Anthony','Moscol','Jr Lucumas 209','00933342','884939394','Lucia','Coronel','Jr Lucumas 209','98993942','988483000')
insert into Padres values('P0014','Jesús','Principe','Av Creiston 883','74665374','99847583','Mixeli','Quiroz','Jr Vacky 456','98334557','988222300')
insert into Padres values('P0015','Cristopher','salinas','Jr Puno 111','98564738','999847787','leydi','Llauce','Jr Puno 111 658','98722228','988256787')
insert into Padres values('P0016','Alonse','Aquino','Jr Lalo 443','22374565','988374620','Camila','Manco','Jr Lalo 443','98111299','948848328')
insert into Padres values('P0017','Anuel','Flores','AV Tuveci 756','88764432','90009838','Patty','Anaya','Av Tuveci 756','98483823','983835021')
insert into Padres values('P0018','Benito','Farfan','Av Palmeras 4893','33475900','988483727','Katty','Gonzales','Av Palmeras 4893','93323567','988809974')
insert into Padres values('P0019','Willy','Cardenas','Jr Coquito 145','664736475','988848324','Alexa','Rojas','Jr Coquito 145','93235678','980482002')
insert into Padres values('P0020','Pedro','vega','Av Olmeros 532','99483635','999938345','Mirtha','Pavon','Av Olmeros 532','993221234','9990933387')

-- Tabla Distrito
insert into Distrito values('D0001','Cercado de Lima')
insert into Distrito values('D0002','Ate')
insert into Distrito values('D0003','Barranco')
insert into Distrito values('D0004','Breña')
insert into Distrito values('D0005','Comas')
insert into Distrito values('D0006','Chorrillos')
insert into Distrito values('D0007','El Agustino')
insert into Distrito values('D0008','Jesús María')
insert into Distrito values('D0009','La Molina')
insert into Distrito values('D0010','La Victoria')
insert into Distrito values('D0011','Lince')
insert into Distrito values('D0012','Magdalena del Mar')
insert into Distrito values('D0013','Miraflores')
insert into Distrito values('D0014','Pueblo Libre')
insert into Distrito values('D0015','Puente Piedra')
insert into Distrito values('D0016','Rimac')
insert into Distrito values('D0017','San Isidro')
insert into Distrito values('D0018','Independencia')
insert into Distrito values('D0019','San Juan de Mirafores')
insert into Distrito values('D0020','San luis')
insert into Distrito values('D0021','San Martin de Porres')
insert into Distrito values('D0022','San Miguel')
insert into Distrito values('D0023','Santiago de Surco')
insert into Distrito values('D0024','Surquillo')
insert into Distrito values('D0025','Villa Maria del Triunfo')
insert into Distrito values('D0026','San Juan de Lurigancho')
insert into Distrito values('D0027','Santa Rosa')
insert into Distrito values('D0028','Los Olivos')
insert into Distrito values('D0029','San Borja')
insert into Distrito values('D0030','Villa el Salvador')
insert into Distrito values('D0031','SAnta Anita')


-- Tabla turno
insert into turno values('turn1','Mañana')
insert into turno values('turn2','Tarde')


--tabla nivel
insert into nivel values('01','primaria')
insert into nivel values('02','secundaria')



--insert into alumno values('A001','Juan Carlos','Perez','Rodriguez','18/01/1999',89574375,'P0045','jr Los cedros','PF001','3ro','"A"','secundaria",

select * from Padres