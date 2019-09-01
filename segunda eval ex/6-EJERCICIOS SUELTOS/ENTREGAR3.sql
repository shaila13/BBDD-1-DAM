/*1) Listar el nombre, oficina, y fecha de contrato de todos los empleados.*/
SELECT NOMBRE,OFICINA_VEND,FECHA_CONTRATO 
FROM VENDEDORES;
/*2) Listar una tarifa (ids, descripción y precio) de productos*/
SELECT ID_FAB,ID_PRODUCTO,DESCRIPCION,PRECIO 
FROM PRODUCTOS;
/*3) Repetir la anterior, pero que como título de la primera columna aparezca
fabricante en vez de ID_FAB.*/
SELECT ID_FAB AS "FABRICANTE",ID_PRODUCTO,DESCRIPCION,PRECIO 
FROM PRODUCTOS;
/*4) Listar la ciudad, región y el superavit (ventas –objetivo) de cada oficina*/
SELECT CIUDAD,REGION,(VENTAS-OBJETIVO)AS  "SUPERABIT"
FROM OFICINAS;
/*5) De cada producto obtener su fabricante (ID_FAB), ID_PRODUCTO, su
descripción y el valor del inventario (EXISTENCIAS*PRECIO)*/
SELECT ID_FAB,ID_PRODUCTO,DESCRIPCION,(EXISTENCIAS*PRECIO) AS "VALOR_INVENTARIO"
FROM PRODUCTOS;
/*6) Listar el nombre, mes y año del contrato de cada vendedor.*/
SELECT NOMBRE,TO_CHAR(FECHA_CONTRATO,'MONTH')AS "MES DE CONTRATO",TO_CHAR(FECHA_CONTRATO,'YY') AS "AÑO DE CONTRATO"
FROM VENDEDORES;
/*7Listar las ventas en cada oficina con el formato: “22 tiene ventas de
186,042.00”*/




