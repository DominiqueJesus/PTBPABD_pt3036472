/* Questão 01. 

Crie uma Trigger denominada dbo.trigger_prevent_assignment_teaches para impedir que aulas sejam atribuidas a um instrutor 
que já possui 2 ou mais atribuições no ano. */

// Versão 1 - Inserção individual
CREATE TRIGGER Student_PT3036472.trigger_prevent_assignment_teaches
ON Student_PT3036472.teaches
AFTER INSERT AS
IF (ROWCOUNT_BIG = 0)
RETURN;
IF ((SELECT COUNT(t.course_id) FROM inserted i JOIN teaches t ON i.ID = t.ID AND i.year = t.year WHERE i.ID = t.ID AND i.year = t.year) >= 2)
BEGIN
	RAISERROR('O instrutor já possui 2 ou mais atribuições nesse ano.', 16, 1);
	ROLLBACK TRANSACTION;
	RETURN
END;

// Versão 2 - Inserções em massa
CREATE TRIGGER Student_PT3036472.trigger_prevent_mass_assignment_teaches
ON Student

SELECT COUNT(t.course_id), i.ID, t.year
FROM takes t JOIN instructor i ON t.ID = i.ID GROUP BY i.ID, t.year;