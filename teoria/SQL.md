18.-SQL hasta en la sopa
========================
SQL significa Structured Query Language y tiene una estructura clara y fija. Su objetivo es hacer un solo lenguaje para consultar cualquier manejador de bases de datos volviéndose un gran estándar.

Ahora existe el NOSQL o Not Only Structured Query Language que significa que no sólo se utiliza SQLen las bases de datos no relacionales.

19.-DDL create
==============
SQL tiene dos grandes sublenguajes:
DDL o Data Definition Language que nos ayuda a crear la estructura de una base de datos. Existen 3 grandes comandos:

    Create: Nos ayuda a crear bases de datos, tablas, vistas, índices, etc.
    Alter: Ayuda a alterar o modificar entidades.
    Drop: Nos ayuda a borrar. Hay que tener cuidado al utilizarlo.

3 objetos que manipularemos con el lenguaje DDL:

    Database o bases de datos
    Table o tablas. Son la traducción a SQL de las entidades
    View o vistas: Se ofrece la proyección de los datos de la base de datos de forma entendible.

Sentencias:
show databases;
CREATE DATABASE nombre_db; or CREATE SCHEMA `nombre_db` DEFAULT CHARACTER SET utf8;
USE DATABASE nombre_db;

CREATE DATABASE IF NOT EXISTS platziblog;
-- SHOW DATABASES; ver bases de datos
USE platziblog;
CREATE TABLE IF NOT EXISTS people (
person_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
last_name VARCHAR(255) NULL,
first_name VARCHAR(255) NULL,
address VARCHAR(255) NULL, 
city VARCHAR(255) NULL
);
-- SHOW TABLES ; ver tablas
DESCRIBE people; -- ver la estructura de la tabla

20.-CREATE VIEW y DDL ALTER
===========================
DELETE FROM people; -- Elimina la información dentro de la tabla.
ALTER TABLE people AUTO_INCREMENT = 1 ; -- Reinicia el autoincrement a 1
INSERT INTO people (last_name,first_name,address,city)VALUES('Vázquez', 'Israel','Calle Famosa Num 1','México'),
('Hernández','Mónica','Reforma 222','México'),
('Alanis','Edgar','Central 1', 'Monterrey'); -- Insertar datos a la tabla

CREATE OR REPLACE VIEW platzi_people AS -- Crear vista
SELECT * FROM people;

select * from platzi_people; -- consultar vista

ALTER TABLE people ADD COLUMN date_of_birth DATETIME NULL AFTER city; -- Agregar columna
DESCRIBE people;
ALTER TABLE people DROP COLUMN date_of_birth; -- Eliminar columna
DESCRIBE people;

21.-DDL drop
============
Está puede ser la sentencia ¡más peligrosa! (????), sobre todo cuando somos principiantes. Básicamente borra o desaparece de nuestra base de datos algún elemento.

DROP TABLE nombre_table;
DROP DATABASE nombre_db;

22.-DML
=======
DML trata del contenido de la base de datos. Son las siglas de Data Manipulation Language y sus comandos son:

    Insert: Inserta o agrega nuevos registros a la tabla.
    Update: Actualiza o modifica los datos que ya existen.
    Delete: Esta sentencia es riesgosa porque puede borrar el contenido de una tabla.
    Select: Trae información de la base de datos.

INSERT INTO people (last_name, first_name, address, city) 
VALUES ('Hernández', 'Laura', 'Calle 21', 'Monterrey');

UPDATE people SET last_name = 'Chávez', city = 'Mérida' WHERE person_id = 1;
UPDATE people SET first_name = 'Juan' WHERE city = 'Mérida';

DELETE FROM people
WHERE person_id = 1;

SELECT first_name, last_name FROM people; --> información dela base de datos

23.-¿Qué tan standard es SQL?
=============================

    SQL unifico la manera en que sea hacen preguntas a un repositorio de datos.
    Se convirtio en un standard util a la hora de usar bases de datos.
    Existen otros manejadores de datos como Oracle o PostgreSQL.
    Sin embargo, si escribimos en lenguaje SQL todos los manejadores funcionaran de manera similar.
    
SQL es un lenguaje universal podemos usarlo en PostgreSQL u otro lenguaje de base de datos.
--CREATE base de datos y tabla
CREATE DATABASE test_db;

USE test_db;

CREATE TABLE people (
	person_id int,
	last_name varchar(255),
	first_name varchar(255),
	address varchar(255),
	city varchar(255) 
);

--INSERT datos a la tabla
INSERT INTO people (last_name, first_name, address, city)
VALUES ('Hernández', 'Laura', 'Calle 21', 'Monterrey');

--SELECT de verificación
SELECT first_name, last_name FROM people;

--DROP eliminar tabla
DROP TABLE people;

24.-Creando Platziblog: tablas independientes
=============================================
    Una buena práctica es comenzar creando las entidades que no tienen una llave foránea.
    Generalmente en los nombres de bases de datos se evita usar eñes o acentos para evitar problemas en los manejadores de las bases de datos.


26.-Tablas transitivas
======================

    Las tablas transitivas sirven como puente para unir dos tablas. No tienen contenido semántico.
    Reverse Engineer nos reproduce el esquema del cual nos basamos para crear nuestras tablas. Es útil cuando llegas a un nuevo trabajo y quieres entender cuál fue la mentalidad que tuvieron al momento de crear las bases de datos.

