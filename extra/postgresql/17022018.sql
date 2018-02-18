-- VISUALIZAR TU MODELO ENTIDAD RELACION

-- CREACION DE TABLA
CREATE TABLE padron_catastro
(
  id SERIAL PRIMARY KEY,
  codcat VARCHAR(35) NOT NULL,
  suministro VARCHAR(11) NOT NULL,
  nombres VARCHAR(80) NOT NULL,
  identificion VARCHAR(20),
  direccion VARCHAR(100),
  urbanizacion VARCHAR(45),
  sector VARCHAR(40),
  manzana INTEGER,
  lote INTEGER,
  tipser VARCHAR(14),
  estcon VARCHAR(11),
  estagu VARCHAR(19),
  estdes VARCHAR(19),
  sitcon VARCHAR(20),
  categoria VARCHAR(32),
  tipmed VARCHAR(32),
  tarifa VARCHAR(50)
)

-- CREACION SECUENCIA (AUTOINCREMENT)
CREATE SEQUENCE padron_catastro_sequence
start 2
increment 1;

--INSERCION MASIVA DE DATA
INSERT INTO padron_catastro(codcat, suministro, nombres, identificion, direccion, urbanizacion, sector, manzana, lote, tipser, estcon, estagu, estdes, sitcon, categoria, tipmed, tarifa)
SELECT '001-03-01-01-0020-1485-001','00100091576','JORGE DEOMEDES CONDORI CALDERON','22069783','CAL PEDAGOGICO 0 S/N','NASCA - URB CASCO URBANO','NASCA - SECTOR 01',20,1485,'AD','Activo','Activo','Activo','Activo A Activo D','DOMESTICO A DOMESTICO D','AC   A  AC   D','NASCA: Agua  A   NASCA: Desagüe  D' UNION ALL
SELECT '001-03-01-01-0030-0579-001','00100091587','ANA MARIA INCISO CRUCES','40853185','CHB MAURICIO 0 MANUEL MERCEDES','NASCA - URB SAN MAURICIO','NASCA - SECTOR 01',30,579,'D','Activo','','Activo','Activo D','DOMESTICO D','AI   D','NASCA: Solo Desagüe  D' UNION ALL
SELECT '001-03-01-01-0010-0020-001','00101000013','CRUZ GRACIELA LOAYZA DE LA','00101000013','JR. ARICA 0 103','NASCA - URB CASCO URBANO','NASCA - SECTOR 01',10,20,'AD','Activo','Activo','Activo','Activo A Activo D','DOMESTICO A DOMESTICO D','AC   A  AC   D','NASCA: Agua  A   NASCA: Desagüe  D' UNION ALL
SELECT '001-03-01-01-0010-0030-001','00101000024','RAQUEL  TORRES CHAMANA','00101000024','JR. ARICA 0 109','NASCA - URB CASCO URBANO','NASCA - SECTOR 01',10,30,'AD','Activo','Activo','Activo','Activo A Activo D','COMERCIAL A COMERCIAL D','AC   A  AC   D','NASCA: Agua  A   NASCA: Desagüe  D' UNION ALL
SELECT '001-03-01-01-0010-0035-001','00101000035','PODER  JUDICIAL ','00101000035','JR. ARICA 115','NASCA - URB CASCO URBANO','NASCA - SECTOR 01',10,35,'AD','Activo','Cortado','Cortado','Cortado A Cortado D','COMERCIAL A COMERCIAL D','AC   A  AC   D','NASCA: Agua  A   NASCA: Desagüe  D' UNION ALL
SELECT '001-03-01-01-0010-0040-001','00101000046','  FARMACIA HUMANITARIA','00101000046','JR. ARICA 0 117','NASCA - URB CASCO URBANO','NASCA - SECTOR 01',10,40,'AD','Activo','Activo','Activo','Activo A Activo D','COMERCIAL A COMERCIAL D','AC   A  AC   D','NASCA: Agua  A   NASCA: Desagüe  D' UNION ALL
SELECT '001-03-01-01-0010-0050-001','00101000057','TOTAL ARTEFACTOS S.A.','00101000057','JR. ARICA 0 121','NASCA - URB CASCO URBANO','NASCA - SECTOR 01',10,50,'AD','Activo','Activo','Activo','Activo A Activo D','COMERCIAL A COMERCIAL D','AC   A  AC   D','NASCA: Agua  A   NASCA: Desagüe  D' UNION ALL
SELECT '001-03-01-01-0010-0060-001','00101000068','AMPARO  PEREZ DE ADAMS','00101000068','JR. ARICA 0 123','NASCA - URB CASCO URBANO','NASCA - SECTOR 01',10,60,'AD','Activo','Activo','Activo','Activo A Activo D','COMERCIAL A COMERCIAL D','AC   A  AC   D','NASCA: Agua  A   NASCA: Desagüe  D' UNION ALL
SELECT '001-03-01-01-0010-0070-001','00101000079','ROJAS S.A.C.  NEGOCIACIONES','20495031307','JR. ARICA 0 125','NASCA - URB CASCO URBANO','NASCA - SECTOR 01',10,70,'D','Activo','Inactivo','Activo','Inactivo A Activo D','COMERCIAL A COMERCIAL D','AC   A  AC   D','NASCA: Agua  A   NASCA: Solo Desagüe  D' UNION ALL
SELECT '001-03-01-01-0010-0071-001','00101000080','GRACIEL  LOAYZA DE BARZOLA','00101000080','JR. ARICA 0 127','NASCA - URB CASCO URBANO','NASCA - SECTOR 01',10,71,'AD','Activo','Activo','Activo','Activo A Activo D','COMERCIAL A COMERCIAL D','AC   A  AC   D','NASCA: Agua  A   NASCA: Desagüe  D' UNION ALL
SELECT '001-03-01-01-0010-0080-001','00101000091','RADIO  NASCA ','00101000091','JR. ARICA 0 129','NASCA - URB CASCO URBANO','NASCA - SECTOR 01',10,80,'AD','Inactivo','Inactivo','Inactivo','Inactivo A Inactivo D','COMERCIAL A COMERCIAL D','AC   A  AC   D','NASCA: Agua  A   NASCA: Desagüe  D' UNION ALL
SELECT '001-03-01-01-0010-0085-001','00101000104','RAQUEL  TORRES CHAMANA','00101000024','JR. ARICA 0 129','NASCA - URB CASCO URBANO','NASCA - SECTOR 01',10,85,'AD','Activo','Activo','Activo','Activo A Activo D','COMERCIAL A COMERCIAL D','AC   A  AC   D','NASCA: Agua  A   NASCA: Desagüe  D' UNION ALL
SELECT '001-03-01-01-0010-0090-001','00101000115','TELLO.  JOSE RAMOS','00101000115','JR. ARICA 0 131','NASCA - URB CASCO URBANO','NASCA - SECTOR 01',10,90,'AD','Activo','Cortado','Cortado','Cortado A Cortado D','COMERCIAL A COMERCIAL D','AC   A  AC   D','NASCA: Agua  A   NASCA: Desagüe  D' UNION ALL
SELECT '001-03-01-01-0010-0095-001','00101000126','REYNA M CUAYLA CONDORI','00101000126','JR. ARICA 0 133','NASCA - URB CASCO URBANO','NASCA - SECTOR 01',10,95,'AD','Activo','Activo','Activo','Activo A Activo D','DOMESTICO A DOMESTICO D','AC   A  AC   D','NASCA: Agua  A   NASCA: Desagüe  D' UNION ALL
SELECT '001-03-01-01-0010-0100-001','00101000137','PATRICIA F. CAMARGO CONDE','00101000137','JR. ARICA 0 139','NASCA - URB CASCO URBANO','NASCA - SECTOR 01',10,100,'AD','Activo','Activo','Activo','Activo A Activo D','COMERCIAL A COMERCIAL D','AC   A  AC   D','NASCA: Agua  A   NASCA: Desagüe  D' UNION ALL
SELECT '001-03-01-01-0010-0105-001','00101000148','LEON  CASTRO CANELO','00101000148','JR. ARICA 0 141','NASCA - URB CASCO URBANO','NASCA - SECTOR 01',10,105,'AD','Activo','Activo','Activo','Activo A Activo D','COMERCIAL A COMERCIAL D','AC   A  AC   D','NASCA: Agua  A   NASCA: Desagüe  D' UNION ALL
SELECT '001-03-01-01-0010-0110-001','00101000159','JESUS ROLANDO HERNANDEZ GARRIAZO','22072157','JR. ARICA 0 149','NASCA - URB CASCO URBANO','NASCA - SECTOR 01',10,110,'AD','Activo','Activo','Activo','Activo A Activo D','COMERCIAL A COMERCIAL D','AC   A  AC   D','NASCA: Agua  A   NASCA: Desagüe  D' UNION ALL
SELECT '001-03-01-01-0010-0115-001','00101000160','MARINA  IGNACIO GARCIA','00101000160','JR. ARICA 0 135','NASCA - URB CASCO URBANO','NASCA - SECTOR 01',10,115,'AD','Activo','Activo','Activo','Activo A Activo D','COMERCIAL A COMERCIAL D','AC   A  AC   D','NASCA: Agua  A   NASCA: Desagüe  D' UNION ALL
SELECT '001-03-01-01-0010-0120-001','00101000171','PODER JUDICIAL','00101000171','JR. ARICA 0 135','NASCA - URB CASCO URBANO','NASCA - SECTOR 01',10,120,'AD','Activo','Activo','Activo','Activo A Activo D','ESTATAL A ESTATAL D','AC   A  AC   D','NASCA: Agua  A   NASCA: Desagüe  D' UNION ALL
SELECT '001-03-01-01-0010-0125-001','00101000182','DEL PERU BCO POPULAR','00101000182','JR. ARICA 0 195','NASCA - URB CASCO URBANO','NASCA - SECTOR 01',10,125,'AD','Inactivo','Inactivo','Inactivo','Inactivo A Inactivo D','COMERCIAL A COMERCIAL D','AC   A  AC   D','NASCA: Agua  A   NASCA: Desagüe  D'