/*8) Obtener un listado alfabético de los empleados.*/
SELECT NOMBRE 
FROM VENDEDORES
ORDER BY NOMBRE;
/*9) Obtener un listado de los empleados por orden de antigüedad en la empresa
(los de más antigüedad aparecen primero).*/
SELECT NOMBRE
FROM VENDEDORES
ORDER BY FECHA_CONTRATO;
/*10) Obtener un listado de los empleados ordenados por volumen de ventas
sacando los de menores ventas primero.*/
SELECT NOMBRE
FROM VENDEDORES
ORDER BY VENTAS;
/*11) Obtener un listado de los empleados por orden de antigüedad en la empresa
empezando por los más recientemente incorporados.*/
SELECT NOMBRE
FROM VENDEDORES
ORDER BY FECHA_CONTRATO DESC;
/*12) Obtener un listado de los empleados ordenados por volumen de ventas
sacando primero los de mayores ventas.*/
SELECT NOMBRE 
FROM VENDEDORES
ORDER BY
VENTAS DESC;
/*13) Mostrar las ventas de cada oficina, ordenadas por orden alfabético de región
y dentro de cada región por ciudad.*/
SELECT OFICINA,REGION,CIUDAD,VENTAS
FROM OFICINAS
ORDER BY REGION,CIUDAD;
/*14) Listar las oficinas clasificadas por región y dentro de cada región por
superávit (ventas-objetivo) de modo que las de mayor superávit aparezcan las
primeras.*/
SELECT OFICINA,REGION,(VENTAS-OBJETIVO)AS "SUPERAVIT"
FROM OFICINAS
ORDER BY SUPERAVIT DESC;
/*15) Listar los códigos de los directores de las oficinas. El director 108 aparece
en dos oficinas, por lo tanto aparecerá dos veces en el resultado de la consulta.*/
SELECT DIRECTOR
FROM OFICINAS;
/*16) Repetir el listado anterior, pero en este caso el valor 108 aparecerá una sola
vez.*/
SELECT DISTINCT DIRECTOR
FROM OFICINAS;
/*17) Listar el nombre, la oficina y el rendimiento (ventas-cuota) de los empleados.*/
SELECT NOMBRE,OFICINA_VEND,(VENTAS-CUOTA)
FROM VENDEDORES;
/*18) Repetir la consulta anterior poniendo como nombre RENDIMIENTO al valor
calculado.*/
SELECT NOMBRE,OFICINA_VEND,(VENTAS-CUOTA)AS"RENDIMIENTO"
FROM VENDEDORES;
/*19) Mostrar las ventas de cada vendedor, ordenadas por la oficina en que trabaja
y dentro de cada oficina que aparezcan primero los que más venden.*/
SELECT NOMBRE ,OFICINA_VEND,VENTAS
FROM VENDEDORES
ORDER BY OFICINA_VEND,VENTAS DESC;
/*20) Listar el nombre de los empleados de la oficina 12.*/
SELECT NOMBRE 
FROM VENDEDORES
WHERE OFICINA_VEND=12;
/*21) Listar el nombre de los empleados de la oficina 12 que tengan más de 30
años.*/
SELECT NOMBRE
FROM VENDEDORES
WHERE OFICINA_VEND=12 AND EDAD>30;
/*22) Listar los empleados cuyas ventas superan su cuota*/
SELECT NOMBRE
FROM VENDEDORES
WHERE VENTAS>CUOTA;
/*23) Lista los empleados contratados antes del año 2008 (cuya fecha de contrato
sea anterior al 1 de enero de 2008).*/
SELECT NOMBRE
FROM VENDEDORES
WHERE FECHA_CONTRATO<'01/01/2008';
/*24) Obtener los empleados cuyo año de la fecha de contrato sea menor que
2008.*/
SELECT NOMBRE
FROM VENDEDORES
WHERE FECHA_CONTRATO<'01/01/2008';
/*25) Listar las oficinas cuyas ventas estén por debajo del 80% de su objetivo.*/
SELECT OFICINA,VENTAS,OBJETIVO
FROM OFICINAS
WHERE VENTAS<(0.8*OBJETIVO);
/*26) Listar las oficinas dirigidas por el empleado 108.*/
SELECT OFICINA
FROM OFICINAS
WHERE DIRECTOR=108;
/*27) Lista los empleados cuyas ventas estén comprendidas entre 100.000 y
500.000*/
SELECT NOMBRE
FROM VENDEDORES
WHERE VENTAS BETWEEN 100000 AND 500000;
/*28) Listar los empleados de las oficinas 11, 12 y 13*/
SELECT NOMBRE 
FROM VENDEDORES
WHERE OFICINA_VEND IN(11,12,13);
/*29) Listar las oficinas que no tienen director.*/
SELECT OFICINA
FROM OFICINAS
WHERE DIRECTOR IS NULL;
/*30) Listar los empleados asignados a alguna oficina (los que tienen un valor en
la columna oficina).*/
SELECT NOMBRE,OFICINA_VEND
FROM VENDEDORES;
/*31) Listar los empleados cuyo nombre termine por Smith.*/
SELECT NOMBRE  
FROM VENDEDORES
WHERE NOMBRE LIKE '%Smith';
/*32) Listar los empleados cuyo nombre contiene Rob.*/
SELECT NOMBRE  
FROM VENDEDORES
WHERE NOMBRE LIKE '%Rob%';
/* 33) Listar los empleados cuyo nombre contenga una r como tercera letra (dos
caracteres, la letra r, y cero o más caracteres.*/
SELECT NOMBRE
FROM VENDEDORES
WHERE NOMBRE LIKE '__r%';
/*34) Obtener una lista de todos los productos mostrando para cada uno su idfab,
idproducto, descripción, precio y precio con I.V.A. incluido (es el precio anterior
aumentado en un 21%).*/
SELECT ID_FAB,ID_PRODUCTO,DESCRIPCION,PRECIO,(PRECIO*1.21)AS "PRODUCTO + IVA"
FROM PRODUCTOS;
/*35) De cada pedido queremos saber su número de pedido, fabricante, producto,
cantidad, precio unitario (importe/cantidad) e importe.*/
SELECT NUM_PEDIDO,FABRICANTE,PRODUCTO,CANTIDAD,(IMPORTE/CANTIDAD)AS "PRECIO UNITARIO",IMPORTE
FROM PEDIDOS;
/*36) Listar de cada empleado su nombre, la fecha de su contrato y los años de
antigüedad en la empresa.*/
SELECT NOMBRE,FECHA_CONTRATO,(TO_CHAR(SYSDATE,'yyyy')-TO_CHAR(FECHA_CONTRATO,'yyyy'))AS"AÑOS EN EMPRESA" 
FROM VENDEDORES;
/*37) Obtener la lista de los clientes ordenados por código de representante
asignado. Visualizar todas la columnas de la tabla.*/
SELECT NUM_CLIENTE,EMPRESA,VENDEDOR_CLIENTE,LIMITE_CREDITO
FROM CLIENTES
ORDER BY NUM_CLIENTE;
/*38) Obtener las oficinas ordenadas por orden alfabético de región y dentro de
cada región por ciudad, si hay más de una oficina en la misma ciudad, aparecerá
primero la que tenga el número de oficina mayor.*/
SELECT OFICINA,REGION,CIUDAD
FROM OFICINAS
ORDER BY REGION,CIUDAD,OFICINA DESC;
/*39) Obtener los pedidos ordenados por fecha de pedido.*/
SELECT NUM_PEDIDO,FECHA_PEDIDO
FROM PEDIDOS
ORDER BY FECHA_PEDIDO;
/*40) Listar las oficinas, clasificadas en orden descendente de ventas, de modo
que las oficinas con mayores ventas aparezcan en primer lugar:*/
SELECT OFICINA,VENTAS
FROM OFICINAS
ORDER BY VENTAS DESC;
/*41) Listar las oficinas clasificadas en orden descendente de rendimiento de
ventas (ventas-objetivo), de modo que las oficinas con mejor rendimiento
aparezcan primero.*/
SELECT OFICINA,(VENTAS-OBJETIVO)AS "RENDIMIENTO"
FROM OFICINAS
ORDER BY RENDIMIENTO DESC;
/*42) Listar toda la información de los pedidos de marzo.*/




