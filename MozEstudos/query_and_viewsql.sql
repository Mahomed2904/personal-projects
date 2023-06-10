USE MozEstudos;	

SELECT * FROM Disciplina;


/*INSERT INTO Alternativa(nome) VALUES ('C');*/

CREATE VIEW ExamesAdmissao AS 
SELECT Prova.idProva, Prova.nome 'nomeProva', Prova.descricao 'descricaoProva', Prova.ano 'anoProva',
	   Disciplina.idDisciplina, Disciplina.nome 'nomeDisciplina', Disciplina.descricao 'descricaoDisciplina',
       Universidade.idUniversidade, Universidade.nome 'nomeUniversidade', Universidade.descricao 'descricaoUniversidade'
FROM Prova, Disciplina, `Exame Admissao`, Universidade
WHERE Prova.disciplina = Disciplina.idDisciplina
AND Prova.idProva = `Exame Admissao`.prova
AND `Exame Admissao`.universidade = Universidade.idUniversidade;

CREATE VIEW ExamesNacionais AS 
SELECT Prova.idProva, Prova.nome 'nomeProva', `Exame Nacional`.epoca, Prova.descricao 'descricaoProva', Prova.ano 'anoProva',
	   Disciplina.idDisciplina, Disciplina.nome 'nomeDisciplina', Disciplina.descricao 'descricaoDisciplina',
       Classe.idClasse, Classe.nome 'nomeClasse', Classe.descricao 'descricaoClasse'
FROM Prova, Disciplina, `Exame Nacional`, Classe
WHERE Prova.disciplina = Disciplina.idDisciplina
AND Prova.idProva = `Exame Nacional`.prova
AND `Exame Nacional`.classe = Classe.idClasse;

CREATE VIEW AssuntosDaDisciplina As
SELECT Disciplina.idDisciplina, Assunto.idAssunto, Assunto.nome, Assunto.descricao
FROM Assunto, Disciplina, Disciplina_Tem_Assunto
WHERE Assunto.idAssunto = Disciplina_Tem_Assunto.assunto 
AND Disciplina_Tem_Assunto.disciplina = Disciplina.idDisciplina;

CREATE VIEW AlternativasDaQuestao AS
SELECT Questao.idQuestao, Alternativa.idAlternativa, Alternativa.nome, Questao_Tem_Alternativa.tipo, Questao_Tem_Alternativa.valor
FROM Questao, Questao_Tem_Alternativa, Alternativa
WHERE Alternativa.idAlternativa = Questao_Tem_Alternativa.alternativa
AND Questao_Tem_Alternativa.questao = Questao.idQuestao;

CREATE VIEW DisciplinaEAssuntoDaQuestao As
SELECT Questao.idQuestao, Questao.descricao,
	   Disciplina.idDisciplina, Disciplina.nome AS 'nomeDisciplina', Disciplina.descricao AS 'descricaoDisciplina',
       Assunto.idAssunto, Assunto.nome AS 'nomeAssunto', Assunto.descricao  AS 'descricaoAssunto'
FROM Questao, Assunto, Disciplina
WHERE Questao.assunto = Assunto.idAssunto
AND Questao.disciplina = Disciplina.idDisciplina;

CREATE VIEW QuestoesDoExame As
SELECT Prova.idProva, 
	   Questao.idQuestao, Questao.descricao AS 'desricaoQuestao',
       Alternativa.idAlternativa, Alternativa.nome AS 'nomeAlternativa',
       Assunto.idAssunto, Assunto.nome AS 'nomeAssunto', Assunto.descricao AS 'descricaoAssunto'
FROM Prova, Prova_Tem_Questao, Questao, Alternativa, Assunto
WHERE Prova.idProva = Prova_Tem_Questao.prova
AND Prova_Tem_Questao.questao = Questao.idQuestao
AND Questao.assunto = Assunto.idAssunto
AND Prova_Tem_Questao.alternativaCorreta = Alternativa.idAlternativa;

CREATE VIEW RespostaDeProva AS
SELECT Resposta_Prova.idResposta_Prova 'idResposta',
	   Utilizador.idUtilizador, Utilizador.primeiroNome, Utilizador.ultimoNome, Utilizador.username, Utilizador.email,
       Prova.idProva, Prova.nome 'nomeProva', Prova.descricao 'descricaoProva'
FROM Utilizador, Resposta_Prova, Prova
WHERE Utilizador.idUtilizador = Resposta_Prova.utilizador
AND Resposta_Prova.prova = Prova.idProva;

CREATE VIEW AlternativasEscolhidas AS
SELECT  resposta_prova 'idResposta',
        Questao.idQuestao, Questao.descricao 'descricaoQuestao',
        Alternativa.idAlternativa, Alternativa.nome 'nomeAlternativa', Questao_Tem_Alternativa.valor 'valorAlternativa'
FROM Alternativa_Escolhida, Questao, Questao_Tem_Alternativa, Alternativa
WHERE Alternativa_Escolhida.questao = Questao.idQuestao
AND Questao.idQuestao = Questao_Tem_Alternativa.questao
AND Alternativa_Escolhida.alternativa = Questao_Tem_Alternativa.alternativa
AND Alternativa_Escolhida.alternativa = Alternativa.idAlternativa;