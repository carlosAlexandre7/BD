/*1. Crie uma fun��o que informada uma data da matr�cula , retorne o dia da
semana.*/
CREATE FUNCTION fcDiaSemana(@DiaSemana DATETIME) 
RETURNS VARCHAR(24) 
AS 
BEGIN 

DECLARE @Dia INT 

SET @Dia = DATEPART(dw, @DiaSemana)

IF @Dia = 1 BEGIN
SET @DiaSemana='Domingo'
END

IF @Dia = 2 BEGIN
SET @DiaSemana='Segunda-Feira'
END

IF @Dia = 3 BEGIN	
SET @DiaSemana='Ter�a-Feira'
END

IF @Dia = 4 BEGIN
SET @DiaSemana = 'Quarta-Feira'
END

IF @Dia = 5 BEGIN
SET @DiaSemana = 'Quinta-Feira'
END

IF @Dia = 6 BEGIN
SET @DiaSemana = 'Sexta-Feira'
END

IF @Dia = 7 BEGIN
SET @DiaSemana = 'S�bado'
END

RETURN @DiaSemana 
END


SELECT dataMatricula AS 'Data Matr�cula', 'Dia Da Semana'=dbo.fcDiaSemana(dataMatricula) FROM tbMatricula

 /*2. Crie uma fun��o que de acordo com a carga hor�ria do curso exiba curso
r�pido ou curso extenso. (R�pido menos de 1000 horas).*/

CREATE FUNCTION fcCargaExt (@CargaHoraria INT) 
RETURNS VARCHAR(24)
AS 
BEGIN 

DECLARE @TamanhoCurso VARCHAR (24)
IF (@CargaHoraria <= 1000)
BEGIN
SET @TamanhoCurso = ('Curso Curto')
END

IF (@CargaHoraria >= 1000)
BEGIN
SET @TamanhoCurso = ('Curso Extenso')
END

RETURN @TamanhoCurso

END

SELECT cargaHorariaCurso AS 'Carga hor�ria do curso', 'Situa��o do Curso' = dbo.fcCargaExt(cargaHorariaCurso) fROM tbCurso
/*3. Crie uma fun��o que de acordo com o valor do curso exiba curso caro ou curso
barato. (Curso caro acima de 400).*/

CREATE FUNCTION fcCursoCaro (@ValorCurso MONEY) 
RETURNS VARCHAR(24)
AS 
BEGIN 

DECLARE @CursoCB VARCHAR (24)
IF (@ValorCurso <= 400)
BEGIN
SET @CursoCB = ('Curso barato')
END

IF (@ValorCurso >= 400)
BEGIN
SET @CursoCB = ('Curso caro')
END

RETURN @CursoCB

END

SELECT valorCurso AS 'Valor do curso', 'Situa��o do Curso' = dbo.fcCursoCaro(valorCurso) fROM tbCurso

/*4. Criar uma fun��o que informada a data da matr�cula converta-a no formato dd/mm/aaaa.*/

CREATE FUNCTION fcConverteData (@dataMatricula DATETIME)
RETURNS VARCHAR (12)
AS
BEGIN

DECLARE @ConverteData VARCHAR (12)
SET @ConverteData = CONVERT(VARCHAR(10), @dataMatricula, 103)

RETURN @ConverteData

END

SELECT dataMatricula, 'Data da Matricula no Modelo Brasileiro' = dbo.fcConverteData(dataMatricula) FROM tbMatricula