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