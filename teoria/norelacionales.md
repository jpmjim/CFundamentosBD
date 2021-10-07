40.-¿Qué son y cuáles son los tipos de bases de datos no relacionales?
======================================================================
Respecto a las bases de datos no relacionales, no existe un solo tipo aunque se engloben en una sola categoría.

Tipos de bases de datos no relacionales:

    Clave - valor: Son ideales para almacenar y extraer datos con una clave única. Manejan los diccionarios de manera excepcional. Ejemplos: DynamoDB, Cassandra.
    Basadas en documentos: Son una implementación de clave valor que varía en la forma semiestructurada en que se trata la información. Ideal para almacenar datos JSON y XML. Ejemplos: MongoDB, Firestore.
    Basadas en grafos: Basadas en teoría de grafos, sirven para entidades que se encuentran interconectadas por múltiples relaciones. Ideales para almacenar relaciones complejas. Ejemplos: neo4j, TITAN.
    En memoria: Pueden ser de estructura variada, pero su ventaja radica en la velocidad, ya que al vivir en memoria la extracción de datos es casi inmediata. Ejemplos: Memcached, Redis.
    Optimizadas para búsquedas: Pueden ser de diversas estructuras, su ventaja radica en que se pueden hacer queries y búsquedas complejas de manera sencilla. Ejemplos: BigQuery, Elasticsearch.

Firebase (Firestore). Es una plataforma muy utilizada para el desarrollo de aplicaciones web y aplicaciones móviles. Como usa un conjunto de herramientas multiplataforma es compatible con grandes plataformas, como IOS, Android, aplicaciones web, Unity y C++. Es muy recomendable para desarrollos.

Jerarquía de datos
1. Base de Datos: Contiene toda la información que se quiere guardar.
2. Colección: Es igual a las tablas en las bases de datos relacionales. Son objetos que agrupan (Documentos) la información que se desea guardar.
3. Documento: Es la información que se quiere guardar. Se guarda en un formato muy parecido al formato JSON (es un lenguaje que se utiliza para comunicarse con diferentes lenguajes o aplicaciones). Los documentos dentro de ellos contienen datos.

42.-Top level collection con Firebase
El modelo de bases de datos no relacionales es un poco más cercano al mundo real en su comportamiento.

    Las top level collections son las colecciones que se tienen de inmediato o entrada en el proyecto.
    Firebase es un servicio que tiene múltiples opciones y está pensado principalmente para aplicaciones móviles y web.

Usando "Firebase"
-----------------
Tipos de datos en Firestore:

    String: Cualquier tipo de valor alfanumérico

    Number: Soporta enteros y flotantes.

    Boolenan: Los clásicos valores True y False

    Map: Permite agregar un documento dentro de otro.

    Array: Permite agregar un conjunto de datos (soporte multi type) sin nombre e identificador.

    Null: Indica que no se ha definido un valor.

    Timestamp: Permite almacenar fechas (guarda el año, mes, día y hora).

    Geopoint: Guarda una localización geográfica (coordenadas latitud-longitud).

    Reference: Permite referencia un documento (relaciona dos documentos, no importa su colección).

Colecciones vs subcolecciones
La particularidad de las top level collections es que existen en el primer nivel de manera intrínseca. Las subcolecciones ya no vivirán al inicio de la base de datos.

Si tienes una entidad separada que vas a referenciar desde muchos lugares es recomendado usar un top level collection. Por el otro lado si se necesita hacer algo intrínseco al documento es aconsejable usar subcolecciones.

Dentro de las bases de datos relacionales tenemos diferentes niveles de datos. En primer lugar tenemos las Bases de Datos o Esquemas como repositorios donde vivirán los datos que nos interesa guardar. Dentro del esquema existen las Tablas que provienen del concepto de entidades; y a su vez dentro de las tablas tenemos las tuplas o renglones.

Cuando trabajamos con bases de datos basadas en documentos como Firestore, aún existe la figura de la base de datos, sin embargo cambiaremos las tablas en favor de las colecciones y las tuplas en lugar de los documentos.

Recuerda:

Tabla -> Colección

Tupla -> Documento

Dentro de las Colecciones existen 2 grandes tipos. Las Top level collection o colecciones de nivel superior y las subcollections o subcolecciones. Estas últimas viven únicamente dentro de un documento padre.

¿Cómo saber cuál escoger?

Para determinar si tu colección debe ser top level o subcolección no hay una regla escrita en piedra y más bien tiene que ver con el caso de uso en particular y con la experiencia que hayas ganado como desarrollador.

Lo cierto es que no hay una sola forma de estructurar nuestra DB basada en documentos, y por tanto no existe una respuesta correcta, sin embargo a continuación te ofrezco un par de reglas guía que puedes utilizar para transformar tu proyecto que ya trabajaste en bases de datos relacionales en un proyecto no relacional.

Regla 1. Piensa en la vista de tu aplicación

La primera pista que te puedo dar es que pienses en un inicio en la manera en que los datos serán extraídos. En el caso de una aplicación, la mejor forma de pensarlo es en términos de las vistas que vas a mostrar a un momento determinado en la aplicación.

Es decir, al armar la estructura en la base de datos que sea un espejo o que al menos contenga todos los datos necesarios para llenar las necesidades que tiene nuestra parte visual en la aplicación.

En el caso de Platziblog por ejemplo si tienes una vista de un blog post individual, generalmente conviene mostrar además de los datos inherentes al post como el contenido, datos adicionales como las etiquetas que tiene o por ejemplo el autor (o autores si es colaborativo), en este caso tal vez convenga guardar estas dos “entidades” (autores y etiquetas) como subcolecciones de cada documento blog post.

Regla 2. La colección tiene vida propia

Esta regla se refiere a que la excepción a la regla 1 es cuando tenemos un caso en que la “entidad” que tiene necesidad de vivir y modificarse constantemente de manera independiente a las otras colecciones. Por ejemplo en Platziblog podemos en el ejemplo anterior hacer una excepción a autores porque nos conviene tenerlas como top level collection en el sentido que se añadan, borren, cambien o listen los usuarios sin depender del blog post.

Experimenta aplicando estas dos reglas a un proyecto que ya conozcas en una base de datos relacional y trata de convertirla en un proyecto de Firestore y comentanos los retos a los que te enfrentaste.