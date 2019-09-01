
--Salir del SQL y seleccionar la opción ROLLBACK antes de abandonar el 
--programa. Volver a entrar y comprobar si existe la fila.
--Realizar los mismos ejercicios anteriores pero seleccionando la opción 
--COMMIT después de insertar.
--Comprobar que pasa si salimos del SQL y volvemos a entrar. ¿están los datos?
--Comprobar en la tabla EMPLE los campos que no pueden ser nulos
--Insertar una fila con unos datos inventados, pero sin el dept_no. 

insert into emple 
(emp_no, apellido, oficio, fecha_alt,salario,dept_no)
values (1111,'Armando','Estudiante',sysdate,111);

--Insertar en la tabla EMPLE un nuevo usuario con la siguiente 
--información y los datos que faltan se completarán con los mismos 
--datos que tiene el usuario SALA.

insert into emple 
select 2222,'Juanito',oficio, dir, sysdate,salario,comision,dept_no
from EMPLE
where apellido ='SALA';

--Insertar en la tabla DEPART el departamento 50 correspondiente al 
--DAI localizado en SOTRONDIO

insert into DEPART 
(dept_no,dnombre,LOC)
values (50,'dai','Sotrondio');


--Añadir a la tabla EMPLE todos los usuarios de la tabla EMPLE 
--asignándoles como fecha la fecha de hoy y como código de 
--departamento=50.  Cuidado con las claves duplicadas, buscar solución

insert into emple 
select (emp_no+1), apellido, oficio, dir,sysdate,salario,comision,50
from EMPLE;

--Modificar el departamento de tu usuario y asignarle el valor 99. Si hay 
--problemas de restricciones buscar una solución alternativa añadiendo la 
--información previa necesaria.
update emple 
set dept_no = 10 
where EMP_NO = 2222;

--Duplicar el salario de tu usuario en la tabla EMPLE
update emple 
set salario = salario*2 
where EMP_NO = 2222;
--Pasar a minúsculas el apellido de todos los usuarios del departamento 50
update emple 
set apellido=  LOWER ( apellido )
where dept_no = 10;

--Asignar a tu usuario el doble del salario del usuario que más 
--gana como vendedor del departamento de ventas
update emple 
set salario = (SELECT max (salario) from emple,depart 
where emple.dept_no=depart.dept_no
group by emple.oficio, depart.dnombre
having oficio='VENDEDOR' and dnombre='VENTAS')*2
where EMP_NO = 2222;

--Pasar a mayúsculas los apellidos de todos los usuarios.
update emple 
set apellido=  upper ( apellido );

--Borrar el empleado creado con tu nombre.
Delete from emple 
where EMP_NO = 2222;

--Borrar los departamentos de la tabla DEPART que tengan mas de 10 empleados. 
--Si no se puede razonar el motivo

Delete from depart 
where DEPT_NO in 
(select DEPT_NO from emple
group by dept_no
having count(emp_no)>3)
;

--Borrar los empleados que son vendedores del departamento 50
--Borrar todos los usuarios que quedan del departamento 50


--primero hay que dar el privilegio desde system grant create view to u4;
--A partir de la tabla EMPLE y DEPART (Usuario U4) crear una vista llamada 
--EMP_DEPT que contenga las columnas EMP_NO, APELLIDO,DEPT_NO Y DNOMBRE. 
--Visualizar las filas de la vista
CREATE view emp_dept as select
apellido, dept_no, dnombre
from emple natural inner join depart
with read only;

--Insertar una fila en la tabla EMPLE con los siguientes datos para cada una de 
--las columnas y comprobar la tabla EMPLE y la vista EMP_DEPT
--9999, ’DESDIZ’, ‘VENDEDOR’,7777,fecha_hoy,3333,0, 10
insert into emple
values (9999,'DESDIZ','VENDEDOR',7782,sysdate,3333,0,10);
select * from emple;
--Insertar una fila en la vista creada con los siguientes datos y comprobar que 
--sucede 2222, ’SUELA’, 20, ‘INVESTIGACION’
--PARA INSERTAR EN VISTA insert into EMP_DEPT (emp_no, apellido, oficio,dept_no) values (2222,'SUELA','INVESTIGA',20)
insert into emple 
(emp_no, apellido, oficio,dept_no)
values (2222,'SUELA','INVESTIGA',20)
;


--Borrar de la tabla EMPLE el usuario ‘DESDIZ’. Comprobar la tabla y la vista
delete from emple where apellido='DESDIZ';

--Borrar de la vista EMP_DEPT el usuario de apellido SALA y comprobar que sucede
--no se puede borrar porque las vistas son solo de lectura
delete from EMP_DEPT where apellido='SALA';
--Actualizar en la vista EMP_DEPT el apellido SALA y sustituirlo por LASA. Comprobar que sucede
--no se puede borrar porque las vistas son solo de lectura
update EMP_DEPT 
set apellido = 'LASA'
where apellido = 'SALA';

update emple 
set apellido = 'LASA'
where apellido = 'SALA';

--Crear una vista llamada PAGOS a partir de las filas de la tabla EMPLE, cuyo departamento sea 10. Las columnas de la vistas se denominarán
--NOMBRE, SAL_MES, SAL_ANNO y DEPT_NO.
--El NOMBRE se almacenará utilizando la función INITCAP
--El SAL_MES es el SALARIO
--El SAL_ANNO es el salario anual
create view PAGOS(nombre, sal_mes, sal_anno, dept_no) 
as select initcap(apellido), salario, salario*14, dept_no 
from emple where DEPT_NO=10;
--En la vista PAGOS actualizar el empleado de NOMBRE =‘Cerezo’ y llamarle ‘Manzano’. Comprobar que sucede
--CASCA PORQUE hay una funcion para establecer el apellido
update pagos set nombre='MANZANO' 
where nombre='CEREZO';
--Modificar el SAL_MES para el usuario NOMBRE=‘Cerezo’ y asignarle 3000. Comprobar que sucede
--CASCA porque 
update pagos set sal_mes=3000 
where nombre='Cerezo';

--Insertar un usuario nuevo en la vista con los siguiente valores y comprobar que sucede:
--CASCA 
insert into PAGOS
values ('PEPE', 1000, 12000, 10);
select * from emple;

--Crear una vista llamada VMEDIA a partir de las tablas EMPLE y DEPART. 
--La vista estará formada el número de departamento, el nombre del departamento, 
--la media de salario y el máximo salario de cada uno de los departamentos
create view VMEDIA(DEPTNO, DEPNOMBRE, MSALARIO,MAXSALARIO) 
as select DEPT_NO, DNOMBRE, AVG(SALARIO),MAX(SALARIO)
from emple NATURAL INNER JOIN depart
GROUP BY DEPT_NO,DNOMBRE;
--Eliminar un departamento cualquiera de la vista y comprobar que sucede. 
--Intentar realizar cualquier otra acción (inserción, actualización)y comprobar que sucede.
--no funciona
delete from VMEDIA where DEPTNO=10;
