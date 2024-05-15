--1. Cadastrar tr�s novos fornecedores via query
INSERT INTO tbFornecedor (nomeFornecedor)
VALUES ('Zeus'), 
('Terra'),
('ETEC')

/*3. Criar uma instru��o utilizando left join e outra utilizando right join para
exibir todos os fornecedores, incluindo ainda os tr�s novos fornecedores
para os quais n�o foram registrados novos produtos;*/

SELECT nomeFornecedor, descricaoProduto FROM tbFornecedor
LEFT JOIN tbProduto ON tbProduto.codFornecedor = tbFornecedor.codFornecedor

SELECT nomeFornecedor, descricaoProduto FROM tbFornecedor
RIGHT JOIN tbProduto ON tbProduto.codFornecedor = tbFornecedor.codFornecedor

/*4. Cadastrar tr�s novos produtos deixando para eles o c�digo do
fornecedor em branco;*/

INSERT INTO tbProduto (descricaoProduto)
VALUES ('Perseu'),
('Fishron'),
('Aluno')