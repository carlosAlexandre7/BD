CREATE DATABASE bdEstoque
GO
USE bdEstoque
--DATABASE DROP bdEstoque

CREATE TABLE tbCliente(
codCliente INT PRIMARY KEY IDENTITY(1,1)
,nomeCliente VARCHAR (200)
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
,dataVenda DATE
,valorTotalVenda MONEY
,codCliente INT FOREIGN KEY REFERENCES tbCliente(codCliente)
)

CREATE TABLE tbProduto(
codProduto INT PRIMARY KEY IDENTITY(1,1)
,descricaoProduto VARCHAR (400)
,valorProduto MONEY
,quantidadeProduto INT
,codFabricante INT FOREIGN KEY REFERENCES tbFabricante (codFabricante)
,codFornecedor INT FOREIGN KEY REFERENCES tbFornecedor (codFornecedor)
)

CREATE TABLE tbItensVenda(
codItensVenda INT PRIMARY KEY IDENTITY(1,1)
,codVenda INT FOREIGN KEY REFERENCES tbVenda (codVenda)
,codProduto INT FOREIGN KEY REFERENCES tbProduto (codProduto)
,quantidadeItensVenda VARCHAR (7)
,subTotalItensVenda MONEY
)

INSERT INTO tbCliente (nomeCliente,cpfCliente,emailCliente,sexoCliente,dataNascimentoCliente)        
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

INSERT INTO tbProduto (descricaoProduto,valorProduto,quantidadeProduto,codFabricante,codFornecedor)                         
VALUES
        ('Amaciante Downy',5.76,1500,2,1)
        ,('Amaciante Comfort',5.45,2300,1,1)
        ,('Sabão em pó OMO',5.99,1280,1,2)
        ,('Margarina Qually',4.76,2500,3,1)
        ,('Salsicha Hot Dog Saddia',6.78,2900,3,2)
        ,('Mortadela Perdigão',2.50,1200,3,3)
        ,('Hamburguer Saddia',9.89,1600,3,1)
        ,('Fralda Pampers',36,340,2,3)
        ,('Xampu Seda',5.89,800,1,2)
        ,('Condicionador Seda',6.50,700,1,3)

INSERT INTO tbVenda(dataVenda,valorTotalVenda)
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



aSELECT SUM(quantidadeProduto) FROM tbProduto
WHERE codFabricante = 2

bSELECT AVG(valorProduto) FROM tbProduto
WHERE codFabricante = 2

cSELECT SUM(valorProduto) FROM tbProduto
WHERE codFabricante = 1

dSELECT AVG(valorProduto) FROM tbProduto
WHERE codFabricante = 3

eSELECT SUM(quantidadeProduto) FROM tbProduto
WHERE codFabricante = 3

fSELECT AVG(valorProduto) FROM tbProduto
WHERE codFabricante = 1

gSELECT AVG(quantidadeProduto) FROM tbProduto
WHERE codFabricante = 2

hSELECT AVG(valorProduto) FROM tbProduto
WHERE quantidadeProduto <= 200

iSELECT AVG(quantidadeProduto) FROM tbProduto
WHERE codFabricante = 1

SELECT SUM(valorTotalVenda) FROM tbVenda 
WHERE (MONTH(dataVenda) = 2 AND YEAR(dataVenda) = 2014) 
    OR (MONTH(dataVenda) = 3 AND YEAR(dataVenda) = 2014)

SELECT SUM(quantidadeProduto) FROM tbProduto
WHERE codProduto < 3

SELECT MAX(valorproduto) FROM tbProduto

SELECT MIN(valorproduto) FROM tbProduto

nSELECT AVG(quantidadeProduto) FROM tbProduto
WHERE codProduto < 3

SELECT COUNT(descricaoProduto) FROM tbProduto

SELECT COUNT(quantidadeProduto) FROM tbProduto
WHERE codFabricante = 1

SELECT COUNT(quantidadeProduto) FROM tbProduto
WHERE codFabricante != 1

SELECT SUM(quantidadeProduto) FROM tbProduto
WHERE quantidadeProduto > 800

SELECT AVG(quantidadeProduto) FROM tbProduto
WHERE quantidadeProduto > 1000 
AND codFabricante = 1

SELECT SUM(valorTotalVenda) FROM tbVenda
WHERE YEAR(dataVenda) = 2014
