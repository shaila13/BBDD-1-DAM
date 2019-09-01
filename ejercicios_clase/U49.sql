/*1.Visualizar  los  departamentos  en  los  que  el  salario  medio  es  mayor  
o  igual  que  la  media  de  todos  los salarios.*/
select dept_no, avg(salario) 
from emple 
group by dept_no 
having avg(salario) >= (select avg(salario) from emple);

/*2.A partir de la tabla EMPLE, visualizar el número de vendedores del 
departamento ‘VENTAS’.*/

SELECT  *
FROM emple NATURAL JOIN depart
where dnombre='VENTAS';

select count(*) 
from emple 
where dept_no = (select dept_no from depart 
        where dnombre ='VENTAS' and oficio = 'VENDEDOR');

/*3.Partiendo de la tabla EMPLE, visualizar por cada oficio de los empleados del 
departamento ‘VENTAS’ la suma de salarios.*/

select sum(salario), oficio 
from emple
where dept_no in (select dept_no from depart where dnombre like 'VENTAS') 
group by oficio; 

SELECT  sum(salario), oficio 
FROM emple NATURAL JOIN depart
where dnombre='VENTAS'
group by oficio; 

/*4.Seleccionar aquellos apellidos de la tabla EMPLE cuyo salario sea mayor o 
igual a la media de su salario en su departamento.
mirar join(+)
no podemos meter FUNCIONES en un WHERE da problemas!!!!!!
*/

select apellido,E.SALARIO from emple e
where SALARIO >= ( select avg(SALARIO) from EMPLE
where DEPT_NO = E.DEPT_NO group by DEPT_NO);

/*5.A  partir  de  la  tabla  EMPLE,  visualizar  el  número  de  empleados  de 
cada  departamento  cuyo  oficio  sea ‘EMPLEADO’.*/

select COUNT(EMP_NO), apellido
from emple
where OFICIO='EMPLEADO'
group by APELLIDO;

select COUNT(EMP_NO)
from emple
where OFICIO='EMPLEADO';

/*6.Desde la tabla EMPLE, visualizar el departamento que tenga más empleados cuyo 
oficio sea ‘EMPLEADO’.*/

select DEPT_NO
from emple 
where oficio like 'EMPLEADO' group by DEPT_NO
having count(*)=(SELECT Max(COUNT(DEPT_NO)) from emple where oficio like 'EMPLEADO' group by DEPT_NO);

/*7.A partir de las tablas de EMPLE y DEPART, visualizar el departamento que 
tenga más empleados cuyo oficio sea ‘EMPLEADO’.*/

select DEPT_NO
from emple natural inner JOIN depart
where oficio like 'EMPLEADO' group by DEPT_NO
having count(*)=(SELECT Max(COUNT(DEPT_NO)) from emple where oficio like 'EMPLEADO' group by DEPT_NO);

/*8.Buscar los departamentos que tienen más de dos personas trabajando en la 
misma profesión.*/
select dept_no,count(*) 
from emple 
group by dept_no,oficio 
having count(*)>2;

/*9.Dada la tabla LIBRERIA, visualizar por cada estante la suma de los 
ejemplares. EN LOS WHERE NO SE USAN FUNCIONES*/
select estante, sum(NUM_EJEMPLARES) 
from libreria 
group by estante;

/*10.Visualizar el estante con más ejemplares de la tabla LIBRERÍA. having si puede tener funciones*/

select estante,sum(ejemplares) 
from libreria 
group by estante 
having sum(ejemplares)=(select max(sum(ejemplares)) from libreria 
group by estante);

/*11.Visualizar los diferentes estantes de la tabla LIBRERIA ordenados 
descendentemente por estante.*/
select ESTANTE
from libreria 
group by estante
order by estante desc;

/*12.Averiguar cuantos temas tiene cada estante.*/
select count(ESTANTE),ESTANTE
from libreria 
group by estante;

/*13.Visualizar los estantes que tengan tres temas.*/
select estante, count(tema)
from libreria
group by estante
having count(tema)=3;