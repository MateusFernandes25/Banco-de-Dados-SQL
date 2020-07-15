USE Criando_Banco;

SELECT c.curso, t.tipo FROM curso c JOIN tipo t ON t.id = c.tipo_id;


SELECT p.codigo,p.datas,p.hora,c.curso AS codigo_curso FROM pedido p 
JOIN pedido_detalhe pd ON p.codigo = pd.pedido;

SELECT p.codigo,p.datas,p.hora,c.curso AS codigo_curso FROM pedido p 
JOIN curso c ON c.id = p.codigo ;

SELECT p.codigo,p.datas,p.hora,a.aluno,c.curso FROM pedido p
JOIN curso c ON c.id = p.codigo
JOIN aluno a ON a.codigo = p.aluno_id;

SELECT*FROM pedido_detalhe;

SELECT*FROM tipo;
CREATE VIEW produto AS SELECT c.curso AS título, c.valor AS preço FROM curso c
JOIN tipo t ON t.id = c.tipo_id;
SELECT*FROM produto;

CREATE VIEW produto_2 AS SELECT c.curso AS título, t.tipo AS tipo, i.instrutor AS nome_instrutor FROM curso c
JOIN tipo t ON t.id = c.tipo_id
JOIN instrutor i ON i.id = c.instrutor_id;
SELECT*FROM produto_2;

CREATE VIEW pedidos_real AS SELECT a.aluno, p.datas, p.hora FROM aluno a
JOIN pedido p ON p.aluno_id = a.codigo;
SELECT * FROM pedidos_real;


