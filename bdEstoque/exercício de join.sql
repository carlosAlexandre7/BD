a SELECT (descricaoProduto), nomeFabricante FROM tbProduto
	INNER JOIN tbFabricante ON tbProduto.codFabricante = tbFabricante.codFabricante

b SELECT (descricaoProduto), nomeFornecedor FROM tbProduto
	INNER JOIN tbFornecedor ON tbProduto.codFornecedor = tbFornecedor.codFornecedor

c SELECT SUM (quantidadeProduto), nomeFabricante FROM tbProduto
	 INNER JOIN tbFabricante ON tbProduto.codFabricante = tbFabricante.codFabricante
	 GROUP BY nomeFabricante

d SELECT SUM(valorTotalVenda), nomeCliente FROM tbVenda
	INNER JOIN tbCliente ON tbVenda.codCliente = tbCliente.codCliente
	 GROUP BY nomeCliente

e SELECT AVG (valorProduto), nomeFornecedor FROM tbProduto
    INNER JOIN tbFornecedor ON tbProduto.codFornecedor = tbFornecedor.codFornecedor
	GROUP BY nomeFornecedor

f SELECT SUM (valorTotalVenda), nomeCliente FROM tbVenda
    INNER JOIN tbCliente ON tbVenda.codCliente = tbCliente.codCliente
	GROUP BY nomeCliente 
	ORDER BY nomeCliente ASC

g SELECT SUM (valorProduto), nomeFabricante  FROM tbProduto
    INNER JOIN tbFabricante ON tbProduto.codFabricante = tbFabricante.codFabricante
	GROUP BY nomeFabricante

h SELECT AVG (valorProduto), nomeFornecedor FROM tbProduto
    INNER JOIN tbFornecedor ON tbProduto.codFornecedor = tbFornecedor.codFornecedor
	GROUP BY nomeFornecedor

i SELECT SUM (valorTotalVenda), nomeFabricante FROM tbFabricante
    INNER JOIN tbProduto ON tbFabricante.codFabricante = tbFabricante.codFabricante
    INNER JOIN tbItensVenda ON tbProduto.codProduto = tbItensVenda.codProduto
	INNER JOIN tbVenda ON tbItensVenda.codVenda = tbVenda.codVenda
	GROUP BY nomeFabricante

j SELECT SUM (valorTotalVenda) , nomeCliente FROM tbVenda
   INNER JOIN tbCliente ON tbVenda.codCliente = tbCliente.codCliente
   WHERE YEAR(datavenda) = 2014
   GROUP BY nomeCliente 
   