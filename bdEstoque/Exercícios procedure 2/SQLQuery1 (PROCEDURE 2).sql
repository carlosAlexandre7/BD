/*a) Criar uma Stored Procedure para inserir as categorias de produto conforme abaixo*/
CREATE PROCEDURE spInsert_Ctg
	@nomeCategoria VARCHAR(255)
AS 
	IF EXISTS(SELECT nomeCategoria FROM tblCategoriaProduto WHERE nomeCategoria LIKE @nomeCategoria)
	BEGIN
		PRINT ('Não foi possivel cadastrar! categoria ' +@nomeCategoria+' já cadastrado!')
	END
	ELSE
	BEGIN
		INSERT tblCategoriaProduto (nomeCategoria)
		VALUES (@nomeCategoria)
		PRINT ('Categoria cadastrada com sucesso!')
	END

SELECT * FROM tblCategoriaProduto
EXEC spInsert_Ctg 'Bolo Festa'
EXEC spInsert_Ctg 'Bolo Simples'
EXEC spInsert_Ctg 'Bolo Torta'
EXEC spInsert_Ctg 'Salgado'

/*b) Criar uma Stored Procedure para inserir os produtos abaixo, sendo que, a procedure deverá 
antes de inserir verificar se o nome do produto já existe, evitando assim que um produto seja 
duplicado*/

CREATE PROCEDURE spInsert_produto
	@nomeProduto VARCHAR(255),
	@preco DECIMAL,
	@idCategoria INT
AS
	IF EXISTS (SELECT nomeProduto FROM tblProduto WHERE nomeProduto LIKE @nomeProduto)
	BEGIN
		PRINT ('Não foi possivel cadastrar! produto ' +@nomeProduto+' já cadastrado!')
	END
	ELSE
	BEGIN
		INSERT tblProduto (nomeProduto,precoVenda,codCategoria)
		VALUES (@nomeProduto, @preco, @idCategoria)
		PRINT('Produto cadastrado com sucesso!')
	END

EXEC spInsert_produto 'Bolo Floresta Negra',42,1
EXEC spInsert_produto 'Bolo Prestigio',43,1
EXEC spInsert_produto 'Bolo Nutella',44,1
EXEC spInsert_produto 'Bolo Formigueiro',17,2
EXEC spInsert_produto 'Bolo de Cenoura',19,2
EXEC spInsert_produto 'Torta de Palmito',45,3
EXEC spInsert_produto 'Torta de Frango com Catupiry',47,3
EXEC spInsert_produto 'Torta de Escarola',44,3
EXEC spInsert_produto 'Coxinha de Frango',25,4
EXEC spInsert_produto 'Esfiha de Carne',27,4
EXEC spInsert_produto 'Folhado Queijo',31,4
EXEC spInsert_produto 'Risoles Misto',29,4

SELECT * FROM tblProduto

/*c) Criar uma stored procedure para cadastrar os clientes abaixo relacionados, sendo que deverão 
ser feitas duas validações:
- Verificar pelo CPF se o cliente já existe. Caso já exista emitir a mensagem: “Cliente cpf XXXXX 
já cadastrado” (Acrescentar a coluna CPF)
- Verificar se o cliente é morador de Itaquera ou Guaianases, pois a confeitaria não realiza 
entregas para clientes que residam fora desses bairros. Caso o cliente não seja morador desses 
bairros enviar a mensagem “Não foi possível cadastrar o cliente XXXX pois o bairro XXXX não é 
atendido pela confeitaria”*/

	CREATE PROCEDURE spInsert_Cliente
		@nome VARCHAR(255),                  
		@datanasc DATE,
		@rua VARCHAR(255),
		@numRua INT,
		@cep VARCHAR(20),
		@bairro VARCHAR(100),
		@cidade VARCHAR(100),
		@estado VARCHAR(2),
		@cpf VARCHAR(20),
		@sexo CHAR(1)
	AS
		IF EXISTS (SELECT cpfCliente FROM tblCliente WHERE cpfCliente LIKE @cpf)
		BEGIN
			PRINT ('Não foi possivel cadastrar! produto ' +@cpf+' já cadastrado!')
		END
		ELSE
		BEGIN
			IF EXISTS (SELECT bairroCliente FROM tblCliente WHERE bairroCliente NOT LIKE 'Itaquera' AND bairroCliente NOT LIKE 'Guaianases')
			BEGIN
				PRINT ('Não foi possivel cadastrar! não atendemos o bairro ' +@Bairro)
			END
			ELSE
			BEGIN
				INSERT tblCliente (nomeCliente,dataNascimento,ruaCliente,numRuaCliente,cepCliente,bairroCliente,cidadeCliente,estadoCliente,cpfCliente,sexoCliente)
				VALUES (@nome, @datanasc, @rua, @numRua, @cep, @Bairro,@cidade, @estado, @cpf, @sexo)
			END
		END

		

