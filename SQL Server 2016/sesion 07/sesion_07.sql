-- SESION 07 - 20180721

/** union **/
--  UNIFICA EL RESULTADO DE DOS O MAS TABLAS. POR DETRAS POSEE UNA CLAUSA DISTINCT. TENER EN CUENTA LA ESTRUCTURA DE LAS TABLAS
/** union all **/
--  UNIFICA EL RESULTADO DE DOS O MAS TABLAS Y DEVUELVE REGISTROS ASI SEAN REPETIDOS


-- Replicar una estructura + su data
select * into dbo.tbEmprendimiento
from produccion.tbEmprendimiento

select * from produccion.tbEmprendimiento
union
-- union all
select * from dbo.tbEmprendimiento


/** USO DE UNION EN LA CLAUSULA FROM **/ 
select ruc, count(ruc) from
(
	select * from produccion.tbEmprendimiento
	-- union
	union all
	select * from dbo.tbEmprendimiento
) tbconsolidado
group by ruc


/** 3.- INTERSECT **/
-- DEBES TENER EN CUENTA QUE TIENE QUE TENER UNA ESTRUCTURA EN COMUN
-- VALORES QUE SON COMUNES ENTRE TABLAS "MOSTRARA LA INTERSECCION - DATOS QUE HACEN MATCH EN AMBAS TABLAS"
insert into produccion.tbEmprendimiento
select '999999960', 'CANCHAS UCAYALI', 'CANCHAUCAYALI',1662,getdate(),1,'DEPORTES','B' union all
select '999999981', 'BODEGA DEL PUEBLO2', 'BODEGAPUEBLO2',1664,getdate(),1,'Dedicado a licores2' union all
select '999999982', 'BODEGA PEPE2', 'BODEGAPEPE2',1664,getdate(),1,'Dedicado a otros2' 

select * FROM produccion.tbEmprendimiento
INTERSECT
SELECT * FROM dbo.tbEmprendimiento

-- PUEDES UTILIZARLO: BUSCAR LOS NOMBRES COMERCIALES COMUNES EN AMBAS TABLAS
select ciiu from produccion.tbActividadEconomica
intersect
select ciiu from produccion.tbEmprendimientoActividad

/** IN/NOT IN **/
-- IN : AQUELLOS REGISTROS QUE ESTAN EN UNA TABLA Y TB ESTAN EN OTRA TABLA
-- NOT IN : AQUELLOS REGISTROS QUE NO ESTAN EN NINGUNA DE LAS DOS TABLAS 
select ciiu from produccion.tbActividadEconomica -- EXPLICO CESAR
-- where ciiu in -- 59
where ciiu not in  -- 358
(
select ciiu from produccion.tbEmprendimientoActividad
)


--4.- EXCEPT
-- VALORES QUE ESTAN EN UN CONJUNTO DETERMINADO, PERO NO ESTA EN EL OTRO CONJUNTO -- EXPLICO CESAR
select ciiu from produccion.tbActividadEconomica
except
select ciiu from produccion.tbEmprendimientoActividad


/*** 5.- FUNCIONES WINDOWS ***/
-- row_number -- cuenta todos los registros y los ennumera
-- rank -- cuenta huecos
-- dense_rank -- no cuenta huecos
-- ntile -- nos permite dividir cada particion en grupos
-- https://stackoverflow.com/questions/11183572/whats-the-difference-between-rank-and-dense-rank-functions-in-oracle

-- ROW_NUMBER 
-- SIN PARTICION
select * ,
 ROW_NUMBER() OVER(ORDER BY nombrecomercial) as posicion1,
 RANK() OVER(ORDER BY nombrecomercial) as posicion2,
 DENSE_RANK() OVER(ORDER BY nombrecomercial) as posicion3,
 NTILE(3) OVER(ORDER BY nombrecomercial) as posicion4
 from produccion.tbEmprendimiento
order by nombrecomercial

-- CON PARTICION -- PARTITION BY LO QUE HACE ES AGRUPARLO
select * ,
ROW_NUMBER() OVER(PARTITION BY idubigeo ORDER BY nombrecomercial) as posicion1,
RANK() OVER(PARTITION BY idubigeo ORDER BY nombrecomercial) as posicion2,
DENSE_RANK() OVER(PARTITION BY idubigeo ORDER BY nombrecomercial) as posicion3,
NTILE(3) OVER(PARTITION BY idubigeo ORDER BY nombrecomercial) as posicion4
from produccion.tbEmprendimiento
where idubigeo=1
order by nombrecomercial

-- CON EMPATE
alter table produccion.tbEmprendimiento add calificacion char(1)
update produccion.tbEmprendimiento
set calificacion='A'
where idubigeo not in (1664,1663)

