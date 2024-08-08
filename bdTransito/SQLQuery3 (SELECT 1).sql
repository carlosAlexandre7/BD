USE bdTransito

/*a) - Quantos motoristas existem no banco de dados*/
SELECT COUNT (idMotorista) FROM tbMotorista

/*b) Quantos motoristas possuem Silva no sobrenome*/
SELECT COUNT (nomeMotorista) FROM tbMotorista
WHERE nomeMotorista = '%Silva%'

 /* c) Quantos motoristas nasceram no ano 2000 */

SELECT COUNT (dataNascimentoMotorista) FROM tbMotorista
WHERE YEAR (dataNascimentoMotorista) >= 2000

/*d) Quantos motoristas possuem mais de 10 pontos de pontua��o acumulada*/

SELECT COUNT (pontuacaoAcumulada) FROM tbMotorista
WHERE pontuacaoAcumulada >10

/*e) A somat�ria da pontua��o de todos os motoristas*/

SELECT SUM (pontuacaoAcumulada) FROM tbMotorista

/*f) A m�dia de pontua��o de todos os motoristas*/

SELECT AVG (pontuacaoAcumulada) FROM tbMotorista

/*g) Quantos ve�culos o motorista de c�digo 1 possui*/

SELECT COUNT(idMotorista) FROM tbveiculo WHERE idmotorista = 1

/*h)Quantos ve�culos a placa come�a com A*/

SELECT COUNT(placa) FROM tbVeiculo WHERE placa = 'A%'

/*i)Quantos ve�culos foram fabricados antes de 2010*/

SELECT COUNT(anoVeiculo) FROM tbVeiculo WHERE anoveiculo <2010

/*j)A m�dia do ano de fabrica��o de todos os ve�culos*/

SELECT AVG(anoVeiculo * 1) FROM tbVeiculo

/*k)A quantidade dos ve�culos que tenham a palavra Sedan em seu modelo*/

SELECT COUNT(modeloVeiculo) FROM tbVeiculo
WHERE modeloVeiculo LIKE '%Sedam%'

/*l) A somat�ria dos pontosMulta do ve�culo de id 02*/

SELECT SUM(pontosMultas) FROM tbMultas
WHERE idVeiculo = 2

/*m) A m�dia de pontosMulta entre todas as multas aplicadas*/

SELECT AVG(pontosMultas) FROM tbMultas

/*n) A quantidade de multas aplicadas no m�s de abril de 2018*/
/*q) A quantidade de ve�culos cuja placa termine com o n�mero 5 ou 6*/

SELECT COUNT(idVeiculo) FROM tbVeiculo