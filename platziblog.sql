--CREATE
--Database
CREATE DATABASE PlatziBlog DEFAULT CHARACTER SET utf8 ;
--Seleccionar base datos
USE PlatziBlog;
--Crear tablas dentro de la BD sin dependencias
CREATE TABLE categorias (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nombre_categoria VARCHAR(30) NOT NULL
);

CREATE TABLE etiquetas (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nombre_etiqueta VARCHAR(30) NOT NULL
);

CREATE TABLE usuarios (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  login VARCHAR(30) NOT NULL,
  password VARCHAR(32) NOT NULL,
  nickname VARCHAR(40) NOT NULL,
  email VARCHAR(40) NOT NULL,
  UNIQUE INDEX email_UNIQUE (email ASC)
);

--Tablas con dependencias
-- El comando “cascade” sirve para que cada que se haga un update en la tabla principal, se refleje también en la tabla en la que estamos creando la relación.
CREATE TABLE posts (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(130) NOT NULL,
  fecha_publicacion TIMESTAMP NULL,
  contenido TEXT NOT NULL,
  estatus CHAR(8) NULL DEFAULT 'activo',
  usuario_id INT NOT NULL,
  categoria_id INT NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON UPDATE CASCADE ON DELETE NO ACTION,
  FOREIGN KEY (categoria_id) REFERENCES categorias(id) ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE comentarios (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  cuerpo_comentario TEXT NOT NULL,
  usuario_id INT NOT NULL,
  post_id INT NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (post_id) REFERENCES posts(id)
);

CREATE TABLE posts_etiquetas(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  post_id INT NOT NULL,
  etiqueta_id INT NOT NULL,
  FOREIGN KEY (post_id) REFERENCES posts(id),
  FOREIGN KEY (etiqueta_id) REFERENCES etiquetas(id)
);