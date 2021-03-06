SELECT * FROM produccion.tbEmprendimiento;
SELECT * FROM produccion.tbUbigeo;

-- 1. Crear un esquema con las iniciales de sus nombres y apellidos. Por ejemplo,
-- para Sofia Valentin Chavez su esquema sera SVCH (1 punto).
CREATE SCHEMA JAGM;

-- 2. Sobre su esquema crear una tabla con la siguiente estructura. No campos
-- adicionales. (3 puntos)
CREATE TABLE JAGM.tbUbigeo
(
codigo varchar(6) not null,
departamento varchar(100) not null,
provincia varchar(100) not null,
distrito varchar(100) not null
)

-- 3. Sobre su tabla creada insertar todos los ubigeos del departamento de Lima.
-- Tomar como fuente de informacion el archivo primer-parcial.xlsx (3puntos)
-- Excel: ="select '"&A2&"' union all "

INSERT INTO JAGM.tbUbigeo
SELECT '150101','LIMA','LIMA','LIMA' UNION ALL
SELECT '150102','LIMA','LIMA','ANCON' UNION ALL
SELECT '150103','LIMA','LIMA','ATE' UNION ALL
SELECT '150104','LIMA','LIMA','BARRANCO' UNION ALL
SELECT '150105','LIMA','LIMA','BRE�A' UNION ALL
SELECT '150106','LIMA','LIMA','CARABAYLLO' UNION ALL
SELECT '150107','LIMA','LIMA','CHACLACAYO' UNION ALL
SELECT '150108','LIMA','LIMA','CHORRILLOS' UNION ALL
SELECT '150109','LIMA','LIMA','CIENEGUILLA' UNION ALL
SELECT '150110','LIMA','LIMA','COMAS' UNION ALL
SELECT '150111','LIMA','LIMA','EL AGUSTINO' UNION ALL
SELECT '150112','LIMA','LIMA','INDEPENDENCIA' UNION ALL
SELECT '150113','LIMA','LIMA','JESUS MARIA' UNION ALL
SELECT '150114','LIMA','LIMA','LA MOLINA' UNION ALL
SELECT '150115','LIMA','LIMA','LA VICTORIA' UNION ALL
SELECT '150116','LIMA','LIMA','LINCE' UNION ALL
SELECT '150117','LIMA','LIMA','LOS OLIVOS' UNION ALL
SELECT '150118','LIMA','LIMA','LURIGANCHO' UNION ALL
SELECT '150119','LIMA','LIMA','LURIN' UNION ALL
SELECT '150120','LIMA','LIMA','MAGDALENA DEL MAR' UNION ALL
SELECT '150121','LIMA','LIMA','PUEBLO LIBRE' UNION ALL
SELECT '150122','LIMA','LIMA','MIRAFLORES' UNION ALL
SELECT '150123','LIMA','LIMA','PACHACAMAC' UNION ALL
SELECT '150124','LIMA','LIMA','PUCUSANA' UNION ALL
SELECT '150125','LIMA','LIMA','PUENTE PIEDRA' UNION ALL
SELECT '150126','LIMA','LIMA','PUNTA HERMOSA' UNION ALL
SELECT '150127','LIMA','LIMA','PUNTA NEGRA' UNION ALL
SELECT '150128','LIMA','LIMA','RIMAC' UNION ALL
SELECT '150129','LIMA','LIMA','SAN BARTOLO' UNION ALL
SELECT '150130','LIMA','LIMA','SAN BORJA' UNION ALL
SELECT '150131','LIMA','LIMA','SAN ISIDRO' UNION ALL
SELECT '150132','LIMA','LIMA','SAN JUAN DE LURIGANCHO' UNION ALL
SELECT '150133','LIMA','LIMA','SAN JUAN DE MIRAFLORES' UNION ALL
SELECT '150134','LIMA','LIMA','SAN LUIS' UNION ALL
SELECT '150135','LIMA','LIMA','SAN MARTIN DE PORRES' UNION ALL
SELECT '150136','LIMA','LIMA','SAN MIGUEL' UNION ALL
SELECT '150137','LIMA','LIMA','SANTA ANITA' UNION ALL
SELECT '150138','LIMA','LIMA','SANTA MARIA DEL MAR' UNION ALL
SELECT '150139','LIMA','LIMA','SANTA ROSA' UNION ALL
SELECT '150140','LIMA','LIMA','SANTIAGO DE SURCO' UNION ALL
SELECT '150141','LIMA','LIMA','SURQUILLO' UNION ALL
SELECT '150142','LIMA','LIMA','VILLA EL SALVADOR' UNION ALL
SELECT '150143','LIMA','LIMA','VILLA MARIA DEL TRIUNFO' UNION ALL
SELECT '150201','LIMA','BARRANCA','BARRANCA' UNION ALL
SELECT '150202','LIMA','BARRANCA','PARAMONGA' UNION ALL
SELECT '150203','LIMA','BARRANCA','PATIVILCA' UNION ALL
SELECT '150204','LIMA','BARRANCA','SUPE' UNION ALL
SELECT '150205','LIMA','BARRANCA','SUPE PUERTO' UNION ALL
SELECT '150301','LIMA','CAJATAMBO','CAJATAMBO' UNION ALL
SELECT '150302','LIMA','CAJATAMBO','COPA' UNION ALL
SELECT '150303','LIMA','CAJATAMBO','GORGOR' UNION ALL
SELECT '150304','LIMA','CAJATAMBO','HUANCAPON' UNION ALL
SELECT '150305','LIMA','CAJATAMBO','MANAS' UNION ALL
SELECT '150401','LIMA','CANTA','CANTA' UNION ALL
SELECT '150402','LIMA','CANTA','ARAHUAY' UNION ALL
SELECT '150403','LIMA','CANTA','HUAMANTANGA' UNION ALL
SELECT '150404','LIMA','CANTA','HUAROS' UNION ALL
SELECT '150405','LIMA','CANTA','LACHAQUI' UNION ALL
SELECT '150406','LIMA','CANTA','SAN BUENAVENTURA' UNION ALL
SELECT '150407','LIMA','CANTA','SANTA ROSA DE QUIVES' UNION ALL
SELECT '150501','LIMA','CA�ETE','SAN VICENTE DE CA�ETE' UNION ALL
SELECT '150502','LIMA','CA�ETE','ASIA' UNION ALL
SELECT '150503','LIMA','CA�ETE','CALANGO' UNION ALL
SELECT '150504','LIMA','CA�ETE','CERRO AZUL' UNION ALL
SELECT '150505','LIMA','CA�ETE','CHILCA' UNION ALL
SELECT '150506','LIMA','CA�ETE','COAYLLO' UNION ALL
SELECT '150507','LIMA','CA�ETE','IMPERIAL' UNION ALL
SELECT '150508','LIMA','CA�ETE','LUNAHUANA' UNION ALL
SELECT '150509','LIMA','CA�ETE','MALA' UNION ALL
SELECT '150510','LIMA','CA�ETE','NUEVO IMPERIAL' UNION ALL
SELECT '150511','LIMA','CA�ETE','PACARAN' UNION ALL
SELECT '150512','LIMA','CA�ETE','QUILMANA' UNION ALL
SELECT '150513','LIMA','CA�ETE','SAN ANTONIO' UNION ALL
SELECT '150514','LIMA','CA�ETE','SAN LUIS' UNION ALL
SELECT '150515','LIMA','CA�ETE','SANTA CRUZ DE FLORES' UNION ALL
SELECT '150516','LIMA','CA�ETE','ZU�IGA' UNION ALL
SELECT '150601','LIMA','HUARAL','HUARAL' UNION ALL
SELECT '150602','LIMA','HUARAL','ATAVILLOS ALTO' UNION ALL
SELECT '150603','LIMA','HUARAL','ATAVILLOS BAJO' UNION ALL
SELECT '150604','LIMA','HUARAL','AUCALLAMA' UNION ALL
SELECT '150605','LIMA','HUARAL','CHANCAY' UNION ALL
SELECT '150606','LIMA','HUARAL','IHUARI' UNION ALL
SELECT '150607','LIMA','HUARAL','LAMPIAN' UNION ALL
SELECT '150608','LIMA','HUARAL','PACARAOS' UNION ALL
SELECT '150609','LIMA','HUARAL','SAN MIGUEL DE ACOS' UNION ALL
SELECT '150610','LIMA','HUARAL','SANTA CRUZ DE ANDAMARCA' UNION ALL
SELECT '150611','LIMA','HUARAL','SUMBILCA' UNION ALL
SELECT '150612','LIMA','HUARAL','VEINTISIETE DE NOVIEMBRE' UNION ALL
SELECT '150701','LIMA','HUAROCHIRI','MATUCANA' UNION ALL
SELECT '150702','LIMA','HUAROCHIRI','ANTIOQUIA' UNION ALL
SELECT '150703','LIMA','HUAROCHIRI','CALLAHUANCA' UNION ALL
SELECT '150704','LIMA','HUAROCHIRI','CARAMPOMA' UNION ALL
SELECT '150705','LIMA','HUAROCHIRI','CHICLA' UNION ALL
SELECT '150706','LIMA','HUAROCHIRI','CUENCA' UNION ALL
SELECT '150707','LIMA','HUAROCHIRI','HUACHUPAMPA' UNION ALL
SELECT '150708','LIMA','HUAROCHIRI','HUANZA' UNION ALL
SELECT '150709','LIMA','HUAROCHIRI','HUAROCHIRI' UNION ALL
SELECT '150710','LIMA','HUAROCHIRI','LAHUAYTAMBO' UNION ALL
SELECT '150711','LIMA','HUAROCHIRI','LANGA' UNION ALL
SELECT '150712','LIMA','HUAROCHIRI','LARAOS' UNION ALL
SELECT '150713','LIMA','HUAROCHIRI','MARIATANA' UNION ALL
SELECT '150714','LIMA','HUAROCHIRI','RICARDO PALMA' UNION ALL
SELECT '150715','LIMA','HUAROCHIRI','SAN ANDRES DE TUPICOCHA' UNION ALL
SELECT '150716','LIMA','HUAROCHIRI','SAN ANTONIO' UNION ALL
SELECT '150717','LIMA','HUAROCHIRI','SAN BARTOLOME' UNION ALL
SELECT '150718','LIMA','HUAROCHIRI','SAN DAMIAN' UNION ALL
SELECT '150719','LIMA','HUAROCHIRI','SAN JUAN DE IRIS' UNION ALL
SELECT '150720','LIMA','HUAROCHIRI','SAN JUAN DE TANTARANCHE' UNION ALL
SELECT '150721','LIMA','HUAROCHIRI','SAN LORENZO DE QUINTI' UNION ALL
SELECT '150722','LIMA','HUAROCHIRI','SAN MATEO' UNION ALL
SELECT '150723','LIMA','HUAROCHIRI','SAN MATEO DE OTAO' UNION ALL
SELECT '150724','LIMA','HUAROCHIRI','SAN PEDRO DE CASTA' UNION ALL
SELECT '150725','LIMA','HUAROCHIRI','SAN PEDRO DE HUANCAYRE' UNION ALL
SELECT '150726','LIMA','HUAROCHIRI','SANGALLAYA' UNION ALL
SELECT '150727','LIMA','HUAROCHIRI','SANTA CRUZ DE COCACHACRA' UNION ALL
SELECT '150728','LIMA','HUAROCHIRI','SANTA EULALIA' UNION ALL
SELECT '150729','LIMA','HUAROCHIRI','SANTIAGO DE ANCHUCAYA' UNION ALL
SELECT '150730','LIMA','HUAROCHIRI','SANTIAGO DE TUNA' UNION ALL
SELECT '150731','LIMA','HUAROCHIRI','SANTO DOMINGO DE LOS OLLEROS' UNION ALL
SELECT '150732','LIMA','HUAROCHIRI','SURCO' UNION ALL
SELECT '150801','LIMA','HUAURA','HUACHO' UNION ALL
SELECT '150802','LIMA','HUAURA','AMBAR' UNION ALL
SELECT '150803','LIMA','HUAURA','CALETA DE CARQUIN' UNION ALL
SELECT '150804','LIMA','HUAURA','CHECRAS' UNION ALL
SELECT '150805','LIMA','HUAURA','HUALMAY' UNION ALL
SELECT '150806','LIMA','HUAURA','HUAURA' UNION ALL
SELECT '150807','LIMA','HUAURA','LEONCIO PRADO' UNION ALL
SELECT '150808','LIMA','HUAURA','PACCHO' UNION ALL
SELECT '150809','LIMA','HUAURA','SANTA LEONOR' UNION ALL
SELECT '150810','LIMA','HUAURA','SANTA MARIA' UNION ALL
SELECT '150811','LIMA','HUAURA','SAYAN' UNION ALL
SELECT '150812','LIMA','HUAURA','VEGUETA' UNION ALL
SELECT '150901','LIMA','OYON','OYON' UNION ALL
SELECT '150902','LIMA','OYON','ANDAJES' UNION ALL
SELECT '150903','LIMA','OYON','CAUJUL' UNION ALL
SELECT '150904','LIMA','OYON','COCHAMARCA' UNION ALL
SELECT '150905','LIMA','OYON','NAVAN' UNION ALL
SELECT '150906','LIMA','OYON','PACHANGARA' UNION ALL
SELECT '151001','LIMA','YAUYOS','YAUYOS' UNION ALL
SELECT '151002','LIMA','YAUYOS','ALIS' UNION ALL
SELECT '151003','LIMA','YAUYOS','AYAUCA' UNION ALL
SELECT '151004','LIMA','YAUYOS','AYAVIRI' UNION ALL
SELECT '151005','LIMA','YAUYOS','AZANGARO' UNION ALL
SELECT '151006','LIMA','YAUYOS','CACRA' UNION ALL
SELECT '151007','LIMA','YAUYOS','CARANIA' UNION ALL
SELECT '151008','LIMA','YAUYOS','CATAHUASI' UNION ALL
SELECT '151009','LIMA','YAUYOS','CHOCOS' UNION ALL
SELECT '151010','LIMA','YAUYOS','COCHAS' UNION ALL
SELECT '151011','LIMA','YAUYOS','COLONIA' UNION ALL
SELECT '151012','LIMA','YAUYOS','HONGOS' UNION ALL
SELECT '151013','LIMA','YAUYOS','HUAMPARA' UNION ALL
SELECT '151014','LIMA','YAUYOS','HUANCAYA' UNION ALL
SELECT '151015','LIMA','YAUYOS','HUANGASCAR' UNION ALL
SELECT '151016','LIMA','YAUYOS','HUANTAN' UNION ALL
SELECT '151017','LIMA','YAUYOS','HUA�EC' UNION ALL
SELECT '151018','LIMA','YAUYOS','LARAOS' UNION ALL
SELECT '151019','LIMA','YAUYOS','LINCHA' UNION ALL
SELECT '151020','LIMA','YAUYOS','MADEAN' UNION ALL
SELECT '151021','LIMA','YAUYOS','MIRAFLORES' UNION ALL
SELECT '151022','LIMA','YAUYOS','OMAS' UNION ALL
SELECT '151023','LIMA','YAUYOS','PUTINZA' UNION ALL
SELECT '151024','LIMA','YAUYOS','QUINCHES' UNION ALL
SELECT '151025','LIMA','YAUYOS','QUINOCAY' UNION ALL
SELECT '151026','LIMA','YAUYOS','SAN JOAQUIN' UNION ALL
SELECT '151027','LIMA','YAUYOS','SAN PEDRO DE PILAS' UNION ALL
SELECT '151028','LIMA','YAUYOS','TANTA' UNION ALL
SELECT '151029','LIMA','YAUYOS','TAURIPAMPA' UNION ALL
SELECT '151030','LIMA','YAUYOS','TOMAS' UNION ALL
SELECT '151031','LIMA','YAUYOS','TUPE' UNION ALL
SELECT '151032','LIMA','YAUYOS','VI�AC' UNION ALL
SELECT '151033','LIMA','YAUYOS','VITIS' 

