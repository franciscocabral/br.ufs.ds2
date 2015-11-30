--
-- Tabela `comanda`
--

DROP TABLE IF EXISTS `comanda`;
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

--
-- Tabela `componentes_produto`
--

DROP TABLE IF EXISTS `componentes_produto`;
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

--
-- Tabela `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
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

--
-- Tabela table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
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

--
-- Tabela `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `idItem` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `descricao` varchar(120) DEFAULT NULL,
  `quantidade` int(11) DEFAULT '1',
  `quantidadeMinima` int(11) DEFAULT NULL,
  PRIMARY KEY (`idItem`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Tabela `pedido`
--

DROP TABLE IF EXISTS `pedido`;
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

--
-- Tabela `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
  `idProduto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `valor` float NOT NULL,
  `descricao` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Tabela `vende`
--

DROP TABLE IF EXISTS `vende`;
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
