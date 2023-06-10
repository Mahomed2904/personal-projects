USE  ProGym;	
SELECT * FROM Aluno;
SELECT * FROM Cobranca;
SELECT * FROM Atividade;
SELECT * FROM Matricula;

UPDATE `Secretária` SET senha = 'Atija2001' WHERE `SecretáriaID` >= 1;

DELETE FROM Cobranca
WHERE CobrancaID >= 1;	

DELETE FROM Pagamento
WHERE PagamentoID >= 1;

DELETE FROM Matricula
WHERE MatriculaID >= 1;

DELETE FROM Atividade
WHERE AtividadeID >= 1;

DELETE FROM Aluno
WHERE AlunoID >= 1;

INSERT INTO `CoordenaçãoDesportiva`(`Descricao`) VALUES ('Contratador de Professor');
	
/*
INSERT INTO Cobranca(`DataInicio`, `DataTermino`, `MatriculaID`, `Taxa`, `Pago`)
VALUES (current_timestamp(),  timestampadd(HOUR, 5, current_timestamp()), 1, 0, FALSE); 

INSERT INTO Cobranca(`DataInicio`, `DataTermino`, `MatriculaID`, `Taxa`, `Pago`)
VALUES (current_timestamp(),  timestampadd(HOUR, 5, current_timestamp()), 2, 0, FALSE);
*/
SELECT * FROM Cobranca; 

INSERT INTO GestorDeFilial (`Nome`) VALUES ('Celso Vanimaly');

INSERT INTO Filial (`Horainicio`, `Horatermino`, Localizacao, GestorDeFilialID, `CoordenaçãoDesportivaID`) 
VALUES ('07:00:00', '18:00:00', 'Pemba', 1, 1);

INSERT INTO `Secretária` VALUES (1, 25, 'Atija Manuel');

INSERT INTO Professor(`Nome`) VALUES ('Bombarda da Conceição');
INSERT INTO Professor(`Nome`) VALUES ('Marques Almeida');
INSERT INTO Professor(`Nome`) VALUES ('Minir Momade');
INSERT INTO Professor(`Nome`) VALUES ('Adelino Cornelio');

INSERT INTO Atividade (`Nome`, `Descricao`, `FilialID`, `CoordenaçãoDesportivaID`, `ProfessorID`)
VALUES ('Natação', 'Megulho na nossa incrível piscina', 1, 1, 1) ;

INSERT INTO Atividade (`Nome`, `Descricao`, `FilialID`, `CoordenaçãoDesportivaID`, `ProfessorID`)
VALUES ('Ginástica aeróbica', 'Apresenda a esticar os músculos como nunca fez', 1, 1, 1) ;

INSERT INTO Atividade (`Nome`, `Descricao`, `FilialID`, `CoordenaçãoDesportivaID`, `ProfessorID`)
VALUES ('Dança', 'Dança de despacito e danças classicas', 1, 1, 1) ;

INSERT INTO Atividade (`Nome`, `Descricao`, `FilialID`, `CoordenaçãoDesportivaID`, `ProfessorID`)
VALUES ('Musculação', 'Virar uma rocha com os nossos treinos super avançados', 1, 1, 4) ;