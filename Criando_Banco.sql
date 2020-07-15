CREATE DATABASE exercicio_1;

USE exercicio_1;

CREATE TABLE tipo
(
	id	int unsigned not null auto_increment,
    tipo varchar(15) not null,
	PRIMARY KEY (id)
);

CREATE TABLE instrutor
(
	id int unsigned not null auto_increment,
    instrutor varchar(30) not null,
    telefone varchar(9) not null,
    PRIMARY KEY (id)
);

CREATE TABLE curso
(
	id int unsigned not null auto_increment,
	curso varchar(20) not null,
    tipo_id int unsigned,
    instrutor_id int unsigned,
    valor double unsigned not null,
    PRIMARY KEY (id),
    CONSTRAINT fk_curso_tipo FOREIGN KEY (tipo_id)  REFERENCES tipo(id),
    CONSTRAINT fk_curso_instrutor FOREIGN KEY (instrutor_id) REFERENCES instrutor(id)
);

CREATE TABLE aluno
(
	codigo int unsigned not null auto_increment,
    aluno varchar(30) not null,
    endereço varchar(40) not null,
    email varchar(20) not null,
	PRIMARY KEY (codigo)
);

CREATE TABLE pedido
(
	codigo int unsigned not null auto_increment,
    aluno_id int unsigned,
    data_1 date,
    hora time,
	PRIMARY KEY (codigo),
    CONSTRAINT fk_pedido_aluno FOREIGN KEY (aluno_id) REFERENCES aluno(codigo)
);

CREATE TABLE pedido_detalhe
(
	pedido int unsigned not null auto_increment,
	curso_id int unsigned,
    valor int unsigned not null,
    PRIMARY KEY (pedido,curso_id),
    FOREIGN KEY (pedido) REFERENCES pedido(codigo),
    CONSTRAINT fk_pedido_detalhe_curso FOREIGN KEY (curso_id) REFERENCES curso(id)
);

ALTER TABLE aluno ADD data_nascimento VARCHAR(10) NOT NULL;
ALTER TABLE aluno CHANGE COLUMN data_nascimento nascimento date;

CREATE INDEX fk_aluno ON aluno(aluno);
ALTER TABLE instrutor ADD email varchar(100);
CREATE INDEX fk_instrutor ON curso(instrutor_id);
ALTER TABLE instrutor DROP COLUMN email;

DROP TABLE EMBLEMAS;

CREATE TABLE EMBLEMAS (
  ID int NOT NULL,
  FORNECEDOR varchar(45) NULL,
  EMBLEMA varchar(10) NOT NULL,
  VALOR double NOT NULL default '0',
  PRIMARY KEY (ID)
);