EXEC spInsert_Cliente 'Samira Fatah', '1990-05-05', 'Rua Aguapeí', 1000, '08.090-000', 'Guaianases','SP', 'SP', '305.928.716-32', 'F'
EXEC spInsert_Cliente 'Celia Nogueira', '1992-06-06 00:00:00', 'Rua Andes', 234, '08.456-090', 'Guaianases','SP', 'RJ', '174.562.839-27', 'F'
EXEC spInsert_Cliente 'Paulo Cesar Siqueira', '1984-04-04 00:00:00', 'Rua Castelo do Piauí', 232, '08.109-000', 'Itaquera','SP', 'MG', '832.901.654-48', 'M'
EXEC spInsert_Cliente 'Rodrigo Favoroni', '1991-04-09 00:00:00', 'Rua Sansão Castelo Branco', 10, '08.431-090', 'Guaianases','SP', 'SP', '502.674.913-87', 'M'
EXEC spInsert_Cliente 'Flávia Regina Brito', '1992-04-22 00:00:00', 'Rua Mariano Moro', 300, '08.200-123', 'Itaquera','SP', 'PR', '918.435.267-51', 'F'

/*d) Criar via stored procedure as encomendas abaixo relacionadas, fazendo as verificações abaixo:
- No momento da encomenda o cliente irá fornecer o seu cpf. Caso ele não tenha sido
cadastrado enviar a mensagem “não foi possível efetivar a encomenda pois o cliente xxxx não
está cadastrado”
- Verificar se a data de entrega não é menor do que a data da encomenda. Caso seja enviar a
mensagem “não é possível entregar uma encomenda antes da encomenda ser realizada”
- Caso tudo esteja correto, efetuar a encomenda e emitir a mensagem: “Encomenda XXX para
o cliente YYY efetuada com sucesso” sendo que no lugar de XXX deverá aparecer o número da
encomenda e no YYY deverá aparecer o nome do cliente;*/

CREATE PROCEDURE spcpf_entrega
	@cpf VARCHAR (20)
	,@dataEncomenda DATE
	,@valorTotal DECIMAL
	,@dataEntrega  DATE
	
AS
	IF EXISTS (SELECT cpfCliente FROM tblCliente WHERE cpfCliente LIKE @cpf)
	BEGIN
		PRINT ('não foi possível efetivar a encomenda pois o cliente'+@cpf+' não está cadastrado')
	END 
	ELSE
	BEGIN
	IF EXISTS (SELECT dataEncomenda FROM tblEncomenda WHERE dataEntregaEncomenda<@dataEncomenda)
	BEGIN
	PRINT ('não é possível entregar uma encomenda antes da encomenda ser realizada')
	END
	ELSE
	BEGIN
	DECLARE @codCliente INT, @codEncomenda INT
	SET @codCliente = (SELECT codCliente FROM tblCliente WHERE cpfCliente LIKE @cpf)
	INSERT tblEncomenda(dataEncomenda,codCliente,valorTotal,dataEntregaEncomenda) 
	VALUES (@dataEncomenda,@codCliente,@valorTotal,@dataEntrega)
	SET @codEncomenda = (SELECT MAX(codEncomenda) FROM tblEncomenda)
	PRINT ('Encomenda de codigo '+@codEncomenda+' para o cliente de codigo '+@codCliente+' efetuada com sucesso')
	END
