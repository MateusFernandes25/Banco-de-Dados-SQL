-- Não precisamos do comando 'USE' pois trabalhamos apenas com comandos de controle de acesso

-- Criando Usuário
-- CREATE USER	'nome_do_usuario'@'local/IP' IDENTIFIED BY 'senha';
-- CREATE USER	'Mateus'@'168.190.1.1' IDENTIFIED BY '1234';
-- CREATE USER	'Mateus'@'%' IDENTIFIED BY '1234'; -- de qualquer IP
CREATE USER	'Mateus'@'localhost' IDENTIFIED BY '1234'; -- apenas da máquina local
GRANT ALL ON curso_sql.* TO 'Mateus'@'localhost';

-- Permitindo acesso
-- GRANT ALL ON banco_de_dados.tabelas TO 'Mateus'@'localhost';  * = todas as tabelas
	-- Usamos só o SELEC
CREATE USER	'Mateus'@'%' IDENTIFIED BY 'viagem';

GRANT SELECT ON curso_sql.* TO 'Mateus'@'%';
GRANT INSERT ON curso_sql.funcionarios TO 'Mateus'@'%';

-- Removendo acessos
REVOKE INSERT ON curso_sql.funcionarios FROM 'Mateus'@'%';
REVOKE SELECT ON curso_sql.* FROM 'Mateus'@'%'; -- Só remove o acesso de leitura 

-- Permitindo acesso tabela a tabela
GRANT SELECT ON curso_sql.funcionarios TO 'Mateus'@'%';
GRANT SELECT ON curso_sql.veiculos TO 'Mateus'@'%';

-- Removendo acesso tabela a tabela
REVOKE SELECT ON curso_sql.funcionarios FROM 'Mateus'@'%';
REVOKE SELECT ON curso_sql.veiculos FROM 'Mateus'@'%';

-- Removendo todos os acessos
REVOKE ALL ON curso_sql.* FROM 'Mateus'@'localhost';

-- Excluindo usuarios
DROP USER 'Mateus'@'%';
DROP USER 'Mateus'@'localhost';

-- Como consultar Usuários criados e suas respectivos acessos
SELECT USER FROM mysql.USER;
SHOW GRANTS FOR 'Mateus'@'%';