CREATE DATABASE bdMerge
USE bdMerge
CREATE TABLE tb2A (
    RMAluno INT PRIMARY KEY,
    nomeAluno VARCHAR(50),
    statusAluno VARCHAR(10)
)

CREATE TABLE tb2B (
    RMAluno INT PRIMARY KEY,
    nomeAluno VARCHAR(50),
    statusAluno VARCHAR(10)
)

CREATE TABLE tb3 (
    RMAluno INT PRIMARY KEY,
    nomeAluno VARCHAR(50),
    statusAluno VARCHAR(10)
)

INSERT INTO tb2A (RMAluno, nomeAluno, statusAluno) VALUES
(1, 'Ana', 'APROVADO'),
(2, 'Bruno', 'APROVADO'),
(3, 'Carla', 'APROVADO'),
(4, 'Daniel', 'APROVADO'),
(5, 'Eduarda', 'APROVADO'),
(6, 'Fernando', 'APROVADO'),
(7, 'Gabriel', 'APROVADO'),
(8, 'Helena', 'REPROVADO'),
(9, 'Igor', 'REPROVADO'),
(10, 'Julia', 'REPROVADO')

INSERT INTO tb2B (RMAluno, nomeAluno, statusAluno) VALUES
(11, 'Lara', 'APROVADO'),
(12, 'Marcelo', 'APROVADO'),
(13, 'Natália', 'APROVADO'),
(14, 'Otávio', 'APROVADO'),
(15, 'Patrícia', 'APROVADO'),
(16, 'Rafael', 'APROVADO'),
(17, 'Sofia', 'APROVADO'),
(18, 'Thiago', 'REPROVADO'),
(19, 'Vanessa', 'REPROVADO'),
(20, 'Wagner', 'REPROVADO')


SELECT * FROM tb2B