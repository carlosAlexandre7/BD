USE bdEscolaIdiomas

--Apresentar os nomes dos alunos ao lado do nome dos cursos que eles fazem--
SELECT nomeAluno, nomeCurso FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
		INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
			INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso

--Apresentar a quantidade de alunos matriculados por nome do curso--

SELECT COUNT(tbMatricula.codAluno), nomeCurso FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
		INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
			INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
			GROUP BY nomeCurso

--Apresentar a quantidade de alunos matriculados por nome da turma--

SELECT COUNT(tbMatricula.codAluno), nomeTurma FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
		INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
		GROUP BY nomeTurma

--Apresentar a quantidadede alunos que fizeram matricula em maio de 2016;--

SELECT COUNT(tbMatricula.codAluno), tbMatricula.dataMatricula FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
	WHERE MONTH(dataMatricula) = 5 AND YEAR(dataMatricula) = 2016
	GROUP BY tbMatricula.dataMatricula;

--Apresentar o nome dos alunos em ordem alfab�tica ao lado do nome das turmas e os nomes dos cursos em que est�o matriculados--

SELECT nomeAluno, nomeTurma FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
		INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
		ORDER BY nomeAluno

--Apresentar o nome dos cursos e os hor�rios em que eles s�o oferecidos--

SELECT nomeCurso, tbTurma.horarioTurma FROM tbTurma
	INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso

--Apresentar a quantidade de alunos nascidos por estado que estejam matriculados no curso de ingles--

SELECT COUNT(tbAluno.codAluno), naturalidadeAluno, nomeCurso FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
		INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
			INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
			WHERE nomeCurso LIKE 'Ingl�s'
			GROUP BY naturalidadeAluno

--Apresentar o nome dos alunos ao lado da data de matr�cula no formato dd/mm/aaaa--

SELECT nomeAluno, dataMatricula FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno

--Apresentar os alunos cujo nome comece com A e que estejam matriculados no curso de ingl�s--

SELECT nomeAluno, nomeCurso FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
		INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
			INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
			WHERE nomeAluno LIKE 'a%' 
			AND nomeCurso LIKE 'Ingles' 

--Apresentar a quantidade de matriculas feitas no ano de 2016--

SELECT COUNT(codMatricula) FROM tbMatricula
	WHERE YEAR(dataMatricula) = 2016

--Apresentar a quantidade de matriculas por nome do curso--

SELECT tbCurso.nomeCurso, COUNT(tbMatricula.codMatricula) FROM tbCurso
 INNER JOIN tbTurma ON tbCurso.codCurso = tbTurma.codCurso
 INNER JOIN tbMatricula ON tbTurma.codTurma = tbMatricula.codTurma
GROUP BY tbCurso.nomeCurso;

--Apresentar a quantidade de alunos que fazemos cursos que custam mais de R$300,00--

SELECT COUNT(tbMatricula.codAluno) FROM tbCurso
 INNER JOIN tbTurma ON tbCurso.codCurso = tbTurma.codCurso
 INNER JOIN tbMatricula ON tbTurma.codTurma = tbMatricula.codTurma
WHERE tbCurso.valorCurso > 300.00;

--Apresentar os nomes dos alunos que fazem o curso de alem�o--
SELECT tbCurso.nomeCurso, tbAluno.nomeAluno FROM tbAluno
INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
WHERE tbCurso.nomeCurso = 'Alem�o';