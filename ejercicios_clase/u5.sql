--Para las tablas de profesores y centros, obtener para cada centro el número 
--de empleados. Si el centro carece de empleados, ha de aparecer un 0 como 
--número de empleados.

SELECT COUNT(DNI),PROFESORES.ESPECIALIDAD
FROM CENTROS, PROFESORES
WHERE CENTROS.COD_CENTRO=PROFESORES.COD_CENTRO(+)
GROUP BY CENTROS.COD_CENTRO, PROFESORES.ESPECIALIDAD;


SELECT C.COD_CENTRO, NOMBRE, COUNT(DNI) "Empleados"
FROM PERSONAL P, CENTROS C
WHERE P.COD_CENTRO(+)=C.COD_CENTRO
GROUP BY C.COD_CENTRO, NOMBRE;

--Contabilizar el número de empleados que hay en cada departamento y visualizar
--el número de departamento, nombre y número de empleados, incluidos aquellos 
--que no tengan empleados

SELECT count(e.emp_no),d.dnombre,d.dept_no from emple e, depart d
Where e.dept_no(+)=d.dept_no
Group by d.dnombre, d.dept_no;
