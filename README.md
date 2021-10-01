# Curso de Fundamentos de Bases de Datos
Conservación de la información al paso de tiempo.

1.-Historia de la persistencia de la información
================================================
- Estructura de los sumerios, tallados en piedra y arcilla
- Pergamino y el papiro
- Papel creado por los chinos
- Microfilm
- Medios digitales (DVD, CD, disco duro, solido)
- Nube accesible de cualquier parte del mundo.

El almacenamiento en la nube tiene un gran pro comparada con los otros métodos de almacenamiento ya que es accesible desde cualquier parte del mundo. Además es centralizada y puede ser usada por varias personas al mismo tiempo.

Las bases de datos entran cuando hacemos la transición a medios digitales.

Tipos de bases de datos:

Relacionales: En la industria hay varias compañías dedicadas a ser manejadoras de bases de datos relacionales como SQL Server, Oracle, MariaDB, entre otras.
No relacionales: Todavía están avanzando y existen ejemplos muy distintos como cassandra, elasticsearch, neo4j, MongoDB, entre otras.

Servicios:
    Auto administrados: Es la base de datos que instalas tú y te encargas de actualizaciones, mantenimiento, etc.
    Administrados: Servicios que ofrecen las nubes modernas como Azure y no debes preocuparte por mantenimiento o actualizaciones.

2.-Historia de las RDB
======================
Las bases de datos surgen de la necesidad de conservar la información más allá de lo que existe en la memoria RAM.

Las bases de datos basadas en archivos eran datos guardados en texto plano, fáciles de guardar pero muy difíciles de consultar y por la necesidad de mejorar esto nacen las bases de datos relacionales. Su inventor Edgar Codd dejó ciertas reglas para asegurarse de que toda la filosofía de las bases de datos no se perdiera, estandarizando el proceso.

Las Reglas y mandamientos de Edgar Frank Ted Codd

    Regla 0: Regla de fundación.
    a) Cualquier sistema que se proclame como relacional, debe ser capaz de gestionar sus bases de datos enteramente mediante sus capacidades relacionales.

    Regla 1: Regla de la información.
    a) Todos los datos deben estar almacenados en las tablas
    b) Esas tablas deben cumplir las premisas del modelo relacional
    c) No puede haber información a la que accedemos por otra vía

    Regla 2: Regla del acceso garantizado.
    a) Cualquier dato es accesible sabiendo la clave de su fila y el nombre de su columna o atributo
    b) Si a un dato no podemos acceder de esta forma, no estamos usando un modelo relacional

    Regla 3: Regla del tratamiento sistemático de valores nulos.
    a) Esos valores pueden dar significado a la columna que los contiene
    b) El SGBD debe tener la capacidad de manejar valores nulos
    c) El SGBD reconocerá este valor diferenciándolo de cualquier otro
    d) El SGBD deberá aplicársele la lógica apropiada
    e) Es un valor independiente del tipo de datos de la columna

    Regla 4: Catálogo dinámico en línea basado en el modelo relacional.
    a) El catálogo en línea es el diccionario de datos
    b) El diccionario de datos se debe de poder consultar usando las mismas técnicas que para los datos
    c) Los metadatos, por tanto, se organizan también en tablas relacionales
    d) Si SELECT es una instrucción que consulta datos, también será la que consulta los metadatos

    Regla 5: Regla comprensiva del sublenguaje de los datos completo.
    a) Al menos tiene que existir un lenguaje capaz de hacer todas las funciones del SGBD
    b) No puede haber funciones fuera de ese lenguaje
    c) Puede haber otros lenguajes en el SGBD para hacer ciertas tareas
    d) Pero esas tareas también se deben poder hacer con el “lenguaje completo”

    Regla 6: Regla de actualización de vistas.
    a) Las vistas tienen que mostrar información actualizada
    b) No puede haber diferencias entre los datos de las vistas y los datos de las tablas base

    Regla 7: Alto nivel de inserción, actualización, y cancelación.
    a) La idea es que el lenguaje que maneja la base de datos sea muy humano
    b) Eso implica que las operaciones del lenguaje de manipulación de los datos (DML) trabajen con conjuntos de filas a la vez
    c) Para modificar, eliminar o añadir datos, no hará falta programar de la forma en la que lo hacen los lenguajes de tercera generación como C o Java

    Regla 8: Independencia física de los datos.
    a) Cambios en la física de la BD no afecta a las aplicaciones ni a los esquemas lógicos
    b) El acceso a las tablas (elemento lógico) no cambia porque la física de la base de datos cambie

    Regla 9: Independencias lógicas de los datos.
    a) Cambios en el esquema lógico (tablas) de la BD no afectan al resto de esquemas
    b) Si cambiamos nombres de tabla, o de columna o modificamos información de las filas, las aplicaciones (esquema externo) no se ven afectadas
    c) Es más difícil de conseguir

    Regla 10: Independencia de la integridad.
    a) Las reglas de integridad (restricciones) deben de ser gestionadas y almacenadas por el SGBD

    Regla 11: Independencia de la distribución.
    a) Que la base de datos se almacene o gestione de forma distribuida en varios servidores, no afecta al uso de esta ni a la programación de las aplicaciones de usuario
    b) El esquema lógico es el mismo independientemente de si la BD es distribuida o no

    Regla 12: La regla de la no subversión.
    a) La base de datos no permitirá que exista un lenguaje o forma de acceso, que permita saltarse las reglas anteriores