END
EXEC spcpf_entrega '22345678900', '2015-08-08', 450.00, '2015-08-15'
EXEC spcpf_entrega '32345678900', '2015-10-10', 200.00, '2015-10-15'
EXEC spcpf_entrega '42345678900', '2015-08-08', 450.00, '2015-08-15'
	

/*e) Ao adicionar a encomenda, criar uma Stored procedure, para que sejam inseridos os itens da 
encomenda*/

CREATE PROCEDURE spInserir_Encomenda
@codEncomenda INT,
@codProduto INT,
@quatidade DECIMAL,
@subTotal DECIMAL
AS
	INSERT tblItensEncomenda (codEncomenda,codProduto,quantidade,subTotal)
	VALUES (@codEncomenda,@codProduto,@quatidade,@subTotal);

	SELECT * FROM tblItensEncomenda

EXEC spInserir_Encomenda 1, 1, 1, 105.00
EXEC spInserir_Encomenda 2, 1, 10, 70.00
EXEC spInserir_Encomenda 3, 1, 9, 150.00
EXEC spInserir_Encomenda 4, 1, 12, 125.00
EXEC spInserir_Encomenda 5, 2, 9, 200.00
EXEC spInserir_Encomenda 6, 3, 11, 100.00
EXEC spInserir_Encomenda 7, 3, 9, 50.00
EXEC spInserir_Encomenda 8, 4, 2, 150.00
EXEC spInserir_Encomenda 9, 4, 3, 100.00
EXEC spInserir_Encomenda 10, 5, 6, 150.00

/*f) Após todos os cadastros, criar Stored procedures para alterar o que se pede:
1- O preço dos produtos da categoria “Bolo festa” sofreram um aumento de 10%
2- O preço dos produtos categoria “Bolo simples” estão em promoção e terão um desconto
de 20%;
3- O preço dos produtos categoria “Torta” aumentaram 25%
4- O preço dos produtos categoria “Salgado”, com exceção da esfiha de carne, sofreram um
aumento de 20%*/

/*CREATE PROCEDURE spAumenta_preco
	@nome VARCHAR(255),
	@percentual INT
AS
	DECLARE @valor DECIMAL
	SET @valor = (SELECT precoVenda FROM tblProduto)
	UPDATE tblProduto
	SET precoVenda = (@valor*@percentual/100)+@valor
	WHERE codCategoria = (SELECT codCategoria FROM tblCategoriaProduto WHERE nomeCategoria LIKE @nome)

		EXEC spAumenta_preco */
		
		
CREATE PROCEDURE spAumenta_preco
	@nome VARCHAR(255),
	@percentual INT
AS
	DECLARE @valor DECIMAL
	SET @valor = (SELECT precoVenda FROM tblProduto)
	UPDATE tblProduto
	SET precoVenda = (@valor*@percentual/100)+@valor
	WHERE codCategoria = (SELECT codCategoria FROM tblCategoriaProduto WHERE nomeCategoria LIKE @nome)


	CREATE PROCEDURE spdiminui_preco
	@nome VARCHAR(255),
	@percentual INT
AS
	DECLARE @valor DECIMAL
	SET @valor = (SELECT precoVenda FROM tblProduto)
	UPDATE tblProduto
	SET precoVenda = (@valor*@percentual/100)-@valor
	WHERE codCategoria = (SELECT codCategoria FROM tblCategoriaProduto WHERE nomeCategoria LIKE @nome)

	EXEC spAumenta_preco 'Bolo Festa', 10
	EXEC spdiminui_preco 'Bolo Simples', 20
	EXEC spAumenta_preco 'torta', 25



	CREATE PROCEDURE spAumenta_precoSalgado
	@nome VARCHAR (255),
	@percentual INT
