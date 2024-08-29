USE bdEscolaIdiomas
/*------------------------------------------1.Criar uma stored procedure “ Busca_Aluno ” que receba o código do aluno e retorne seu nome e data de nascimento---------------------------------------------------------------*/
CREATE PROCEDURE spBusca_Aluno
@codAluno INT
AS
SELECT nomeAluno, DataNascAluno FROM tbAluno
WHERE codAluno = @codAluno

EXEC spBusca_Aluno 1

/*-----------------------------------------2.Criar uma stored procedure “ Insere_Aluno ” que insira um registro na tabela de Alunos.-------------------------------------------------------------*/

CREATE PROCEDURE spInsere_Aluno
	@nome VARCHAR(255),
	@dataNasc DATE,
	@rg VARCHAR(255),
	@naturaliadde VARCHAR(255)
AS
	IF EXISTS(SELECT rgAluno FROM tbAluno where rgAluno LIKE @rg)
	BEGIN
		PRINT ('Não foi possivel cadastrar! rg ' +@rg+' já cadastrado!')
	END
	ELSE
	BEGIN
		INSERT tbAluno(nomeAluno,dataNascAluno,rgAluno,naturalidadeAluno)
		VALUES (@nome, @dataNasc, @rg, @naturaliadde)
	END

EXEC spInsere_Aluno 'Carlos','02/07/2007','123.123.123.53','brasileiro'

SELECT * FROM tbAluno

-----------------------------------------3. Criar uma stored procedure “Aumenta_Preco” que, dados o nome do curso e um percentual, aumente o valor do curso com a porcentagem informada-------------------------------------------------------------

CREATE PROCEDURE spAumentaPreco 
	@nome VARCHAR(255),
	@percentual INT
AS
	UPDATE tbCurso
	SET valorCurso = (valorCurso*@percentual/100)+valorCurso
	WHERE nomeCurso LIKE @nome

EXEC spAumentaPreco 'Inglês',20

SELECT * FROM tbCurso


-----------------------------------------4. Criar uma stored procedure “Exibe_Turma” que, dado o nome da turma exiba todas as informações dela.-----------------------------------------------------------------------

CREATE PROCEDURE spExibe_Turma
	@nome VARCHAR (255)
AS
	SELECT * FROM tbTurma
	WHERE nomeTurma LIKE @nome

EXEC spExibe_Turma '1|A'

-----------------------------------------Criar uma stored procedure “Exibe_AlunosdaTurma” que, dado o nome da turma exiba os seus alunos. ----------------------------------------------------------------------------------------

CREATE PROCEDURE spExibe_AlunosdaTurma
	@nome VARCHAR (255)
AS
	SELECT * FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
	INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
	WHERE nomeTurma LIKE @nome

EXEC spExibe_AlunosdaTurma '1|A'
-----------------------------------------6- Criar uma stored procedure para inserir alunos, verificando pelo cpf se o aluno existe ou não, e informar essa condição via mensagem-------------------------------------------------------
CREATE PROCEDURE spInserirAluno
	@nome VARCHAR(255),
	@datanasc DATE,
	@rg VARCHAR(255),
	@naturalidade VARCHAR(255)
AS
	DECLARE @id INT
	IF EXISTS (SELECT rgAluno FROM tbAluno WHERE rgAluno LIKE @rg)
	BEGIN
		PRINT ('Não é possivel inserir o aluno  de rg ' +@rg+' pois já existe')
	END
	ELSE
	BEGIN
		INSERT tbAluno (nomeAluno,dataNascAluno,rgAluno,naturalidadeAluno)
		VALUES (@nome,@datanasc,@rg,@naturalidade)
		SET @id = (SELECT MAX(codAluno) FROM tbAluno)
		PRINT ('Aluno cadastrado com sucesso')
	END

SELECT * FROM tbAluno
EXEC spInserirAluno 'Edu','2007-03-24','111,111,111-12','brasileiro'

-------------------------------------------------Criar uma stored procedure que receba o nome do curso e o nome do aluno e matricule o mesmo no curso pretendido----------------------------------------------------------------------
	CREATE PROCEDURE spMatricule
	@nomeCurso VARCHAR (255)
	,@nomeAluno VARCHAR (255)
	,@datanasc DATE
	,@rg VARCHAR(255)
	,@naturalidade VARCHAR(255)
AS

	DECLARE @id INT
	IF EXISTS (SELECT rgAluno FROM tbAluno WHERE rgAluno LIKE @rg)
	BEGIN
		PRINT ('Não é possivel inserir o aluno  de rg ' +@rg+' pois já existe')
	END
	ELSE
	BEGIN
	INSERT tbAluno (nomeAluno,dataNascAluno,rgAluno,naturalidadeAluno)
	VALUES (@nomeAluno,@datanasc,@rg,@naturalidade)
	WHERE nomeAluno LIKE @nomeAluno AND nomeCurso LIKE @nomeCurso
	SET @id = (SELECT MAX(codAluno) FROM tbAluno)
	PRINT ('Aluno cadastrado com sucesso')
	END