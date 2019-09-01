/*3) Repetir la anterior, pero que como título de la primera columna aparezca
fabricante en vez de ID_FAB.*/
SELECT ID_FAB AS "FABRICANTE",ID_PRODUCTO,DESCRIPCION,PRECIO 
FROM PRODUCTOS;
/*EL ALIAS VA CON COMILLES DOBLES*/


/*6) Listar el nombre, mes y año del contrato de cada vendedor.*/
SELECT NOMBRE,TO_CHAR(FECHA_CONTRATO,'MONTH')AS "MES DE CONTRATO",TO_CHAR(FECHA_CONTRATO,'YYYY') AS "AÑO DE CONTRATO"
FROM VENDEDORES;


/*8) Obtener un listado alfabético de los empleados.*/
SELECT NOMBRE 
FROM VENDEDORES
ORDER BY NOMBRE;
/*POR DEFECTO YA ORDENA POR ORDEN ALFABETICU PERO TENGO QUE PONER EL ORDER BY NOMBRE*/


/*9) Obtener un listado de los empleados por orden de antigüedad en la empresa
(los de más antigüedad aparecen primero).*/
SELECT NOMBRE
FROM VENDEDORES
ORDER BY FECHA_CONTRATO;
/*YA SEA FECHES DE CONTRATOS O CIFRES NUMERIQUES AL ORDENADELES VAN APARECER LES CIFRES MAS BAJES ARRIBA DEL TOO
SI SON CONTRATOS VAN APAECER ARRIBA LOS MAS ANTIGUOS(PORQUE TIENEN LES CIFRES MAS BAJES)SI SE QUIER ORDENAR DE
MAYOS VALOR A MENOR O LES FECHES MAS RECIENTES HAI QUE PONER UN "DESC" TRAS FECHA_CONTRATO*/


/*15) Listar los códigos de los directores de las oficinas. El director 108 aparece
en dos oficinas,pero en este caso el valor 108 aparecerá una sola
vez.*/
SELECT DISTINCT DIRECTOR
FROM OFICINAS;
/*AÑADESE EL DISTINCT PA EVITAR QUE SE REPITAN VALORES*/


/*52) Hallar los pedidos con fecha anterior al 1 de enero de 2010. Mostrar el
número de pedido, el importe y la fecha.*/
SELECT NUM_PEDIDO,IMPORTE,FECHA_PEDIDO
FROM PEDIDOS
WHERE FECHA_PEDIDO<'01/01/2010';


/*54) Buscar el nombre de las empresas cuyo nombre…
- … acaba en ‘Corp’*/
SELECT EMPRESA 
FROM CLIENTES
WHERE EMPRESA LIKE '%Corp.';
/*SI PIDE QUE ACABE EL % VA ANTES DE LA PALABRA O LETRA, SIEMPRE CON COMILLES SIMPLES*/


/*54B)empieza por “Smiths”*/
SELECT EMPRESA 
FROM CLIENTES
WHERE EMPRESA LIKE 'Smiths%';
/*SI PIDE QUE EMPIEDZE PRIMERO VA EL TEXTO Y DEPUES EL PORCENTAJE*/
/*

'%corp.'      esto sifnifica que busca palabres que acaben en corp(NO OLVIDAR EL PUNTU FINAL)
'Smiths%'     esto significa que busca palabres que empiecen por Smith(NO OLVIDAR LES MAYUSCVULES)
'%A%'         esto significa que busca palabres que tengan una A en cualquier posicion
'_A%'         esto significa que busca palabres que tengan una A en segunda posicion


*/

