CREATE DATABASE bdBanco
GO
USE bdBanco

CREATE TABLE tbCliente(
codCliente INT PRIMARY KEY IDENTITY(1,1)
,nomeCliente VARCHAR (100)
,cpfCliente VARCHAR (14)
)

CREATE  TABLE tbContaCorrente(
codConta INT PRIMARY KEY IDENTITY(1,1)
,numConta INT
,saldoConta MONEY
,codCliente INT FOREIGN KEY REFERENCES tbCliente(codCliente)
)

CREATE TABLE tbDeposito(
codDeposito INT PRIMARY KEY IDENTITY(1,1)
,valorDeposito MONEY
,numConta INT FOREIGN KEY REFERENCES tbContaCorrente(codConta)
,dataDeposito DATE
,horaDeposito TIME
)

CREATE TABLE tbSaque(
codSaque INT PRIMARY KEY IDENTITY (1,1)
,valorSaque MONEY
,numConta INT FOREIGN KEY REFERENCES tbContaCorrente(codConta)
,dataSaque DATE
,horaSaque TIME
)
