/*EJERCICIO 1*/
SELECT APELLIDO "NOMBRE EMPLEADO", TO_CHAR(SALARIO,'999,999.99L')
FROM EMPLE
WHERE SALARIO BETWEEN 2000 AND 3000 AND UPPER(OFICIO)='VENDEDOR'
ORDER BY APELLIDO;

/*EJERCICIO 2*/
ACCEPT Vsal PROMPT 'INTRODUCE EL SALARIO';
SELECT *
FROM EMPLE
WHERE SALARIO>&Vsal

/*EJERCICIO 3*/
SELECT *
FROM EMPLE
WHERE APELLIDO LIKE'_A%';

/*EJERCICIO 4*/
SELECT EMP_NO "NUMERO EMPLEADO", APELLIDO "NOMBRE EMPLEADO", OFICIO, DIR, 
FECHA_ALT, TO_CHAR(SALARIO,'999,999.99L') "SALARIO", TO_CHAR(NVL(COMISION,0),'999,999L')"COMISION",TO_CHAR((SALARIO+NVL(COMISION,0)),'999,999.99L')"NOMINA",DEPT_NO
FROM EMPLE;

/*EJERCICIO 5*/
SELECT DEPT_NO,COUNT(APELLIDO) "EMPLEADOS POR DEPARTAMENTO"
FROM EMPLE
WHERE UPPER(OFICIO)='EMPLEADO'
GROUP BY DEPT_NO
ORDER BY DEPT_NO;

/*EJERCICIO 6*/
SELECT DEPT_NO,OFICIO,COUNT(APELLIDO) "PERSONAS TRABAJANDO"
FROM EMPLE
GROUP BY DEPT_NO, OFICIO
HAVING COUNT(APELLIDO)>1;

/*EJERCICIO 7*/
SELECT DEPT_NO, TO_CHAR(MAX(SALARIO),'999,999.99L')"SALARIO MAXIMO", TO_CHAR(MIN(SALARIO),'999,999.99L')"SALARIO MINIMO"
FROM EMPLE
GROUP BY DEPT_NO
ORDER BY DEPT_NO;

/*EJERCICIO 8*/
SELECT DEPT_NO, MAX(TRUNC((SYSDATE-FECHA_ALT)/365))"A�OS TRABAJANDO"
FROM EMPLE 
GROUP BY DEPT_NO;

/*EJERCICIO 9*/
SELECT *
FROM EMPLE
WHERE EXTRACT(YEAR FROM FECHA_ALT)>1981;

/*EJERCICIO 10*/
SELECT DEPT_NO AS "NUMERO DEPARTAMENTO", APELLIDO"NOMBRE",TO_CHAR(SALARIO,'999,999.99L')"SALARIO ACTUAL",TO_CHAR((SALARIO+SALARIO*0.05),'999,999.99L')"SALARIO SUBIDO 5%"
FROM EMPLE
WHERE DEPT_NO=20;

/*EJERCICIO 11*/
SELECT SUBSTR(AUTOR,INSTR(LTRIM(RTRIM(AUTOR)),',')+2)"NOMBRE AUTOR",SUBSTR(AUTOR,1,INSTR(AUTOR,',')-1)"APELLIDO AUTOR"
FROM LIBROS

/*EJERCICIO 12*/
SELECT CONCAT(INITCAP(SUBSTR(AUTOR,INSTR((AUTOR),',')+2)),INITCAP(LPAD(SUBSTR(AUTOR,1,INSTR(AUTOR,',')-1),LENGTH(SUBSTR(AUTOR,1,INSTR(AUTOR,',')-1))+1)))"NOMBRE Y APELLIDOS"
FROM LIBROS