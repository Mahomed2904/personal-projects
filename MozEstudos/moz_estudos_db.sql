CREATE DATABASE MozEstudos;

USE MozEstudos;

CREATE TABLE IF NOT EXISTS `Utilizador` (
  `idUtilizador` INT NOT NULL AUTO_INCREMENT,
  `primeiroNome` VARCHAR(100) NOT NULL,
  `ultimoNome` VARCHAR(100) NOT NULL,
  `username` VARCHAR(45) NULL,
  `email` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idUtilizador`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Classe` (
  `idClasse` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(200) NULL,
  PRIMARY KEY (`idClasse`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Universidade` (
  `idUniversidade` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL,
  `descricao` VARCHAR(300) NULL,
  PRIMARY KEY (`idUniversidade`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Alternativa` (
  `idAlternativa` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`idAlternativa`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Assunto` (
  `idAssunto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL,
  `descricao` VARCHAR(200) NULL,
  PRIMARY KEY (`idAssunto`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Disciplina` (
  `idDisciplina` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL,
  `descricao` VARCHAR(200) NULL,
  PRIMARY KEY (`idDisciplina`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Prova` (
  `idProva` INT NOT NULL AUTO_INCREMENT,
  `ano` INT NULL,
  `nome` VARCHAR(72) NULL,
  `descricao` VARCHAR(200) NULL,
  `disciplina` INT NOT NULL,
  PRIMARY KEY (`idProva`),
  INDEX `fk_Prova_Disciplina1_idx` (`disciplina` ASC) VISIBLE,
  CONSTRAINT `fk_Prova_Disciplina1`
    FOREIGN KEY (`disciplina`)
    REFERENCES `Disciplina` (`idDisciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Exame Admissao` (
  `prova` INT NOT NULL,
  `universidade` INT NOT NULL,
  INDEX `fk_Exame Admissao_Prova1_idx` (`prova` ASC) VISIBLE,
  PRIMARY KEY (`prova`),
  INDEX `fk_Exame Admissao_Universidade1_idx` (`universidade` ASC) VISIBLE,
  CONSTRAINT `fk_Exame Admissao_Prova1`
    FOREIGN KEY (`prova`)
    REFERENCES `Prova` (`idProva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Exame Admissao_Universidade1`
    FOREIGN KEY (`universidade`)
    REFERENCES `Universidade` (`idUniversidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Exame Nacional` (
  `epoca` INT NULL,
  `prova` INT NOT NULL,
  `classe` INT NOT NULL,
  INDEX `fk_Exame Nacional_Prova1_idx` (`prova` ASC) VISIBLE,
  PRIMARY KEY (`prova`),
  INDEX `fk_Exame Nacional_Classe1_idx` (`classe` ASC) VISIBLE,
  CONSTRAINT `fk_Exame Nacional_Prova1`
    FOREIGN KEY (`prova`)
    REFERENCES `Prova` (`idProva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Exame Nacional_Classe1`
    FOREIGN KEY (`classe`)
    REFERENCES `Classe` (`idClasse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Disciplina_Tem_Assunto` (
  `disciplina` INT NOT NULL,
  `assunto` INT NOT NULL,
  PRIMARY KEY (`disciplina`, `assunto`),
  INDEX `fk_Disciplina_has_Assunto_Assunto1_idx` (`assunto` ASC) VISIBLE,
  INDEX `fk_Disciplina_has_Assunto_Disciplina1_idx` (`disciplina` ASC) VISIBLE,
  CONSTRAINT `fk_Disciplina_has_Assunto_Disciplina1`
    FOREIGN KEY (`disciplina`)
    REFERENCES `Disciplina` (`idDisciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Disciplina_has_Assunto_Assunto1`
    FOREIGN KEY (`assunto`)
    REFERENCES `Assunto` (`idAssunto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Questao` (
  `idQuestao` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL,
  `urlFoto` VARCHAR(100) NULL,
  `disciplina` INT NOT NULL,
  `assunto` INT NOT NULL,
  PRIMARY KEY (`idQuestao`),
  INDEX `fk_Questao_Disciplina_Tem_Assunto1_idx` (`disciplina` ASC, `assunto` ASC) VISIBLE,
  CONSTRAINT `fk_Questao_Disciplina_Tem_Assunto1`
    FOREIGN KEY (`disciplina` , `assunto`)
    REFERENCES `Disciplina_Tem_Assunto` (`disciplina` , `assunto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Questao_Tem_Alternativa` (
  `alternativa` INT NOT NULL,
  `questao` INT NOT NULL,
  `tipo` VARCHAR(10) NOT NULL DEFAULT 'Não' COMMENT 'Alternativa correta ou nao',
  `valor` VARCHAR(550) NOT NULL COMMENT 'A opção dada por esta alternativa',
  PRIMARY KEY (`alternativa`, `questao`),
  INDEX `fk_Alternativa_has_Questao_Questao1_idx` (`questao` ASC) VISIBLE,
  INDEX `fk_Alternativa_has_Questao_Alternativa1_idx` (`alternativa` ASC) VISIBLE,
  CONSTRAINT `fk_Alternativa_has_Questao_Alternativa1`
    FOREIGN KEY (`alternativa`)
    REFERENCES `Alternativa` (`idAlternativa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alternativa_has_Questao_Questao1`
    FOREIGN KEY (`questao`)
    REFERENCES `Questao` (`idQuestao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Prova_Tem_Questao` (
  `prova` INT NOT NULL,
  `questao` INT NOT NULL,
  `nrQuestao`INT NOT NULL,
  `alternativaCorreta` INT NOT NULL,
  PRIMARY KEY (`prova`, `nrQuestao`),
  INDEX `fk_Prova_has_Questao_Questao1_idx` (`questao` ASC) VISIBLE,
  INDEX `fk_Prova_has_Questao_Prova1_idx` (`prova` ASC) VISIBLE,
  INDEX `fk_Prova_Tem_Questao_Alternativa1_idx` (`alternativaCorreta` ASC) VISIBLE,
  CONSTRAINT `fk_Prova_has_Questao_Prova1`
    FOREIGN KEY (`prova`)
    REFERENCES `Prova` (`idProva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prova_has_Questao_Questao1`
    FOREIGN KEY (`questao`)
    REFERENCES `Questao` (`idQuestao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prova_Tem_Questao_Alternativa1`
    FOREIGN KEY (`alternativaCorreta`)
    REFERENCES `Alternativa` (`idAlternativa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Resposta_Prova` (
  `idResposta_Prova` INT NOT NULL AUTO_INCREMENT,
  `utilizador` INT NOT NULL,
  `prova` INT NOT NULL,
  PRIMARY KEY (`idResposta_Prova`),
  INDEX `fk_Resposta_Utilizador1_idx` (`utilizador` ASC) VISIBLE,
  INDEX `fk_Resposta_Prova1_idx` (`prova` ASC) VISIBLE,
  CONSTRAINT `fk_Resposta_Utilizador1`
    FOREIGN KEY (`utilizador`)
    REFERENCES `Utilizador` (`idUtilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Resposta_Prova1`
    FOREIGN KEY (`prova`)
    REFERENCES `Prova` (`idProva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Alternativa_Escolhida` (
  `resposta_prova` INT NOT NULL,
  `alternativa` INT NOT NULL,
  `questao` INT NOT NULL,
  PRIMARY KEY (`resposta_prova`, `questao`),
  INDEX `fk_Resposta_has_Questao_Tem_Alternativa_Questao_Tem_Alterna_idx` (`alternativa` ASC, `questao` ASC) VISIBLE,
  INDEX `fk_Resposta_has_Questao_Tem_Alternativa_Resposta1_idx` (`resposta_prova` ASC) VISIBLE,
  CONSTRAINT `fk_Resposta_has_Questao_Tem_Alternativa_Resposta1`
    FOREIGN KEY (`resposta_prova`)
    REFERENCES `Resposta_Prova` (`idResposta_Prova`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Resposta_has_Questao_Tem_Alternativa_Questao_Tem_Alternati1`
    FOREIGN KEY (`alternativa` , `questao`)
    REFERENCES `Questao_Tem_Alternativa` (`alternativa` , `questao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


