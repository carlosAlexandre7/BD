CREATE DATABASE bdEstoque
GO
--DROP DATABASE bdEstoque
USE bdEstoque

CREATE TABLE tblCategoriaProduto (
  codCategoria INT PRIMARY KEY IDENTITY (1,1),
  nomeCategoria VARCHAR(255)
);

CREATE TABLE tblProduto (
  codProduto INT PRIMARY KEY IDENTITY (1,1),
  nomeProduto VARCHAR(255),
  precoVenda DECIMAL(10,2),
  codCategoria INT,
  FOREIGN KEY (codCategoria) REFERENCES tblCategoriaProduto(codCategoria)
);

CREATE TABLE tblCliente (
  codCliente INT PRIMARY KEY IDENTITY (1,1),
  nomeCliente VARCHAR(255),
  dataNascimento DATE,
  ruaCliente VARCHAR(255),
  numRuaCliente INT,
  cepCliente VARCHAR(20),
  bairroCliente VARCHAR(100),
  cidadeCliente VARCHAR(100),
  estadoCliente CHAR(2),
  cpfCliente VARCHAR(20),
  sexoCliente CHAR(1),
);

CREATE TABLE tblEncomenda (
   codEncomenda INT PRIMARY KEY IDENTITY (1,1),
   valorTotal DECIMAL(10,2),
   dataEncomenda DATE,
   codCliente INT,
   dataEntregaEncomenda DATE,
   FOREIGN KEY (codCliente) REFERENCES tblCliente(codCliente)
);

CREATE TABLE tblItensEncomenda (
   codItemEncomenda INT PRIMARY KEY IDENTITY (1,1),
   quantidade DECIMAL(10,2),
   subTotal DECIMAL(10,2),
   codProduto INT,
   codEncomenda INT,
   FOREIGN KEY (codProduto) REFERENCES tblProduto(codProduto),
   FOREIGN KEY (codEncomenda) REFERENCES tblEncomenda(codEncomenda)
);
