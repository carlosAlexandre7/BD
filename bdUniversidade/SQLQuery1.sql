CREATE DATABASE bdUniversidade
/*DROP DATABASE*/

CREATE TABLE tbProfessor(
	idProfessor INT PRIMARY KEY IDENTITY (1,1) NOT NULL
	,nomeProfessor VARCHAR (70)
	,cpfProfessor CHAR (14)
	,rgProfessor CHAR (12)
	,logradouroProfessor VARCHAR (50)
	,numeroLogradouroProfessor VARCHAR (5)
	,cepProfessor CHAR(9)
	,bairroProfessor VARCHAR (40)
	,cidadeProfessor VARCHAR (40)
	,estadoProfessor VARCHAR (40)
	,paisProfessor VARCHAR (40)
	)

CREATE TABLE tbCurso(
	idCurso INT PRIMARY KEY IDENTITY (1,1) NOT NULL
	,nomeCurso VARCHAR (45)
	,descricaoCurso VARCHAR(60)
	,cargaHorariaCurso INT
)

CREATE TABLE tbDisciplina(
	idCurso INT PRIMARY KEY IDENTITY (1,1) NOT NULL
	,nomeDisciplina VARCHAR(50)
	,descDisciplina VARCHAR(55)
)

CREATE TABLE tbCursoDsiciplina(
	idCurspDisciplina INT PRIMARY KEY IDENTITY (1,1) NOT NULL
	,idCurso INT FOREIGN KEY REFERENCES tbCUrso(idCurso)
	,idDisciplina INT FOREIGN KEY REFERENCES tbDisciplina(idDisciplina)
)

CREATE TABLE tbSemestre(
	idSemestre INT PRIMARY KEY IDENTITY (1,1)
	,idTurma INT FOREIGN KEY REFERENCES tbTurma(idTurma)
)

CREATE TABLE tbAluno (
	idAluno INT PRIMARY KEY IDENTITY (1,1) NOT NULL
	,nomeAluno VARCHAR (70)
	,cpfAluno CHAR (14)
	,rgAluno CHAR (12)
	,logradouroAluno VARCHAR (50)
	,numeroLogradouroAluno VARCHAR (5)
	,cepAluno CHAR(9)
	,bairroAluno VARCHAR (40)
	,cidadeAluno VARCHAR (40)
	,estadoAluno VARCHAR (40)
	,paisAluno VARCHAR (40)
	,idSemestre INT FOREIGN KEY REFERENCES tbSemestre(idSemestre)
)

CREATE TABLE tbFoneAluno(
idFoneAluno INT PRIMARY KEY IDENTITY (1,1)
idAluno INT FOREIGN KEY REFERENCES tbAluno (idAluno)
foneAluno VARCHAR (11)
)
