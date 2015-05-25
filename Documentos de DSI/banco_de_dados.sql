SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `restaurante-g3` ;
CREATE SCHEMA IF NOT EXISTS `restaurante-g3` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `restaurante-g3` ;

-- -----------------------------------------------------
-- Table `fornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fornecedor` ;

CREATE TABLE IF NOT EXISTS `fornecedor` (
  `idFornecedor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(11) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `num` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`idFornecedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item` ;

CREATE TABLE IF NOT EXISTS `item` (
  `idItem` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NULL,
  `descricao` VARCHAR(120) NOT NULL,
  `quantidade` INT NOT NULL,
  `quantidadeMinima` INT NULL,
  PRIMARY KEY (`idItem`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vende`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vende` ;

CREATE TABLE IF NOT EXISTS `vende` (
  `idVende` INT NOT NULL UNIQUE AUTO_INCREMENT,
  `idFornecedor` INT NOT NULL,
  `idItem` INT NOT NULL,
  `data` DATE NOT NULL,
  `valor` FLOAT NOT NULL,
  PRIMARY KEY (`idFornecedor`, `idItem`, `idVende`),
  INDEX `fk_Fornecedor_has_Item_Item1_idx` (`idItem` ASC),
  INDEX `fk_Fornecedor_has_Item_Fornecedor_idx` (`idFornecedor` ASC),
  CONSTRAINT `fk_Fornecedor_has_Item_Fornecedor`
    FOREIGN KEY (`idFornecedor`)
    REFERENCES `Fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fornecedor_has_Item_Item1`
    FOREIGN KEY (`idItem`)
    REFERENCES `Item` (`idItem`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `produto` ;

CREATE TABLE IF NOT EXISTS `produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `valor` FLOAT NOT NULL,
  `descricao` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `componentes_produtos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `componente_produto` ;

CREATE TABLE IF NOT EXISTS `componentes_produtos` (
  `idCompoe` INT NOT NULL AUTO_INCREMENT,
  `idProduto` INT NOT NULL,
  `idItem` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`idCompoe`, `idProduto`, `idItem`),
  INDEX `fk_Produto_has_Item_Item1_idx` (`idItem` ASC),
  INDEX `fk_Produto_has_Item_Produto1_idx` (`idProduto` ASC),
  CONSTRAINT `fk_Produto_has_Item_Produto1`
    FOREIGN KEY (`idProduto`)
    REFERENCES `Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Item_Item1`
    FOREIGN KEY (`idItem`)
    REFERENCES `Item` (`idItem`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `funcionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `funcionario` ;

CREATE TABLE IF NOT EXISTS `funcionario` (
  `idFuncionario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(9) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `num` VARCHAR(5) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(11) NOT NULL,
  `salario` FLOAT NOT NULL,
  `dataContratacao` DATE NOT NULL,
  `ativo` TINYINT(1) NOT NULL,
  `turno` INT NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `nivelAcesso` INT(1) NOT NULL,
  PRIMARY KEY (`idFuncionario`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comanda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comanda` ;

CREATE TABLE IF NOT EXISTS `comanda` (
  `idcomanda` INT NOT NULL AUTO_INCREMENT,
  `idFuncionario` INT NOT NULL,
  `mesa` INT NOT NULL,
  `dataAbertura` DATETIME NOT NULL,
  `dataEncerramento` DATETIME NOT NULL,
  `valorFinal` FLOAT NOT NULL,
  PRIMARY KEY (`idcomanda`, `idFuncionario`),
  INDEX `fk_comanda_Funcionario1_idx` (`idFuncionario` ASC),
  CONSTRAINT `fk_comanda_Funcionario1`
    FOREIGN KEY (`idFuncionario`)
    REFERENCES `Funcionario` (`idFuncionario`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pedido` ;

CREATE TABLE IF NOT EXISTS `pedido` (
  `idPedido` INT NOT NULL AUTO_INCREMENT,
  `idFuncionario` INT NOT NULL,
  `idProduto` INT NOT NULL,
  `idcomanda` INT NOT NULL,
  `dataPedido` DATETIME NOT NULL,
  `dataFinalizacao` DATETIME NOT NULL,
  `cancelado` TINYINT(1) NULL,
  PRIMARY KEY (`idPedido`, `idFuncionario`, `idProduto`, `idcomanda`),
  INDEX `fk_Produto_has_comanda_comanda1_idx` (`idcomanda` ASC),
  INDEX `fk_Produto_has_comanda_Produto1_idx` (`idProduto` ASC),
  INDEX `fk_Pedido_Funcionario1_idx` (`idFuncionario` ASC),
  CONSTRAINT `fk_Produto_has_comanda_Produto1`
    FOREIGN KEY (`idProduto`)
    REFERENCES `Produto` (`idProduto`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_comanda_comanda1`
    FOREIGN KEY (`idcomanda`)
    REFERENCES `comanda` (`idcomanda`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Funcionario1`
    FOREIGN KEY (`idFuncionario`)
    REFERENCES `funcionario` (`idFuncionario`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
