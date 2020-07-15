USE Criando_Banco;

SELECT DISTINCT(aluno) FROM aluno;
SELECT aluno FROM aluno LIMIT 1;
SELECT aluno FROM aluno ORDER BY codigo DESC LIMIT 1;
SELECT aluno FROM aluno ORDER BY codigo DESC LIMIT 2,1;

SELECT COUNT(curso) FROM curso;
SELECT SUM(valor) FROM pedido_detalhe;
SELECT AVG(valor) FROM pedido_detalhe WHERE pedido = 2;
SELECT MAX(valor) FROM curso;
SELECT MIN(valor) FROM curso;
SELECT pedido,SUM(valor) FROM pedido_detalhe GROUP BY pedido;
SELECT * FROM pedido_detalhe;

SELECT instrutor,curso FROM instrutor i JOIN curso c WHERE c.instrutor_id = i.id GROUP BY curso,instrutor;
SELECT COUNT(curso),instrutor FROM curso, instrutor WHERE instrutor_id = 1 GROUP BY instrutor;
SELECT instrutor Instrutor,COUNT(curso) Turmas FROM instrutor i,curso c WHERE instrutor_id = i.id IN 
	(
		SELECT instrutor_id FROM curso
	) GROUP BY instrutor;

SELECT p.codigo, a.aluno, SUM(pd.valor) FROM pedido p JOIN
aluno a ON a.codigo = p.aluno_id JOIN
pedido_detalhe pd ON pd.pedido = p.codigo GROUP BY p.codigo HAVING SUM(pd.valor) > 200;
	
SELECT pd.pedido, a.aluno, COUNT(*) FROM pedido_detalhe pd JOIN
pedido p ON pd.pedido = p.codigo JOIN 
aluno a ON a.codigo = p.aluno_id GROUP BY pd.pedido;

SELECT aluno, endereço FROM aluno WHERE endereço LIKE 'Av%';

SELECT curso FROM curso WHERE curso LIKE 'JAVA%';


SELECT curso, valor FROM curso WHERE valor IN 
	(
		SELECT valor FROM curso GROUP BY valor HAVING MIN(valor)
    );
SELECT curso, MIN(valor) FROM curso GROUP BY curso;

SELECT * FROM tipo;

SELECT c.curso FROM curso c JOIN
tipo t ON t.id = c.tipo_id WHERE t.tipo LIKE 'Programação%';

SELECT c.curso FROM curso c WHERE c.tipo_id IN 
	(
		SELECT id FROM tipo WHERE tipo = 'Programação'
    );
    
SELECT c.curso FROM curso c WHERE EXISTS
	(
		SELECT t.id FROM tipo t WHERE t.id = c.tipo_id AND t.tipo = 'Programação'
    );
    

SELECT instrutor, 
	(
		SELECT SUM(pd.valor) FROM pedido_detalhe pd INNER JOIN 
        curso c ON pd.curso_id = c.id WHERE c.instrutor_id = i.id
	) 
AS TOTAL_DE_VENDAS FROM instrutor i;

CREATE VIEW aluno_e_compras AS SELECT aluno,
	(
		SELECT SUM(pd.valor) FROM pedido_detalhe pd INNER JOIN
        pedido p ON pd.pedido = p.codigo AND p.aluno_id = a.codigo 
    ) AS 'Valor Total' FROM aluno a;
SELECT * FROM aluno_e_compras;


SELECT SUM(codigo) FROM aluno WHERE aluno = 'Fernando';
