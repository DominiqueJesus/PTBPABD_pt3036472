-- Os exercícios não foram testados nem aplicados ao banco real do azure, pois estou sem acesso ao meu banco de dados

/* Questão 01. Crie uma tabela pessoa com os campos ID, nome, sobrenome e idade. 
 Crie uma cláusula de checagem para o campo idade, impedindo que valores menores que 0 sejam adicionados.*/


CREATE TABLE pessoa (
	ID VARCHAR(10) PRIMARY KEY,
	nome VARCHAR(50),
	sobrenome VARCHAR(50),
	idade INT,

	CONSTRAINT idade_minimo CHECK(idade>0)
);

/* Questão 02. Altere a tabela pessoa e crie uma restrição utilizando a especificação unique ( A1, A2, …, Am) 
para os campos ID, nome e sobrenome. */

ALTER TABLE pessoa
ADD CONSTRAINT unique_values UNIQUE (ID,nome,sobrenome);

/* Questão 03. Altere a coluna idade da tabela pessoa e garanta que ela não receba valores nulos. */

ALTER TABLE pessoa
ALTER COLUMN idade INT NOT NULL;

/* Questão 04. Crie uma tabela endereco com os campos ID e rua. 
Adicione o campo endereco na tabela pessoa e crie uma integridade referencial a partir deste campo com a tabela endereco. */

CREATE TABLE endereco (
	ID VARCHAR(10) PRIMARY KEY,
	rua VARCHAR(50)
);

ALTER TABLE pessoa
ADD COLUMN endereco VARCHAR(10) REFERENCES endereco(ID)
ON UPDATE SET NULL
ON DELETE SET NULL;
