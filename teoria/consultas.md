27.-¿Por qué las consultas son tan importantes?
===============================================
Las consultas o queries a una base de datos son una parte fundamental ya que esto podría salvar un negocio o empresa.
Alrededor de las consultas a las bases de datos se han creado varias especialidades como ETL o transformación de datos, business intelligence e incluso machine learning.
La palabra ETL correspondería al acrónimo de:
Extract (Extraer)
Transform (Transformar)
Load (Cargar)
ETL hace parte del proceso de integración de datos, mas aun es un componente muy importante que completa el resultado final en la relación de aplicaciones y sistemas.

28.-Estructura básica de un Query
=================================
Los queries son la forma en la que estructuramos las preguntas que se harán a la base de datos. Transforma preguntas en sintaxis.

El query tiene básicamente 2 partes: SELECT y FROM y puede aparecer una tercera como WHERE.

    La estrellita o asterisco (*) quiere decir que vamos a seleccionar todo sin filtrar campos.

29.-SELECT
==========
SELECT se encarga de proyectar o mostrar datos.

    El nombre de las columnas o campos que estamos consultando puede ser cambiado utilizando AS después del nombre del campo y poniendo el nuevo que queremos tener:
    SELECT titulo AS encabezado FROM posts;
    select titulo, fecha_publicacion, estatus from posts;

    Existe una función de SELECT para poder contar la cantidad de registros. Esa información (un número) será el resultado del query:
    SELECT COUNT(*) AS numero_posts FROM posts;

30.-FROM
========
FROM indica de dónde se deben traer los datos y puede ayudar a hacer sentencias y filtros complejos cuando se quieren unir tablas. La sentencia compañera que nos ayuda con este proceso es JOIN.

Los diagramas de Venn son círculos que se tocan en algún punto para ver dónde está la intersección de conjuntos. Ayudan mucho para poder formular la sentencia JOIN de la manera adecuada dependiendo del query que se quiere hacer.

