/* Questão 01. Crie as contas de usuário User_A, User_B, User_C, User_D e User_E.*/

CREATE USER User_A WITH PASSWORD = 'userA@PTB';
CREATE USER User_B WITH PASSWORD = 'userB@PTB';
CREATE USER User_C WITH PASSWORD = 'userC@PTB';
CREATE USER User_D WITH PASSWORD = 'userD@PTB';
CREATE USER User_E WITH PASSWORD = 'userE@PTB';

/*Questão 02. Considere o esquema de banco de dados relacional university.
O User_A poderá selecionar ou modificar qualquer relação, exceto CLASSROOM, 
e pode conceder qualquer um desses privilégios a outros usuários. */

GRANT SELECT, INSERT, DELETE, UPDATE ON SCHEMA::Student_PT3036472 TO User_A WITH GRANT OPTION;
REVOKE ALL ON classroom FROM User_A CASCADE;

/* Questão 03. Liste as permissões do User_A.*/

SELECT princ.name,
	   princ.type_desc,
	   perm.permission_name,
	   perm.state_desc,
	   perm.class_desc,
	   object_name(perm.major_id)
FROM   sys.database_principals princ
LEFT JOIN sys.database_permissions perm
ON perm.grantee_principal_id = princ.principal_id
WHERE princ.type_desc = 'User_A'
ORDER BY princ.name;