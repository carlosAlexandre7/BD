-- Inserindo dados na tabela tbDepartamento
INSERT INTO tbDepartamento (codDepartamento, nomeDepartamento) VALUES
(1, 'Compras'),
(2, 'Vendas'),
(3, 'TI'),
(4, 'Marketing');

-- Inserindo dados na tabela tbFuncionario
INSERT INTO tbFuncionario (codFuncionario, nomeFuncionario, cpfFuncionario, dataNascFuncionario, sexoFuncionario, codDepartamento, salarioFuncionario) VALUES
(1, 'Maria Luisa Moura', '12345678900', '1990-02-10', 'F', 1, 3400.00),
(2, 'Mariana Goulart', '45678909299', '1991-04-08', 'F', 1, 2800.00),
(3, 'Pedro Paulo Vidigal', '64587222388', '1994-05-07', 'M', 2, 5400.00),
(4, 'Carlos Calixto', '83738232233', '1965-03-03', 'M', 2, 8900.00),
(5, 'Viviane Martins', '77832233399', '1976-06-06', 'F', 3, 4300.00),
(6, 'Analice Mendes', '83703383493', '1981-09-09', 'F', 3, 6800.00),
(7, 'Patricia Ishikawa', '43356609300', '1978-05-05', 'F', 4, 4900.00);

-- Inserindo dados na tabela tbDependente
INSERT INTO tbDependente (codDependente, nomeDependente, dataNascDependente, sexoDependente, codFuncionario) VALUES
(1, 'Lucas Moura', '2015-01-10', 'M', 1),
(2, 'Carlos Calixto Jr', '2000-06-08', 'M', 4),
(3, 'Michele Costa Calodo', '2003-09-09', 'F', 4),
(4, 'Silvana Costa Calixto', '2006-04-04', 'F', 4),
(5, 'Arthur Mendes Silva', '2010-07-07', 'M', 6);