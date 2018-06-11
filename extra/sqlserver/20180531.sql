-- CONTANDO COLUMNAS DE UNA TABLA -- 6
SELECT COUNT(*)
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'taproducto' and TABLE_SCHEMA = 'dbo' 

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'TrxEvent' and TABLE_SCHEMA = 'rutex'  --21

-- CONTANDO TABLAS DE UN SCHEMA
--104 tablas
SELECT * FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'ROUTEX'

-- CONTANDO TABLAS DE UN SCHEMA
--135 tablas
SELECT * FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'RUEDA'

-- CREACION DE TABLA ESPEJO (SOLO ESTRUCTURA)
-- Idiomas 
select * into rutex.tmp_MaeGrupo
from rutex.MaeGrupo
where 1=0

-- AÑADIENDO PRIMARY KEY
ALTER TABLE rutex.tmp_Maetipo ADD CONSTRAINT PK_tmp_Maetipo PRIMARY KEY(ntipCodigo)

-- VARBINARY (EL TIPO DE DATOS VARBINARY UN TIPO DE ENCRIPTAMIENTO)

-- LENG(). VERIFICAMOS CUANTOS CARACTERES TIENE UN REGISTRO DE UN CAMPO EN ESPECIFICO
SELECT LEN(de_usuario) as co,* FROM DBO.tausuario order by co

-- SUBSTRING(). PARA UNA MIGRACION DONDE LOS TAMAÑOS DE LOS CAMPOS SEAN DIFERENTES 
SELECT SUBSTRING(em_usuario,1,50) as co,* FROM DBO.tausuario order by co
SELECT SUBSTRING(de_usuario,1,50) as co,* FROM DBO.tausuario order by co

-- INFORMACION DE CAMPOS DE UNA TABLA
select TABLE_NAME, COLUMN_NAME,COLUMN_DEFAULT, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH from INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='tausuario'

-- BUSQUEDA POR NOMBRE DE CAMPO EN TODAS LAS TABLAS DE UN SCHEMA ESPECIFICO
select COLUMN_NAME,* from INFORMATION_SCHEMA.COLUMNS
where TABLE_SCHEMA = 'RUEDA'
and COLUMN_NAME  like '%TXT%'

