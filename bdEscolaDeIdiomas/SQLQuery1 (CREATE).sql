CREATE DATABASE bdEscolaIdiomas
GO
USE bdEscolaIdiomas
--DROP DATABASE bdEscolaIdiomas--

CREATE TABLE tbCurso (
    codCurso INT PRIMARY KEY IDENTITY(1,1),
    nomeCurso VARCHAR(255),
    cargahorariaCurso INT,
    valorCurso MONEY
);

CREATE TABLE tbTurma (
    codTurma INT PRIMARY KEY IDENTITY(1,1),
    nomeTurma VARCHAR(255),
    codCurso INT,
    horarioTurma DATETIME,
    CONSTRAINT codCurso FOREIGN KEY (codCurso) REFERENCES tbCurso(codCurso)
);

CREATE TABLE tbAluno (
    codAluno INT PRIMARY KEY IDENTITY(1,1),
    nomeAluno VARCHAR(255),
    dataNascAluno DATE,
    rgAluno VARCHAR(255),
    naturalidadeAluno VARCHAR(255)
);

CREATE TABLE tbMatricula (
    codMatricula INT PRIMARY KEY IDENTITY(1,1),
    dataMatricula DATE,
    codAluno INT,
    codTurma INT,
    CONSTRAINT codAluno FOREIGN KEY (codAluno) REFERENCES tbAluno(codAluno),
    CONSTRAINT codTurma FOREIGN KEY (codTurma) REFERENCES tbTurma(codTurma)
);