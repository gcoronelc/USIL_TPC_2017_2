create view v_secciones(
  periodo, nivel, nomnivel, grado, nomgrado,
  seccion, nombre, vacantes, matriculados
) as
select 
  s.idperiodo, n.idnivel, n.nombre,
  g.idgrado, g.nombre, s.idseccion,
  s.nombre, s.vacantes, s.matriculados
from nivel n
join grado g on n.idnivel = g.idnivel
join seccion s on g.idgrado = s.idgrado;
go


select * from v_secciones;
go