AS
 
  IF NOT EXISTS (SELECT nomeProduto FROM tblProduto WHERE codCategoria = 4)
  BEGIN
  PRINT ('Impossivel registrar aumento de '+@nome)
  END
    IF NOT EXISTS (SELECT nomeProduto FROM tblProduto WHERE nomeProduto LIKE 'Esfiha%')
  BEGIN
  PRINT ('Impossivel registrar aumento de salgado '+@nome+' pois não se pode aumentar o valor de esfihas no momento')
  END
  ELSE
  BEGIN
	DECLARE @valor DECIMAL
	SET @valor = (SELECT precoVenda FROM tblProduto)
	UPDATE tblProduto
	SET precoVenda = (@valor*@percentual/100)+@valor
	WHERE codProduto = (SELECT codProduto FROM tblProduto WHERE nomeProduto LIKE @nome)
	END
	
	EXEC spAumenta_precoSalgado 'Coxinha frango', 20
	EXEC spAumenta_precoSalgado 'Folhado queijo', 20
	EXEC spAumenta_precoSalgado 'Risoles misto', 20


/*g) Criar uma procedure para excluir clientes pelo CPF sendo que:
1- Caso o cliente possua encomendas emitir a mensagem “Impossivel remover esse cliente pois o
cliente XXXXX possui encomendas; onde XXXXX é o nome do cliente.
2- Caso o cliente não possua encomendas realizar a remoção e emitir a mensagem “Cliente XXXX
removido com sucesso”, onde XXXX é o nome do cliente;*/

CREATE PROCEDURE spExcluir_Cliente
@cpf VARCHAR (20)
,@nomeCliente VARCHAR (255)

AS
DECLARE @codCliente INT

SET @codCliente = (SELECT codCliente FROM tblCliente WHERE cpfCliente LIKE @cpf)
IF EXISTS (SELECT codCliente FROM tblEncomenda WHERE codCliente = @codCliente)
BEGIN
PRINT ('Impossivel remover esse cliente pois o cliente '+@nomeCliente+ ' possui encomendas')
END
ELSE
BEGIN
	DELETE FROM tblCliente WHERE codCliente = @codCliente
END

EXEC spExcluir_Cliente '305.928.716-32', 'Samira Fatah'

/*h) Criar uma procedure que permita excluir qualquer item de uma encomenda cuja data de
entrega seja maior que a data atual. Para tal o cliente deverá fornecer o código da encomenda
e o código do produto que será excluído da encomenda. A procedure deverá remover o item e
atualizar o valor total da encomenda, do qual deverá ser subtraído o valor do item a ser
removido. A procedure poderá remover apenas um item da encomenda de cada vez.*/

CREATE PROCEDURE spDelete_Item
@dataAtual DATE,
@codEncomenda INT,
@codProduto INT
AS
	IF EXISTS (SELECT dataEntregaEncomenda FROM tblEncomenda WHERE dataEntregaEncomenda<@dataAtual)
	BEGIN 
	PRINT ('Impossivel apagar item com data de entrega que ja ocorreu')
	END
	ELSE
	IF NOT EXISTS (SELECT codEncomenda FROM tblEncomenda WHERE codEncomenda LIKE @codEncomenda)
	BEGIN
		PRINT('Impossivel apagar item de uma encomenda que não existe')
	END
	ELSE
	IF NOT EXISTS (SELECT codProduto FROM tblProduto WHERE codProduto LIKE @codProduto)
	BEGIN
		PRINT('Impossivel apagar item que não existe')
	END
	ELSE
	BEGIN
	DECLARE @valorProduto DECIMAL
	SET @valorProduto = (SELECT precoVenda FROM tblProduto WHERE codProduto = @codProduto)
	UPDATE tblItensEncomenda
	SET codProduto = ''
	WHERE codEncomenda LIKE @codEncomenda AND codProduto LIKE @codProduto
	UPDATE tblItensEncomenda
	SET subTotal = subTotal-@valorProduto
	END

	EXEC spDelete_Item '2024-09-11', 2, 10
