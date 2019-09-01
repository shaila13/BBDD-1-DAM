--Insertar una fila en la tabla EMPLE con los siguientes datos:
--tenemos que meter un valor en el deportamento
--Comprobar si se ha a�adido la fila, en caso contrario que error nos da
--A�adir en DEPART un registro con el DEPT_NO=1, nombre=�prueba�, y ciudad = �XXXX�
--Insertar ahora el registro y comprobar si lo ha a�adido
insert into depart (DEPT_NO,DNombre,loc) values (1,'trabajo','Oviedo');
insert into emple 
(emp_no, apellido, oficio, fecha_alt,salario,dept_no)
values (1111,'Shaila','Apar',sysdate,111,1);

--Salir del SQL y seleccionar la opci�n ROLLBACK antes de abandonar el 
--programa. Volver a entrar y comprobar si existe la fila.

--Realizar los mismos ejercicios anteriores pero seleccionando la opci�n 
--COMMIT despu�s de insertar.

--Comprobar que pasa si salimos del SQL y volvemos a entrar. �est�n los datos?

--Comprobar en la tabla EMPLE los campos que no pueden ser nulos

--Insertar una fila con unos datos inventados, pero sin el dept_no.