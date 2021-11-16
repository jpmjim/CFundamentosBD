48.-Bases de datos en la vida real
==================================
  Hoy en dia, se utilizan diversos tipos de bases de datos segun el problema que se quiera resolver:
      Las bases de datos relacionales, durante mucho tiempo, fueron utilizadas para resolver todo tipo de situaciones, pero al aumentar enormemente el numero de datos a manejar, se volveron ineficientes en muchos casos.
      Firestore o MongoDB nos permiten obtener los datos actuales de la aplicacion de manera simple. Sin embargo, no nos permite hacer, por ejemplo, queries muy complejos.
      En una misma disciplina, es probable que haya que utilizar mas de un tipo de bases de datos.

Big Data
--------
Big Data es un concepto que nace de la necesidad de manejar grandes cantidades de datos. La tendencia comenzó con compañías como YouTube al tener la necesidad de guardar y consultar mucha información de manera rápida.
Es un gran movimiento que consiste en el uso de diferentes tipos de bases de datos.
Grandes cantidades de datos procesada de manera rápida (millones de datos por segundo o menos) y eficiente para ser soportados por la BDD

Data warehouse
--------------
Data Warehouse trata de guardar cantidades masivas de datos para la posteridad. Allí se guarda todo lo que no está viviendo en la aplicación pero es necesario tenerlo.
Debe servir para guardar datos por un largo periodo de tiempo y estos datos se deben poder usar para poder encontrar cuestiones interesantes para el negocio.
La información ingresada al Data Warehouse debe pasar por el proceso ETL (Extract, Transform and Load). Este proceso que se explica con más detalle en otro artículo. Como se comenta más arriba la información ingresada al Data Warehouse debe ser integrada y limpia, objetivo que se logra a través del proceso ETL.

![alt text](https://static.platzi.com/media/user_upload/data_warehouse-600x390-c99b5607-187f-44b2-9ef3-906e7e2566a1.jpg)

Data mining
-----------
El Data Mining se dedica a minar datos, a extraerlos de donde sea que estén (archivos muertos, base de datos actual, etc…) y hacer sentido de ellos para darles un uso.
Se utiliza para minar datos, se basa en extraer datos de donde sea que estén, organizarlos y que puedan ser utilizables.
Es la técnica aplicada a fuentes de datos que pueden bien organizadas o no estar organizadas, para extraer datos que proveen de valor y sentido a los datos existentes, pero organizados de una manera mas aprovechable.

ETL
---
ETL son las siglas de Extract, Transform, Load (extraer, transformar y cargar). Se trata de tomar datos de archivos muertos y convertirlos en algo que sea de utilidad para el negocio.
También ayuda a tomar los datos vivos de la aplicación, transformarlos y guardarlos en un data warehouse periódicamente.

![alt text](https://static.platzi.com/media/user_upload/imagen-de68568a-733f-4cd9-a9b3-0ed362094619.jpg)

Business intelligence
---------------------
Business Intelligence es una parte muy importante de las carreras de datos ya que es el punto final del manejo de estos. Su razón de ser es tener la información lista, clara y que tenga todos los elementos para tomar decisiones en una empresa.
Es necesario tener una buena sensibilidad por entender el negocio, sus necesidades y la información que puede llevar a tomar decisiones en el momento adecuado al momento de realizar business intelligence.
Tener todos los datos (actuales e históricos) de manera clara y oportuna, para que sean útiles para el momento de tomar decisiones de negocios basados en esos datos.

Machine Learning
----------------
Machine Learning tiene significados que varían. Es una serie de técnicas que involucran la inteligencia artificial y la detección de patrones.
Machine learning para datos tiene un gran campo de acción y es un paso más allá del business intelligence.
Nos ayuda a hacer modelos que encuentran patrones fortuitos encontrando correlaciones inesperadas.

Tiene dos casos de uso particulares:

    Clasificación
    Predicción

Data Science
------------
Data Science es aplicar todas las técnicas de procesamiento de datos. En su manera más pura tiene que ver con gente con un background de estadísticas y ciencias duras.

¿Por qué aprender bases de datos hoy?
-------------------------------------
¡Has concluido el curso! Ahora tienes potentes herramientas y posibilidades para ingresar en este apasionante campo.

Llevaste diagramas a bases de datos, exploraste un poco el mundo de las bases de datos no relacionales, hicimos un proyecto en firestore y transformamos Platzi blog de una base de datos relacional en una base de datos de documentos.

Dentro de las posibilidades que tienes hoy en día puedes hacer: Machine learning, ETL, Data Warehouse, Data mining, entre otros.

Recuerda practicar mucho con el proyecto. Te invito a que tomes el examen y verifiques tus conocimientos. ¡Exitos!