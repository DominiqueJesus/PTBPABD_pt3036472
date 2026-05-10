/* Questão 01. Crie um procedimento denominado salaryHistogram, que distribua as frequências dos salários dos Professores em intervalos (Histograma).
O número de intervalos será calculado de acordo com o parâmetro de entrada do procedimento.  */

CREATE PROCEDURE Student_PT3036472.salaryHistogram @numIntervalo INT
AS
BEGIN
	SET NOCOUNT ON;

	IF @numIntervalo <= 0 SET @numIntervalo = 1;
	
	DECLARE @minSalary INT, @maxSalary INT, @counter INT, 
			@amplitude INT, @bin_min INT, @bin_max INT, @total INT;
	DECLARE @temp TABLE (valorMinimo INT, valorMaximo INT, total INT);

	SET @minSalary = (SELECT MIN(i.salary) FROM instructor i);
	SET @maxSalary = (SELECT CEILING(MAX(i.salary)) FROM instructor i);
	SET @amplitude = (@maxSalary - @minSalary) / @numIntervalo;
	SET @counter = 1;
	SET @bin_min = @minSalary;
	
	WHILE @counter <= @numIntervalo 
	BEGIN
	
		IF @counter = @numIntervalo 
			SET @bin_max = @maxSalary
		ELSE
			SET @bin_max = @bin_min + @amplitude;
	
		SELECT @total = COUNT(*) 
			FROM instructor i
			WHERE i.salary >= @bin_min AND
			i.salary <= @bin_max;
		
		INSERT INTO @temp 
		VALUES (@bin_min,@bin_max,@total);
	
		SET @counter = @counter + 1;
		SET @bin_min = @bin_max + 1;
	END
	SELECT * FROM @temp;
END

-- Exemplo: EXEC dbo.salaryHistogram 5;

EXEC Student_PT3036472.salaryHistogram 5;


	
