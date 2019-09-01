/*Diseñar la tabla USUARIOS con los siguientes campos:
num_usr ? number(1); clave primaria
Nom_usr ? varchar(20);
*/

/*
–Crear una secuencia SECUENCIA_USR, que empiece en el número 1 y su último valor 
sea 5. El incremento de la secuencia será de dos. En el TOAD pinchar la pestaña 
SECUENCE y comprobar la secuencia
*/
--Empezar sin start with (no pasa nada según Roberto)
CREATE SEQUENCE SECUENCIA_USR INCREMENT BY 2 MAXVALUE 5;

/*
–Insertar el nombre USUARIO1 y asignarle como clave primaria el número generado 
por la secuencia
*/
CREATE SEQUENCE SECUENCIA_USR START WITH 1 INCREMENT BY 2 MAXVALUE 5;
--hay que usar primero nextval, que te da el siguiente valor a usar
INSERT INTO USUARIOS VALUES (SECUENCIA_USR.nextval,'USUARIO1');



/*
–Insertar el nombre USUARIO2 y asignarle como clave primaria el siguiente número 
generado por la secuencia
*/
--La clave primaria está puesta por defecto
--Esta no la has ejecutado
INSERT INTO USUARIOS VALUES (SECUENCIA_USR.nextval,'USUARIO2');
/*
Comprobar, utilizando la tabla DUAL, el valor actual que tiene la secuencia
*/
select SECUENCIA_USR.currval from dual;

/*
Ir insertando usuarios sucesivamente USUARIO3 y comprobar que sucede cuando se
inserta el USUARIO6
*/
INSERT INTO USUARIOS VALUES (SECUENCIA_USR.nextval,'USUARIO3');
INSERT INTO USUARIOS VALUES (SECUENCIA_USR.nextval,'USUARIO4');
--A partir de aquí casca
INSERT INTO USUARIOS VALUES (SECUENCIA_USR.nextval,'USUARIO5');

--Pruebas
--Esta no me deja meter el valor de 10
CREATE SEQUENCE SECUENCIA_USR_bis START WITH 1 INCREMENT BY 1 MAXVALUE 10;

--Ojo con nextval y currval
--No podemos meter más valores que lo que tengamos especificado en la primary key

