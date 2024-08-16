--a) Criar uma view para exibir a quantidade de funcionários por nome de departamento;

CREATE VIEW vwQuanti_Func  AS
	SELECT COUNT(codFuncionario) AS 'totalFuncionariosPdp', nomeDepartamento FROM tbFuncionario
	INNER JOIN tbDepartamento ON tbDepartamento.codDepartamento = tbFuncionario.codDepartamento
	GROUP BY nomeDepartamento


--b) Usando a view anterior, exibir somente o nome do departamento que possui o menor número de funcionários
	SELECT nomeDepartamento FROM vwQuanti_Func
	WHERE totalFuncionariosPdp = (SELECT MIN(codFuncionario) FROM tbFuncionario
	INNER JOIN tbDepartamento ON tbDepartamento.codDepartamento = tbFuncionario.codDepartamento)

--c) Criar uma view para exibir a soma dos sal?rios por nome de departamento/
	CREATE VIEW vwSomaSalario_func AS
	SELECT SUM(salarioFuncionario) AS 'SomaSalariosPdp', nomeDepartamento FROM tbFuncionario
	INNER JOIN tbDepartamento ON tbDepartamento.codDepartamento = tbFuncionario.codDepartamento
	GROUP BY nomeDepartamento


--d) Utilizando a view do exercício anterior, mostrar somente a maior soma dentre os departamentos

SELECT SomaSalariosPdp FROM vwSomaSalario_func
WHERE SomaSalariosPdp = (SELECT MAX(SomaSalariosPdp)FROM vwSomaSalario_func)

--e) Criar uma view para exibir somente o nome dos funcionários e o nome dos departamentos daqueles funcionários que não possuem dependentes
CREATE VIEW vwFuncioSemDep_func AS
SELECT (NomeFuncionario) AS , nomeDepartamento FROM tbFuncionario
	INNER JOIN tbDepartamento ON tbDepartamento.codDepartamento = tbFuncionario.codDepartamento
	INNER JOIN tbDependente ON tbFuncionario.codFuncionario = tbDependente.codFuncionario
	WHERE tbDependente.codFuncionario LIKE 'null'

SELECT * FROM vwFuncioSemDep_func

--f) Criar uma view que exiba a quantidadevde dependentes por nome de funcionario
CREATE VIEW vwQuantiDepFuncio_func AS
	SELECT COUNT(codDependente) AS 'numeroDependentes', nomeFuncionario FROM tbFuncionario
	INNER JOIN tbDependente ON tbFuncionario.codFuncionario = tbDependente.codFuncionario
	GROUP BY nomeFuncionario   

SELECT * FROM vwQuantiDepFuncio_func 

--g) Utilizando a view anterior, mostrar somente o nome do funcionário que possui mais dependentes
SELECT nomeFuncionario FROM vwQuantiDepFuncio_func
WHERE numeroDependentes = (SELECT MAX(numeroDependentes) FROM vwQuantiDepFuncio_func)

--h) Criar uma view para exibir a quantidade de dependentes por departamento
CREATE VIEW vwQuantiDepDepart_func AS
		SELECT COUNT(codDependente) AS 'numeroDependentesDep', nomeDepartamento FROM tbFuncionario
		INNER JOIN tbDependente ON tbFuncionario.codFuncionario = tbDependente.codFuncionario
		INNER JOIN tbDepartamento ON tbDepartamento.codDepartamento = tbFuncionario.codDepartamento
		GROUP BY nomeDepartamento

SELECT * FROM vwQuantiDepDepart_func

--i) Utilizando a view do exercícios anterior, apresentar a soma geral dos dependentes

SELECT SUM(numeroDependentesDep) FROM vwQuantiDepDepart_func
