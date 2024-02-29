CREATE DATABASE bdEstoque
GO
USE bdEstoque
/*DROP DATABASE*/

CREATE TABLE tbCliente(
codCliente INT PRIMARY KEY IDENTITY(1,1)
,nomeCliente VARCHAR (61)
,cpfCliente CHAR (14)
,emailCliente VARCHAR (40)
,sexoCliente CHAR (1)
,dataNascimentoCliente DATE
)

CREATE TABLE tbFabricante(
codFabricante INT PRIMARY KEY IDENTITY(1,1)
,nomeFabricante VARCHAR (40)
)

CREATE TABLE tbFornecedor(
codFornecedor INT PRIMARY KEY IDENTITY(1,1)
,nomeFornecedor VARCHAR(40)
,contatoFornecedor VARCHAR (61)
)

CREATE TABLE tbVenda(
codVenda  INT PRIMARY KEY IDENTITY(1,1)
,dataVenda DATETIME
,valorTotalVenda MONEY
,codCliente INT FOREIGN KEY REFERENCES tbCliente(codCliente)
)

CREATE TABLE tbProduto(

)