update produccion.tbEmprendimiento
set calificacion='B'
where idubigeo in (1664,1663)

-- CONSULTA DE RESUMEN DE INFORMACION
-- SUB CONSULTA CON FUNCTION WINDOWS
select
calificacion,
idubigeo, 
total, 
ROW_NUMBER() over(PARTITION BY calificacion ORDER BY total asc) as row_number,
RANK() over(PARTITION BY calificacion ORDER BY total asc) as rank,
DENSE_RANK() over(PARTITION BY calificacion ORDER BY total asc) as dense_rank
from
(
select calificacion, idubigeo, count(distinct id) as total
from produccion.tbEmprendimiento
group by calificacion,idubigeo
)resumen


/** OPERADOR CROSS APPLY ,  **/
--ES CUENDO COINCIDE VALORES EN AMBAS TABLAS 
-- OPERADOR EXCLUSIVO EN EL FROM
-- PARA INTERSECCIONES CROSS APPLY
-- PARA QUE MI TABLA DERECHA ENVIE UN RESULTADO, MI TABLA IZQUIERDA DEBE OBLIGATORIAMENTE MANDARLE UN RESULTADO

select ae.ciiu, ae.descripcion, td.razonsocial from produccion.tbActividadEconomica as ae -- tabla izquierda
cross apply 
(
select top(3) * from produccion.tbEmprendimientoActividad ea
inner join produccion.tbEmprendimiento e
on ea.idemprendimiento = e.id
where ea.ciiu= ae.ciiu
order by razonsocial

) as td--tabla derecha (tabla derivada)


/** OPERADOR OUTER APPLY  **/
-- DEVUELVE TODO Y SI NO COINCIDE DEVUELVE VALORES EN NULL
-- MI TABLA DERECHA DEBE PASARLE UN VALOR OBLIGATORIAMENTE A LA TABLA IZQUIERDA

-- PRIMERO CREAR LA FUNCION DE TABLA
go
CREATE FUNCTION produccion.fn_ObtenerTop3
(
	@ciiu varchar(4)
)
returns table --funcion de tabla
return
(
	select top(3) * from produccion.tbEmprendimientoActividad ea
	inner join produccion.tbEmprendimiento e
	on ea.idemprendimiento = e.id
	where ea.ciiu= @ciiu
	order by razonsocial
)
select * from produccion.fn_ObtenerTop3('6201')

select * from produccion.tbActividadEconomica

-- SEGUNDO: CREAR EL OUTER APPLY
select ae.ciiu, ae.descripcion, td.razonsocial 
from produccion.tbActividadEconomica as ae -- tabla izquierda
cross apply 
--outer applu
produccion.fn_ObtenerTop3(ae.ciiu)
as td


/** XML **/
-- XML RAW
-- convertir un formato tradicional a un formato xml
select * 
from produccion.tbActividadEconomica
for xml raw -- raw me genera una fila por cada registro, y cada atributo de la tabla es lo que se visualiza de color rojo

-- XML AUTO
-- tener en cuenta que el orden del xml tiene que ver con el orden en la que declaras en el select 
select e.razonsocial, u.departamento, u.provincia, u.distrito, ae.descripcion
from produccion.tbEmprendimientoActividad ea
inner join produccion.tbEmprendimiento e on ea.idemprendimiento = e.id
inner join produccion.tbUbigeo u on e.idubigeo = u.id
inner join produccion.tbActividadEconomica ae on ea.ciiu = ae.ciiu
for xml auto

-- XML PATH
-- en el path añades la etiqueta que va absorver al resto
-- 1.- primera regla
select 
e.razonsocial as '@razonsocial', 
u.departamento as '@departamento', 
u.provincia as '@provincia', 
u.distrito as '@distrito', 
ae.descripcion as '@descripcion'
from produccion.tbEmprendimientoActividad ea
inner join produccion.tbEmprendimiento e on ea.idemprendimiento = e.id
inner join produccion.tbUbigeo u on e.idubigeo = u.id
inner join produccion.tbActividadEconomica ae on ea.ciiu = ae.ciiu
for xml path('empredimiento'), root('emprendimientos') -- path('xxx') renombra la fila -- roo('')  nodo raiz 


-- segunda regla
select 
e.razonsocial, 
u.departamento as 'ubigeo/@departamento', 
u.provincia as 'ubigeo/@provincia', 
u.distrito as 'ubigeo/@distrito', 
ae.descripcion
from produccion.tbEmprendimientoActividad ea
inner join produccion.tbEmprendimiento e on ea.idemprendimiento = e.id
inner join produccion.tbUbigeo u on e.idubigeo = u.id
inner join produccion.tbActividadEconomica ae on ea.ciiu = ae.ciiu
for xml path('empredimiento'), root('emprendimientos') -- path('xxx') renombra la fila -- roo('')  nodo raiz 


