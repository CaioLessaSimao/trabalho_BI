-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dbnetf
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbnetf
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbnetf` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `dbnetf` ;

-- -----------------------------------------------------
-- Table `dbnetf`.`Pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbnetf`.`Pais` (
  `idPais` INT NOT NULL,
  `nmPais` VARCHAR(80) NULL DEFAULT NULL,
  PRIMARY KEY (`idPais`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbnetf`.`Cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbnetf`.`Cidade` (
  `idCidade` INT NOT NULL,
  `nmCidade` VARCHAR(80) NULL DEFAULT NULL,
  PRIMARY KEY (`idCidade`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbnetf`.`Estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbnetf`.`Estado` (
  `idEstado` INT NOT NULL,
  `nmEstado` VARCHAR(80) NULL DEFAULT NULL,
  PRIMARY KEY (`idEstado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbnetf`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbnetf`.`Usuario` (
  `idUsuario` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `dtNascimento` DATE NULL DEFAULT NULL,
  `sexo` CHAR(1) NULL DEFAULT NULL,
  `pais_idPais` INT NOT NULL,
  `cidade_idCidade` INT NOT NULL,
  `estado_idEstado` INT NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idUsuario` (`idUsuario` ASC) VISIBLE,
  UNIQUE INDEX `email` (`email` ASC) VISIBLE,
  INDEX `fk_usuario_pais_idx` (`pais_idPais` ASC) VISIBLE,
  INDEX `fk_usuario_cidade1_idx` (`cidade_idCidade` ASC) VISIBLE,
  INDEX `fk_usuario_estado1_idx` (`estado_idEstado` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_pais`
    FOREIGN KEY (`pais_idPais`)
    REFERENCES `dbnetf`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_cidade1`
    FOREIGN KEY (`cidade_idCidade`)
    REFERENCES `dbnetf`.`Cidade` (`idCidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_estado1`
    FOREIGN KEY (`estado_idEstado`)
    REFERENCES `dbnetf`.`Estado` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbnetf`.`QualidadeVideo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbnetf`.`QualidadeVideo` (
  `idQualidade` SMALLINT NOT NULL,
  `descricao` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`idQualidade`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbnetf`.`Plano`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbnetf`.`Plano` (
  `idPlano` INT NOT NULL,
  `nmPlano` VARCHAR(50) NULL DEFAULT NULL,
  `precoMensal` DECIMAL(10,2) NULL DEFAULT NULL,
  `numTelas` INT NULL DEFAULT NULL,
  `Qualidadevideo_idQualidade` SMALLINT NOT NULL,
  PRIMARY KEY (`idPlano`),
  INDEX `fk_plano_Qualidadevideo1_idx` (`Qualidadevideo_idQualidade` ASC) VISIBLE,
  CONSTRAINT `fk_plano_Qualidadevideo1`
    FOREIGN KEY (`Qualidadevideo_idQualidade`)
    REFERENCES `dbnetf`.`QualidadeVideo` (`idQualidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbnetf`.`SituacaoAssinatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbnetf`.`SituacaoAssinatura` (
  `idSituacao` SMALLINT NOT NULL,
  `descricao` VARCHAR(40) NULL DEFAULT NULL,
  PRIMARY KEY (`idSituacao`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbnetf`.`Assinatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbnetf`.`Assinatura` (
  `idAssinatura` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `dtInicio` DATE NULL DEFAULT NULL,
  `dtFim` DATE NULL DEFAULT NULL,
  `Usuario_idUsuario` BIGINT UNSIGNED NOT NULL,
  `Plano_idPlano` INT NOT NULL,
  `SituacaoAssinatura_idSituacao` SMALLINT NOT NULL,
  PRIMARY KEY (`idAssinatura`),
  UNIQUE INDEX `idAssinatura` (`idAssinatura` ASC) VISIBLE,
  INDEX `fk_Assinatura_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  INDEX `fk_Assinatura_Plano1_idx` (`Plano_idPlano` ASC) VISIBLE,
  INDEX `fk_Assinatura_SituacaoAssinatura1_idx` (`SituacaoAssinatura_idSituacao` ASC) VISIBLE,
  CONSTRAINT `fk_Assinatura_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `dbnetf`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Assinatura_Plano1`
    FOREIGN KEY (`Plano_idPlano`)
    REFERENCES `dbnetf`.`Plano` (`idPlano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Assinatura_SituacaoAssinatura1`
    FOREIGN KEY (`SituacaoAssinatura_idSituacao`)
    REFERENCES `dbnetf`.`SituacaoAssinatura` (`idSituacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbnetf`.`TipoConteudo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbnetf`.`TipoConteudo` (
  `idTipoConteudo` SMALLINT NOT NULL,
  `descricao` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`idTipoConteudo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbnetf`.`ClassIndicativa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbnetf`.`ClassIndicativa` (
  `idClassIndicativa` SMALLINT NOT NULL,
  `descricao` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`idClassIndicativa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbnetf`.`GeneroConteudo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbnetf`.`GeneroConteudo` (
  `idGenero` SMALLINT NOT NULL,
  `descricao` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`idGenero`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbnetf`.`Conteudo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbnetf`.`Conteudo` (
  `idConteudo` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(150) NULL DEFAULT NULL,
  `duracao` INT NULL DEFAULT NULL,
  `ano_lancamento` INT NULL DEFAULT NULL,
  `TipoConteudo_idTipoConteudo` SMALLINT NOT NULL,
  `TipoConteudo_idTipoConteudo1` SMALLINT NOT NULL,
  `ClassIndicativa_idClassIndicativa` SMALLINT NOT NULL,
  `GeneroConteudo_idGenero` SMALLINT NOT NULL,
  PRIMARY KEY (`idConteudo`),
  UNIQUE INDEX `idConteudo` (`idConteudo` ASC) VISIBLE,
  INDEX `fk_Conteudo_TipoConteudo1_idx` (`TipoConteudo_idTipoConteudo` ASC) VISIBLE,
  INDEX `fk_Conteudo_TipoConteudo2_idx` (`TipoConteudo_idTipoConteudo1` ASC) VISIBLE,
  INDEX `fk_Conteudo_ClassIndicativa1_idx` (`ClassIndicativa_idClassIndicativa` ASC) VISIBLE,
  INDEX `fk_Conteudo_GeneroConteudo1_idx` (`GeneroConteudo_idGenero` ASC) VISIBLE,
  CONSTRAINT `fk_Conteudo_TipoConteudo1`
    FOREIGN KEY (`TipoConteudo_idTipoConteudo`)
    REFERENCES `dbnetf`.`TipoConteudo` (`idTipoConteudo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Conteudo_TipoConteudo2`
    FOREIGN KEY (`TipoConteudo_idTipoConteudo1`)
    REFERENCES `dbnetf`.`TipoConteudo` (`idTipoConteudo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Conteudo_ClassIndicativa1`
    FOREIGN KEY (`ClassIndicativa_idClassIndicativa`)
    REFERENCES `dbnetf`.`ClassIndicativa` (`idClassIndicativa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Conteudo_GeneroConteudo1`
    FOREIGN KEY (`GeneroConteudo_idGenero`)
    REFERENCES `dbnetf`.`GeneroConteudo` (`idGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbnetf`.`Avaliacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbnetf`.`Avaliacao` (
  `id_avaliacao` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_usuario` BIGINT NULL DEFAULT NULL,
  `id_conteudo` BIGINT NULL DEFAULT NULL,
  `nota` INT NULL DEFAULT NULL,
  `data_avaliacao` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `Usuario_idUsuario` BIGINT UNSIGNED NOT NULL,
  `Conteudo_idConteudo` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_avaliacao`),
  UNIQUE INDEX `id_avaliacao` (`id_avaliacao` ASC) VISIBLE,
  INDEX `fk_Avaliacao_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  INDEX `fk_Avaliacao_Conteudo1_idx` (`Conteudo_idConteudo` ASC) VISIBLE,
  CONSTRAINT `fk_Avaliacao_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `dbnetf`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Avaliacao_Conteudo1`
    FOREIGN KEY (`Conteudo_idConteudo`)
    REFERENCES `dbnetf`.`Conteudo` (`idConteudo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbnetf`.`SistemaOperacional`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbnetf`.`SistemaOperacional` (
  `idSistemaOperacional` SMALLINT NOT NULL,
  `descricao` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`idSistemaOperacional`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbnetf`.`Dispositivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbnetf`.`Dispositivo` (
  `idDispositivo` SMALLINT NOT NULL,
  `descricao` VARCHAR(50) NULL DEFAULT NULL,
  `SistemaOperacional_idSistemaOperacional` SMALLINT NOT NULL,
  PRIMARY KEY (`idDispositivo`),
  INDEX `fk_Dispositivo_SistemaOperacional1_idx` (`SistemaOperacional_idSistemaOperacional` ASC) VISIBLE,
  CONSTRAINT `fk_Dispositivo_SistemaOperacional1`
    FOREIGN KEY (`SistemaOperacional_idSistemaOperacional`)
    REFERENCES `dbnetf`.`SistemaOperacional` (`idSistemaOperacional`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbnetf`.`Episodio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbnetf`.`Episodio` (
  `idConteudo` BIGINT UNSIGNED NOT NULL,
  `idSeriado` BIGINT UNSIGNED NOT NULL,
  `temporada` INT NULL DEFAULT NULL,
  `numero_episodio` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idConteudo`),
  INDEX `fk_Episodio_Conteudo1_idx` (`idConteudo` ASC) VISIBLE,
  INDEX `fk_Episodio_Conteudo2_idx` (`idSeriado` ASC) VISIBLE,
  CONSTRAINT `fk_Episodio_Conteudo1`
    FOREIGN KEY (`idConteudo`)
    REFERENCES `dbnetf`.`Conteudo` (`idConteudo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Episodio_Conteudo2`
    FOREIGN KEY (`idSeriado`)
    REFERENCES `dbnetf`.`Conteudo` (`idConteudo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbnetf`.`Visualizacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbnetf`.`Visualizacao` (
  `id_visualizacao` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_hora_inicio` TIMESTAMP NULL DEFAULT NULL,
  `duracao_visualizacao` INT NULL DEFAULT NULL,
  `Usuario_idUsuario` BIGINT UNSIGNED NOT NULL,
  `Conteudo_idConteudo` BIGINT UNSIGNED NOT NULL,
  `Dispositivo_idDispositivo` SMALLINT NOT NULL,
  PRIMARY KEY (`id_visualizacao`),
  UNIQUE INDEX `id_visualizacao` (`id_visualizacao` ASC) VISIBLE,
  INDEX `fk_Visualizacao_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  INDEX `fk_Visualizacao_Conteudo1_idx` (`Conteudo_idConteudo` ASC) VISIBLE,
  INDEX `fk_Visualizacao_Dispositivo1_idx` (`Dispositivo_idDispositivo` ASC) VISIBLE,
  CONSTRAINT `fk_Visualizacao_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `dbnetf`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Visualizacao_Conteudo1`
    FOREIGN KEY (`Conteudo_idConteudo`)
    REFERENCES `dbnetf`.`Conteudo` (`idConteudo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Visualizacao_Dispositivo1`
    FOREIGN KEY (`Dispositivo_idDispositivo`)
    REFERENCES `dbnetf`.`Dispositivo` (`idDispositivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbnetf`.`Pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbnetf`.`Pagamento` (
  `idPagamento` INT NOT NULL,
  `dtPagamento` VARCHAR(45) NULL,
  `vlrRecebido` VARCHAR(45) NULL,
  `Assinatura_idAssinatura` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idPagamento`),
  INDEX `fk_Pagamento_Assinatura1_idx` (`Assinatura_idAssinatura` ASC) VISIBLE,
  CONSTRAINT `fk_Pagamento_Assinatura1`
    FOREIGN KEY (`Assinatura_idAssinatura`)
    REFERENCES `dbnetf`.`Assinatura` (`idAssinatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbnetf`.`Artista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbnetf`.`Artista` (
  `idArtista` INT NOT NULL,
  `nmArtista` VARCHAR(45) NULL,
  PRIMARY KEY (`idArtista`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbnetf`.`Função`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbnetf`.`Função` (
  `idFuncao` INT NOT NULL,
  `descFuncao` VARCHAR(45) NULL,
  PRIMARY KEY (`idFuncao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbnetf`.`ArtistaConteudo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbnetf`.`ArtistaConteudo` (
  `Artista_idArtista` INT NOT NULL,
  `Conteudo_idConteudo` BIGINT UNSIGNED NOT NULL,
  `Funcao_id_Funcao` INT NOT NULL,
  PRIMARY KEY (`Artista_idArtista`, `Conteudo_idConteudo`),
  INDEX `fk_Artista_has_Conteudo_Conteudo1_idx` (`Conteudo_idConteudo` ASC) VISIBLE,
  INDEX `fk_Artista_has_Conteudo_Artista1_idx` (`Artista_idArtista` ASC) VISIBLE,
  INDEX `fk_ArtistaConteudo_Papel1_idx` (`Funcao_id_Funcao` ASC) VISIBLE,
  CONSTRAINT `fk_Artista_has_Conteudo_Artista1`
    FOREIGN KEY (`Artista_idArtista`)
    REFERENCES `dbnetf`.`Artista` (`idArtista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Artista_has_Conteudo_Conteudo1`
    FOREIGN KEY (`Conteudo_idConteudo`)
    REFERENCES `dbnetf`.`Conteudo` (`idConteudo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ArtistaConteudo_Papel1`
    FOREIGN KEY (`Funcao_id_Funcao`)
    REFERENCES `dbnetf`.`Função` (`idFuncao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
