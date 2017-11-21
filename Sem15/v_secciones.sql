create view v_secciones(
  periodo, nivel, nomnivel, grado, nomgrado,
  seccion, nombre, vacantes, matriculados
) as
select 
  s.periodo, n.nivel, n.nombre,
  g.grado, g.nombre, s.seccion,
  s.nombre, s.vacantes, s.matriculados
from nivel n
join grado g on n.nivel = g.nivel
join seccion s on g.grado = s.grado;
go


select * from v_secciones;
go


