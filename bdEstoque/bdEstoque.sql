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
codProduto INT PRIMARY KEY IDENTITY(1,1)
,descricaoProduto VARCHAR (400)
,valorProduto MONEY
,quantidadeProduto VARCHAR (7)
,codFabricante INT FOREIGN KEY REFERENCES tbFabricante (codFabricante)
)

CREATE TABLE tbItensVenda(
codItensVenda INT PRIMARY KEY IDENTITY(1,1)
,codVenda INT FOREIGN KEY REFERENCES tbVenda (codVenda)
,codProduto INT FOREIGN KEY REFERENCES tbProduto (codProduto)
,quantidadeItensVenda VARCHAR (7)
,subTotalItensVenda MONEY
)

USE bdEstoque

INSERT INTO tbCliente (nomeCliente,cpfCliente,emailCliente,sexoCliente,dataNascimento)        
VALUES
        ('Amando José Santana','123.456.789-00','amandojsanatana@outlook.com','M','21/02/1961')
        ,('Sheila Carvalho Leal','456.789.098-23','scarvalho@ig.com.br','F','13/09/1978')
        ,('Carlos Henrique Souza','765.982.782-99','chenrique@ig.com.br','M','08/09/1981')
        ,('Maria Aparecida Souza','873.653.098-99','mapdasouza@outlook.com','F','07/07/1962')
        ,('Adriana Nogueira Silva','763.543.093-88','drica1977@ig.com.br','F','09/04/1977')
        ,('Paulo Henrique Silva','873.901.231-11','phsilva80@hotmail.com','M','02/02/1987')

INSERT INTO tbFabricante (nomeFabricante)
VALUES
        ('Unilever')
        ,('P&G')
        ,('Bunge')

INSERT INTO tbFornecedor (nomeFornecedor,contatoFornecedor)
VALUES
        ('Atacadão','Carlos Santos')
        ,('Assai','Maria Stella')
        ,('Roldão','Paulo César')

INSERT INTO tbProduto (descricaoProduto,valorProduto,quantidadeProduto)
VALUES
        ('Amaciante Downy',5.76,1500)
        ,('Amaciante Comfort',5.45.2300)
        ,('Sabão em pó OMO',5.99,1280)
        ,('Margarina Qually',4,76,2500)
        ,('Salsicha Hot Dog Saddia',6.78,2900)
        ,('Mortadela Perdigão',2.50,1200)
        ,('Hamburguer Saddia',9.89,1600)
        ,('Fralda Pampers',36,340)
        ,('Xampu Seda',5.89,800)
        ,('Condicionador Seda',6.50,700)

INSERT INTO tbVenda
tbVenda(dataVenda,valorTotalVenda)
VALUES
('01/02/2014',4500)
,('03/02/2014',3400)
,('10/02/2014',2100)
,('15/02/2014',2700)
,('17/03/2014',560)
,('09/04/2014',1200)
,('07/05/2014',3500)
,('07/05/2014',3400)
,('05/05/2014',4000)

INSERT INTO tbItensVenda
(quantidadeItensVenda,subTotalItensVenda)
VALUES
(200,1500)
,(300,3000)
,(120,1400)
,(200,1000)
,(130,1000)
,(200,2100)
,(120,1000)
,(450,700)
,(200,560)
,(200,600)
,(300,600)
,(300,2500)
,(200,1000)
,(250,1700)
,(200,1700)
,(1000,4000)
