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

/*-----------------------------------------3. Criar uma stored procedure “Aumenta_Preco” que, dados o nome do curso e um percentual, aumente o valor do curso com a porcentagem informada-------------------------------------------------------------*/
