USE bdEscolaIdiomas

-- Inserir dados na tabela tbCurso
INSERT INTO tbCurso (nomeCurso, cargahorariaCurso, valorCurso) VALUES
('Inglês', 2000, 356.00),
('Alemão', 3000, 478.00),
('Espanhol', 4000, 500.00);

-- Inserir dados na tabela tbTurma
INSERT INTO tbTurma (nomeTurma, codCurso, horarioTurma) VALUES
('1|A', 1, '1900-01-01 12:00'),
('1|C', 1, '1900-01-01 18:00'),
('1|B', 1, '1900-01-01 18:00'),
('1AA', 1, '1900-01-01 19:00');

-- Inserir dados na tabela tbAluno
INSERT INTO tbAluno (nomeAluno, dataNascAluno, rgAluno, naturalidadeAluno) VALUES
('Paulo Santos', '2000-03-10', '82.282.122-0', 'SP'),
('Maria da Gloria', '1999-10-03', '45.233.123-0', 'SP'),
('Pedro Nogueira da Silva', '1998-04-04', '23.533.211-9', 'SP');

-- Inserir dados na tabela tbMatricula
INSERT INTO tbMatricula (dataMatricula, codAluno, codTurma) VALUES
('2024-04-25', 1, 1),
('2024-04-26', 2, 2),
('2024-04-27', 3, 3);