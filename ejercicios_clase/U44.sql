Select greatest ('Benito','Jorge','Isabel') from DUAL;
DESC DUAL;
SELECT CHR(65) FROM DUAL;

SELECT CONCAT('Hola','mundo')FROM DUAL;
SELECT LOWER('HOLA') FROM DUAL;
SELECT UPPER('hola') FROM DUAL;
SELECT INITCAP('hola mundo') FROM DUAL;
SELECT LPAD('X',5,'*')FROM DUAL;
SELECT LPAD('X',10,'>+') FROM DUAL;
SELECT RPAD('X',5,'*') FROM DUAL;
SELECT RPAD('X',10,'>+')FROM DUAL;

SELECT LTRIM('hola') FROM DUAL;
SELECT LTRIM('hola', 'h')FROM DUAL;
SELECT RTRIM('hola')FROM DUAL;
SELECT RTRIM('hola', 'la')FROM DUAL;
SELECT REPLACE ('blanco negro','o','a')FROM DUAL;
SELECT REPLACE ('blanco negro','o')FROM DUAL;
SELECT SUBSTR('ABCDEFG',3,2)FROM DUAL;
SELECT SUBSTR('ABCDEFG',-3,2)FROM DUAL;
SELECT TRANSLATE('SQLPLUS','SQLU',123) FROM DUAL;

SELECT ASCII('a') FROM DUAL;
SELECT ASCII('DAI')FROM DUAL;
SELECT INSTR('II VUELTA CICLISTA A TALAVERA','A',3,2) FROM DUAL;
SELECT INSTR('II VUELTA CICLISTA A TALAVERA','TA',20)FROM DUAL;
SELECT LENGTH('HOLA MUNDO')FROM DUAL;

SELECT SYSDATE FROM DUAL;
SELECT ADD_MONTHS(sysdate,2) FROM DUAL;
SELECT ADD_MONTHS(sysdate,-2)FROM DUAL;
SELECT LAST_DAY(sysdate) FROM DUAL;
SELECT MONTHS_BETWEEN(sysdate,'04-06-2017') FROM DUAL;
SELECT NEXT_DAY(sysdate,'LUNES') FROM DUAL;
SELECT EXTRACT(MONTH FROM SYSDATE) FROM DUAL;

--Visualizar en la tabla EMPLE el número de empleados que hay en cada departamento.
SELECT dept_no, COUNT(*) FROM EMPLE
group by dept_no;
--Modificar la sentencia anterior para que aparezca ordenado por departamento.
SELECT dept_no, COUNT(*) FROM EMPLE
group by dept_no
ORDER BY DEPT_NO;
--Visualizar en la tabla EMPLE todos los departamentos en los que hay más de 4 empleados.
SELECT dept_no, COUNT(*) FROM EMPLE
group by dept_no
having COUNT(*)>4;

--Visualizar el listado anterior descendentemente en función al número de empleados que aparecen en cada departamento.
SELECT dept_no, COUNT(*) FROM EMPLE
group by dept_no
having COUNT(*)>4 order by dept_no desc;

--Obtener la suma de salarios, el salario máximo y el salario mínimo de cada departamento con salida formateada.
SELECT SUM(EMPLE.SALARIO), MAX(SALARIO), MIN(SALARIO) FROM EMPLE
group by dept_no;
--Obtener los nombres de los departamentos que tengan más de 4 personas.
SELECT dept_no, DEPART.DNOMBRE
FROM DEPART
WHERE DEPT_NO IN (
SELECT DEPT_NO FROM EMPLE 
        GROUP BY DEPT_NO
        HAVING COUNT (*)>4);
        
--Calcular el número de empleados que realizan cada OFICIO en cada DEPARTAMENTO. Los datos a visualizar son: Departamento, Oficio y Número de Empleados.
--SOLO SE PUEDE SACAR POR PANTALLA LOS DATOS QUE HEMOS AGRUPADO!!!
SELECT COUNT (*), DEPT_NO, OFICIO
FROM EMPLE
GROUP BY DEPT_NO,OFICIO 
ORDER BY DEPT_NO;
--Cual es el número de empleados del departamento que más empleados tiene.
SELECT MAX(COUNT (*))
FROM EMPLE
GROUP BY DEPT_NO;

--Visualizar el número de departamento, el nombre de departamento y el número de empleados del departamento con más empleados.
--NOS SACA LAS QUE ESTAN RELACIONADAS CON LA CLAVE PRIMARIA Y LA FOREING KEY
SELECT EMPLE.DEPT_NO,DEPART.DNOMBRE, COUNT(*)
FROM EMPLE, DEPART
WHERE EMPLE.DEPT_NO=DEPART.DEPT_NO
GROUP BY EMPLE.DEPT_NO, DEPART.DNOMBRE
HAVING COUNT(*)=
(SELECT MAX(COUNT(*))FROM EMPLE
        GROUP BY DEPT_NO);

--Obtener el número de empleados por departamento que cobran mas de 1500€ en cada departamento
SELECT COUNT(*)
FROM EMPLE
WHERE SALARIO>1500
GROUP BY DEPT_NO;