/*43) Listar los números de los empleados que tienen una oficina asignada.*/
SELECT NUM_EMPLE
FROM VENDEDORES
WHERE OFICINA_VEND IS NOT NULL;
/*44) Listar los números de las oficinas que no tienen director.*/
SELECT OFICINA
FROM OFICINAS
WHERE DIRECTOR IS NULL;
/*45) Listar los datos de las oficinas de las regiones del norte y del este (tienen
que aparecer primero las del norte y después las del este).*/



/*46) Listar los empleados de nombre Bob.*/
SELECT NOMBRE
FROM VENDEDORES
WHERE NOMBRE LIKE 'Bob%';
/*47) Listar los productos cuyo idproducto acabe en X.*/
SELECT ID_PRODUCTO,DESCRIPCION
FROM PRODUCTOS
WHERE ID_PRODUCTO LIKE '%X';
/*48) Mostrar el nombre, las ventas y la cuota del empleado número 105.*/
SELECT NOMBRE,VENTAS,CUOTA
FROM VENDEDORES
WHERE NUM_EMPLE=105;
/*49) Listar las oficinas cuyas ventas están por debajo del 80 por 100 del objetivo.
Mostrar la ciudad, las ventas y el objetivo.*/
SELECT OFICINA
FROM OFICINAS
WHERE VENTAS<(0.8*OBJETIVO);
/*50) Listar las oficinas no dirigidas por el empleado número 108. Mostrar la
ciudad y número de empleado del director.*/
SELECT OFICINA
FROM OFICINAS
WHERE DIRECTOR!=108;
/*51) Hallar los pedidos cuyo importe es superior a 20.000 e inferior a 29.999.
Mostrar el número de pedido e importe.*/
SELECT NUM_PEDIDO,IMPORTE
FROM PEDIDOS
WHERE IMPORTE>20000 AND IMPORTE<29999;
/*52) Hallar los pedidos con fecha anterior al 1 de enero de 2010. Mostrar el
número de pedido, el importe y la fecha.*/
SELECT NUM_PEDIDO,IMPORTE,FECHA_PEDIDO
FROM PEDIDOS
WHERE FECHA_PEDIDO<'01/01/2010';
/*53) Hallar todos los pedidos obtenidos por cuatro vendedores específicos (elegir
4 que ya existan). Mostrar el número de pedido, representante e importe.*/
SELECT NUM_PEDIDO,PRODUCTO,IMPORTE
FROM PEDIDOS
WHERE VENDEDOR IN (105,106,107,108);
/*54A) Buscar el nombre de las empresas cuyo nombre…
 acaba en ‘Corp’*/
