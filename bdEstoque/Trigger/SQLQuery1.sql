CREATE DATABASE bdMulta
GO
USE bdMulta	
--DROP DATABASE bdMulta

CREATE TABLE tbMotorista(
codMotorista INT PRIMARY KEY IDENTITY(1,1)
,nomeMotorista VARCHAR(255)
,dataNascimentoMotorista DATE
,cpfMotorista VARCHAR(12)
,cnhMotorista VARCHAR(9)
,pontuacaoAcumulada INT
)

CREATE TABLE tbVeiculo(
codVeiculo INT PRIMARY KEY IDENTITY(1,1)
,modeloVeiculo VARCHAR (70)
,placa VARCHAR (7)
,renavam VARCHAR (11)
,anoVeiculo INT
,idMotorista INT
)

CREATE TABLE tbMultas(
codMultas INT PRIMARY KEY IDENTITY(1,1)
,dataMulta DATE
,horaMulta TIME
,pontosMulta INT
,idVeiculo INT
)