-- convercion minuscula
select lower(nombres) as minuscula, * 
from padron_catastro 
where lower(nombres) like '%capcha%' and lower(nombres) like '%julio cesar%'

-- CONCATENACION
SELECT codcat, suministro, nombres, identificacion, direccion, estcon, tarifa, CONCAT(nombres,' -- ' ,identificacion) 
FROM padron_catastro

-- SUBSTRING
SELECT codcat, SUBSTRING(codcat, 19,4) lote
FROM padron_catastro

SELECT suministro, identificacion,
	CASE
		WHEN suministro <> identificacion THEN 'ES DIFERENTE'
		WHEN suministro = identificacion THEN 'ES IGUAL'
	END as MENSAJE
FROM padron_catastro
WHERE suministro != identificacion

-- ficha
select
	CASE
	WHEN SUCURSAL='nasca' THEN 01
	WHEN SUCURSAL='vista alegre' THEN 05
	WHEN SUCURSAL='01' THEN 01
	END AS SUCURSAL,
	*
from nasca.ficha
where id=12

-- parametro
select variable, *
from nasca.parametro
where variable like '%sucur%'

-- ubigeo
select *
from nasca.ubigeo
where variable='sucursal'

-- codigo catastral
select *
from nasca.parametro
where variable='SECTOR'

