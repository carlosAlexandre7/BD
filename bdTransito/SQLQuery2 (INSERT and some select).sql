USE bdTransito

    INSERT INTO tbMotorista (nomeMotorista, dataNascimentoMotorista, cpfMotorista, CNHMotorista, pontuacaoAcumulada) VALUES

    ('Kaue Rodrigues', '2007-08-25', '12345678983', '012345678', 7)
    ,('Guilherme Fermino', '2007-04-08', '77777777777', '123456789', 39)
    ,('Gustavo Fermino', '2007-04-08', '66666666666', '234567890', 2)

        INSERT INTO tbVeiculo (modeloVeiculo, placa, renavam, anoVeiculo, idMotorista) VALUES

        ('Opala', 'ABC1234', '12345678901', '1978', 1)
        ,('Maverick', 'XYZ5678', '98765432109', '1988', 2) 
        ,('Chevette', 'KLM8901', '11223344556', '1997', 3)
		,('Fiat Strada', 'ABC1235', '12345678901', '1978', 1)
        ,('Chevrolet Onix', 'XYZ5679', '98765432109', '1988', 2)
        ,('Fusca', 'KLM8902', '11223344556', '1997', 3)
		,(' Chevrolet Onix Plus', 'ABC1236', '12345678901', '1978', 1)
        ,(' Omega', 'XYZ5610', '98765432109', '1988', 2)
        ,('Palio', 'KLM8902', '11223344556', '1997', 3)

        INSERT INTO tbMultas (dataMulta, horaMulta, pontosMultas, idVeiculo) VALUES
        ('2037-01-28', '02:15:00', 4, 1)
        ,('2028-06-12', '12:45:00', 3, 1)
        ,('2028-03-23', '04:21:00', 14,2)
        ,('2037-12-15', '14:36:00', 15,2)
        ,('2042-11-17', '13:14:00', 1, 3)
        ,('2052-04-8', '13:27:00', 1, 3)

        /*a) - Quantos motoristas existem no banco de dados*/
        SELECT COUNT (idMotorista) FROM tbMotorista

        /*b) Quantos motoristas possuem Silva no sobrenome*/
        SELECT COUNT (nomeMotorista) FROM tbMotorista
        WHERE nomeMotorista = '%Silva%'

 /* c) Quantos motoristas nasceram no ano 2000 */

SELECT COUNT (dataNascimentoMotorista) FROM tbMotorista
        WHERE YEAR (dataNascimentoMotorista) >= 2000

/*d)*/

SELECT COUNT (pontuacaoAcumulada) FROM tbMotorista
      WHERE pontuacaoAcumulada >10

/*e)*/

SELECT SUM (pontuacaoAcumulada) FROM tbMotorista

/*f)*/

SELECT AVG (pontuacaoAcumulada) FROM tbMotorista

/*g)*/

SELECT COUNT(idMotorista) FROM tbveiculo WHERE idmotorista = 1

/*h)*/

SELECT COUNT(placa) FROM tbVeiculo WHERE placa = 'A%'

/*i)*/

SELECT COUNT(anoVeiculo) FROM tbVeiculo WHERE anoveiculo <2010

/*j)*/

SELECT AVG(anoVeiculo) FROM tbVeiculo

/*k)*/

SELECT COUNT(nomeVeiculo) FROM tbVeiculo
WHERE nomeVeiculo LIKE 'Sedan%'

/*l*/

SELECT SUM(pontosMultas) FROM tbMultas
WHERE idVeiculo = 2;

