CREATE DATABASE agenda;
USE agenda;

CREATE TABLE pessoa (
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL
);

INSERT INTO pessoa(nome) VALUES ("mateus"),("mateus2"),("mateus3");