SELECT * FROM JAGM.tbUbigeo;

-- 4. Liste el codigo, departamento, provincia y distrito de los ubigeos del
-- departamento de JUNIN y con poblacion menor a 6000. Ademas, considere
-- el siguiente cuadro para mostrar un mensaje considerando los rangos de la
-- poblaci�n (3 puntos)
SELECT codigo, departamento, distrito,
	CASE 
		WHEN poblacion <= 2000 THEN 'Poblacion [0-2000]' 
		WHEN poblacion > 2000 AND poblacion <= 4000 THEN 'Poblacion [2001-4000]'
		WHEN poblacion > 4000 AND poblacion <= 6000 THEN 'Poblacion [4001-6000]' 
	END AS mensaje
FROM produccion.tbUbigeo
WHERE departamento = 'JUNIN' AND
		poblacion < 6000;

-- 5. Listar en una sola consulta el departamento, provincia, distrito, poblacion y
-- area_km2 de los ubigeos (5 puntos).
-- NOTA: Los ubigeos que se visualizarcionn cumplen una, dos o tres de las
-- condiciones indicadas.

-- 5.1 Con departamento AMAZONAS, poblacion menor a 6000 y area_km2 mayor a 200.
-- 5.2 Con departamento HUANUCO, provincia DOS DE MAYO y poblacion mayor a 5000.
-- 5.3 Con JUAN dentro del nombre del distrito y estado del ubigeo 1.
SELECT  departamento, provincia, distrito, poblacion, areakm2
FROM produccion.tbUbigeo
WHERE (departamento = 'AMAZONAS' AND poblacion < 6000 AND areakm2 > 200 ) OR
	  (departamento = 'HUANUCO' AND provincia = 'DOS DE MAYO' AND poblacion > 5000 ) OR
	  (distrito = 'JUAN' AND estado = 1)

-- 6. Muestre el codigo, departamento, provincia, distrito y poblacion de aquellos
-- ubigeos vigentes. Ademas, presente los resultados ordenados de manera
-- descendente por departamento en un primer nivel y en un segundo nivel, por
-- poblacion de manera ascendente (3 puntos).
SELECT codigo, departamento, provincia, distrito, poblacion, estado
FROM produccion.tbUbigeo
WHERE estado = 1
ORDER BY departamento DESC, poblacion ASC

-- 7. Liste el ruc, razon social y nombre comercial de los 5 primeros
-- emprendimientos, ordenados por numero de ruc de manera ascendente, que
-- tengan la palabra COMERCIAL dentro de su razon social (2 puntos)
SELECT top 5 with ties ruc, razonsocial, nombrecomercial
FROM produccion.tbEmprendimiento
WHERE razonsocial LIKE '%comercial%'
ORDER BY ruc ASC
