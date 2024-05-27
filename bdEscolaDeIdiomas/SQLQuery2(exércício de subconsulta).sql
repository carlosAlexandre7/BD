--Criar uma consulta que retorne o nome e o pre�o dos cursos que custem abaixo do valor m�dio

SELECT nomeCurso, valorCurso FROM tbCurso
WHERE valorCurso >= (SELECT AVG (valorCurso) FROM tbCurso)

--Criar uma consulta que retorne o nome e o rg do aluno mais novoSELECT nomeAluno, rgAluno FROM tbAlunoWHERE YEAR(dataNascAluno) = (SELECT MIN(YEAR(dataNascAluno)) FROM tbAluno)
--Criar uma consulta que retorne o nome do aluno mais velho
SELECT nomeAluno FROM tbAlunoWHERE YEAR(dataNascAluno) = (SELECT MAX(YEAR(dataNascAluno)) FROM tbAluno)

--Criar uma consulta que retorne o nome e o valor do curso mais caroSELECT nomeCurso, valorCurso FROM tbCursoWHERE valorCurso = (SELECT MAX(valorCurso) FROM tbCurso)--Criar uma consulta que retorne o nome do aluno e o nome do curso, do aluno que fez a �ltima matr�culaSELECT nomeAluno, nomeCurso FROM tbAlunoINNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAlunoINNER JOIN tbTurma ON tbTurma.codTurma = tbAluno.codAlunoINNER JOIN tbCurso ON tbCurso.codCurso = tbTurma.codCurso	WHERE dataMatricula = (SELECT MAX(dataMatricula) FROM tbMatricula) --Criar uma consulta que retorne o nome do primeiro aluno a ser matriculado na escola de IdiomasSELECT nomeAluno FROM tbAlunoINNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAlunoWHERE dataMatricula = (SELECT MIN(dataMatricula) FROM tbMatricula) --Criar uma consulta que retorne o nome, rg e data de nascimento de todos os alunos que estejam matriculados no curso de ingl�sSELECT nomeAluno, rgAluno, dataNascAluno FROM tbAlunoINNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAlunoINNER JOIN tbTurma ON tbTurma.codTurma = tbAluno.codAlunoINNER JOIN tbCurso ON tbCurso.codCurso = tbTurma.codCurso	WHERE nomeCurso = 'ingl�s'