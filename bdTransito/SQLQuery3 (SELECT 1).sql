USE bdTransito

/*a) - Quantos motoristas existem no banco de dados*/
SELECT COUNT (idMotorista) FROM tbMotorista

/*b) Quantos motoristas possuem Silva no sobrenome*/
SELECT COUNT (nomeMotorista) FROM tbMotorista
WHERE nomeMotorista = '%Silva%'

 /* c) Quantos motoristas nasceram no ano 2000 */

SELECT COUNT (dataNascimentoMotorista) FROM tbMotorista
WHERE YEAR (dataNascimentoMotorista) >= 2000

/*d) Quantos motoristas possuem mais de 10 pontos de pontuação acumulada*/

SELECT COUNT (pontuacaoAcumulada) FROM tbMotorista
WHERE pontuacaoAcumulada >10

/*e) A somatória da pontuação de todos os motoristas*/

SELECT SUM (pontuacaoAcumulada) FROM tbMotorista

/*f) A média de pontuação de todos os motoristas*/

SELECT AVG (pontuacaoAcumulada) FROM tbMotorista

/*g) Quantos veículos o motorista de código 1 possui*/

SELECT COUNT(idMotorista) FROM tbveiculo WHERE idmotorista = 1

/*h)Quantos veículos a placa começa com A*/

SELECT COUNT(placa) FROM tbVeiculo WHERE placa = 'A%'

/*i)Quantos veículos foram fabricados antes de 2010*/

SELECT COUNT(anoVeiculo) FROM tbVeiculo WHERE anoveiculo <2010

/*j)A média do ano de fabricação de todos os veículos*/

SELECT AVG(anoVeiculo * 1) FROM tbVeiculo

/*k)A quantidade dos veículos que tenham a palavra Sedan em seu modelo*/

SELECT COUNT(modeloVeiculo) FROM tbVeiculo
WHERE modeloVeiculo LIKE '%Sedam%'

/*l) A somatória dos pontosMulta do veículo de id 02*/

SELECT SUM(pontosMultas) FROM tbMultas
WHERE idVeiculo = 2

/*m) A média de pontosMulta entre todas as multas aplicadas*/

SELECT AVG(pontosMultas) FROM tbMultas

/*n) A quantidade de multas aplicadas no mês de abril de 2018*/SELECT COUNT(idMulta) FROM tbMultasWHERE YEAR(dataMulta) < 2018/*o) A quantidade de veículos cuja placa termine com o número 1 ou 2*/SELECT COUNT(idVeiculo) FROM tbVeiculoWHERE placa LIKE '%1' OR placa LIKE '%2'/*p) A quantiadade de veículos cuja placa termine com o número 3 ou 4*/SELECT COUNT(idVeiculo) FROM tbVeiculoWHERE placa LIKE '%3' OR placa LIKE '%4'
/*q) A quantidade de veículos cuja placa termine com o número 5 ou 6*/

SELECT COUNT(idVeiculo) FROM tbVeiculoWHERE placa LIKE '%5' OR placa LIKE '%6'/*r) A quantidade de veículos cuja placa termine com 7 ou 8*/SELECT COUNT(idVeiculo) FROM tbVeiculoWHERE placa LIKE '%7' OR placa LIKE '%8'/*s) A quantidade de veículos cuja placa termine com 9 ou 0*/SELECT COUNT(idVeiculo) FROM tbVeiculoWHERE placa LIKE '%9' OR placa LIKE '%0'/*t) A quantidade de veículos por ano de fabricação*/SELECT COUNT(idVeiculo) FROM tbVeiculoGROUP BY anoVeiculo/*u) A quantidade de motoristas por pontuação acumulada*/SELECT COUNT(idMotorista) FROM tbMotoristaGROUP BY pontuacaoAcumulada/*v) A quantidade de motoristas que ultrapassaram os 20 pontos*/SELECT COUNT(idMotorista) FROM tbMotoristaWHERE pontuacaoAcumulada > 20/*w) A pontuação média dos motoristas nascidos no ano de 2000*/SELECT AVG(pontuacaoAcumulada) FROM tbMotoristaWHERE  YEAR(dataNascimentoMotorista) = 2000/*x) A média dos pontos das multas aplicadas em julho de 2017*/SELECT AVG(pontosMultas) FROM tbMultasWHERE YEAR(dataMulta) = 2017 AND MONTH(dataMulta) = 7/*y) Quantos veículos não podem circular na segunda-feira (placa final 1 ou 2)*/SELECT COUNT(idVeiculo) FROM tbVeiculoWHERE placa LIKE '%1' OR placa LIKE '%2'