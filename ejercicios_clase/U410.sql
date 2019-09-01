/*1.Obtener el nombre de los empleados y de los departamentos en los que 
trabajan. Ordena la consulta por nombre de departamento.
*/
select DISTINCT apellido,dept_no
from emple
order by dept_no;
/*
2.Realizar la misma consulta que en el apartado anterior, incluyendo los 
departamentos que no tienen empleados.
*/
select apellido,dept_no
from emple RIGHT join depart USING (dept_no);

--Roberto solution
select DEPART.DEPT_NO
from EMPLE,DEPART
where DEPART.DEPT_NO=EMPLE.dept_no(+);
/*
3.Mostrar el número de empleados que trabajan en cada departamento, debiendo 
de mostrar aquellos departamentos que incluso no tengan trabajadores. 
*/

select dept_no,count(*) as trabajadores
from emple RIGHT join depart USING (dept_no)
group by dept_no;

/*
4.Modificar la consulta anterior para que se muestre también el nombre del 
departamento 
*/
select dept_no,depart.DNOMBRE,count(*) as trabajadores
from emple RIGHT join depart USING (dept_no)
group by dept_no,DNOMBRE;
/*
5.Obtener la lista de empleados con los nombres de sus directores
*/
--Se referencia a si mismo
select e1.apellido, e2.apellido as JEFE
from emple e1 inner join emple e2
on e1.dir = e2.emp_no order by e1.apellido;

/*
6.Obtener  la  lista  de  empleados  con  los  nombres  de  sus  directores,  
incluyendo  al  PRESIDENTE, que es el único que no tiene director
*/
select e1.apellido, e2.apellido as JEFE
from emple e1 inner join emple e2
on e1.dir = e2.emp_no(+) 
order by e1.apellido;

/*
7.Mostrar un listado con el numero de departamento, el nombre y el total de  
empleados por departamento
*/
--Se pude hacer de las dos maneras
select dept_no, dnombre, count(dept_no) as trabajadores
from depart inner join emple USING (dept_no)
group by dept_no, dnombre;

select dept_no, dnombre, count(*) as trabajadores
from depart inner join emple USING (dept_no)
group by dept_no, dnombre;

/*
8.Modificar la consulta anterior para que muestre además, aquellos departamentos
que no tienen empleados
*/
select dept_no, dnombre, count(*) as trabajadores
from depart left join emple USING (dept_no)
group by dept_no, dnombre;

/*
9.Obtener información de todos los libros que están prestados, mostrando el 
código del socio que lo tiene
*/
select libros.*,prestamos.COD_SOCIO
from libros,prestamos 
where prestamos.COD_LIBRO(+) = libros.COD_LIBRO
order by prestamos.COD_SOCIO;

/*
10.Obtener información de todos los libros tanto de los que están prestados 
mostrando en su caso el código del socio que lo tiene, como los que no están 
prestados  dejando  en  este  caso  el valor en blanco
*/
select libros.*, nvl(prestamos.COD_SOCIO,0)
from libros,prestamos 
where prestamos.COD_LIBRO (+)= libros.COD_LIBRO
order by prestamos.COD_SOCIO;

/*
11.Mostrar información de todos los socios mostrando los libros que tienen 
prestados, en caso de no tener ningún libro prestado se deberá  mostrar la 
información en blanco
*/