SELECT POWER(3,2)FROM DUAL;/*CALCULA POTENCIA DE 3 ELEVADO A 2*/

SELECT SQRT (25) FROM DUAL;/*RAIZ CUADRADA DE 25*/

SELECT ROUND (2.5657,2)FROM DUAL;/*REDONDEA 2 DIGITOS EL NUMERO 2,5657*/

SELECT AVG (SALARIO)FROM EMPLE;/*MEDIA DEL SALARIO DEL SALARIO DE LA TABLA EMPLE*/

SELECT COUNT (COMISION) FROM EMPLE;

SELECT COUNT (*) FROM EMPLE;
/*EJERCICIOS PAG59*/

SELECT AVG (SALARIO) FROM EMPLE;/* MEDIA DEL SALARIO DE EMPLEADOS*/

SELECT AVG (SALARIO) FROM EMPLE WHERE DEPT_NO=10;/*CALCULAR EL SALARIO MEDIO DE LOS EMPLEADOS DEL DEPT 10*/

SELECT COUNT (*) FROM EMPLE;/* CALCULA EL NUMERO DE FILAS*/

SELECT COUNT(*) FROM EMPLE WHERE COMISION IS NULL;/*NUMERO DE FILAS DONDE LA COMISION ES NULA*/

SELECT MAX(SALARIO)FROM EMPLE;/*SALARIO MAS ALTO DE LA TABLA EMPLEADOS*/

SELECT (SUM(SALARIO)+ SUM(NVL(COMISION,0))) FROM EMPLE;/*SI ES NULO COGE 0 Y SI NOPILLA EL VALOR DE LA COMISION(NVL*/
/*CALCULAR EL IMPORTE DE LA NOMINA DE ESTE MES DE TODOS LOS EMPLEADOS*/

SELECT COUNT(DISTINCT OFICIO) FROM EMPLE;/*CALCULAR EL NUMERO DE OFICIOS DISTINTOS  QUE HAY EN LA TABLA EMPLEADOS*/

SELECT COUNT (DISTINCT OFICIO) FROM EMPLE WHERE DEPT_NO=10 OR DEPT_NO=20;/*CALCULAR EL NUMERO DE OFICIOS QUE HAY EN LOS DEPARTAMENTOS 10 Y 20*/

/*FUNCIONES QUE TRSBAJAN SOBRE LISTAS PAG60*/


SELECT CHR(5) FROM DUAL;/* DEVUELVE CARACTER DE 5*/

SELECT CONCAT ('HOLA','MUNDO')FROM DUAL;/*CONCATENA*/

SELECT INITCAP('pepin') FROM DUAL;

/*MANEJO DE FECHAS*/

SELECT SYSDATE FROM DUAL;/*DEVUELVE FECHA DE HOY*/

SELECT ADD_MONTHS(SYSDATE,2) FROM DUAL;/*A�ADE 2 MESES A LA FECHA DE HOY VALE TAMIEN CON RESTA (-2)*/

SELECT LAST_DAY(SYSDATE) FROM DUAL; /*DEVUELVE EL ULTIMO DIA DE ESTI MES*/

SELECT NEXT_DAY(SYSDATE,'lunes') FROM DUAL;/*DEVUELVE LA FECHA QUE TENDRA EL PROXIMO LUNES*/

SELECT MONTHS_BETWEEN('05/09/1990',SYSDATE)FROM DUAL;/*NUMERO DE MESES DE VIDA QUE TENGO*/

/*FUNCIONES DE CONVERSION PAG73*/

SELECT TO_CHAR(SYSDATE,'ddd') FROM DUAL;/*NUMERO DEL DIA DEL A�O*/

SELECT TO_CHAR(SYSDATE,'MM') FROM DUAL; /*NUMERO DEL MES DEL A�O*/

SELECT TO_CHAR(SYSDATE,'CC') FROM DUAL; /*NUMERO DEL SIGLO*/

SELECT TO_CHAR(SYSDATE,'MON') FROM DUAL;/*NOMBRE DEL MES*/

SELECT TO_CHAR(SYSDATE,'DAY') FROM DUAL;/* NOMBRE DEL DIA*/

SELECT SALARIO FROM EMPLE;

/*PAG77*/

SELECT TO_CHAR(SALARIO,'B9,999.99L') FROM EMPLE;     

SELECT TO_CHAR(COMISION,'RN')FROM EMPLE;

/*FUNCIONES DE CONVERSION TO_NUMBER PAG80*/

SHOW USER;/*EJECUTAR COMO SCRIPT  MUESTRA USUARIO*/

/*EJERCICIOS TEMA 4 BLOQUE 2*/

SELECT TRUNC (67.232,2)FROM DUAL;/* EL TRUNC CORTA EL NUMERO DE DIGITOS(2)*/

SELECT COUNT (APELLIDO) FROM EMPLE WHERE APELLIDO LIKE 'A%';/*LIKE=COMO*/