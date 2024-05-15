--1. Cadastrar três novos fornecedores via query
INSERT INTO tbFornecedor (nomeFornecedor)
VALUES ('Zeus'), 
('Terra'),
('ETEC')

/*3. Criar uma instrução utilizando left join e outra utilizando right join para
exibir todos os fornecedores, incluindo ainda os três novos fornecedores
para os quais não foram registrados novos produtos;*/

SELECT nomeFornecedor, descricaoProduto FROM tbFornecedor
LEFT JOIN tbProduto ON tbProduto.codFornecedor = tbFornecedor.codFornecedor

SELECT nomeFornecedor, descricaoProduto FROM tbFornecedor
RIGHT JOIN tbProduto ON tbProduto.codFornecedor = tbFornecedor.codFornecedor

/*4. Cadastrar três novos produtos deixando para eles o código do
fornecedor em branco;*/

INSERT INTO tbProduto (descricaoProduto)
VALUES ('Perseu'),
('Fishron'),
('Aluno')