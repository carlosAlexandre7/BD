		MERGE tb3 dest /*define apelido da tabela tb3 para dest*/
		USING( SELECT RMAluno, nomeAluno, statusAluno FROM tb2A WHERE statusAluno = 'APROVADO'
		UNION /*UNION une os 2 SELECTS diferenciandos daqueles que tem valores iguais*/ 
		SELECT RMAluno, nomeAluno, statusAluno FROM tb2B WHERE statusAluno = 'APROVADO') ori /*define todas as informa��es desse select com apelido ori*/
		ON ori.RMAluno = dest.RMAluno /*compara os RM's para n�o haver repeti��o*/
		WHEN NOT MATCHED THEN /*quando os RM's n�o coicidirem ele faz o c�digo abaixo*/
	    INSERT (RMAluno, nomeAluno, statusAluno)
		VALUES (ori.RMAluno, ori.nomeAluno, ori.statusAluno);
		
		
		--DELETE  FROM tb3
		--SELECT * FROM tb3