## Create Tables

# CategoriaProduto
CREATE TABLE `categoriaproduto` (
  `categoriaProdutoId` int(11) NOT NULL,
  `nomeCategoria` varchar(45) NOT NULL,
  PRIMARY KEY (`categoriaProdutoId`)
);

#Insumo
CREATE TABLE `insumo` (
  `insumoId` int(11) NOT NULL,
  `nomeInsumo` varchar(45) DEFAULT NULL,
  `unidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`insumoId`)
);

#nome produto
CREATE TABLE `nomeproduto` (
  `nomeProdutoId` int(11) NOT NULL,
  `categoriaProdutoId` int(11) NOT NULL,
  `nomeProduto` varchar(45) NOT NULL,
  PRIMARY KEY (`nomeProdutoId`),
  FOREIGN KEY (`categoriaProdutoId`) REFERENCES categoriaproduto( `categoriaProdutoId`)
);

#tamanho
CREATE TABLE `tamanho` (
  `tamanhoId` int(11) NOT NULL,
  `nomeTamanho` varchar(45) NOT NULL,
  PRIMARY KEY (`tamanhoId`)
);

#time
CREATE TABLE `time` (
  `date` date NOT NULL,
  `month` int(11) NOT NULL,
  `week` int(11) NOT NULL,
  `quarter` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`date`)
);


#order metrics
CREATE TABLE `ordermetrics` (
  `date` date NOT NULL,
  `tamanhoId` int(11) NOT NULL,
  `nomeProdutoId` int(11) NOT NULL,
  `quantidadeVendida` int(11) NOT NULL,
  `faturamento` decimal(10,0) NOT NULL,
  `margemLiquida` float NOT NULL,
  PRIMARY KEY (`date`,`tamanhoId`,`nomeProdutoId`),
  FOREIGN KEY (`nomeProdutoId`) REFERENCES nomeproduto( `nomeProdutoId`),
  FOREIGN KEY (`date`) REFERENCES time( `date`),
  FOREIGN KEY (`tamanhoId`) REFERENCES tamanho( `tamanhoId`)
);

#supply metrics
CREATE TABLE `supplymetrics` (
  `date` date NOT NULL,
  `tamanhoId` int(11) NOT NULL,
  `categoriaProdutoId` int(11) NOT NULL,
  `insumoId` int(11) NOT NULL,
  `custoInventario` float NOT NULL,
  `consumoInventario` float NOT NULL,
  PRIMARY KEY (`date`,`tamanhoId`,`categoriaProdutoId`,`insumoId`),
  FOREIGN KEY (`categoriaProdutoId`) REFERENCES categoriaproduto( `categoriaProdutoId`),
  FOREIGN KEY (`date`) REFERENCES time( `date`),
  FOREIGN KEY (`tamanhoId`) REFERENCES tamanho( `tamanhoId`),
  FOREIGN KEY (`insumoId`) REFERENCES insumo(`insumoId`)
);




