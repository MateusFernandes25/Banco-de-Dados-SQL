USE Criando_Banco;

-- Tabela Tipo
ALTER TABLE tipo CHANGE tipo tipo varchar(40);
INSERT INTO tipo(tipo) VALUES ("Banco de Dados");
INSERT INTO tipo(tipo) VALUES ("Programação");
INSERT INTO tipo(id, tipo) VALUES (3,"Modelagem dos Dados");
SELECT*FROM tipo;

-- Tabela Instrutor
DELETE FROM instrutor WHERE id >=1;
ALTER TABLE instrutor CHANGE telefone telefone varchar(10);
INSERT INTO instrutor(id, instrutor, telefone) VALUES (1,"André Milani", "1111-1111");
INSERT INTO instrutor(id, instrutor, telefone) VALUES (2,"Carlos Tossin", "1212-1212");
SELECT*FROM instrutor;

-- Tabela Curso
INSERT INTO curso VALUES (1, "Java Fundamentos", 2,2,270);
INSERT INTO curso VALUES (2, "Java Avançado", 2,2,330);
INSERT INTO curso VALUES (3, "SQL Completo", 1,1,170);
INSERT INTO curso VALUES (4, "Php Básico", 2,1,270);
SELECT*FROM curso;

-- Tabela Aluno
ALTER TABLE aluno CHANGE email email varchar(50);
INSERT INTO aluno(codigo, aluno, endereço, email) VALUES (1, "José", "Rua XV Novembro 72", "jose@softblues.com.br");
INSERT INTO aluno(codigo, aluno, endereço, email) VALUES (2, "Wagner", "Av. Paulista", "wagner@softblues.com.br");
INSERT INTO aluno(aluno, endereço, email) VALUES ("Emílio", "Rua Lajes 103 ap 101", "jose@softblues.com.br");
INSERT INTO aluno(aluno, endereço, email) VALUES ("Cris", "Rua Tauney 22", "cris@softblues.com.br");
INSERT INTO aluno(aluno, endereço, email) VALUES ("Regina", "Rua Salles 305", "regina@softblues.com.br");
INSERT INTO aluno(aluno, endereço, email) VALUES ("Fernando", "Av. Centraçl 30", "fernando@softblues.com.br");
INSERT INTO aluno(aluno, endereço, email) VALUES ("Fernando", "Av. Centraçl 30",'');
SELECT*FROM aluno;

-- Tabela Pedidos
ALTER TABLE pedido CHANGE data_1 datas varchar(12);
INSERT INTO pedido(aluno_id, datas, hora) VALUES (2, '2010-15-04', '11:23:32');
SET SQL_SAFE_UPDATES = 0;
UPDATE pedido SET datas = '15-04-2010';
INSERT INTO pedido(aluno_id, datas, hora) VALUES (2, '15-04-2010', '14:36:21');
INSERT INTO pedido(aluno_id, datas, hora) VALUES (3, '16-04-2010', '11:17:45');
INSERT INTO pedido(aluno_id, datas, hora) VALUES (4, '17-04-2010', '14:27:22');
INSERT INTO pedido(aluno_id, datas, hora) VALUES (5, '18-04-2010', '11:18:19');
INSERT INTO pedido(aluno_id, datas, hora) VALUES (6, '19-04-2010', '13:47:35');
INSERT INTO pedido(aluno_id, datas, hora) VALUES (7, '20-04-2010', '18:13:44');
SELECT*FROM pedido;

-- Tabela Pedido Detalhe
INSERT INTO pedido_detalhe(curso_id,valor) VALUES (1,270);
INSERT INTO pedido_detalhe(pedido, curso_id,valor) VALUES (2,2,330);
INSERT INTO pedido_detalhe(pedido, curso_id,valor) VALUES (3,1,270);
INSERT INTO pedido_detalhe(curso_id,valor) VALUES (2,330);
INSERT INTO pedido_detalhe(curso_id,valor) VALUES (3,170);
INSERT INTO pedido_detalhe(curso_id,valor) VALUES (4,270);
INSERT INTO pedido_detalhe(curso_id,valor) VALUES (2,330);
INSERT INTO pedido_detalhe(curso_id,valor) VALUES (4,270);
INSERT INTO pedido_detalhe(curso_id,valor) VALUES (3,170);
INSERT INTO pedido_detalhe(curso_id,valor) VALUES (3,170);
INSERT INTO pedido_detalhe(curso_id,valor) VALUES (4,270);
SELECT*FROM pedido_detalhe;


SELECT * FROM  aluno;
SELECT curso FROM curso;
SELECT curso,valor FROM curso WHERE valor > 200;
SELECT curso,valor FROM curso WHERE valor BETWEEN 200 AND 300;
SELECT * FROM pedido WHERE datas BETWEEN '15-04-2010' AND '18-04-2010';
SELECT aluno,datas,valor FROM aluno,pedido,pedido_detalhe WHERE datas = '15-04-2010';

SELECT * FROM ALUNO;
UPDATE aluno SET endereço = 'Av. Brasil 778' WHERE aluno = 'José';
UPDATE aluno SET email = 'cristiano@softblues' WHERE aluno = 'Cris';

SELECT * FROM curso;
SET SQL_SAFE_UPDATES = 0;
UPDATE curso SET valor = ROUND(valor*1.1) WHERE valor <= 300;
UPDATE curso SET curso = 'Php Fundamentos' WHERE curso = 'Php Básico';

SELECT * FROM aluno WHERE nascimento IS NULL;
