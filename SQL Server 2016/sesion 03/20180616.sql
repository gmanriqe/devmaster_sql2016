-- sesion03_20180516
-- bd_cuestionario.bak

/* =============
LIKE
==============*/

-- LIKE '%[p-s]'  -- "It search data from table parameter where sentence ending with p,q,r,s word."
-- LIKE '[0-9]' --It use for search only numeric value
-- LIKE '%table%' -- it use for search parameter from table where use "table" keyword'.
-- LIKE %[^p-r]  -- it set the condition where Not Ending With a Range of Characters
-- LIKE 'a%' -- cualquier valor que inicie con a
-- LIKE '%a' -- cualquier valor que finalice con a
-- LIKE '%or%' -- cualquier valor que contenga
-- LIKE '_r%' -- cualquier valor que contenga r en la segunda posicion
-- LIKE 'a%o' -- cualquier valor que inicie con a y finalice con o

-- elabore un reporte que ten el estado activo "A"
-- dentro de los tipos de control 1 y 5 que pertenezcan al modulo 7

select *
from cuestionario
where estado='A'
-- si tu utilizas beetwen, este buscara valores entre el rando del 1 al 5 (eso no te piden)
-- mientras que el in(1,5) solamente buscara valores del 1 y 5
and idtipocontrol in (1,5) 
and idmodulo=7

--elabore un reporte que el titulo termine con la letra d o a
select * from cuestionario
where TITULO like '%d'
or TITULO like '%a'


--elabore un reporte ue no contenga el caracter ':' y que sea del tipo control 1 o 2
-- OR and NOT LIKE 
select * from cuestionario
where (IDTIPOCONTROL = 1 or IDTIPOCONTROL = 2) 
-- where IDTIPOCONTROL in (1,2)
and titulo not like '%:%'

-- IN and NOT LIKE -- Por temas de tiempo de consulta es mejor utilizar IN
select * from cuestionario
where IDTIPOCONTROL in (1,2)
and titulo not like '%:%'

--elabore un reporte que en el titulo la segunda letra sea un punto
select * from cuestionario
where titulo like '_.%'

--elabore un reporte que el titulo inicie con la letra a y termine en :
select * from cuestionario
where titulo like 'a_%:'

--elabore un reporte que tenga la malama 'KM' despues de la palabra tama
select * from cuestionario
where titulo like '%tama%ha%'


/* =============
TOP
==============*/
-- trae los primeros 3 registros de la tabla cuestionario
select top 3 * from cuestionario

-- elabore un reporte que los 4 primeros registros contenga tipo control 5
select top 4 * from CUESTIONARIO
where IDTIPOCONTROL=2


/* =============
OFFSET-FETCH
==============*/
select * 
from CUESTIONARIO
order by id asc
offset 3 rows -- aqui le dices que los primero 3 registros no quieres que los cuente
fetch next 3 rows only -- aqui le dices que te muestre solamente 3 registros, quiere decir registro 4, 5 y 6

-- De manera dinamica
-- Paginado de sitios web
declare @tampagina as int=5;
declare @numpagina as int=3;

select * 
from CUESTIONARIO
order by id asc -- es importante declarar el 'ORDER BY' (sea ASC o DES)
offset (@numpagina-1)*@tampagina rows 
fetch next @tampagina rows only

/* =============
NULL
==============*/
select cu.hint,cu.* 
from CUESTIONARIO cu
where HINT is null

--elabore un reporte que ORDENCOLUMNA sea nulos y con valor 1
select cu.ORDENCOLUMNA,cu.* 
from CUESTIONARIO cu
where ORDENCOLUMNA is null or ORDENCOLUMNA=1

--elabore un reporte que NINT no tenga valores null
select cu.ORDENCOLUMNA,cu.* 
from CUESTIONARIO cu
where HINT is not null

--elabore un reporte de 5 registros con tipo de control 3 o 4 y que sean de pregunta entre 10 y 100
select top 5 cu.ORDENPREGUNTA,cu.IDTIPOCONTROL, *
from CUESTIONARIO cu
where IDTIPOCONTROL in (3,4) -- 3 o 4
and ORDENPREGUNTA between 10 and 100 -- rango del 10 al 100
order by id desc