3.-Entidades y atributos
========================
Una entidad es algo similar a un objeto (programación orientada a objetos) y representa algo en el mundo real, incluso algo abstracto. Tienen atributos que son las cosas que los hacen ser una entidad y por convención se ponen en plural.

Los atributos compuestos son aquellos que tienen atributos ellos mismos.

Los atributos llave son aquellos que identifican a la entidad y no pueden ser repetidos. Existen:

    Naturales: son inherentes al objeto como el número de serie
    Clave artificial: no es inherente al objeto y se asigna de manera arbitraria.

Entidades fuertes: son entidades que pueden sobrevivir por sí solas.

Entidades débiles: no pueden existir sin una entidad fuerte y se representan con un cuadrado con doble línea.

    Identidades débiles por identidad: no se diferencian entre sí más que por la clave de su identidad fuerte.
    Identidades débiles por existencia: se les asigna una clave propia.

4.-Proyecto de PlatziBlog
=========================
Nuestro proyecto será un manejador de Blogpost. Es un contexto familiar y nos representará retos muy interesantes.

    Primer paso: Identificar las entidades
    Segundo paso: Pensar en los atributos

![alt text](https://static.platzi.com/media/user_upload/Captura2-8c5455ae-05a4-48bf-8e40-e9f053156c7e.jpg)

5.-Relaciones
Las relaciones nos permiten ligar o unir nuestras diferentes entidades y se representan con rombos. Por convención se definen a través de verbos.

Las relaciones tienen una propiedad llamada cardinalidad y tiene que ver con números. Cuántos de un lado pertenecen a cuántos del otro lado:

    Cardinalidad: 1 a 1
    Cardinalidad: 0 a 1
    Cardinalidad: 1 a N
    Cardinalidad: 0 a N

Relaciones

Las relaciones, representadas por un rombo, sirven para crear relaciones entre entidades. Por convención las relaciones son verbos que conectan entidades. Existen entidades multivaluadas o compuestas que tienen vida propia y se relacionan con otras entidades, por lo que se pueden normalizar (concepto que se explicará luego)

Cardinalidad

Es una propiedad de las relaciones que indica la cantidad y correspondencia con la que puede estar relacionada una entidad y puede ser uno a uno, uno a varios, varios a uno y varios a varios.
![alt text](https://lh6.googleusercontent.com/proxy/BWwfVeHWLGIMExCLh91GUCnq5-0TX2ay5RelZwRBj5Ku4u90DmqKv_V3WmZ_0IOR-moNHKuNPb-6qccSaOzTJgENwMl5SdjmJO0AxRfx1v1TmtJPXWK95dj3v2C5Tst9b73kZ6JGHiEAhnUhNQiY=w1200-h630-p-k-no-nu)

Muchos a Muchos
![alt text](https://static.platzi.com/media/user_upload/cardinalidad%20n%20a%20n-e8130a46-dd22-41a6-90e9-e737d2c3b4a1.jpg)

Diagrama ER
Un diagrama es como un mapa y nos ayuda a entender cuáles son las entidades con las que vamos a trabajar, cuáles son sus relaciones y qué papel van a jugar en las aplicaciones de la base de datos.



    Cada Usuario escribe múltiples Posts, pero un Post esta escrito por un solo usuario.

    Cada Usuario escribe múltiples Comentarios, pero un Comentario esta escrito por un Usuario.

    Un Post tiene una Categoría, pero una Categoría tiene múltiples Post.

    Un Post tiene múltiples Etiquetas, pero una Etiquetas tiene múltiples Post.

![alt text](https://static.platzi.com/media/user_upload/diagrama-entidad-relacion-7be03b35-a5d8-496e-bd15-eac81f18bbe6.jpg)
