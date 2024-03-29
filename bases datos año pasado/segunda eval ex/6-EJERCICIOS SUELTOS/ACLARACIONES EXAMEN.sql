/*CUENTA LES FILES NO NULES DE LA COLUMNA OFICINA_VEND*/
SELECT COUNT(OFICINA_VEND)
FROM VENDEDORES;

/*CUENTA TOLES FILES INCUIDES LES NULES*/
SELECT COUNT(*)
FROM VENDEDORES
ORDER BY OFICINA_VEND;
/*VENDEDORES QUE TENGAN UNA A EN MINUSCULA EN CUALQUIER PARTE DEL NOMBRE*/
SELECT NOMBRE
FROM VENDEDORES
WHERE NOMBRE LIKE '%a%';

/*VENDEDORES QUE EMPIECEN POR B MAYUSCULA*/
SELECT NOMBRE
FROM VENDEDORES
WHERE NOMBRE LIKE'B%';

/*VENDEDORES QUE ACABEN EN S MINUSCULA*/
SELECT NOMBRE
FROM VENDEDORES
WHERE NOMBRE LIKE '%s';

/*VENDEDORES QUE TENGAN UNA r QUE NO SEA AL PRINCIPIO O AL FINAL DEL NOMBRE*/
SELECT NOMBRE 
FROM VENDEDORES
WHERE NOMBRE LIKE'_%r_%'





SELECT ABS(-123456)
FROM DUAL;

SELECT CEIL(1.12456)
FROM DUAL;

SELECT FLOOR(1.12456)
FROM DUAL;

SELECT FLOOR(1.12456)
FROM DUAL;

SELECT MOD(15,3)
FROM DUAL;

SELECT POWER(5,3)
FROM DUAL;

SELECT ROUND(5.3256456,3)
FROM DUAL;

SELECT SIGN(-123)
FROM DUAL;

SELECT SIGN(123)
FROM DUAL;

SELECT SQRT(25)
FROM DUAL;

SELECT AVG(IMPORTE)
FROM PEDIDOS;

SELECT COUNT(IMPORTE)
FROM PEDIDOS;

SELECT UPPER(NOMBRE)
FROM VENDEDORES;

SELECT LOWER(NOMBRE)
FROM VENDEDORES;

SELECT GREATEST(CUOTA,VENTAS)
FROM VENDEDORES;

SELECT CONCAT(CONCAT('HOLA ','QUE '),'ASE')
FROM DUAL;

/*EJERCICIOS BLOQUE 2*/
/*2*/
SELECT COUNT(APELLIDO) 
FROM EMPLE
WHERE APELLIDO LIKE 'A%' ;
/*3*/
SELECT AVG(SALARIO+COMISION)AS"SUELDO",COUNT(COMISION),MAX(SALARIO+COMISION),MIN(SALARIO+COMISION)
FROM EMPLE
WHERE DEPT_NO=30;