/*=====================
INSERT
====================¨*/
--usando el BD: BANCA_MASTER
--excel comando: =CONCATENAR("INSERT INTO CALIFICACION(";B$2;",";C$2;")VALUES('";B3;"','";C3;"')")

select * from calificacion
-- insercion declarando parametros, quiere decir que solamente insertar aquellos valores que declaras
INSERT INTO CALIFICACION(nombre ,descripcion)VALUES('MUY MALA','0 puntos')
INSERT INTO CALIFICACION(nombre ,descripcion)VALUES('MALA','1 puntos')
INSERT INTO CALIFICACION(nombre ,descripcion)VALUES('REGULAR','2 puntos')
INSERT INTO CALIFICACION(nombre ,descripcion)VALUES('BUENA','3 puntos')
INSERT INTO CALIFICACION(nombre ,descripcion)VALUES('MUY BUENA','4 puntos')

delete from calificacion -- eliminacion de registros
DBCC CHECKIDENT (calificacion, RESEED,0) -- setiando identity a 0 "cero" o al valor que desees

-- insercion sin declarar parametros, quiere decir todas las columnas iran como valores
insert into colaborador
values ('71998055','jesus alexander','gonzales manriqe')

-- otro tipo de insert
insert into colaborador
select '987654321','hervey','quiñonez valentin'

insert into categoria
--SELECT 'clientes con cartera','cliente_cartera'
SELECT 'clientes sin cartera','cliente_sin_cartera'

--actualizacion de informacion con el UPDATE
select * from cliente
update cliente
set telefono='6567062'
where idcliente=1

--insertando registros a la tabla clientes
insert into cliente(dni,nombre,apellidos,correo,idcategoria)
select '71556877','rosa mercedes','gonzales',NULL,1 union all
select '19887355','gian franco','manrique valentin',NULL,2

--insertando mas registros a la tala clientes
-- EXCEL: =CONCATENAR("INSERT INTO CLIENTE(";B$2;",";C$2;",";D$2;",";E$2;")VALUES('";B3;"','";C3;"','";D3;"',";E3;")")
INSERT INTO CLIENTE(dni,nombre,apellidos,idcategoria)VALUES('81907654','gian carlos','manrique valentin',1)
INSERT INTO CLIENTE(dni,nombre,apellidos,idcategoria)VALUES('98789788','javier','diaz pichilingue',1)
INSERT INTO CLIENTE(dni,nombre,apellidos,idcategoria)VALUES('76654456','karol ','kondori',2)
INSERT INTO CLIENTE(dni,nombre,apellidos,idcategoria)VALUES('87678890','carmen maria','manrique quiñones',2)

--insercion en tipo de producto
insert into tipoproducto
select 'tipo A','esta tarjeta es para clientes de tipo A' union all
select 'tipo B','esta tarjeta es para clientes de tipo B' union all
select 'tipo C','esta tarjeta es para clientes de tipo c'

--insertando producto
--prestamos
--credito vehicular
--hipotecas
--credito domiciliario 
select * from producto

truncate table producto
DBCC CHECKIDENT (producto, RESEED,0)

insert into producto
select 'prestamos',NULL,1 union all
select 'credito vehicular',NULL,2 union all
select 'hipotecas',NULL,1 union all
select 'credito domiciliario',NULL,1 union all
select 'tarjeta debito',NULL,2

select * from contacto_registro
--insercion en la tabla contacto_registro
insert into contacto_registro(idcliente, idcolaborador, idproducto, comentario, fecharegistro, estado)
select 3,2,4,'hay dias que no cuenta con disponibilidad',getdate(),1

--insercion en la tabla calificacion_contacto
insert into calificacion_contacto(idcontacto,idcalificacion,comentario)
select 1,1,'El colaborador fue imprudente en la llamada'

--haciendo uso de inner join
select prd.nombreproducto, prd.descripcion, creg.comentario
from contacto_registro creg
inner join producto prd
on creg.idproducto = prd.idproducto

select cli.nombre,prod.nombreproducto,creg.fecharegistro,col.nombres +''+col.apellidos as nom_ape, col.dni, creg.comentario
from contacto_registro creg
inner join colaborador col
on creg.idcolaborador=col.idcolaborador
inner join cliente cli
on creg.idcliente=cli.idcliente
inner join producto prod
on creg.idcliente=prod.idproducto