![alt text](https://static.platzi.com/media/user_upload/joins-32e40dc3-e061-4cea-8a67-e3e509007329.jpg)

LEFT JOIN
---------
SELECT * 
FROM usuarios 
  LEFT JOIN posts ON usuarios.id = posts.usuario_id;

SELECT * 
FROM usuarios 
  LEFT JOIN posts ON usuarios.id = posts.usuario_id
WHERE posts.usuario_id IS NULL;

RIGHT JOIN
----------
SELECT * 
FROM usuarios 
  RIGHT JOIN posts ON usuarios.id = posts.usuario_id
WHERE posts.usuario_id IS NULL;

INNER JOIN
----------
SELECT * 
FROM usuarios 
  INNER JOIN posts ON usuarios.id = posts.usuario_id;

UNION
-----
SELECT * 
FROM usuarios 
  LEFT JOIN posts ON usuarios.id = posts.usuario_id
UNION
SELECT * 
FROM usuarios 
  RIGHT JOIN posts ON usuarios.id = posts.usuario_id;

Diferencia simétrica
--------------------
SELECT * 
FROM usuarios 
  LEFT JOIN posts ON usuarios.id = posts.usuario_id
WHERE posts.usuario_id IS NULL
UNION
SELECT * 
FROM usuarios 
  RIGHT JOIN posts ON usuarios.id = posts.usuario_id
WHERE posts.usuario_id IS NULL;

32.-WHERE
=========
WHERE es la sentencia que nos ayuda a filtrar tuplas o registros dependiendo de las características que elegimos.

    La propiedad LIKE nos ayuda a traer registros de los cuales conocemos sólo una parte de la información.
    La propiedad BETWEEN nos sirve para arrojar registros que estén en el medio de dos. Por ejemplo los registros con id entre 20 y 30.
SELECT * FROM posts WHERE id<=50;
SELECT * FROM posts WHERE estatus='activo';
SELECT * FROM posts WHERE estatus!='activo';
SELECT * FROM posts WHERE id!=50;
SELECT * FROM posts WHERE titulo LIKE '%escandalo%'; -- al medio
SELECT * FROM posts WHERE titulo LIKE 'escandalo%'; -- inicien
SELECT * FROM posts WHERE titulo LIKE '%escandalo'; -- terminen
SELECT * FROM posts WHERE fecha_publicacion>'2025-01-01'; 
SELECT * FROM posts WHERE fecha_publicacion BETWEEN '2025-01-01' AND '2025-12-31';
SELECT * FROM posts WHERE YEAR(fecha_publicacion) BETWEEN '2023' AND '2024';
SELECT * FROM posts WHERE MONTH(fecha_publicacion)=04;

Utilizando la sentencia WHERE nulo y no nulo
--------------------------------------------
El valor nulo en una tabla generalmente es su valor por defecto cuando nadie le asignó algo diferente. La sintaxis para hacer búsquedas de datos nulos es IS NULL. La sintaxis para buscar datos que no son nulos es IS NOT NULL

select * from posts
where usuario_id is not null
  and estatus = 'activo'
  and id<10
  and categoria_id = 2
  and year(fecha_publicacion)='2025';

34.-GROUP BY
============
GROUP BY tiene que ver con agrupación. Indica a la base de datos qué criterios debe tener en cuenta para agrupar.
SELECT estatus, COUNT(*) post_quantity
FROM posts
GROUP BY estatus;

SELECT YEAR(fecha_publicacion) AS post_year, COUNT(*) AS post_quantity
FROM posts
GROUP BY post_year;

SELECT estatus,MONTHNAME(fecha_publicacion) AS post_month, COUNT(*) AS post_quantity
FROM posts
GROUP BY estatus, post_month;

35.-ORDER BY y HAVING
=====================
La sentencia ORDER BY tiene que ver con el ordenamiento de los datos dependiendo de los criterios que quieras usar.

    ASC sirve para ordenar de forma ascendente.
    DESC sirve para ordenar de forma descendente.
    LIMIT se usa para limitar la cantidad de resultados que arroja el query.

HAVING tiene una similitud muy grande con WHERE, sin embargo el uso de ellos depende del orden. Cuando se quiere seleccionar tuplas agrupadas únicamente se puede hacer con HAVING.

SELECT MONTHNAME(fecha_publicacion) AS mes, estatus, COUNT(*) AS cantidad
FROM posts
GROUP BY estatus, mes
HAVING cantidad > 1 AND mes IN ('December', 'May') ;

-- Ordenar los posts por el campo fecha_publicacion de forma ascendente.
Select * From posts 
Order By fecha_publicacion Asc;

-- Ordenar los posts por el campo fecha_publicacion de forma descendente.
Select * From posts 
Order By fecha_publicacion Desc;


-- Ordenar los posts por el campo fecha_publicacion de forma ascendente.
Select * From posts 
Order By fecha_publicacion;

-- Mostrar los primeros cinco posts que resulten de la consulta.
Select * From posts 
Order By fecha_publicacion Asc
Limit 5;

-- Ordenar los posts por el campo Usuario_Id de forma ascendente, exceptuando los valores nulos.
Select * From posts 
Where Usuario_Id Is Not Null 
Order By Usuario_Id Asc;

-- Ordenar los posts por el campo Usuario_Id de forma ascendente, exceptuando los valores nulos y que su Id esten entre 60 y 70.
Select * From posts Where 
Usuario_Id Is Not Null 
and Id Between 60 and 70
Order By Usuario_Id Asc;

-- Agrupar por estatus y mes. Contar los posts y mostrar los que se han mayores a uno. Finalmente se debe ornear por mes.
Select MonthName(fecha_publicacion) As Mes, status, Count(*) As Cant
From posts Group By status, Mes
Having Cant > 1
Order By Mes;

-- Agrupar por Año y mes. Contar los posts y mostrar los que sean mayores a uno. Finalmente se debe ornear por Año.
Select Year(fecha_publicacion) As Año, MonthName(fecha_publicacion) As Mes, status, Count(*) As Cant
From posts Group By Año, Mes
Having Cant > 1
Order By Año;

36.-El interminable agujero de conejo (Nested queries)
======================================================
Los Nested queries significan que dentro de un query podemos hacer otro query. Esto sirve para hacer join de tablas, estando una en memoria. También teniendo un query como condicional del otro.

Este proceso puede ser tan profundo como quieras, teniendo infinitos queries anidados.
Se le conoce como un producto cartesiano ya que se multiplican todos los registros de una tabla con todos los del nuevo query. Esto provoca que el query sea difícil de procesar por lo pesado que puede resultar.
-- Crear una tabla con el campo fecha, que los cuente, los agrupe y los ordene por el 
-- campo fecha. La información se extraerá de la tabla posts y la fecha mínima de cada año.
Select NuevaTabla.Fecha, Count(*) As Cant
From (
	Select Date(Min(fecha_publicacion)) As Fecha, Year(fecha_publicacion) As Año
	From posts
    Group By Año
) As NuevaTabla
Group By NuevaTabla.Fecha
Order By NuevaTabla.Fecha;

-- Mostrar de la tabla posts la fecha máxima o las más actual.
Select * From posts
Where fecha_publicacion= (
	Select Max(fecha_publicacion)
    From posts
);

37.-¿Cómo convertir una pregunta en un query SQL?
=================================================
De pregunta a Query

    SELECT: Lo que quieres mostrar
    FROM: De dónde voy a tomar los datos
    WHERE: Los filtros de los datos que quieres mostrar
    GROUP BY: Los rubros por los que me interesa agrupar la información
    ORDER BY: El orden en que quiero presentar mi información
    HAVING: Los filtros que quiero que mis datos agrupados tengan
     
GROUP_CONCAT toma el resultado del query y lo pone como campo separado por comas.
SELECT posts.titulo, GROUP_CONCAT(etiquetas.nombre_etiqueta) AS etiquetas
FROM posts
	INNER JOIN posts_etiquetas ON posts.id = posts_etiquetas.post_id
	INNER JOIN etiquetas ON etiquetas.id = posts_etiquetas.etiqueta_id
GROUP BY posts.id;

Cuales son las etiquetas que no tienen asociado ningún post
SELECT nombre_etiqueta 
FROM posts_etiquetas
	RIGHT JOIN etiquetas ON etiquetas.id = posts_etiquetas.etiqueta_id
WHERE posts_etiquetas.post_id IS NULL;

Puedes usar una abreviación para evitar escribir lo mismo cada vez.
Ejemplo:FROM categorias AS c
select c.nombre_categoria, count(*)as cant_posts
from categorias as c
	inner join posts as p on c.id=p.categoria_id
group by c.id
order by cant_posts desc;

select u.nickname, count(*)cant_posts
from usuarios as u
	inner join posts as p on u.id=p.usuario_id
group by u.id
order by cant_posts desc;

select u.nickname, count(*)cant_posts, group_concat(nombre_categoria)
from usuarios as u
	inner join posts as p on u.id=p.usuario_id
    inner join categorias as c on c.id=p.categoria_id
group by u.id
order by cant_posts desc;

SELECT *
FROM usuarios as u
LEFT JOIN posts AS p ON u.id = p.usuario_id
WHERE p.usuario_id IS NULL;
