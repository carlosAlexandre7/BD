/*1. Crie uma função que informada uma data da matrícula , retorne o dia da
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
SET @DiaSemana='Terça-Feira'
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
SET @DiaSemana = 'Sábado'
END

RETURN @DiaSemana 
END


SELECT dataMatricula AS 'Data Matrícula', 'Dia Da Semana'=dbo.fcDiaSemana(dataMatricula) FROM tbMatricula

 /*2. Crie uma função que de acordo com a carga horária do curso exiba curso
rápido ou curso extenso. (Rápido menos de 1000 horas).*/

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

SELECT cargaHorariaCurso AS 'Carga horária do curso', 'Situação do Curso' = dbo.fcCargaExt(cargaHorariaCurso) fROM tbCurso
/*3. Crie uma função que de acordo com o valor do curso exiba curso caro ou curso
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

SELECT valorCurso AS 'Valor do curso', 'Situação do Curso' = dbo.fcCursoCaro(valorCurso) fROM tbCurso

/*4. Criar uma função que informada a data da matrícula converta-a no formato dd/mm/aaaa.*/

CREATE FUNCTION fcConverteData (@dataMatricula DATETIME)
RETURNS VARCHAR (12)
AS
BEGIN

DECLARE @ConverteData VARCHAR (12)
SET @ConverteData = CONVERT(VARCHAR(10), @dataMatricula, 103)

RETURN @ConverteData

END

SELECT dataMatricula, 'Data da Matricula no Modelo Brasileiro' = dbo.fcConverteData(dataMatricula) FROM tbMatricula