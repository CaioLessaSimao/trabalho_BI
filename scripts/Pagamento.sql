-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Pagamento
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Pagamento
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Pagamento` DEFAULT CHARACTER SET utf8 ;
USE `Pagamento` ;

-- -----------------------------------------------------
-- Table `Pagamento`.`Dim_Localizacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pagamento`.`Dim_Localizacao` (
  `id` INT NOT NULL,
  `cidade` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pagamento`.`Dim_Data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pagamento`.`Dim_Data` (
  `id` INT NOT NULL,
  `mes` INT NULL,
  `ano` INT NULL,
  `trimestre` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pagamento`.`Dim_Assinatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pagamento`.`Dim_Assinatura` (
  `id` INT NOT NULL,
  `EnumTipo` INT NOT NULL,
  `desc` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pagamento`.`Fato_Receita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pagamento`.`Fato_Receita` (
  `id` INT NOT NULL,
  `valor` DECIMAL(12,2) NULL,
  `Dim_Data_id` INT NOT NULL,
  `Dim_Localizacao_id` INT NOT NULL,
  `Dim_Assinatura_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Dim_Data_id`, `Dim_Localizacao_id`, `Dim_Assinatura_id`),
  INDEX `fk_Fato_Assinatura_Dim_Data_idx` (`Dim_Data_id` ASC) VISIBLE,
  INDEX `fk_Fato_Assinatura_Dim_Localizacao1_idx` (`Dim_Localizacao_id` ASC) VISIBLE,
  INDEX `fk_Fato_Receita_Dim_Assinatura1_idx` (`Dim_Assinatura_id` ASC) VISIBLE,
  CONSTRAINT `fk_Fato_Assinatura_Dim_Data`
    FOREIGN KEY (`Dim_Data_id`)
    REFERENCES `Pagamento`.`Dim_Data` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fato_Assinatura_Dim_Localizacao1`
    FOREIGN KEY (`Dim_Localizacao_id`)
    REFERENCES `Pagamento`.`Dim_Localizacao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fato_Receita_Dim_Assinatura1`
    FOREIGN KEY (`Dim_Assinatura_id`)
    REFERENCES `Pagamento`.`Dim_Assinatura` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '					';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;