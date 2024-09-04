/a) Criar uma Stored Procedure para inserir as categorias de produto conforme abaixo/
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

/*b) Criar uma Stored Procedure para inserir os produtos abaixo, sendo que, a procedure deverá 
antes de inserir verificar se o nome do produto já existe, evitando assim que um produto seja 
duplicado*/

CREATE PROCEDURE spInsert_produto
	@nomeProduto VARCHAR(255),
	@preco DECIMAL

AS
	DECLARE @idCategoria INT;
	IF EXISTS (SELECT nomeProduto FROM tblProduto WHERE nomeProduto LIKE @nomeProduto)
	BEGIN
		PRINT ('Não foi possivel cadastrar! produto ' +@nomeProduto+' já cadastrado!')
	END
	ELSE
	BEGIN
		SET @idCategoria = (SELECT MAX(codCategoria) FROM tblCategoriaProduto)
		INSERT tblProduto (nomeProduto,precoVenda,codCategoria)
		VALUES (@nomeProduto, @preco, @idCategoria)
		PRINT('Produto cadastrado com sucesso!')
	END

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
		PRINT ('Não foi possivel cadastrar! produto ' +@nomeProduto+' já cadastrado!')
	END
	ELSE
	BEGIN
		IF EXISTS (SELECT bairroCliente FROM tblCategoriaProduto WHERE bairroCliente NOT LIKE 'Itaquera' AND bairroCliente NOT LIKE 'Guaianases')
		BEGIN
			
		END
	END
