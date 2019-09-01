--Contabilizar el número de empleados que hay en cada departamento y visualizar
--el número de departamento, nombre y número de empleados, incluidos aquellos 
--que no tengan empleados

SELECT count(e.emp_no),d.dnombre,d.dept_no from emple e, depart d
Where e.dept_no(+)=d.dept_no
Group by d.dnombre, d.dept_no;


--Select … from tabla1 RIGHT OUTER JOIN tabla2
--ON tabla1.campo = tabla2.campo este campo sustituye al where

SELECT count(e.emp_no),d.dnombre,d.dept_no from emple e RIGHT OUTER JOIN depart d
on e.DEPT_NO=d.DEPT_NO
Group by d.dnombre, d.dept_no;