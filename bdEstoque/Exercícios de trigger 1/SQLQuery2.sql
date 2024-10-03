/*Criar um trigger que, ao ser feita uma venda (Insert na tabela
tbItensVenda), todos os produtos vendidos tenham sua quantidade
atualizada na tabela tbProduto. Exemplo, se foi feita uma venda de 5
unidades do produto código 01, na tabela tbProduto a quantidade desse
produto será a quantidade atual – 5;*/

CREATE TRIGGER tgDiminuiProduto ON tbItensVenda AFTER INSERT
AS
 DECLARE @quanti INT, @codProduto INT
 SELECT @quanti = quantidadeProduto FROM tbProduto
 SELECT @codProduto = codProduto FROM tbProduto

 UPDATE tbProduto 
 SET quantidadeProduto = @quanti - quantidadeProduto
 WHERE @codProduto = codProduto


  INSERT INTO tbItensVenda
	(codVenda, codProduto, quantidadeItensVenda, subTotalItensVenda)
  VALUES
	(1, 1, 10, 100)

SELECT * FROM tbItensVenda
SELECT * FROM tbProduto

/*Criar uma trigger que, quando for inserida uma nova entrada de produtos
na tbEntradaProduto, a quantidade desse produto seja atualizada e
aumentada na tabela tbProduto;*/


CREATE TRIGGER tgEntradaPro ON tbEntradaProduto AFTER INSERT
AS
 DECLARE @quanti INT, @codProduto INT
 SELECT @quanti = quantidadeProduto FROM tbProduto
 SELECT @codProduto = codProduto FROM tbProduto

 UPDATE tbProduto
 SET quantidadeProduto = @quanti + quantidadeProduto
 WHERE @codProduto = codProduto


INSERT INTO tbEntradaProduto
	(dataEntradaProduto,codProduto, quantidadeEntradaProduto)
VALUES
	('2024-05-05', 3, 100)

/*Criar uma trigger que, quando for feita uma venda de um determinado
produto, seja feito um Insert na tbSaidaProduto.*/

CREATE TRIGGER tgSaidaPro ON tbItensVenda FOR INSERT
AS
DECLARE @codProduto INT, @quanti INT

 SELECT @codProduto=codProduto FROM INSERTED
 SELECT @quanti=quantidadeItensVenda FROM INSERTED

 INSERT INTO tbSaidaProduto
	(dataSaidaProduto, codProduto, quantidadeSaidaProduto)
VALUES
	(GETDATE(), @codProduto, @quanti)


	 INSERT INTO tbItensVenda
	(codProduto, quantidadeItensVenda, subTotalItensVenda)
VALUES
	(3, 10, 100)