CREATE DATABASE bdEscola
/*DROP DATABASE*/

CREATE TABLE tbAluno
(codAluno INT PRIMARY KEY
,nomeAluno VARCHAR(80)
,dataNascimentoAluno DATETIME 
,rgAluno CHAR(12)
,naturalidadeAluno CHAR(2))

CREATE TABLE tbCurso
(codCurso INT PRIMARY KEY
,nomeCurso VARCHAR(30)
,cargaHorariaCurso CHAR(4)
,valorCurso MONEY)

CREATE TABLE tbTurma
(codTurma INT PRIMARY KEY
,nomeTurma CHAR(4)
,codCurso INT FOREIGN KEY REFERENCES tbCurso(codCurso)
,horarioTurma DATETIME)

CREATE TABLE tbMatricula
(codMatricula INT PRIMARY KEY
,dataMatricula DATE
,codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno)
,codTurma INT FOREIGN KEY REFERENCES tbTurma(codTurma))
