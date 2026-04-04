/* Questão 01. Crie um SCHEMA chamado avaliacaocontinua no seu banco de dados para armazenar os objetos criados nas próximas questões.
Após a execução de todas as instruções, os objetos serão organizados de acordo com a figura. */

CREATE SCHEMA avaliacaocontinua;

/* Questão 02. Crie a tabela company com os atributos company_name e city.
Utilize a restrição not null para o atributo company_name.
O atributo company_name deverá ser uma chave primária. */

CREATE TABLE company (
	company_name VARCHAR(50) NOT NULL,
	city VARCHAR(50),
	
	CONSTRAINT pk_company PRIMARY KEY (company_name)
);

/* Questão 03. Crie a tabela employee com os atributos person_name, street e city.
Utilize a restrição not null para o atributo person_name.
O atributo person_name deverá ser uma chave primária.*/

CREATE TABLE employee (
	person_name VARCHAR(50) NOT NULL,
	street VARCHAR(50),
	city VARCHAR(50),
	
	CONSTRAINT pk_employee PRIMARY KEY (person_name)
);

/* Questão 04. Crie a tabela manages com os atributos person_name e manager_name.
Utilize a restrição not null para o atributo person_name.
O atributo person_name deverá ser uma chave primária. */

CREATE TABLE manages (
	person_name VARCHAR(50) NOT NULL,
	manager_name VARCHAR(50),
	
	CONSTRAINT pk_manages PRIMARY KEY (person_name)
);

/* Questão 05. Crie a tabela works com os atributos person_name, company_name e salary.
Utilize a restrição not null para o atributo person_name e company_name.
O atributo person_name deverá ser uma chave primária. */

CREATE TABLE works (
	person_name VARCHAR(50) NOT NULL,
	company_name VARCHAR(50) NOT NULL,
	salary DECIMAL(11,2),
	
	CONSTRAINT pk_works PRIMARY KEY (person_name)
);

/* Questão 06. Crie a integridade referencial entre a relação works e a relação employee.
O atributo person_name da relação works deverá existir na relação employee.
Utilize as ações em cascata: update e delete. */

ALTER TABLE employee
ADD CONSTRAINT fk_works_employee
FOREIGN KEY (person_name) references works (person_name)
ON UPDATE cascade
ON DELETE cascade;

/* Questão 07. Crie a integridade referencial entre a relação works e a relação company.
O atributo company_name da relação works deverá existir na relação company.
Utilize as ações em cascata: update e delete. */

ALTER TABLE company
ADD CONSTRAINT fk_works_company
FOREIGN KEY (company_name) references works (company_name)
on UPDATE cascade
on DELETE cascade;

/* Questão 08. Crie a integridade referencial entre a relação manages e a relação employee.
O atributo person_name da relação manages deverá existir na relação employee.
Utilize as ações em cascata: update e delete. */

ALTER TABLE employee
ADD CONSTRAINT fk_manages_employee
FOREIGN KEY (person_name) references manages (person_name)
ON UPDATE cascade
ON DELETE cascade;


