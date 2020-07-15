USE curso_sql;

CREATE TABLE pedidos
(
	id int unsigned not null auto_increment,
    descricao  varchar(100) not null,
    valor double not null default '0',
    pago varchar(3) not null default 'Não',
    PRIMARY KEY (id)
);

INSERT INTO pedidos (descricao, valor) VALUES ('TV',3000);
INSERT INTO pedidos (descricao, valor) VALUES ('Geladeira',1400);
INSERT INTO pedidos (descricao, valor) VALUES ('DVD Player',300);

SELECT * FROM pedidos;

CALL limpa_pedidos(); 	-- Para criar é só clicar com o botão esquerdo no 'Stored Procedures' do 'Banco de  Dados usado'
						-- Coloca dentro do ciclo e aplica

-- Triggers
CREATE TABLE estoque
(
	id int unsigned not null auto_increment,
    descricao varchar(50) not null,
    quantidade int not null,
    PRIMARY KEY (id)
);

CREATE TRIGGER gatilho_limpa_gatilhos
BEFORE INSERT 
ON estoque 
FOR EACH ROW
CALL limpa_pedidos();

INSERT INTO pedidos (descricao, valor) VALUES ('TV',3000);
INSERT INTO pedidos (descricao, valor) VALUES ('Geladeira',1400);
INSERT INTO pedidos (descricao, valor) VALUES ('DVD Player',300);
SELECT * FROM pedidos;
UPDATE pedidos SET pago = 'Sim' WHERE id=8; 	

INSERT INTO estoque (descricao, quantidade) VALUES ('Fogão',5);
SELECT * FROM estoque;