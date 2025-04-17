--Questão 01. Crie uma tabela pessoa com os campos ID, nome, sobrenome e idade. Crie uma cláusula de checagem para o campo idade, impedindo que valores menores que 0 sejam adicionados.
CREATE TABLE pessoa (
	ID int, 
	nome varchar (50),
	sobrenome varchar (50),
	idade int,
	check (idade >= 0) --Checagem da idade
);

--Questão 02. Altere a tabela pessoa e crie uma restrição utilizando a especificação unique (A1, A2, ..., Am) para os campos ID, nome e sobrenome.
ALTER TABLE pessoa
ADD CONSTRAINT unique_id_nome_sobrenome UNIQUE (ID, nome, sobrenome);

--Questão 03. Altere a coluna idade da tabela pessoa e garanta que ela não receba valores nulos.
ALTER TABLE pessoa
ALTER COLUMN idade INT NOT NULL;

--Questão 04. Crie uma tabela endereco com os campos ID e rua. Adicione o campo endereco na tabela pessoa e crie uma integridade referencial a partir deste campo com a tabela endereco.
CREATE TABLE endereco (
	ID int,
	rua varchar(100),
	primary key (ID)
);
--Adicionei uma coluna endereco em pessoa.
ALTER TABLE pessoa
ADD endereco INT;
--Criei em pessoa uma chave estrangeira de endereco, criando assim a integridade referencial
ALTER TABLE pessoa
ADD CONSTRAINT fk_endereco FOREIGN KEY (endereco) REFERENCES endereco(ID);

-- Criei alguns testes:
--Adicionei um endereco na tabela endereco, para poder usar em pessoa
INSERT INTO endereco
(ID, rua)
VALUES (1, 'Rua dos Cibernéticos');
--Exemplo de insert na tabela pessoa que dará errado, pois a idade não passa pela cláusula de checagem e o ID do endereco não existe, violando a integridade referêncial
INSERT INTO pessoa
(ID, nome, sobrenome, idade, endereco)
VALUES (01, 'Eduardo', 'Silva', -1, 2);
--Exemplo correto de insert na tabela pessoa.
INSERT INTO pessoa
(ID, nome, sobrenome, idade, endereco)
VALUES (01, 'Eduardo', 'Silva', 19, 1);
