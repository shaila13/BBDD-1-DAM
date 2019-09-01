select * from EMPLE where SALARIO >1500 order by SALARIO desc;
select * from EMPLE where COMISION >0;
select * from EMPLE where COMISION IS NOT NULL;
select * from EMPLE where apellido like 'J%';
select * from EMPLE where apellido like 'J%' or apellido like 'S%';
select * from EMPLE where apellido like '_A%';
select emp_no,apellido,oficio,salario,NVL(salario+comision,0) "Nomina" from EMPLE;
select emp_no,apellido,oficio,salario,NVL(salario+comision,0)"Nomina",(salario+NVL(comision,0)) from EMPLE order by "Nomina";

select * from EMPLE where DEPT_NO IN (10,30);
select * from EMPLE where DEPT_NO NOT IN (10,30);
select * from EMPLE where OFICIO IN ('ANALISTA','EMPLEADO','VENDEDOR');
select * from EMPLE where OFICIO not IN ('ANALISTA','EMPLEADO','VENDEDOR');
select * from EMPLE WHERE SALARIO BETWEEN 1000 AND 2000;
select * from EMPLE WHERE SALARIO NOT BETWEEN 1000 AND 2000;
select apellido,salario, dept_no from emple where salario >2000 and dept_no in (10,20); 

select apellido,oficio,dept_no from emple where oficio = (select OFICIO from emple where APELLIDO='SALA');
select apellido,oficio,dept_no from emple where dept_no IN (select dept_no from DEPART where LOC IN('MADRID', 'BARCELONA'));

select apellido,oficio,salario,dept_no from emple where oficio =
(select oficio from emple where APELLIDO='FERNANDEZ')
and SALARIO = 
(SELECT SALARIO FROM EMPLE WHERE APELLIDO='FERNANDEZ')
;
select apellido,oficio,salario,dept_no from emple where oficio=
(select oficio from emple where apellido='MARTIN')
and SALARIO BETWEEN 1000 AND 2000;


select apellido from emple where dept_no in
(select dept_no from emple where apellido IN('SALA', 'GIL'));

Select EMPLE.EMP_NO as "NUM_EMP", EMPLE.APELLIDO as "NOMBRE", EMPLE.OFICIO as "PUESTO",
EMPLE.DEPT_NO as "NUM_DPTO", DEPART.DEPT_NO as "NOM_DPTO" from EMPLE,DEPART where EMPLE.DEPT_NO= DEPART.DEPT_NO;

Select EMPLE.EMP_NO  "NUM_EMP", EMPLE.APELLIDO  "NOMBRE", EMPLE.OFICIO "PUESTO",EMPLE.DEPT_NO "NUM_DPTO", 
EMPLE.SALARIO "SALARIO", NVL(EMPLE.COMISION,0) "COMISION", (EMPLE.SALARIO+NVL(EMPLE.COMISION,0))  "NOMINA", 
DEPART.DEPT_NO  "NOM_DPTO", DEPART.LOC "NOMBRE CIUDAD" from EMPLE,DEPART where EMPLE.DEPT_NO= DEPART.DEPT_NO;

Select EMPLE.EMP_NO  "NUM_EMP", EMPLE.APELLIDO  "NOMBRE", EMPLE.OFICIO "PUESTO",EMPLE.DEPT_NO "NUM_DPTO", 
EMPLE.SALARIO "SALARIO", NVL(EMPLE.COMISION,0) "COMISION", (EMPLE.SALARIO+NVL(EMPLE.COMISION,0))  "NOMINA", 
DEPART.DEPT_NO  "NOM_DPTO", DEPART.LOC "NOMBRE CIUDAD" from EMPLE,DEPART where  DEPART.LOC IN('SEVILLA','MADRID','BILBAO');

--Calcular el salario medio de los empleados
select trunc(avg(salario),2) from emple;
--Calcular el salario medio de los empleados del departamento 10
select trunc(avg(salario),2) from emple where DEPT_NO IN (10);
--Calcular el número de filas de la tabla de empleados
Select COUNT(*) from emple;
--Calcular el número de filas donde la comisión es nula
Select COUNT(*) from emple where COMISION is null;
--Cual es el salario más alto de la tabla de empleados
Select MAX (salario) from emple;
--Visualizar el nombre, departamento, puesto y salario del empleado que más cobra.
Select apellido,oficio,salario,dept_no from emple where salario=(select MAX(salario) from emple);
--Realizar el mismo proceso para conocer el que menos cobra
Select MIN (salario) from emple;
--Calcular el importe en dinero de la nómina de este mes de todos los empleados
select SUM(salario+NVL(comision,0))"NOMINA" from emple;
--Calcular el número de oficios que hay en la tabla empleados
Select COUNT(DISTINCT OFICIO) from EMPLE;
--Calcular el número de oficios que hay en los departamentos 10 y 20
Select COUNT(DISTINCT OFICIO) from EMPLE WHERE DEPT_NO IN (10,30);



