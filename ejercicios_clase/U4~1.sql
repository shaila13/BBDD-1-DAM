/*¿Cual sería la salida de ejecutar estas funciones?*/
--valor absoluto
select ABS(146) 
from dual;

select ABS(30)
from dual;

--redondea al entero superior, en este caso como es negativo al 2
select CEIL(-2.3)
from dual;

select CEIL(-2)
from dual;

--Calcula la potencia de numero
select POWER(10,0)
from dual;
--Redondea al entero superior
select ROUND(33.67)
from dual;
--Redondea al entero superior con dos decimales
select ROUND(-33.67,2)
from dual;
--Redondea al entero superior con un decimal
select ROUND(-33.27,1)
from dual;

select CEIL(2)
from dual;

select CEIL(1.3) 
from dual;

select FLOOR(2)
from dual;
--Redondea al entero inferior
select FLOOR(1.3)
from dual;

--Eleva el primer número a la potencia del segundo
select POWER(3,2)
from dual;

--quita los decimales si no se especifica nada
select TRUNC(67.232) 
from dual;

--quita los decimales hasta dos cifras
select TRUNC(67.232,2)
from dual;
--quita los decimales hasta una cifra
select TRUNC(67.58,1)
from dual;

select FLOOR(-2)
from dual;

--Redondea al entero inferior en este caso al ser negativo -3
select FLOOR(-2.3)
from dual;

--Calcula RESTO de dividir “m” entre “n”
select MOD(22,23)
from dual;
--Calcula RESTO de dividir “m” entre “n”
select MOD(10,3)
from dual;

--Calcula la potencia de un número como es negativo 0.33333
select POWER(3,-1)
from dual;

--Si m<0 trunca los “m” dígitos a la izquierda del punto decimal
select TRUNC(67.232,-2)
from dual;

select TRUNC(67.58,-1)
from dual;

--Redondea “n” con el número de dígitos de precisión “m”. Si m<0 redondea los “m” dígitos a la izquierda del punto decimal
select ROUND(-33.67,-2)
from dual;

select ROUND(-33.27,-1)
from dual;

/*
2. A partir de la tabla EMPLE, visualizar cuántos apellidos de los empleados empiezan por la letra ‘A’.
*/

select *
from emple 
where APELLIDO  like 'A%';

/*
3. Dada la tabla EMPLE, obtener el sueldo medio, el número de comisiones no nulas, el máximo sueldo y el mínimo 
sueldo  de  los  empleados  del  departamento  30.  Emplear  el  formato  adecuado  de  la  salida  para  las  cantidades 
numéricas.
*/
select trunc(avg(salario)) as "SUELDO MEDIO",count(comision), max(salario) as "Sueldazo", min(salario) as "mierdecilla"
from emple
where DEPT_NO=30;

/*
4.Contar las filas de LIBRERIA cuyo tema tenga, por lo menos, una ‘a’.
*/
select count(tema) from LIBRERIA where tema like '%a%';
/*
5.Visualizar los temas con mayor número de ejemplares de la tabla LIBRERIA y que tengan al menos, una ‘e’ (puede ser un tema o varios).
*/

select tema from LIBRERIA 
WHERE NUM_EJEMPLARES = (select max(NUM_EJEMPLARES) 
from LIBRERIA) and TEMA LIKE '%e%'; 

/*
6. Visualizar el número de estantes diferentes que hay en la tabla LIBRERIA.
--DISTINCT cuando queremos que nos devuelvan LOS QUE NO SE REPITAN
*/
select count(DISTINCT ESTANTE)
from libreria;

/*
7. Visualizar el número de estantes distintos que hay en la tabla LIBRERIA de aquellos temas que contienen al menos, una ‘e’.
*/
select count(DISTINCT ESTANTE)
from libreria
where TEMA LIKE '%e%';
/*
8. Dada la tabla MISTEXTOS, ¿que sentencia SELECT se debe ejecutar para tener este resultado?.
*/


/*
9. Visualizar los títulos de las tablas MISTEXTOS sin los caracteres punto y comillas, y en minúsculas.
*/
select LOWER(RTRIM(LTRIM(TITULO,'".'),'".')) 
FROM MISTEXTOS; 
/*
10. Dada la tabla LIBROS, escribir la sentencia SELECT que visualice dos columnas, una con el AUTOR y otra con el apellido del Autor.
*/
SELECT  AUTOR,SUBSTR(AUTOR,1,INSTR(AUTOR,',')-1)  "APELLIDO" 
FROM LIBROS; 

/*
11. Escribir la sentencia SELECT que visualice las columnas de AUTOR y otra columna con el nombre del autor(sin el apellido) de la tabla LIBROS.
*/
SELECT  AUTOR,SUBSTR(AUTOR,1,INSTR(AUTOR,',')-1)  "APELLIDO" 
FROM LIBROS; 

/*
12. A partir de la tabla LIBROS del usuario U4 realizar una sentencia SELECT que visualice en una columna, primero el nombre del autor y, luego, su apellido.
13. A  partir  de  la  tabla  LIBRERIA del  usuario U4 realizar  una  sentencia  SELECT  para  que  aparezcan  los  títulos 
ordenados por su número de caracteres.
14.Dada la tabla NACIMIENTOS de U4, realizar una sentencia SELECT que obtenga la siguiente salida:
*/
