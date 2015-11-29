-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ds3
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.7-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comanda`
--

DROP TABLE IF EXISTS `comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comanda` (
  `idcomanda` int(11) NOT NULL AUTO_INCREMENT,
  `idFuncionario` int(11) NOT NULL,
  `mesa` int(11) NOT NULL,
  `dataAbertura` datetime NOT NULL,
  `dataEncerramento` datetime DEFAULT NULL,
  `valorFinal` float DEFAULT NULL,
  PRIMARY KEY (`idcomanda`),
  KEY `fk_comanda_Funcionario1_idx` (`idFuncionario`),
  CONSTRAINT `fk_comanda_Funcionario1` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idFuncionario`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comanda`
--

LOCK TABLES `comanda` WRITE;
/*!40000 ALTER TABLE `comanda` DISABLE KEYS */;
INSERT INTO `comanda` VALUES (1,1,3,'2015-11-07 18:17:00','2015-11-08 21:25:41',28),(2,1,1,'2015-11-07 18:17:00',NULL,NULL),(3,1,1,'2011-11-07 18:18:00',NULL,NULL),(4,1,4,'2015-11-07 19:08:00','2015-11-07 19:08:00',NULL),(5,1,10,'2015-11-08 21:59:36',NULL,NULL);
/*!40000 ALTER TABLE `comanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componentes_produto`
--

DROP TABLE IF EXISTS `componentes_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `componentes_produto` (
  `idCompoe` int(11) NOT NULL AUTO_INCREMENT,
  `idProduto` int(11) NOT NULL,
  `idItem` int(11) NOT NULL,
  `quantidade` int(11) DEFAULT '1',
  PRIMARY KEY (`idCompoe`),
  KEY `fk_Produto_has_Item_Item1_idx` (`idItem`),
  KEY `fk_Produto_has_Item_Produto1_idx` (`idProduto`),
  CONSTRAINT `fk_Produto_has_Item_Item1` FOREIGN KEY (`idItem`) REFERENCES `item` (`idItem`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Item_Produto1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componentes_produto`
--

LOCK TABLES `componentes_produto` WRITE;
/*!40000 ALTER TABLE `componentes_produto` DISABLE KEYS */;
INSERT INTO `componentes_produto` VALUES (1,1,3,1),(2,2,2,1),(3,3,1,1),(4,4,5,1),(5,5,4,1),(6,5,5,1),(7,6,4,2),(8,6,5,2);
/*!40000 ALTER TABLE `componentes_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedor` (
  `idFornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cnpj` varchar(11) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `num` varchar(45) DEFAULT NULL,
  `endereco` varchar(45) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  PRIMARY KEY (`idFornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `idFuncionario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` varchar(9) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `num` varchar(5) NOT NULL,
  `endereco` varchar(45) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `salario` float NOT NULL,
  `dataContratacao` date NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `turno` int(11) NOT NULL,
  `login` varchar(45) NOT NULL,
  `password_digest` varchar(60) NOT NULL,
  `nivelAcesso` int(1) NOT NULL,
  PRIMARY KEY (`idFuncionario`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'admin','0','0','0','0','0','0',0,'2015-11-06',1,0,'admin','$2a$10$9SOovishQCDsLH2o.WTRj.nkiCVs6Yl0D7jDRJoHs/.yIXy101k.2',0);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `idItem` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `descricao` varchar(120) DEFAULT NULL,
  `quantidade` int(11) DEFAULT '1',
  `quantidadeMinima` int(11) DEFAULT NULL,
  PRIMARY KEY (`idItem`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'lata de cerveja skoll','skoll','cerveja skoll',200,50),(2,'lata de fanta','coca-cola','lata de fanta',50,10),(3,'lta de coca-cola','coca-cola','lata de coca-cola',100,25),(4,'polpa de morango','fabise','polpa de morango',40,5),(5,'garrafa de água','crystal','água',50,10);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `idFuncionario` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `idcomanda` int(11) NOT NULL,
  `dataPedido` timestamp DEFAULT CURRENT_TIMESTAMP,
  `dataFinalizacao` datetime DEFAULT NULL,
  `cancelado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_Produto_has_comanda_comanda1_idx` (`idcomanda`),
  KEY `fk_Produto_has_comanda_Produto1_idx` (`idProduto`),
  KEY `fk_Pedido_Funcionario1_idx` (`idFuncionario`),
  CONSTRAINT `fk_Pedido_Funcionario1` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idFuncionario`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_comanda_Produto1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_comanda_comanda1` FOREIGN KEY (`idcomanda`) REFERENCES `comanda` (`idcomanda`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,1,1,'2015-11-07 19:03:36',NULL,1),(2,1,2,1,'2015-11-07 19:04:28',NULL,NULL),(3,1,1,1,'2015-11-07 19:04:35',NULL,NULL),(4,1,3,1,'2015-11-07 19:05:05',NULL,NULL),(5,1,4,1,'2015-11-07 19:05:05',NULL,NULL),(6,1,2,1,'2015-11-07 19:05:05',NULL,1),(7,1,1,1,'2015-11-07 19:05:05',NULL,1),(8,1,1,1,'2015-11-08 20:55:25','2015-11-08 21:00:16',NULL),(9,1,6,1,'2015-11-08 20:56:30','2015-11-08 21:00:12',NULL),(10,1,1,2,'2015-11-08 22:15:32',NULL,1),(11,1,1,2,'2015-11-08 22:16:13',NULL,NULL);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `idProduto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `valor` float NOT NULL,
  `descricao` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Lata de Coca-Cola',5,'lata de refrigerante coca-cola'),(2,'Lata de Fanta',4,'lata de refrigerante fanta'),(3,'Skoll Lata',5,'Lata de Cerveja Skoll'),(4,'Garrafa de Água 200ml',2,'Garrafa de água'),(5,'Copo de Suco de Morango',3,'Copo de suco feito com polpa de morango'),(6,'Jarra de Suco de Morango',7,'Jarra de Suco de Morango');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20150422121333'),('20151107183124');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vende`
--

DROP TABLE IF EXISTS `vende`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vende` (
  `idVende` int(11) NOT NULL AUTO_INCREMENT,
  `idFornecedor` int(11) NOT NULL,
  `idItem` int(11) NOT NULL,
  `data` date NOT NULL,
  `valor` float NOT NULL,
  PRIMARY KEY (`idVende`),
  UNIQUE KEY `idVende` (`idVende`),
  KEY `fk_Fornecedor_has_Item_Item1_idx` (`idItem`),
  KEY `fk_Fornecedor_has_Item_Fornecedor_idx` (`idFornecedor`),
  CONSTRAINT `fk_Fornecedor_has_Item_Fornecedor` FOREIGN KEY (`idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fornecedor_has_Item_Item1` FOREIGN KEY (`idItem`) REFERENCES `item` (`idItem`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vende`
--

LOCK TABLES `vende` WRITE;
/*!40000 ALTER TABLE `vende` DISABLE KEYS */;
/*!40000 ALTER TABLE `vende` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-08 22:19:34
