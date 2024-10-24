CREATE DATABASE bdEscola
GO
USE bdEscola
--DROP DATABASE bdEscola--

CREATE TABLE tbCurso(
	idCurso INT PRIMARY KEY IDENTITY(1,1)
	, nomeCurso VARCHAR(45) NOT NULL
	, cargaHorariaCurso INT NOT NULL
	, valorCurso MONEY NOT NULL
)

CREATE TABLE tbAluno(
	idAluno INT PRIMARY KEY IDENTITY(1,1)
	, nomeAluno VARCHAR(75) NOT NULL
	, dataNasciAluno SMALLDATETIME NOT NULL
	, rgAluno VARCHAR(14) NOT NULL
	, naturalidadeAluno VARCHAR(20) NOT NULL
)
CREATE TABLE tbTurma(
	idTurma INT PRIMARY KEY IDENTITY(1,1)
	, nomeTurma VARCHAR(20) NOT NULL
	, horarioTurma DATETIME NOT NULL
	, idCurso INT FOREIGN KEY REFERENCES tbCurso(idCurso)
)

CREATE TABLE tbMatricula(
	idMatricula INT PRIMARY KEY IDENTITY(1,1)
	, dataMatricula DATETIME NOT NULL
	, idAluno INT FOREIGN KEY REFERENCES tbAluno(idAluno)
	, idTurma INT FOREIGN KEY REFERENCES tbTurma(idTurma)
)

