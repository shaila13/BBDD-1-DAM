Select nombre from alum UNION select nombre from NUEVOS;
Select nombre from alum INTERSECT select nombre from ANTIGUOS;
Select nombre from alum MINUS select nombre from ANTIGUOS;
Select nombre,edad from alum MINUS select apellidos, salario from PERSONAL;
--error en la última sentencia porque está comparando campos distintos
--Select nombre, edad from alum MINUS select salario, apellido from PERSONAL;