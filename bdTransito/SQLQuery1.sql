CREATE DATABASE bdTransito
/*DROP DATABASE bdTransito*/

CREATE TABLE tbMotorista (
idMotorista INT PRIMARY KEY IDENTITY (1,1) NOT NULL
,nomeMotorista VARCHAR(200)
,dataNascimentoMotorista DATE
,cpfMotorista  INT
,CNHMotorista INT
,pontuacaoAcumulada INT
);

CREATE TABLE tbVeiculo(
idVeiculo INT PRIMARY KEY IDENTITY (1,1) NOT NULL
,modeloVeiculo VARCHAR (100)
,placa CHAR (7)
,renavam VARCHAR (11)
,anoVeiculo CHAR (4)
,idMotorista INT FOREIGN KEY REFERENCES tbMotorista(idMotorista)
);

CREATE TABLE tbMultas(
idMulta INT PRIMARY KEY IDENTITY (1,1) NOT NULL
,dataMulta DATE
,horaMulta TIME
,pontosMultas INT 
,idVeiculo INT FOREIGN KEY REFERENCES tbVeiculo(idVeiculo)
);

