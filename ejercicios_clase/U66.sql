/*Obtener  ordenados  alfabéticamente  los  nombres  y  salarios  de  los  empleados  cuyo  salario  esté
comprendido entre 2000 y 3000.*/

Select apellido, salario from emple
where salario between 2000 and 3000;

/*Seleccionar  el  nombre  de  aquellos  empleados  que  ganen más  de  2000  euros  que  sean VENDEDORES.*/
Select apellido from emple
where salario > 2000 and OFICIO='VENDEDOR';

/*Obtener el nombre de los diferentes oficios ordenados alfabéticamente, sin que se repitan.*/
Select distinct oficio FROM emple order by oficio;
/*Obtener  un  listado  de  todos  los  empleados,  ordenado  por  departamento,  que  no  cobren 
comisión*/
select * from emple 
where comision is null or comision = 0
order by dept_no;
/*Obtener  un  listado  con  la  información  de  los  empleados  que  tengan  un  salario entre  un 
máximo y un mínimo que se introducirá por teclado.*/
ACCEPT salamin PROMPT 'Introduce salario minimo: ';
ACCEPT salamax PROMPT 'Introduce salario maximo: ';
SELECT * FROM emple WHERE salario between &salamin and &salamax;

/*Listado de los empleados cuyo apellido acabe en O*/
SELECT * FROM emple where upper(apellido) like '%O';
/*Listado de los empleados cuyo apellido tenga una A en la segunda posición*/
select * from EMPLE where apellido like '_A%';
/*Contabilizar con la función COUNT ( * ) cuantos son*/
select count (*) from emple where apellido like '_A%';
/*Consulta para conocer cual es el numero de empleado que tiene el presidente*/
select * from emple where upper(oficio) ='PRESIDENTE';

/*Listado de los empleados cuyo jefe es el presidente*/
select * from emple
where dir = (select emp_no from emple
Where upper(oficio) ='PRESIDENTE');

/*Cuantos empleados no cobran comisión (Usar la función COUNT)*/
select count (*) from emple
where comision is null or comision = 0;

/*Listado de los empleados cuya nómina es mayor que una cantidad que se mete por teclado.
(Recordar que NVL(columna,valor): sustituye los valores nulos de la columna por el valor indicado
en la opción  valor)*/

accept vnomina prompt 'Introduce nomina:'
select e.*, (salario + nvl(comision,0)) from emple e
where (salario + nvl(comision,0)) > &vnomina;

/*Obtener un listado de todos los empleados cuyo departamento sea VENTAS*/
select * FROM EMPLE where DEPT_NO = (select dept_no from depart
where UPPER(dnombRe) = 'VENTAS');

/*Obtener  un  listado  de  todos  los  empleados  que  sean  del  departamento  de  VENTAS  y  del 
departamento de CONTABILIDAD*/

select * 
from emple
where DEPT_NO in (select dept_no from depart
where UPPER(dnombRe) = 'VENTAS' and UPPER(dnombRe) = 'CONTABILIDAD');

/*Obtener los empleados del departamento de VENTAS y cuya nomina sea  mayor que 2000 euros*/
--comillas dobles al renombrar
select e.* ,(e.salario+nvl(e.comision,0)) as "PERRES"
FROM emple e
WHERE (e.DEPT_NO in (select dept_no from depart
where UPPER(dnombRe) = 'VENTAS'))
and (e.salario+nvl(e.comision,0)) >2000;

/*Seleccionar  todos  los  empleados  de  un  departamento  que  se  introducirá  por  teclado, 
sabiendo que el usuario siempre introducirá el nombre del departamento.*/

accept vdepart prompt 'Introduce un departamento a buscar:'
select e.*
from emple e
WHERE (e.dept_no=(select dept_no from depart
where UPPER(dnombre)=upper('&vdepart')));

/*Realizar las sentencias select para que una vez introducido el apellido de un empleado nos 
muestre el nombre del departamento al que pertenece*/

accept vapellido prompt 'Introduce un apellido a buscar:'
select d.* 
from depart d
WHERE (d.dept_no=(select dept_no from emple
where upper(apellido)= upper('&vapellido')));

/*Indicar los nombres de los departamentos de aquellos empleados cuya comisión es igual a null*/
select d.*
from depart d
WHERE d.dept_no in(select dept_no from emple
where comision is null);

/*Indicar los nombres de los departamentos que no tengan ningún empleado*/
select d.*
from depart d
WHERE d.DEPT_NO not in (select distinct dept_no from emple);

/*Indicar los jefes/director del departamento de INVESTIGACION y del de VENTAS*/ 
select *
from emple 
where oficio='DIRECTOR' and DEPT_NO in (select DEPT_NO from depart where dnombre='VENTAS'
or dnombre='INVESTIGACION';

/*Nombre del departamento de un empleado que se introduce por teclado*/
accept vdepartamento prompt 'Introduce un apellido a buscar:'
select d.* 
from depart d
WHERE (d.dept_no=(select dept_no from emple
where upper(apellido)= upper('&vdepartamento')));

/*Crear una sentencia de subconsultas con introducción de datos por teclado y comprobar el resultado*/