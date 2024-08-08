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