SELECT EMPRESA 
FROM CLIENTES
WHERE EMPRESA LIKE '%Corp.';
/*54B)empieza por “Smiths”, acaba en “n” y en el medio hay una letra desconocida.*/
SELECT EMPRESA 
FROM CLIENTES
WHERE EMPRESA LIKE 'Smiths%'AND EMPRESA LIKE'%n______'AND EMPRESA LIKE '_%__%';
/*54c)empieza por “Smiths”, acaba en “n” y en el medio hay una letra desconocida
y acaba en “Corp.”.*/
SELECT EMPRESA 
FROM CLIENTES
WHERE EMPRESA LIKE 'Smiths%'AND EMPRESA LIKE'%n______'AND EMPRESA LIKE '_%__%'
AND EMPRESA LIKE '%Corp.';
/*55A) Hallar todos los nombres de vendedores que cumplan:
- Trabajan en Denver (22), New York (11) o Chicago (12).*/
SELECT NOMBRE
FROM VENDEDORES
WHERE OFICINA_VEND IN(22,11,12);
/*55B)- No tienen director*/
SELECT NOMBRE
FROM VENDEDORES
WHERE DIRECTOR IS NULL;
/*55C)- Fueron contratados a partir de junio de 2008.*/



/*55D)- Sus ventas están por encima de la cuota, pero tienen ventas de 600.000 o
menos.*/
SELECT NOMBRE
FROM VENDEDORES
WHERE VENTAS>CUOTA AND VENTAS<=600000;

/*56) Por cada producto mostrar el identificador del fabricante, el identificador del
producto, su descripción y el inventario (existencias por precio).*/
SELECT ID_FAB,ID_PRODUCTO,DESCRIPCION,(EXISTENCIAS*PRECIO)AS"INVENTARIO"
FROM PRODUCTOS;
/*57) Calcular a cada vendedor una nueva cuota, incrementando su cuota actual
en un 3 por 100 de sus ventas anuales. Mostrar el nombre de vendedor, su cuota
actual y su nueva cuota.*/
SELECT NOMBRE,CUOTA,((0.03*VENTAS)+CUOTA)AS "NUEVA CUOTA"
FROM VENDEDORES;
/*58) Listar las oficinas, clasificadas en orden alfabético por región, y dentro de
cada región por orden descendente de rendimiento de ventas (ventas menos
objetivo). Por cada oficina se mostrará la ciudad, la región y el rendimiento de
ventas.*/
SELECT CIUDAD,REGION,(VENTAS-OBJETIVO)AS"RENDIMIENTO"
FROM OFICINAS
ORDER BY REGION,RENDIMIENTO DESC;








/*CONSULTAS RESUMEN*/

/*1) Obtener una sola fila con el resultado de sumar todos los valores de la
columna ventas de la tabla oficinas*/



/*2) ¿Cuántos empleados tenemos?*/
SELECT COUNT(*)
FROM VENDEDORES
GROUP BY 



/*3) ¿Cuántos empleados tienen una oficina asignada?*/




/*4) Mostrar el acumulado de ventas de los empleados de la oficina 12.*/
SELECT VENTAS
FROM OFICINAS
WHERE OFICINA=12;
/*5) Obtener:
- la suma de las ventas de todos los vendedores*/
SELECT SUM(VENTAS)
FROM VENDEDORES;
/*¿Cuáles son las cuotas mínima y máxima asignadas a los vendedores?*/
SELECT MAX(CUOTA),MIN(CUOTA)
FROM VENDEDORES;
/*- ¿Cuántos vendedores superan su cuota?*/




/*6) Obtener una lista con la suma de las ventas de los empleados de cada oficina.*/
SELECT OFICINA,VENTAS
FROM OFICINAS;
/*7) Obtener la suma de las ventas de las oficinas agrupadas por región y ciudad:*/
SELECT VENTAS
FROM OFICINAS
ORDER BY REGION,CIUDAD;
 /*8) Obtener la suma de las ventas de los vendedores agrupados por oficina. Llamar a la columna suma VENTAS_TOTALES*/
SELECT OFICINA,VENTAS
FROM OFICINAS;

SELECT SUM(VENTAS),OFICINA_VEND
FROM VENDEDORES
GROUP BY OFICINA_VEND;
/*9) Queremos saber las oficinas con un promedio de ventas de sus empleados mayor que 300.000*/
SELECT OFICINA
FROM OFICINAS
WHERE VENTAS>300000;
/*10) ¿Cuál es la cuota media y las ventas medias de todos los empleados?*/
SELECT NOMBRE,AVG(CUOTA),AVG(VENTAS)
FROM VENDEDORES
GROUP BY
/*











