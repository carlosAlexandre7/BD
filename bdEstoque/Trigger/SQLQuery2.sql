CREATE TRIGGER tgInsertMulta
ON tbMultas
FOR INSERT
AS
	DECLARE @pontos INT
	SELECT @pontos = pontosMulta FROM inserted
	UPDATE tbMotorista
	SET pontuacaoAcumulada = (pontuacaoAcumulada+@pontos)
	IF (SELECT pontuacaoAcumulada FROM tbMotorista) = 20
	BEGIN
	PRINT('Sua carteira vai ser suspensa')
	END


	INSERT INTO tbMultas (dataMulta,horaMulta,pontosMulta,idVeiculo)
	VALUES (GETDATE(),19,4,1)