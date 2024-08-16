CREATE DATABASE bdRecursosHumanos
USE bdrecursosHumanos
CREATE TABLE tbDepartamento (
  codDepartamento INT PRIMARY KEY,
  nomeDepartamento VARCHAR(255)
);

CREATE TABLE tbFuncionario (
  codFuncionario INT PRIMARY KEY,
  nomeFuncionario VARCHAR(255),
  cpfFuncionario VARCHAR(14),
  dataNascFuncionario DATE,
  sexoFuncionario CHAR(1),
  codDepartamento INT,
  salarioFuncionario DECIMAL(10,2),
  FOREIGN KEY (codDepartamento) REFERENCES tbDepartamento(codDepartamento)
);

CREATE TABLE tbDependente (
  codDependente INT PRIMARY KEY,
  nomeDependente VARCHAR(255),
  dataNascDependente DATE,
  sexoDependente CHAR(1),
  codFuncionario INT,
  FOREIGN KEY (codFuncionario) REFERENCES tbFuncionario(codFuncionario)
);