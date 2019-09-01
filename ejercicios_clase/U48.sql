/*Dise�ar la tabla USUARIOS con los siguientes campos:
num_usr ? number(1); clave primaria
Nom_usr ? varchar(20);
*/

/*
�Crear una secuencia SECUENCIA_USR, que empiece en el n�mero 1 y su �ltimo valor 
sea 5. El incremento de la secuencia ser� de dos. En el TOAD pinchar la pesta�a 
SECUENCE y comprobar la secuencia
*/
--Empezar sin start with (no pasa nada seg�n Roberto)
CREATE SEQUENCE SECUENCIA_USR INCREMENT BY 2 MAXVALUE 5;

/*
�Insertar el nombre USUARIO1 y asignarle como clave primaria el n�mero generado 
por la secuencia
*/
CREATE SEQUENCE SECUENCIA_USR START WITH 1 INCREMENT BY 2 MAXVALUE 5;
--hay que usar primero nextval, que te da el siguiente valor a usar
INSERT INTO USUARIOS VALUES (SECUENCIA_USR.nextval,'USUARIO1');



/*
�Insertar el nombre USUARIO2 y asignarle como clave primaria el siguiente n�mero 
generado por la secuencia
*/
--La clave primaria est� puesta por defecto
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
--A partir de aqu� casca
INSERT INTO USUARIOS VALUES (SECUENCIA_USR.nextval,'USUARIO5');

--Pruebas
--Esta no me deja meter el valor de 10
CREATE SEQUENCE SECUENCIA_USR_bis START WITH 1 INCREMENT BY 1 MAXVALUE 10;

--Ojo con nextval y currval
--No podemos meter m�s valores que lo que tengamos especificado en la primary key