-- tipo documento
select *
from nasca.parametro
where variable='TIPO_DOCUMENTO'

-- actualizar tipo documento
UPDATE nasca.parametro
SET valor='CE', CODIGO='CE'
WHERE id=90

-- distrito/centor poblado
SELECT *
FROM nasca.parametro
WHERE variable='CENTRO_PROBLADO_DISTRITO'

-- zona (SUB CONSULTA VERIFICAR)
SELECT distrito, (SELECT distrito
FROM nasca.ficha) as z, *
FROM nasca.ficha

-- TIPO DE HABILITACION
SELECT *
FROM nasca.parametro
WHERE variable='TIPO_HABILITACION' -- FALTA AÑADIR CASCO URBANO EN TIPO_HABILITACION

UPDATE 	nasca.parametro
SET	valor='CP.', codigo='CP.'
WHERE 	id=96

INSERT INTO parametro(variable, valor, codigo)
SELECT 'TIPO_HABILITACION',''

-- NOBRE HABILITACION
SELECT *
FROM nasca.parametro
WHERE variable='NOMBRE_HABILITACION'

INSERT INTO nasca.parametro(variable, valor, codigo)
SELECT 'NOMBRE_HABILITACION','CAJUCA I 5TA ESTRELLA','CAJUCA_I_5TA_ESTRELLA'

-- COMUNA -- CONCATENAR
select tipo_habilitacion,nombre_habilitacion,tipo_habilitacion||' '||nombre_habilitacion as comuna 
from nasca.ficha

-- TIPO DE VIA
SELECT *
FROM nasca.parametro
WHERE variable='TIPO_VIA' -- CONSULTAR VICTOR
ORDER BY codigo

UPDATE nasca.parametro
SET valor='CARRETERA', codigo='CARR.'
WHERE id=105

-- ESTADO SERVICIO
SELECT *
FROM nasca.parametro
WHERE variable='ESTADO_SERVICIO'

-- TIPO SERVICIO
SELECT *
FROM nasca.parametro
WHERE variable='TIPO_SERVICIO'

-- TIPO CONSTRUCCION
SELECT *
FROM nasca.parametro
WHERE variable='TIPO_CONSTRUCCION'

-- ESTADO CONSTRUCCION
SELECT *
FROM nasca.parametro
WHERE variable='ESTADO_CONSTRUCCION'

-- ESTADO_SERVICIO_AGUA
SELECT *
FROM nasca.parametro
WHERE variable='CIIU'