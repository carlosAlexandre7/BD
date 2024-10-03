CREATE DATABASE bdEstoque2
GO
USE bdEstoque2	
--DROP DATABASE bdEstoque

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

CREATE TABLE tbEntradaProduto (
    codEntrada INT PRIMARY KEY IDENTITY(1,1),
    codProduto INT,
    dataEntradaProduto DATE,
    quantidadeEntradaProduto INT,
    FOREIGN KEY (codProduto) REFERENCES tbProduto(codProduto)
)

CREATE TABLE tbSaidaProduto (
    codSaidaProduto INT PRIMARY KEY IDENTITY(1,1),
    dataSaidaProduto DATE,
    codProduto INT,
    quantidadeSaidaProduto INT,
    FOREIGN KEY (codProduto) REFERENCES tbProduto(codProduto)
);