-- tercera regla
select 
e.razonsocial as 'emprendimient/razonsocial', 
u.departamento as 'ubigeo/departamento', 
u.provincia as 'ubigeo/provincia', 
u.distrito as 'ubigeo/distrito', 
ae.descripcion 'ubigeo/descripcion' -- lo convierto como hijo de ubigeo
from produccion.tbEmprendimientoActividad ea
inner join produccion.tbEmprendimiento e on ea.idemprendimiento = e.id
inner join produccion.tbUbigeo u on e.idubigeo = u.id
inner join produccion.tbActividadEconomica ae on ea.ciiu = ae.ciiu
for xml path('empredimiento'), root('emprendimientos')


-- SERVICIO SOAP : CONSUME XML
-- SERVICIO REST : CONSUME JSON

/** JSON **/
-- json auto 
-- los valores en null son desaparecidos. si quieres que aparescan los null  debes declarar include_null_values
select * 
from produccion.tbEmprendimiento
for json auto, include_null_values

-- 
select 
e.razonsocial , 
u.departamento , 
u.provincia , 
u.distrito , 
ae.descripcion  -- lo convierto como hijo de ubigeo
from produccion.tbEmprendimientoActividad ea
inner join produccion.tbEmprendimiento e on ea.idemprendimiento = e.id
inner join produccion.tbUbigeo u on e.idubigeo = u.id
inner join produccion.tbActividadEconomica ae on ea.ciiu = ae.ciiu
for json auto,include_null_values, root('resultado')

--
select 
e.razonsocial as [emprendimiento.razon] , 
e.ruc as  [emprendimiento.ruc],
/*u.departamento as [emprendimiento.ubigeo.departamento] , 
u.provincia as [emprendimiento.ubigeo.provincia],
u.distrito as [emprendimiento.ubigeo.distrito], */
u.distrito as [ubigeo.distrito], 
ae.descripcion as [actividad.nombre]
from produccion.tbEmprendimientoActividad ea
inner join produccion.tbEmprendimiento e on ea.idemprendimiento = e.id
inner join produccion.tbUbigeo u on e.idubigeo = u.id
inner join produccion.tbActividadEconomica ae on ea.ciiu = ae.ciiu
order by e.id
for json path, WITHOUT_ARRAY_WRAPPER


/** STORE PROCEDURE **/
-- CONJUNTO DE INSTRUCCIONES QUE HACEN ALGO
-- CRUD
-- SON UTILIZADOS MUCHO EN TEMAS DE RUTINA(= BASH)
-- QUE HAGA UN BACKUP TODAS LOS DIAS A UNA HORA EN ESPECIFICA


-- CREAR UN PROCEDIMIENTO DE LECTURA DE INFORMACION SIN PARAMETROS
create procedure produccion.usp_selReporteEmprendimientos
as
begin
	select 
	e.razonsocial,
	ae.descripcion,
	u.departamento,
	u.provincia,
	u.distrito
	from produccion.tbEmprendimientoActividad ea
	inner join produccion.tbEmprendimiento e on ea.idemprendimiento=e.id
	inner join produccion.tbActividadEconomica ae on ea.ciiu=ae.ciiu
	inner join produccion.tbUbigeo u on e.idubigeo=u.id
	order by e.id
end

-- alterando el procedure
alter procedure produccion.usp_selReporteEmprendimientos
as
begin
	select 
	e.id,
	e.razonsocial,
	ae.descripcion,
	u.departamento,
	u.provincia,
	u.distrito
	from produccion.tbEmprendimientoActividad ea
	inner join produccion.tbEmprendimiento e on ea.idemprendimiento=e.id
	inner join produccion.tbActividadEconomica ae on ea.ciiu=ae.ciiu
	inner join produccion.tbUbigeo u on e.idubigeo=u.id
	order by e.id
end

exec produccion.usp_selReporteEmprendimientos


-- CREAR UN PROCEDIMIENTO DE LECTURA DE INFORMACION CON PARAMETROS
create procedure produccion.usp_selReportePorEmprendimiento (@id int)
as
begin
	select 
	e.razonsocial,
	ae.descripcion,
	u.departamento,
	u.provincia,
	u.distrito
	from produccion.tbEmprendimientoActividad ea
	inner join produccion.tbEmprendimiento e on ea.idemprendimiento=e.id
	inner join produccion.tbActividadEconomica ae on ea.ciiu=ae.ciiu
	inner join produccion.tbUbigeo u on e.idubigeo=u.id
	where e.id=@id
	order by e.id
end

execute produccion.usp_selReportePorEmprendimiento 1
