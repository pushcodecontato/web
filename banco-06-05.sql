-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: mob_share
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_acessorio_veiculo`
--

DROP TABLE IF EXISTS `tbl_acessorio_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_acessorio_veiculo` (
  `idtbl_acessorio_tbl_veiculo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela de acessório do veículo',
  `id_acessorio` int(11) DEFAULT NULL COMMENT 'código da tabela acessório',
  `id_veiculo` int(11) DEFAULT NULL COMMENT 'código da tabela de veículo',
  PRIMARY KEY (`idtbl_acessorio_tbl_veiculo`),
  KEY `fk_tbl_acessorio_veiculo_tbl_veiculo_idx` (`id_veiculo`),
  KEY `fk_tbl_acessorio_veiculo_tbl_acessorio_idx` (`id_acessorio`),
  CONSTRAINT `fk_tbl_acessorio_veiculo_tbl_acessorio` FOREIGN KEY (`id_acessorio`) REFERENCES `tbl_acessorios` (`id_acessorios`),
  CONSTRAINT `fk_tbl_acessorio_veiculo_tbl_veiculo` FOREIGN KEY (`id_veiculo`) REFERENCES `tbl_veiculo` (`id_veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_acessorio_veiculo`
--

LOCK TABLES `tbl_acessorio_veiculo` WRITE;
/*!40000 ALTER TABLE `tbl_acessorio_veiculo` DISABLE KEYS */;
INSERT INTO `tbl_acessorio_veiculo` VALUES (1,3,1),(2,4,1),(3,5,2),(4,3,2),(5,6,4),(6,4,3),(7,5,3),(8,3,5),(9,4,5),(10,6,6),(11,5,6),(12,3,7),(13,4,7),(14,5,8),(15,4,9),(16,6,9);
/*!40000 ALTER TABLE `tbl_acessorio_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_acessorios`
--

DROP TABLE IF EXISTS `tbl_acessorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_acessorios` (
  `id_acessorios` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela acessórios',
  `nome_acessorios` varchar(150) NOT NULL COMMENT 'nome dos acessórios',
  `id_tipo_veiculo` int(11) NOT NULL COMMENT 'código da tabela tipo de veículo',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `excluido` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_acessorios`),
  KEY `fk_tbl_acessorios_tbl_tipo_veiculos_idx` (`id_tipo_veiculo`),
  CONSTRAINT `fk_tbl_acessorios_tbl_tipo_veiculos` FOREIGN KEY (`id_tipo_veiculo`) REFERENCES `tbl_tipo_veiculo` (`id_tipo_veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_acessorios`
--

LOCK TABLES `tbl_acessorios` WRITE;
/*!40000 ALTER TABLE `tbl_acessorios` DISABLE KEYS */;
INSERT INTO `tbl_acessorios` VALUES (1,'sadasd',10,1,1),(2,'dsfsd',10,1,1),(3,'Semi-Automático',10,1,0),(4,' Flex',10,1,0),(5,'Direção hidráulica',10,1,0),(6,'Bancos de couro',10,1,0);
/*!40000 ALTER TABLE `tbl_acessorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_anuncio`
--

DROP TABLE IF EXISTS `tbl_anuncio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_anuncio` (
  `id_anuncio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela anúncio',
  `descricao` text NOT NULL COMMENT 'descrição da tabela de anúncio',
  `id_cliente_locador` int(11) NOT NULL COMMENT 'código da tabela cliente locador',
  `id_veiculo` int(11) NOT NULL COMMENT 'código da tabela de veículo',
  `horario_inicio` time NOT NULL COMMENT 'horário de inicio do anúncio',
  `horario_termino` time NOT NULL COMMENT 'horário de termino do anúncio',
  `data_inicial` date NOT NULL COMMENT 'data inicial do anúncio',
  `data_final` date NOT NULL COMMENT 'data final do anúncio',
  `status_aprovado` tinyint(2) DEFAULT NULL COMMENT 'status aprovado do anúncio',
  `valor_hora` decimal(10,2) NOT NULL DEFAULT '1.00',
  PRIMARY KEY (`id_anuncio`),
  KEY `fk_tbl_usuario_tbl_anuncios_idx` (`id_cliente_locador`),
  KEY `fk_tbl_veiculos_tbl_anuncios_idx` (`id_veiculo`),
  CONSTRAINT `fk_tbl_usuario_tbl_anuncios` FOREIGN KEY (`id_cliente_locador`) REFERENCES `tbl_cliente` (`id_cliente`),
  CONSTRAINT `fk_tbl_veiculos_tbl_anuncios` FOREIGN KEY (`id_veiculo`) REFERENCES `tbl_veiculo` (`id_veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_anuncio`
--

LOCK TABLES `tbl_anuncio` WRITE;
/*!40000 ALTER TABLE `tbl_anuncio` DISABLE KEYS */;
INSERT INTO `tbl_anuncio` VALUES (1,'Feriado do dia do trabalho',1,1,'07:00:00','18:00:00','2019-05-04','2019-05-10',1,10.00),(2,'Final de semana',2,4,'11:00:00','15:00:00','2019-05-03','2019-10-05',1,22.00),(3,'Começo de semana ',3,7,'13:00:00','19:00:00','2018-05-07','2019-05-12',1,11.00),(4,'Começo de semana ',1,2,'11:00:00','13:00:00','2018-05-07','2019-05-10',1,22.00),(5,'Final de semana',2,5,'13:00:00','19:00:00','2018-05-07','2019-10-05',1,22.00),(6,'Final de semana',2,6,'13:00:00','19:00:00','2018-05-07','2019-10-05',1,22.00),(7,'Final de semana',3,8,'13:00:00','19:00:00','2018-05-07','2019-10-05',1,22.00),(8,'Final de semana',2,5,'13:00:00','19:00:00','2018-05-07','2019-10-05',1,22.00),(9,'Final de semana',3,9,'13:00:00','19:00:00','2018-05-07','2019-10-05',1,22.00);
/*!40000 ALTER TABLE `tbl_anuncio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_anuncio_venda`
--

DROP TABLE IF EXISTS `tbl_anuncio_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_anuncio_venda` (
  `id_anuncio_venda` int(11) NOT NULL COMMENT 'código do anúncio de venda',
  `id_veiculo` int(11) NOT NULL COMMENT 'código da tabela do veículo',
  `id_cliente` int(11) NOT NULL COMMENT 'código da tabela do cliente',
  `descricao_anuncio_venda` text NOT NULL COMMENT 'descrição do anúncio de venda',
  `valor_venda` float NOT NULL COMMENT 'valor de venda do anúncio',
  PRIMARY KEY (`id_anuncio_venda`),
  KEY `fk_tbl_usuario_tbl_anuncio_venda_idx` (`id_cliente`),
  KEY `fk_tbl_veiculo_tbl_anuncio_venda_idx` (`id_veiculo`),
  CONSTRAINT `fk_tbl_usuario_tbl_anuncio_venda` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`),
  CONSTRAINT `fk_tbl_veiculo_tbl_anuncio_venda` FOREIGN KEY (`id_veiculo`) REFERENCES `tbl_veiculo` (`id_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_anuncio_venda`
--

LOCK TABLES `tbl_anuncio_venda` WRITE;
/*!40000 ALTER TABLE `tbl_anuncio_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_anuncio_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_aprovacao_anuncio`
--

DROP TABLE IF EXISTS `tbl_aprovacao_anuncio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_aprovacao_anuncio` (
  `id_aprovacao_anuncio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela aprovação do anúncio',
  `status_aprovacao` tinyint(4) NOT NULL COMMENT 'status da aprovação',
  `id_anuncio` int(11) NOT NULL COMMENT 'código da tabela anúncio',
  `id_usuario_cms` int(11) NOT NULL COMMENT 'código da tabela usuário do cms',
  `mensagem` text NOT NULL,
  PRIMARY KEY (`id_aprovacao_anuncio`),
  KEY `fk_tbl_aprovacao_anuncio_tbl_usuario_cms_idx` (`id_usuario_cms`),
  KEY `fk_tbl_aprovacao_anuncio_tbl_anuncio_idx` (`id_anuncio`),
  CONSTRAINT `fk_tbl_avaliacao_anuncio_tbl_anuncio` FOREIGN KEY (`id_anuncio`) REFERENCES `tbl_anuncio` (`id_anuncio`),
  CONSTRAINT `fk_tbl_avaliacao_anuncio_tbl_usuario_cms` FOREIGN KEY (`id_usuario_cms`) REFERENCES `tbl_usuario_cms` (`id_usuario_cms`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_aprovacao_anuncio`
--

LOCK TABLES `tbl_aprovacao_anuncio` WRITE;
/*!40000 ALTER TABLE `tbl_aprovacao_anuncio` DISABLE KEYS */;
INSERT INTO `tbl_aprovacao_anuncio` VALUES (1,0,1,8,'tudo ok');
/*!40000 ALTER TABLE `tbl_aprovacao_anuncio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_aprovacao_anuncio_venda`
--

DROP TABLE IF EXISTS `tbl_aprovacao_anuncio_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_aprovacao_anuncio_venda` (
  `id_aprovacao_anuncio_venda` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código de aprovação do anúncio de venda',
  `status_aprovacao` tinyint(4) NOT NULL COMMENT 'status de aprovação do anúncio de venda',
  `id_anuncio_venda` int(11) NOT NULL COMMENT 'código da tabela de anúncio de venda',
  `id_usuario_cms` int(11) NOT NULL COMMENT 'código da tabela do usuário do cms',
  PRIMARY KEY (`id_aprovacao_anuncio_venda`),
  KEY `fk_tbl_aprovacao_anuncio_tbl_usuario_cms_idx` (`id_usuario_cms`),
  KEY `fk_tbl_aprovacao_anuncio_venda_tbl_anuncio_venda_idx` (`id_anuncio_venda`),
  CONSTRAINT `fk_tbl_avaliacao_anuncio_venda_tbl_anuncio_venda` FOREIGN KEY (`id_anuncio_venda`) REFERENCES `tbl_anuncio_venda` (`id_anuncio_venda`),
  CONSTRAINT `fk_tbl_avaliacao_anuncio_venda_tbl_usuario_cms` FOREIGN KEY (`id_usuario_cms`) REFERENCES `tbl_usuario_cms` (`id_usuario_cms`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_aprovacao_anuncio_venda`
--

LOCK TABLES `tbl_aprovacao_anuncio_venda` WRITE;
/*!40000 ALTER TABLE `tbl_aprovacao_anuncio_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_aprovacao_anuncio_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_aprovacao_veiculo`
--

DROP TABLE IF EXISTS `tbl_aprovacao_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_aprovacao_veiculo` (
  `id_aprovacao_veiculo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela aprovação do veículo',
  `status_aprovacao` tinyint(4) NOT NULL COMMENT 'status de aprovação',
  `id_usuario_cms` int(11) NOT NULL COMMENT 'código do usuário do cms',
  `id_veiculo` int(11) NOT NULL COMMENT 'código da tabela veículo',
  `mensagem` text NOT NULL,
  PRIMARY KEY (`id_aprovacao_veiculo`),
  KEY `fk_tbl_aprovacao_veiculo_tbl_veiculo_idx` (`id_veiculo`),
  KEY `fk_tbl_aprovacao_veiculo_tbl_usuario_cms_idx` (`id_usuario_cms`),
  CONSTRAINT `fk_tbl_avaliacao_veiculo_tbl_usuario_cms` FOREIGN KEY (`id_usuario_cms`) REFERENCES `tbl_usuario_cms` (`id_usuario_cms`),
  CONSTRAINT `fk_tbl_avaliacao_veiculo_tbl_veiculo` FOREIGN KEY (`id_veiculo`) REFERENCES `tbl_veiculo` (`id_veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_aprovacao_veiculo`
--

LOCK TABLES `tbl_aprovacao_veiculo` WRITE;
/*!40000 ALTER TABLE `tbl_aprovacao_veiculo` DISABLE KEYS */;
INSERT INTO `tbl_aprovacao_veiculo` VALUES (4,0,8,1,'ok!'),(5,0,8,4,'ok!');
/*!40000 ALTER TABLE `tbl_aprovacao_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_avaliacao_locatario`
--

DROP TABLE IF EXISTS `tbl_avaliacao_locatario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_avaliacao_locatario` (
  `id_avaliacao_locatario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código  da tabeça de avaliação do locatario',
  `nota` float DEFAULT NULL COMMENT 'nota do locatario',
  `comentario` text NOT NULL COMMENT 'comentário da avaliação do locatário',
  `data_avaliacao` date NOT NULL COMMENT 'data da avaliação do locatario',
  `id_locacao` int(11) NOT NULL COMMENT 'código da tabela locação',
  PRIMARY KEY (`id_avaliacao_locatario`),
  KEY `fk_tbl_avaliacao_locacao_tbl_locacao_idx` (`id_locacao`),
  CONSTRAINT `fk_tbl_avaliacao_locacao_tbl_locacao` FOREIGN KEY (`id_locacao`) REFERENCES `tbl_locacao` (`id_locacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_avaliacao_locatario`
--

LOCK TABLES `tbl_avaliacao_locatario` WRITE;
/*!40000 ALTER TABLE `tbl_avaliacao_locatario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_avaliacao_locatario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_avaliacao_servico`
--

DROP TABLE IF EXISTS `tbl_avaliacao_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_avaliacao_servico` (
  `id_avaliacao_servico` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela avaliação serviço',
  `nota` float DEFAULT NULL COMMENT 'nota da avaliação',
  `data_avaliacao` date NOT NULL COMMENT 'data da avaliação',
  `id_locacao` int(11) NOT NULL COMMENT 'código da tabela locação',
  `comentario` text COMMENT 'comentária da locação',
  PRIMARY KEY (`id_avaliacao_servico`),
  KEY `fk_tbl_avaliacao_servico_tbl_locacao_idx` (`id_locacao`),
  CONSTRAINT `fk_tbl_avaliacao_servico_tbl_locacao` FOREIGN KEY (`id_locacao`) REFERENCES `tbl_locacao` (`id_locacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_avaliacao_servico`
--

LOCK TABLES `tbl_avaliacao_servico` WRITE;
/*!40000 ALTER TABLE `tbl_avaliacao_servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_avaliacao_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bancos`
--

DROP TABLE IF EXISTS `tbl_bancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_bancos` (
  `id_banco` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela bancas',
  `nome_banco` varchar(60) NOT NULL COMMENT 'nome do banco',
  `agencia_numero` varchar(20) NOT NULL COMMENT 'número da agência',
  `cidade` varchar(100) DEFAULT NULL COMMENT 'cidade do banco',
  `uf` varchar(2) DEFAULT NULL COMMENT 'estado do banco',
  PRIMARY KEY (`id_banco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bancos`
--

LOCK TABLES `tbl_bancos` WRITE;
/*!40000 ALTER TABLE `tbl_bancos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_bancos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cargo_funcionario`
--

DROP TABLE IF EXISTS `tbl_cargo_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_cargo_funcionario` (
  `id_cargo_funcionario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela de cargo do funcionário',
  `id_cargo` int(11) NOT NULL COMMENT 'código da tabela de cargo',
  `id_funcionario` int(11) NOT NULL COMMENT 'código da tabela de funcionário',
  `data` date DEFAULT NULL COMMENT 'data de contratação do funcionário',
  PRIMARY KEY (`id_cargo_funcionario`),
  KEY `fk_tbl_setor_tbl_cargo_funcionario_idx` (`id_cargo`),
  KEY `fk_tbl_funcionario_tbl_cargo_funcionario_idx` (`id_funcionario`),
  CONSTRAINT `fk_tbl_funcionario_tbl_cargo_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `tbl_funcionario` (`id_funcionario`),
  CONSTRAINT `fk_tbl_setor_tbl_cargo_funcionario` FOREIGN KEY (`id_cargo`) REFERENCES `tbl_cargos` (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cargo_funcionario`
--

LOCK TABLES `tbl_cargo_funcionario` WRITE;
/*!40000 ALTER TABLE `tbl_cargo_funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cargo_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cargos`
--

DROP TABLE IF EXISTS `tbl_cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_cargos` (
  `id_cargo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela de cargos',
  `nome` varchar(100) NOT NULL COMMENT 'nome do cargo',
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cargos`
--

LOCK TABLES `tbl_cargos` WRITE;
/*!40000 ALTER TABLE `tbl_cargos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cliente`
--

DROP TABLE IF EXISTS `tbl_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código do cliente',
  `nome_cliente` varchar(250) NOT NULL COMMENT 'nome do cliente',
  `cpf` varchar(11) DEFAULT NULL COMMENT 'cpf do cliente',
  `telefone` varchar(15) DEFAULT NULL COMMENT 'telefone do cliente',
  `celular` varchar(16) DEFAULT NULL COMMENT 'celular do cliente',
  `cnh_foto` varchar(255) DEFAULT NULL COMMENT 'foto da cnh do cliente',
  `foto_cliente` varchar(255) NOT NULL COMMENT 'foto do cliente',
  `rua` varchar(150) DEFAULT NULL COMMENT 'rua do endereço do cliente',
  `bairro` varchar(150) DEFAULT NULL COMMENT 'bairro do cliente',
  `cep` varchar(8) DEFAULT NULL COMMENT 'cep do cliente',
  `complemento` varchar(150) DEFAULT NULL COMMENT 'complemento do endereço do cliente',
  `cidade` varchar(70) DEFAULT NULL COMMENT 'cidade do cliente',
  `uf` varchar(2) DEFAULT NULL COMMENT 'sigla do estado do cliente ',
  `email` varchar(150) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `dt_nascimento` date NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cliente`
--

LOCK TABLES `tbl_cliente` WRITE;
/*!40000 ALTER TABLE `tbl_cliente` DISABLE KEYS */;
INSERT INTO `tbl_cliente` VALUES (1,'Gabriel','43534','345345','345345','92b8aca15170aad6e392c835bb11c0f0.png','55761ff015d4887afc61becf4401e7f4.png','324','324324','32423','32423','324','32','admin@bugbunny.com','$2y$12$bkQhQa5RQQX0RxwU9lZ5lOSneac1hZwtAfSnQCHTkJalLYVNrgKny',1,'0000-00-00'),(2,'Gil 45435','43534543','435345','435345','4befd27b8e47c89c67efdbb2a31bdaae.png','9d476c5f9d012ec9d18bf0141799eaaa.jpg','345345','4353','32423','435345','435','34','claudio@teste.com.br','$2y$12$srOo70lWcrDwy1GGESMyLeF7Lz5i/2pqmxN5yuQAahXodZMs6tPVe',0,'0000-00-00'),(3,'Claudio','43534543','435345','435345','7cbe6b59fc9a4c38bb5faddf75a9ca02.png','a4af6044b6a1abd4e88bb3cb9a959b5a.png','345345','4353','32423','435345','435','34','claudio@teste.com.br','$2y$12$xN33ks.UYcZVRoHWrlmcOu6Edi/Tac5DF/RXVYsxaVR4iC6RlsEQC',0,'0000-00-00'),(4,'Larissa Bruna ','49056154885','1141445998','11952446264','f38a682cc6d4f40631a804babaa8ec61.jpg','cfcc3b19a426269118bf894a2b9d86e9.png','Ariano Camaros','Amador Bueno','6680580','apt','Barueri','SP','lala_2.5@hotmail.com','$2y$12$Optce0mwBAfQLIdoLlGRHemKcOzf4R4oaN1wheri03zBjSsT0Pcou',1,'0000-00-00'),(5,'matheus',NULL,NULL,NULL,NULL,'img/1lvc017wjvcakrgb.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'matheus@matheus','123',1,'1999-07-18'),(6,'Matheus',NULL,NULL,NULL,NULL,'img/1lvc017wjvcari1r.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'matheus@hotmail','123',1,'1999-07-18'),(7,'Gil Ramos',NULL,NULL,NULL,NULL,'img/1lvc07hgjvcesuhm.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'gilberto.tec@vivaldi.net','123',1,'1999-06-02');
/*!40000 ALTER TABLE `tbl_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_comentario_avaliacao`
--

DROP TABLE IF EXISTS `tbl_comentario_avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_comentario_avaliacao` (
  `id_comentario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela comentário',
  `comentario` text COMMENT 'comentário',
  `data` datetime NOT NULL COMMENT 'data do comentário da avaliação',
  PRIMARY KEY (`id_comentario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_comentario_avaliacao`
--

LOCK TABLES `tbl_comentario_avaliacao` WRITE;
/*!40000 ALTER TABLE `tbl_comentario_avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_comentario_avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_como_ganhar_dinheiro`
--

DROP TABLE IF EXISTS `tbl_como_ganhar_dinheiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_como_ganhar_dinheiro` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da página como ganhar dinheiro',
  `titulo_sessao1` text NOT NULL COMMENT 'título da página como ganhar dinheiro',
  `lista1_sessao1` text NOT NULL,
  `lista2_sessao1` text NOT NULL COMMENT 'texto da página como ganhar dinheiro',
  `img1_sessao1` text NOT NULL COMMENT 'imagem da página como ganhar dinheiro',
  `titulo_sessao2` text NOT NULL,
  `img1_sessao2` text NOT NULL,
  `lista1_sessao2` text NOT NULL,
  `img2_sessao2` text NOT NULL,
  `lista2_sessao2` text NOT NULL,
  `titulo_sessao3` text NOT NULL,
  `texto_sessao3` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_como_ganhar_dinheiro`
--

LOCK TABLES `tbl_como_ganhar_dinheiro` WRITE;
/*!40000 ALTER TABLE `tbl_como_ganhar_dinheiro` DISABLE KEYS */;
INSERT INTO `tbl_como_ganhar_dinheiro` VALUES (3,'aaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAAAAgasgasgAAAAAAAAAAAAAAA','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAAAAgasgasgAAAAAAAAAAAAAAA','1aa8910686372afa7ef198215634e71c.png','AAAAAAAA','0f94526f73c7677a5c51f81ef9c6eee3.jpeg','AAAAAA','0f94526f73c7677a5c51f81ef9c6eee3.jpeg','AAAA','AAAAAAAAA','AAAAAA'),(4,'aaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAAAAgasgasgAAAAAAAAAAAAAAA','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAAAAgasgasgAAAAAAAAAAAAAAA','c573f0b14ae181d13912cae1d8cbb7a3.png','AAAAAAAA','0f94526f73c7677a5c51f81ef9c6eee3.jpeg','AAAAAA','0f94526f73c7677a5c51f81ef9c6eee3.jpeg','AAAA','AAAAAAAAA','AAAAAA'),(5,'titulo','<div style=\"text-align: left;\"><ul><li><span style=\"text-align: right;\">qweqwe</span></li><li>eqweqe</li><li>qweqw</li></ul></div>','<div style=\"text-align: left;\"><ul><li><span style=\"text-align: right;\">qweqwe</span></li><li>eqweqe</li><li>qweqw</li></ul></div>','4c23bcedee969ee8d35693db308eb023.png','AAAAAAAA','0f94526f73c7677a5c51f81ef9c6eee3.jpeg','AAAAAA','0f94526f73c7677a5c51f81ef9c6eee3.jpeg','AAAA','AAAAAAAAA','AAAAAA'),(6,'titulo','<div style=\"text-align: left;\"><ul><li><span style=\"text-align: right;\">qweqwe</span></li><li>eqweqe</li><li>qweqw</li></ul></div>','<div style=\"text-align: left;\"><ul><li><span style=\"text-align: right;\">qweqwe</span></li><li>eqweqe</li><li>qweqw</li></ul></div>','4c23bcedee969ee8d35693db308eb023.png','titulo2','0f94526f73c7677a5c51f81ef9c6eee3.jpeg','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2</span></li><li>eqweqe</li><li>qweqw</li></ul>','0f94526f73c7677a5c51f81ef9c6eee3.jpeg','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2</span></li><li>eqweqe</li><li>qweqw</li></ul>','AAAAAAAAA','AAAAAA'),(7,'titulo','<div style=\"text-align: left;\"><ul><li><span style=\"text-align: right;\">qweqwe</span></li><li>eqweqe</li><li>qweqw</li></ul></div>','<div style=\"text-align: left;\"><ul><li><span style=\"text-align: right;\">qweqwe</span></li><li>eqweqe</li><li>qweqw</li></ul></div>','4c23bcedee969ee8d35693db308eb023.png','titulo2','0f94526f73c7677a5c51f81ef9c6eee3.jpeg','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2</span></li><li>eqweqe</li><li>qweqw</li></ul>','0f94526f73c7677a5c51f81ef9c6eee3.jpeg','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2</span></li><li>eqweqe</li><li>qweqw</li></ul>','titulo3','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe3</span></li><li>eqweqe</li><li>qweqw3</li></ul>'),(8,'titulo','','','4c23bcedee969ee8d35693db308eb023.png','titulo2','0f94526f73c7677a5c51f81ef9c6eee3.jpeg','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2</span></li><li>eqweqe</li><li>qweqw</li></ul>','0f94526f73c7677a5c51f81ef9c6eee3.jpeg','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2</span></li><li>eqweqe</li><li>qweqw</li></ul>','titulo3','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe3</span></li><li>eqweqe</li><li>qweqw3</li></ul>'),(9,'titulo','','','4c23bcedee969ee8d35693db308eb023.png','aaaa','f29094d6fc0e185013315d25cc559796.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2</span></li><li>eqweqe</li><li>qweqwa</li></ul>','7fa366e549902436bb38d35f8db62570.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2</span></li><li>eqweqea</li><li>qweqw</li></ul>','titulo3','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe3</span></li><li>eqweqe</li><li>qweqw3</li></ul>'),(10,'titulo','','','4c23bcedee969ee8d35693db308eb023.png','aaaa','c9ca9c0f018d1c77ac56fdc08d08e473.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2</span></li><li>eqweqe</li><li>qweqwa</li></ul>','1390d827da893f709d784f7f640a06cf.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2</span></li><li>eqweqea</li><li>qweqw</li></ul>','titulo3','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe3</span></li><li>eqweqe</li><li>qweqw3</li></ul>'),(11,'titulo','','','4c23bcedee969ee8d35693db308eb023.png','aaaa','8151888edd517d34e0bf988ed3482ca6.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2gsgagsagas</span></li><li>eqweqeasggggasggsa</li><li>qweqwagsagagsagsa</li></ul>','afc4b095c8828f189e12c54529f8c3f8.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2gsagsag</span></li><li>qweqwsaggsagagsag</li></ul>','titulo3','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe3</span></li><li>eqweqe</li><li>qweqw3</li></ul>'),(12,'titulo','','','4c23bcedee969ee8d35693db308eb023.png','aaaa','8151888edd517d34e0bf988ed3482ca6.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2gsgagsagas</span></li><li>eqweqeasggggasggsa</li><li>qweqwagsagagsagsa</li></ul>','afc4b095c8828f189e12c54529f8c3f8.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2gsagsag</span></li><li>qweqwsaggsagagsag</li></ul>','titulo3a','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe3aaaaaaaaaaa</span></li><li>eqweqeaaaaaaaaaaa</li><li>qweqw3aaaaaaaaaaaa</li></ul>'),(13,'titulo','','','4c23bcedee969ee8d35693db308eb023.png','aaaa','8151888edd517d34e0bf988ed3482ca6.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2gsgagsagas</span></li><li>eqweqeasggggasggsa</li><li>qweqwagsagagsagsa</li></ul>','afc4b095c8828f189e12c54529f8c3f8.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2gsagsag</span></li><li>qweqwsaggsagagsag</li></ul>','titulo3aagasgagsag','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe3aaaaaaaaaaa</span></li><li>eqweqeaaaaaaaaaaasgag</li><li>qweqw3aaaaaaaaaaaagagg</li><li>gagsagasgsg</li></ul>'),(14,'titulo1','<div><ul><li>gasgasgsag</li><li>agasg</li><li>sgasgsag</li><li>gasg</li></ul></div>','<div><ol><li>gasg</li><li>sag</li><li>sag</li><li>asg</li><li>sg</li><li>sag</li><li><br></li></ol></div>','4c23bcedee969ee8d35693db308eb023.png','aaaa','8151888edd517d34e0bf988ed3482ca6.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2gsgagsagas</span></li><li>eqweqeasggggasggsa</li><li>qweqwagsagagsagsa</li></ul>','afc4b095c8828f189e12c54529f8c3f8.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2gsagsag</span></li><li>qweqwsaggsagagsag</li></ul>','titulo3aagasgagsag','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe3aaaaaaaaaaa</span></li><li>eqweqeaaaaaaaaaaasgag</li><li>qweqw3aaaaaaaaaaaagagg</li><li>gagsagasgsg</li></ul>'),(15,'GASGASGGAS','<div><ul><li>ASGSAGSAGSA</li><li>agasgGAGSAG</li><li>sgasgsagAGAGA</li><li>gasgGAGAGAG</li></ul></div>','<div><ol><li>gasgSAGAG</li><li>sagAGAG</li><li>sagSAGAG</li><li>asgSAGSAG</li><li>sgSAGASGAG</li><li>sag</li><li><br></li></ol></div>','4c23bcedee969ee8d35693db308eb023.png','aaaa','8151888edd517d34e0bf988ed3482ca6.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2gsgagsagas</span></li><li>eqweqeasggggasggsa</li><li>qweqwagsagagsagsa</li></ul>','afc4b095c8828f189e12c54529f8c3f8.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2gsagsag</span></li><li>qweqwsaggsagagsag</li></ul>','titulo3aagasgagsag','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe3aaaaaaaaaaa</span></li><li>eqweqeaaaaaaaaaaasgag</li><li>qweqw3aaaaaaaaaaaagagg</li><li>gagsagasgsg</li></ul>'),(16,'GASGASGGAS','<div><ul><li>ASGSAGSAGSA</li><li>agasgGAGSAG</li><li>sgasgsagAGAGA</li><li>gasgGAGAGAG</li></ul></div>','<div><ol><li>gasgSAGAG</li><li>sagAGAG</li><li>sagSAGAG</li><li>asgSAGSAG</li><li>sgSAGASGAG</li><li>sag</li><li><br></li></ol></div>','4c23bcedee969ee8d35693db308eb023.png','aaaaGASGASGSAGSA','8151888edd517d34e0bf988ed3482ca6.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2gsgagsagasGASGSAG</span></li><li>eqweqeasggggasggsaAGASGSAGSAG</li><li>qweqwagsagagsagsaSAGSAGS</li></ul>','afc4b095c8828f189e12c54529f8c3f8.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2gsagsagSAGASG</span></li><li>qweqwsaggsagagsagASGGASGSAG</li></ul>','titulo3aagasgagsag','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe3aaaaaaaaaaa</span></li><li>eqweqeaaaaaaaaaaasgag</li><li>qweqw3aaaaaaaaaaaagagg</li><li>gagsagasgsg</li></ul>'),(17,'GASGASGGAS','<div><ul><li>ASGSAGSAGSA</li><li>agasgGAGSAG</li><li>sgasgsagAGAGA</li><li>gasgGAGAGAG</li></ul></div>','<div><ol><li>gasgSAGAG</li><li>sagAGAG</li><li>sagSAGAG</li><li>asgSAGSAG</li><li>sgSAGASGAG</li><li>sag</li><li><br></li></ol></div>','4c23bcedee969ee8d35693db308eb023.png','aaaaGASGASGSAGSA','8151888edd517d34e0bf988ed3482ca6.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2gsgagsagasGASGSAG</span></li><li>eqweqeasggggasggsaAGASGSAGSAG</li><li>qweqwagsagagsagsaSAGSAGS</li></ul>','afc4b095c8828f189e12c54529f8c3f8.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2gsagsagSAGASG</span></li><li>qweqwsaggsagagsagASGGASGSAG</li></ul>','titulo3aagasgagsagAGSAGSAGAG','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe3aaaaaaaaaaaGASGSA</span></li><li>eqweqeaaaaaaaaaaasgagGSAGA</li><li>qweqw3aaaaaaaaaaaagaggGSAGSA</li><li>gagsagasgsgGAGAG</li></ul>'),(18,'GASGASGGAS','<div><ul><li>ASGSAGSAGSA</li><li>agasgGAGSAG</li><li>sgasgsagAGAGA</li><li>gasgGAGAGAG</li></ul></div>','<div><ol><li>gasgSAGAG</li><li>sagAGAG</li><li>sagSAGAG</li><li>asgSAGSAG</li><li>sgSAGASGAG</li><li>sag</li><li><br></li></ol></div>','82bee193f08459639e4433bbaebd9fe5.png','aaaaGASGASGSAGSA','8151888edd517d34e0bf988ed3482ca6.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2gsgagsagasGASGSAG</span></li><li>eqweqeasggggasggsaAGASGSAGSAG</li><li>qweqwagsagagsagsaSAGSAGS</li></ul>','afc4b095c8828f189e12c54529f8c3f8.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe2gsagsagSAGASG</span></li><li>qweqwsaggsagagsagASGGASGSAG</li></ul>','titulo3aagasgagsagAGSAGSAGAG','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe3aaaaaaaaaaaGASGSA</span></li><li>eqweqeaaaaaaaaaaasgagGSAGA</li><li>qweqw3aaaaaaaaaaaagaggGSAGSA</li><li>gagsagasgsgGAGAG</li></ul>'),(19,'GASGASGGAS','<div><ul><li>ASGSAGSAGSA</li><li>agasgGAGSAG</li><li>sgasgsagAGAGA</li><li>gasgGAGAGAG</li></ul></div>','<div><ol><li>gasgSAGAG</li><li>sagAGAG</li><li>sagSAGAG</li><li>asgSAGSAG</li><li>sgSAGASGAG</li><li>sag</li><li><br></li></ol></div>','82bee193f08459639e4433bbaebd9fe5.png','222222222222','0ab2ba2c6569fc6027c2d1cdf40e614d.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">2</span></li><li>2<br></li></ul>','9e76e4f176452246773dca6451a3fd93.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">2</span></li><li>2</li></ul>','titulo3aagasgagsagAGSAGSAGAG','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe3aaaaaaaaaaaGASGSA</span></li><li>eqweqeaaaaaaaaaaasgagGSAGA</li><li>qweqw3aaaaaaaaaaaagaggGSAGSA</li><li>gagsagasgsgGAGAG</li></ul>'),(20,'GASGASGGAS','<div><ul><li>ASGSAGSAGSA</li><li>agasgGAGSAG</li><li>sgasgsagAGAGA</li><li>gasgGAGAGAG</li></ul></div>','<div><ol><li>gasgSAGAG</li><li>sagAGAG</li><li>sagSAGAG</li><li>asgSAGSAG</li><li>sgSAGASGAG</li><li>sag</li><li><br></li></ol></div>','82bee193f08459639e4433bbaebd9fe5.png','222222222222','a0fefaffb3ac1fd95c2d98e25f208d7a.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">2</span></li><li>2<br></li></ul>','289651257e2c858bb4d66cac6ef0e1a8.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">2</span></li><li>2</li></ul>','titulo3aagasgagsagAGSAGSAGAG','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">qweqwe3aaaaaaaaaaaGASGSA</span></li><li>eqweqeaaaaaaaaaaasgagGSAGA</li><li>qweqw3aaaaaaaaaaaagaggGSAGSA</li><li>gagsagasgsgGAGAG</li></ul>'),(21,'GASGASGGAS','<div><ul><li>ASGSAGSAGSA</li><li>agasgGAGSAG</li><li>sgasgsagAGAGA</li><li>gasgGAGAGAG</li></ul></div>','<div><ol><li>gasgSAGAG</li><li>sagAGAG</li><li>sagSAGAG</li><li>asgSAGSAG</li><li>sgSAGASGAG</li><li>sag</li><li><br></li></ol></div>','82bee193f08459639e4433bbaebd9fe5.png','222222222222','a0fefaffb3ac1fd95c2d98e25f208d7a.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">2</span></li><li>2<br></li></ul>','289651257e2c858bb4d66cac6ef0e1a8.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">2</span></li><li>2</li></ul>','3','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">3</span></li><li>3</li><li>3</li><li>3</li></ul>'),(22,'GASGASGGAS','<div><ul><li>ASGSAGSAGSA</li><li>agasgGAGSAG</li><li>sgasgsagAGAGA</li><li>gasgGAGAGAG</li></ul></div>','<div><ol><li>gasgSAGAG</li><li>sagAGAG</li><li>sagSAGAG</li><li>asgSAGSAG</li><li>sgSAGASGAG</li><li>sag</li><li><br></li></ol></div>','82bee193f08459639e4433bbaebd9fe5.png','222222222222','a0fefaffb3ac1fd95c2d98e25f208d7a.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">2</span></li><li>2<br></li></ul>','289651257e2c858bb4d66cac6ef0e1a8.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">2</span></li><li>2</li></ul>','3','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">3</span></li><li>3</li><li>3</li><li>3</li></ul>'),(23,'GASGASGGAS','<div><ul><li>ASGSAGSAGSA</li><li>agasgGAGSAG</li><li>sgasgsagAGAGA</li><li>gasgGAGAGAG</li></ul></div>','<div><ol><li>gasgSAGAG</li><li>sagAGAG</li><li>sagSAGAG</li><li>asgSAGSAG</li><li>sgSAGASGAG</li><li>sag</li><li><br></li></ol></div>','82bee193f08459639e4433bbaebd9fe5.png','222222222222','a0fefaffb3ac1fd95c2d98e25f208d7a.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">2</span></li><li>2<br></li></ul>','289651257e2c858bb4d66cac6ef0e1a8.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">2</span></li><li>2</li></ul>','3','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">3</span></li><li>3</li><li>3</li><li>3</li></ul>'),(24,'GASGASGGAS','<div><ul><li>ASGSAGSAGSA</li><li>agasgGAGSAG</li><li>sgasgsagAGAGA</li><li>gasgGAGAGAG</li></ul></div>','<div><ol><li>gasgSAGAG</li><li>sagAGAG</li><li>sagSAGAG</li><li>asgSAGSAG</li><li>sgSAGASGAG</li><li>sag</li><li><br></li></ol></div>','82bee193f08459639e4433bbaebd9fe5.png','222222222222','a0fefaffb3ac1fd95c2d98e25f208d7a.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">2</span></li><li>2<br></li></ul>','289651257e2c858bb4d66cac6ef0e1a8.png','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">2</span></li><li>2</li></ul>','3','<ul style=\"text-align: left;\"><li><span style=\"text-align: right;\">3</span></li><li>3</li><li>3</li><li>3</li></ul>');
/*!40000 ALTER TABLE `tbl_como_ganhar_dinheiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_conta`
--

DROP TABLE IF EXISTS `tbl_conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_conta` (
  `id_conta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da conta',
  `saldo_conta_bancaria` decimal(10,2) NOT NULL COMMENT 'saldo da conta bancaria',
  `numero_conta` varchar(32) NOT NULL COMMENT 'número da conta bancária',
  `id_banco` int(11) NOT NULL COMMENT 'código da tabela banco',
  PRIMARY KEY (`id_conta`),
  KEY `fk_tbl_conta_bancaria_tbl_` (`id_banco`),
  CONSTRAINT `fk_tbl_conta_bancaria_tbl_` FOREIGN KEY (`id_banco`) REFERENCES `tbl_bancos` (`id_banco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_conta`
--

LOCK TABLES `tbl_conta` WRITE;
/*!40000 ALTER TABLE `tbl_conta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contas_pagar`
--

DROP TABLE IF EXISTS `tbl_contas_pagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_contas_pagar` (
  `id_conta_pagar` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela contas à pagar',
  `descricao` text NOT NULL COMMENT 'descrição da conta à pagar ',
  `data_entrada` date NOT NULL COMMENT 'data de entrada da conta à pagar',
  `valor` decimal(10,2) NOT NULL COMMENT 'valor da conta à pagar',
  `titulos_baixados` varchar(45) DEFAULT NULL COMMENT 'títulos das contas à pagar',
  `data_baixa` datetime DEFAULT NULL COMMENT 'data da baixa da conta à pagar',
  `codigo_pagamento` varchar(32) DEFAULT NULL COMMENT 'número do código do pagamento',
  `confirmado` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'confirmação do pagamento aceito ou não aceito',
  PRIMARY KEY (`id_conta_pagar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contas_pagar`
--

LOCK TABLES `tbl_contas_pagar` WRITE;
/*!40000 ALTER TABLE `tbl_contas_pagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_contas_pagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contas_receber`
--

DROP TABLE IF EXISTS `tbl_contas_receber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_contas_receber` (
  `id_conta_receber` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela contas à receber',
  `valor` decimal(10,2) NOT NULL COMMENT 'valor das contas à receber',
  `data_entrada` date NOT NULL COMMENT 'data da entrada do valor à receber',
  `descricao` text COMMENT 'descrição das contas à receber',
  `titulos_baixados` varchar(45) DEFAULT NULL COMMENT 'títulos baixados',
  `titulos_recebidos` varchar(45) DEFAULT NULL COMMENT 'títulos recebidos',
  `data_baixa` datetime DEFAULT NULL COMMENT 'data da baixa do título',
  `confirmado` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'contas foram confirmadas ou não',
  PRIMARY KEY (`id_conta_receber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contas_receber`
--

LOCK TABLES `tbl_contas_receber` WRITE;
/*!40000 ALTER TABLE `tbl_contas_receber` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_contas_receber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_email_mkt`
--

DROP TABLE IF EXISTS `tbl_email_mkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_email_mkt` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da página email marketing',
  `email` varchar(100) NOT NULL COMMENT 'email da página email marketing',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_email_mkt`
--

LOCK TABLES `tbl_email_mkt` WRITE;
/*!40000 ALTER TABLE `tbl_email_mkt` DISABLE KEYS */;
INSERT INTO `tbl_email_mkt` VALUES (1,'lucassoeiro03@gmail.com'),(5,'admin@mobshare.com');
/*!40000 ALTER TABLE `tbl_email_mkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_fale_conosco`
--

DROP TABLE IF EXISTS `tbl_fale_conosco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_fale_conosco` (
  `id_fale_conosco` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da página fale conosco',
  `nome_fale_conosco` varchar(100) DEFAULT NULL COMMENT 'nome da página fale conosco',
  `email_fale_conosco` varchar(100) NOT NULL COMMENT 'email da página fale conosco',
  `telefone_fale_conosco` varchar(20) NOT NULL COMMENT 'telefone da página fale conosco',
  `celular_fale_conosco` varchar(20) DEFAULT NULL COMMENT 'telefone da página fale conosco',
  `mensagem_fale_conosco` text NOT NULL,
  PRIMARY KEY (`id_fale_conosco`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_fale_conosco`
--

LOCK TABLES `tbl_fale_conosco` WRITE;
/*!40000 ALTER TABLE `tbl_fale_conosco` DISABLE KEYS */;
INSERT INTO `tbl_fale_conosco` VALUES (1,'gagag','a@a.com','(11)1111-1111','(11)91111-1111','11111111111111'),(2,'gagag','a@a.com','(11)1111-1111','(11)91111-1111','11111111111111'),(8,'gagag','admin@mobshare.com','(11)1111-1111','(11)94894-8545','qqqqqqqqqqqqq');
/*!40000 ALTER TABLE `tbl_fale_conosco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_faq`
--

DROP TABLE IF EXISTS `tbl_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da página faq',
  `perguntas` text NOT NULL COMMENT 'pergunta da página faq',
  `respostas` text NOT NULL COMMENT 'resposta da página faq',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_faq`
--

LOCK TABLES `tbl_faq` WRITE;
/*!40000 ALTER TABLE `tbl_faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_folha_pagamento`
--

DROP TABLE IF EXISTS `tbl_folha_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_folha_pagamento` (
  `id_folha_pagamento` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela folha de pagamento',
  `valor_final` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'valor final da folha de pagamento',
  `data_agendamento` date NOT NULL COMMENT 'data de agendamento ',
  `descricao_pagamento` text NOT NULL COMMENT 'descrição do pagamento',
  `cod_pagamento_funcionario` varchar(32) NOT NULL COMMENT 'código do pagamento do funcionário',
  `id_funcionario` int(11) NOT NULL COMMENT 'código da tabela funcionário',
  `id_usuario_desktop` int(11) NOT NULL COMMENT 'código da tabela usuário do desktop',
  PRIMARY KEY (`id_folha_pagamento`,`id_funcionario`),
  KEY `fk_tbl_pagamento_funcionario_tbl_funcionario_idx` (`id_funcionario`),
  KEY `fk_tbl_usuario_desktop_tbl_folha_pagamento_idx` (`id_usuario_desktop`),
  CONSTRAINT `fk_tbl_pagamento_funcionario_tbl_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `tbl_funcionario` (`id_funcionario`),
  CONSTRAINT `fk_tbl_usuario_desktop_tbl_folha_pagamento` FOREIGN KEY (`id_usuario_desktop`) REFERENCES `tbl_usuario_desktop` (`id_usuario_desktop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_folha_pagamento`
--

LOCK TABLES `tbl_folha_pagamento` WRITE;
/*!40000 ALTER TABLE `tbl_folha_pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_folha_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_folha_pagamento_contas_pagar`
--

DROP TABLE IF EXISTS `tbl_folha_pagamento_contas_pagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_folha_pagamento_contas_pagar` (
  `id_pedido_contas_pagar` int(11) NOT NULL AUTO_INCREMENT,
  `id_folha_pagamento` int(11) NOT NULL COMMENT 'código da tabela folha de pagamento',
  `id_conta_pagar` int(11) NOT NULL COMMENT 'código da tabela conta à pagar',
  PRIMARY KEY (`id_pedido_contas_pagar`),
  KEY `fk_tbl_funcionario_idx` (`id_folha_pagamento`),
  KEY `fk_tbl_contas_pagar_tbl_folha_pagamento_contas_pagar_idx` (`id_conta_pagar`),
  CONSTRAINT `fk_tbl_contas_pagar_tbl_folha_pagamento_contas_pagar` FOREIGN KEY (`id_conta_pagar`) REFERENCES `tbl_contas_pagar` (`id_conta_pagar`),
  CONSTRAINT `fk_tbl_folha_pagamento_tbl_folha_pagamento_contas_pagar` FOREIGN KEY (`id_folha_pagamento`) REFERENCES `tbl_folha_pagamento` (`id_folha_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_folha_pagamento_contas_pagar`
--

LOCK TABLES `tbl_folha_pagamento_contas_pagar` WRITE;
/*!40000 ALTER TABLE `tbl_folha_pagamento_contas_pagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_folha_pagamento_contas_pagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_fornecedor`
--

DROP TABLE IF EXISTS `tbl_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_fornecedor` (
  `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela do fornecedor',
  `nome_fornecedor` varchar(100) NOT NULL COMMENT 'nome do fornecedor',
  `cnpj_fornecedor` varchar(20) NOT NULL COMMENT 'cnpj do fornecedor',
  `cod_fornecedor` varchar(32) DEFAULT NULL COMMENT 'código de identificação do fornecedor',
  `razao_social` varchar(100) DEFAULT NULL COMMENT 'razão social do fornecedor',
  PRIMARY KEY (`id_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_fornecedor`
--

LOCK TABLES `tbl_fornecedor` WRITE;
/*!40000 ALTER TABLE `tbl_fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_foto_veiculo`
--

DROP TABLE IF EXISTS `tbl_foto_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_foto_veiculo` (
  `id_foto_veiculo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela foto do veículo',
  `nome_foto` varchar(255) NOT NULL COMMENT 'nome da foto ',
  `id_veiculo` int(11) NOT NULL COMMENT 'código da tabela veículo',
  PRIMARY KEY (`id_foto_veiculo`),
  KEY `fk_tbl_foto_veiculo_tbl_veiculo_idx` (`id_veiculo`),
  CONSTRAINT `fk_tbl_foto_veiculo_tbl_veiculo` FOREIGN KEY (`id_veiculo`) REFERENCES `tbl_veiculo` (`id_veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_foto_veiculo`
--

LOCK TABLES `tbl_foto_veiculo` WRITE;
/*!40000 ALTER TABLE `tbl_foto_veiculo` DISABLE KEYS */;
INSERT INTO `tbl_foto_veiculo` VALUES (1,'1555769689957.jpg',1),(2,'1555769695089.jpg',1),(3,'1555769701029.jpg',1),(4,'5167320905285632_1541683227319.jpg',2),(5,'5167320905285632_1541683231994.jpg',2),(6,'5167320905285632_1541683255232.jpg',2),(7,'6122254203092992_1548158584194.jpg',3),(8,'6122254203092992_1548158595896.jpg',3),(9,'6122254203092992_1548160499989.jpg',3),(10,'6122254203092992_1548158619550.jpg',3),(11,'1555584420266.jpg',4),(12,'1555584380806.jpg',4),(13,'1555584460911.jpg',4),(14,'1550485506367.jpg',5),(15,'1550485514961.jpg',5),(16,'1550485527415.jpg',5),(17,'1556112353575.jpg',6),(18,'1556112424145.jpg',6),(19,'1556112260014.jpg',6),(20,'6536687039545344_1533549331271.jpg',7),(21,'6536687039545344_1533549339235.jpg',7),(22,'1556634069364.jpg',8),(23,'1556634054143.jpg',8),(24,'1553966231647.jpg',9),(25,'1553966241610.jpg',9),(26,'1553966261018.jpg',9);
/*!40000 ALTER TABLE `tbl_foto_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_funcionario`
--

DROP TABLE IF EXISTS `tbl_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_funcionario` (
  `id_funcionario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela de funcionário',
  `nome` varchar(100) NOT NULL COMMENT 'nome do funcionário',
  `cpf` int(11) NOT NULL COMMENT 'cpf do funcionário',
  `cod_funcionario` varchar(32) NOT NULL COMMENT 'código de verificação do funcionário',
  `email` varchar(150) NOT NULL COMMENT 'email do funcionário',
  `demissao` date DEFAULT NULL COMMENT 'data de demissão do funcionário',
  `rg` int(9) DEFAULT NULL COMMENT 'rg do funcionário',
  `dt_nacimento` date DEFAULT NULL COMMENT 'data de nascimento do funcionário',
  `cep` int(8) DEFAULT NULL COMMENT 'cep do endereço do funcionário',
  `uf` varchar(2) DEFAULT NULL COMMENT 'estado do funcionário',
  `cidade` varchar(100) DEFAULT NULL COMMENT 'cidade do funcionário',
  `logradouro` varchar(100) DEFAULT NULL COMMENT 'logradouro do endereço do funcionário',
  `n` varchar(10) DEFAULT NULL,
  `telefone` varchar(12) DEFAULT NULL COMMENT 'telefone do funcionário',
  `admissao` date DEFAULT NULL COMMENT 'data de admissão do funcionário',
  `id_setor` int(11) NOT NULL COMMENT 'código da tabela de setor',
  PRIMARY KEY (`id_funcionario`),
  KEY `fk_tbl_setor_tbl_funcionario_idx` (`id_setor`),
  CONSTRAINT `fk_tbl_setor_tbl_funcionario` FOREIGN KEY (`id_setor`) REFERENCES `tbl_setor` (`id_setor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_funcionario`
--

LOCK TABLES `tbl_funcionario` WRITE;
/*!40000 ALTER TABLE `tbl_funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_home_sessao1`
--

DROP TABLE IF EXISTS `tbl_home_sessao1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_home_sessao1` (
  `id_pagina_home` int(11) NOT NULL AUTO_INCREMENT,
  `texto_banner` text NOT NULL,
  `foto_banner` varchar(255) NOT NULL,
  `status_banner` float NOT NULL,
  `texto2_banner` text NOT NULL,
  PRIMARY KEY (`id_pagina_home`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_home_sessao1`
--

LOCK TABLES `tbl_home_sessao1` WRITE;
/*!40000 ALTER TABLE `tbl_home_sessao1` DISABLE KEYS */;
INSERT INTO `tbl_home_sessao1` VALUES (1,'Ganhar dinheiro compartilhando seu veículo nunca foi tão fácil!','imagem1.jpg',1,'#anuncienamobshare'),(23,'Ganhar dinheiro compartilhando seu veículo nunca foi tão fácil!','imagem1.jpg',0,'#anuncienamobshare'),(24,'Ganhar dinheiro compartilhando seu veículo nunca foi tão fácil!','imagem1.jpg',1,'#anuncienamobshare'),(25,'Ganhar dinheiro compartilhando seu veículo nunca foi tão fácil!','imagem1.jpg',0,'#anuncienamobshare'),(26,'Ganhar dinheiro compartilhando seu veículo nunca foi tão fácil!','imagem1.jpg',1,'#anuncienamobshare');
/*!40000 ALTER TABLE `tbl_home_sessao1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_home_sessao2`
--

DROP TABLE IF EXISTS `tbl_home_sessao2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_home_sessao2` (
  `id_pagina_home2` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_sessao2` varchar(255) NOT NULL,
  `texto_sessao2` text NOT NULL,
  `foto_sessao2` varchar(255) NOT NULL,
  `status_sessao2` float NOT NULL,
  PRIMARY KEY (`id_pagina_home2`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_home_sessao2`
--

LOCK TABLES `tbl_home_sessao2` WRITE;
/*!40000 ALTER TABLE `tbl_home_sessao2` DISABLE KEYS */;
INSERT INTO `tbl_home_sessao2` VALUES (1,'Como funciona?','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.','carr.jpg',1);
/*!40000 ALTER TABLE `tbl_home_sessao2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_home_sessao3`
--

DROP TABLE IF EXISTS `tbl_home_sessao3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_home_sessao3` (
  `id_home_sessao3` int(11) NOT NULL AUTO_INCREMENT,
  `foto1_sessao3` varchar(255) NOT NULL,
  `foto2_sessao3` varchar(255) NOT NULL,
  `foto3_sessao3` varchar(255) NOT NULL,
  `titulo1_sessao3` varchar(255) NOT NULL,
  `titulo2_sessao3` varchar(255) NOT NULL,
  `titulo3_sessao3` varchar(255) NOT NULL,
  `texto1_sessao3` text NOT NULL,
  `texto2_sessao3` text NOT NULL,
  `texto3_sessao3` text NOT NULL,
  `status_sessao3` float NOT NULL,
  `titulo_sessao3` varchar(255) NOT NULL,
  PRIMARY KEY (`id_home_sessao3`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_home_sessao3`
--

LOCK TABLES `tbl_home_sessao3` WRITE;
/*!40000 ALTER TABLE `tbl_home_sessao3` DISABLE KEYS */;
INSERT INTO `tbl_home_sessao3` VALUES (1,'bike.png','moto.png','car.png','Bicicletas','Motos','Carros','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus.',1,'O que pode ser alugador?');
/*!40000 ALTER TABLE `tbl_home_sessao3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_home_sessao4`
--

DROP TABLE IF EXISTS `tbl_home_sessao4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_home_sessao4` (
  `id_home_sessao4` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_sessao4` varchar(45) NOT NULL,
  `foto_sessao4` varchar(255) NOT NULL,
  `texto_sessao4` varchar(45) NOT NULL,
  `status_sessao4` varchar(45) NOT NULL,
  PRIMARY KEY (`id_home_sessao4`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_home_sessao4`
--

LOCK TABLES `tbl_home_sessao4` WRITE;
/*!40000 ALTER TABLE `tbl_home_sessao4` DISABLE KEYS */;
INSERT INTO `tbl_home_sessao4` VALUES (2,'Por que anúnciar seu veículo?','carro_dinheiro.jpg','Lorem ipsum dolor sit amet, consectetur adipi','1');
/*!40000 ALTER TABLE `tbl_home_sessao4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_home_sessao5`
--

DROP TABLE IF EXISTS `tbl_home_sessao5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_home_sessao5` (
  `id_home_sessao5` int(11) NOT NULL AUTO_INCREMENT,
  `status_sessao5` float NOT NULL,
  `titulo_sessao5` varchar(45) NOT NULL,
  `subtitulo1_sessao5` varchar(45) NOT NULL,
  `subtitulo2_sessao5` varchar(45) NOT NULL,
  `subtitulo3_sessao5` varchar(45) NOT NULL,
  `subtitulo4_sessao5` varchar(45) NOT NULL,
  `foto1_sessao5` varchar(255) NOT NULL,
  `foto2_sessao5` varchar(255) NOT NULL,
  `foto3_sessao5` varchar(255) NOT NULL,
  `foto4_sessao5` varchar(255) NOT NULL,
  `texto1_sessao5` text NOT NULL,
  `texto2_sessao5` text NOT NULL,
  `texto3_sessao5` text NOT NULL,
  `texto4_sessao5` text NOT NULL,
  `subtitulo_sessao5` varchar(255) NOT NULL,
  PRIMARY KEY (`id_home_sessao5`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_home_sessao5`
--

LOCK TABLES `tbl_home_sessao5` WRITE;
/*!40000 ALTER TABLE `tbl_home_sessao5` DISABLE KEYS */;
INSERT INTO `tbl_home_sessao5` VALUES (1,1,'Quer anúnciar seu veículo?','Criar uma conta','Cadastre seu veículo','Crie um anúncio','Espere os interessados','user.png','key.png','ad.png','esperar.png','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo','dsadasdasdasdad');
/*!40000 ALTER TABLE `tbl_home_sessao5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_locacao`
--

DROP TABLE IF EXISTS `tbl_locacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_locacao` (
  `id_locacao` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela locação',
  `id_cliente_locador` int(11) NOT NULL COMMENT 'código da tabela cliente locador',
  `id_anuncio` int(11) NOT NULL COMMENT 'código da tabela anúncio',
  `valor_locacao` float NOT NULL COMMENT 'valor da locação',
  `data_hora_final` datetime NOT NULL COMMENT 'data e hora final da locação',
  `id_percentual` int(11) NOT NULL COMMENT 'código da tabela percentual',
  PRIMARY KEY (`id_locacao`),
  KEY `fk_tbl_usuario_tbl_locacao_idx` (`id_cliente_locador`),
  KEY `fk_tbl_anuncio_tbl_locacao_idx` (`id_anuncio`),
  CONSTRAINT `fk_tbl_anuncio_tbl_locacao` FOREIGN KEY (`id_anuncio`) REFERENCES `tbl_anuncio` (`id_anuncio`),
  CONSTRAINT `fk_tbl_usuario_tbl_locacao` FOREIGN KEY (`id_cliente_locador`) REFERENCES `tbl_cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_locacao`
--

LOCK TABLES `tbl_locacao` WRITE;
/*!40000 ALTER TABLE `tbl_locacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_locacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_locacao_conta_pagar`
--

DROP TABLE IF EXISTS `tbl_locacao_conta_pagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_locacao_conta_pagar` (
  `id_locacao_conta_pagar` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela contas à pagar',
  `id_locacao` int(11) NOT NULL COMMENT 'código da tabela locação',
  `id_conta_pagar` int(11) NOT NULL COMMENT 'código da tabela contas à pagar',
  PRIMARY KEY (`id_locacao_conta_pagar`),
  KEY `fk_tbl_pagamento_cliente_tbl_locacao_idx` (`id_locacao`),
  KEY `fk_tbl_contas_pagar_tbl_locacao_conta_pagar_idx` (`id_conta_pagar`),
  CONSTRAINT `fk_tbl_contas_pagar_tbl_locacao_conta_pagar` FOREIGN KEY (`id_conta_pagar`) REFERENCES `tbl_contas_pagar` (`id_conta_pagar`),
  CONSTRAINT `fk_tbl_locacao_tbl_locacao_conta_pagar` FOREIGN KEY (`id_locacao`) REFERENCES `tbl_locacao` (`id_locacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_locacao_conta_pagar`
--

LOCK TABLES `tbl_locacao_conta_pagar` WRITE;
/*!40000 ALTER TABLE `tbl_locacao_conta_pagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_locacao_conta_pagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_locacao_conta_receber`
--

DROP TABLE IF EXISTS `tbl_locacao_conta_receber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_locacao_conta_receber` (
  `id_locacao_conta_receber` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela locação contas à receber',
  `id_locacao` int(11) NOT NULL COMMENT 'código da tabela locação',
  `id_conta_receber` int(11) NOT NULL COMMENT 'código da tabela contas à receber',
  PRIMARY KEY (`id_locacao_conta_receber`),
  KEY `fk_tbl_carteira_tbl_locacao_idx` (`id_locacao`),
  KEY `fk_tbl_contas_receber_tbl_locacao_conta_receber_idx` (`id_conta_receber`),
  CONSTRAINT `fk_tbl_contas_receber_tbl_locacao_conta_receber` FOREIGN KEY (`id_conta_receber`) REFERENCES `tbl_contas_receber` (`id_conta_receber`),
  CONSTRAINT `fk_tbl_locacao_tbl_locacao_contas_receber` FOREIGN KEY (`id_locacao`) REFERENCES `tbl_locacao` (`id_locacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_locacao_conta_receber`
--

LOCK TABLES `tbl_locacao_conta_receber` WRITE;
/*!40000 ALTER TABLE `tbl_locacao_conta_receber` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_locacao_conta_receber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_marca_veiculo`
--

DROP TABLE IF EXISTS `tbl_marca_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_marca_veiculo` (
  `id_marca_veiculo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da marca do veículo',
  `nome_marca` varchar(20) NOT NULL COMMENT 'nome da marca do veículo',
  `cod_fip` varchar(50) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_marca_veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_marca_veiculo`
--

LOCK TABLES `tbl_marca_veiculo` WRITE;
/*!40000 ALTER TABLE `tbl_marca_veiculo` DISABLE KEYS */;
INSERT INTO `tbl_marca_veiculo` VALUES (1,'ryundai',NULL,1),(2,'ryunday',NULL,1),(3,'Galeao4545',NULL,1),(4,'volkswagen',NULL,1),(5,'BMW',NULL,1);
/*!40000 ALTER TABLE `tbl_marca_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_marca_veiculo_tipo_veiculo`
--

DROP TABLE IF EXISTS `tbl_marca_veiculo_tipo_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_marca_veiculo_tipo_veiculo` (
  `id_tipo_marca` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela tipo da marca do veículo',
  `id_tipo_veiculo` int(11) NOT NULL COMMENT 'código da tabela tipo do veículo',
  `id_marca_veiculo` int(11) NOT NULL COMMENT 'código da tabelma marca do veículo',
  `excluido` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_tipo_marca`),
  KEY `fk_tbl_marca_veiculo_tipo_veiculo_tbl_marca_veiculo_idx` (`id_marca_veiculo`),
  KEY `fk_tbl_marca_veiculo_tipo_veiculo_tbl_tipo_veiculo_idx` (`id_tipo_veiculo`),
  CONSTRAINT `fk_tbl_marca_veiculo_tipo_veiculo_tbl_marca_veiculo` FOREIGN KEY (`id_marca_veiculo`) REFERENCES `tbl_marca_veiculo` (`id_marca_veiculo`),
  CONSTRAINT `fk_tbl_marca_veiculo_tipo_veiculo_tbl_tipo_veiculo` FOREIGN KEY (`id_tipo_veiculo`) REFERENCES `tbl_tipo_veiculo` (`id_tipo_veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_marca_veiculo_tipo_veiculo`
--

LOCK TABLES `tbl_marca_veiculo_tipo_veiculo` WRITE;
/*!40000 ALTER TABLE `tbl_marca_veiculo_tipo_veiculo` DISABLE KEYS */;
INSERT INTO `tbl_marca_veiculo_tipo_veiculo` VALUES (1,10,1,1),(2,10,2,1),(3,10,3,1),(4,10,4,0),(5,10,5,0);
/*!40000 ALTER TABLE `tbl_marca_veiculo_tipo_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_melhores_avaliacoes`
--

DROP TABLE IF EXISTS `tbl_melhores_avaliacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_melhores_avaliacoes` (
  `id_melhores_avaliacoes` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da página melhores avaliações',
  `titulo_melhores_avaliacoes` text NOT NULL COMMENT 'título da página melhores avaliações',
  `texto_melhores_avaliacoes` text NOT NULL COMMENT 'texto da página melhores avaliações',
  PRIMARY KEY (`id_melhores_avaliacoes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_melhores_avaliacoes`
--

LOCK TABLES `tbl_melhores_avaliacoes` WRITE;
/*!40000 ALTER TABLE `tbl_melhores_avaliacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_melhores_avaliacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_menu`
--

DROP TABLE IF EXISTS `tbl_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela menu',
  `nome_menu` varchar(25) NOT NULL COMMENT 'nome do menu',
  `href` varchar(150) NOT NULL COMMENT 'url/ link do menu',
  `icone` varchar(255) NOT NULL COMMENT 'ícone do menu',
  `onclick` varchar(255) NOT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_menu`
--

LOCK TABLES `tbl_menu` WRITE;
/*!40000 ALTER TABLE `tbl_menu` DISABLE KEYS */;
INSERT INTO `tbl_menu` VALUES (1,'Gerenciar Paginas','#','paginas.png','abrir_menu(\'120px\', \'#gerenciar_paginas\')'),(2,'Gerenciar Veículos','#','veiculo.png','abrir_menu(\'120px\', \'#gerenciar_veiculos\')'),(3,'Anúncios','#','anuncio.png','abrir_menu(\'120px\',\'#gerenciar_anuncios\')'),(4,'Clientes','#','cliente.png','conteudo_subMenu(\'clientes/clientes\',true)'),(5,'Usuários','#','funcionario.png','abrir_menu(\'140px\', \'#usuarios\', \'#usuario_atv\')'),(6,'Fale conosco','#','fale_conosco.png','conteudo_subMenu(\'fale_conosco/fale_conosco\',true)'),(7,'Email marketing','#','email.png','conteudo_subMenu(\'email_marketing/email_marketing\',true)');
/*!40000 ALTER TABLE `tbl_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_modelo_veiculo`
--

DROP TABLE IF EXISTS `tbl_modelo_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_modelo_veiculo` (
  `id_modelo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela do modelo do veículo',
  `nome_modelo` varchar(50) NOT NULL COMMENT 'nome do modelo',
  `id_marca_tipo` int(11) NOT NULL COMMENT 'código da tabela marca tipo do veículo',
  `cod_fip` varchar(50) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `excluido` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_modelo`),
  KEY `fk_tbl_modelo_veiculo_tbl_marca_veiculo_tipo_veiculo_idx` (`id_marca_tipo`),
  CONSTRAINT `fk_tbl_modelo_veiculo_tbl_marca_veiculo_tipo_veiculo` FOREIGN KEY (`id_marca_tipo`) REFERENCES `tbl_marca_veiculo_tipo_veiculo` (`id_tipo_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_modelo_veiculo`
--

LOCK TABLES `tbl_modelo_veiculo` WRITE;
/*!40000 ALTER TABLE `tbl_modelo_veiculo` DISABLE KEYS */;
INSERT INTO `tbl_modelo_veiculo` VALUES (3,'Galeao',1,NULL,1,1),(4,'civiqui',1,NULL,1,1),(5,'Galeao',2,NULL,1,1),(6,'MOVE UP FLEX',4,NULL,1,0),(7,'NEW BEETLE',4,NULL,1,0),(8,'SPACEFOX',4,NULL,1,0),(9,'BMW X1',5,NULL,1,0),(10,'BMW 320I',5,NULL,1,0),(11,'BMW X6',5,NULL,1,0),(12,' GOLF',4,NULL,1,0);
/*!40000 ALTER TABLE `tbl_modelo_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_niveis`
--

DROP TABLE IF EXISTS `tbl_niveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_niveis` (
  `id_niveis` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela níveis',
  `nome_nivel` varchar(25) NOT NULL COMMENT 'nome do nível',
  `descricao` varchar(50) NOT NULL COMMENT 'descrição do nível',
  `excluido` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_niveis`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_niveis`
--

LOCK TABLES `tbl_niveis` WRITE;
/*!40000 ALTER TABLE `tbl_niveis` DISABLE KEYS */;
INSERT INTO `tbl_niveis` VALUES (4,'admin','Administra todas as operações do sistema',1),(5,'admin','administrador',0);
/*!40000 ALTER TABLE `tbl_niveis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_niveis_menu`
--

DROP TABLE IF EXISTS `tbl_niveis_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_niveis_menu` (
  `id_niveis_menu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela níveis do menu',
  `id_menu` int(11) NOT NULL COMMENT 'código da tabela menu',
  `id_niveis` int(11) NOT NULL COMMENT 'código da tabela níveis',
  PRIMARY KEY (`id_niveis_menu`),
  KEY `fk_tbl_niveis_menu_tbl_niveis_idx` (`id_niveis`),
  KEY `fk_tbl_niveis_menu_tbl_menu_idx` (`id_menu`),
  CONSTRAINT `fk_tbl_niveis_menu_tbl_menu` FOREIGN KEY (`id_menu`) REFERENCES `tbl_menu` (`id_menu`),
  CONSTRAINT `fk_tbl_niveis_menu_tbl_niveis` FOREIGN KEY (`id_niveis`) REFERENCES `tbl_niveis` (`id_niveis`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_niveis_menu`
--

LOCK TABLES `tbl_niveis_menu` WRITE;
/*!40000 ALTER TABLE `tbl_niveis_menu` DISABLE KEYS */;
INSERT INTO `tbl_niveis_menu` VALUES (1,1,5),(2,2,5),(3,3,5),(4,4,5),(5,5,5),(6,6,5),(7,7,5);
/*!40000 ALTER TABLE `tbl_niveis_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_operacoes`
--

DROP TABLE IF EXISTS `tbl_operacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_operacoes` (
  `id_operacoes` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela operações',
  `id_conta` int(11) NOT NULL COMMENT 'código da tabela conta',
  `data_entrada` date NOT NULL COMMENT 'data da entrada da operação',
  `id_usuario_desktop` int(11) NOT NULL COMMENT 'código do usuário do desktop',
  PRIMARY KEY (`id_operacoes`),
  KEY `fk_tbl_conta_tbl_operacoes_idx` (`id_conta`),
  KEY `fk_tbl_usuario_desktop_tbl_operacoes_idx` (`id_usuario_desktop`),
  CONSTRAINT `fk_tbl_conta_tbl_operacoes` FOREIGN KEY (`id_conta`) REFERENCES `tbl_conta` (`id_conta`),
  CONSTRAINT `fk_tbl_usuario_desktop_tbl_operacoes` FOREIGN KEY (`id_usuario_desktop`) REFERENCES `tbl_usuario_desktop` (`id_usuario_desktop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_operacoes`
--

LOCK TABLES `tbl_operacoes` WRITE;
/*!40000 ALTER TABLE `tbl_operacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_operacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_operacoes_contas_pagar`
--

DROP TABLE IF EXISTS `tbl_operacoes_contas_pagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_operacoes_contas_pagar` (
  `id_operacoes_contas_pagar` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela operações contas à receber',
  `id_contas_pagar` int(11) NOT NULL COMMENT 'código da tabela contas à pagar',
  `id_operacoes` int(11) NOT NULL COMMENT 'código da tabela operações',
  PRIMARY KEY (`id_operacoes_contas_pagar`),
  KEY `fk_tbl_contas_pagar_tbl_operacoes_contas_pagar_idx` (`id_contas_pagar`),
  KEY `fk_tbl_operacoes_tbl_operacoes_contas_pagar_idx` (`id_operacoes`),
  CONSTRAINT `fk_tbl_contas_pagar_tbl_operacoes_contas_pagar` FOREIGN KEY (`id_contas_pagar`) REFERENCES `tbl_contas_pagar` (`id_conta_pagar`),
  CONSTRAINT `fk_tbl_operacoes_tbl_operacoes_contas_pagar` FOREIGN KEY (`id_operacoes`) REFERENCES `tbl_operacoes` (`id_operacoes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_operacoes_contas_pagar`
--

LOCK TABLES `tbl_operacoes_contas_pagar` WRITE;
/*!40000 ALTER TABLE `tbl_operacoes_contas_pagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_operacoes_contas_pagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_operacoes_contas_receber`
--

DROP TABLE IF EXISTS `tbl_operacoes_contas_receber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_operacoes_contas_receber` (
  `id_operacoes_contas_receber` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela operações contas à receber',
  `id_contas_receber` int(11) NOT NULL COMMENT 'código da tabela contas à receber',
  `id_operacoes` int(11) NOT NULL COMMENT 'código da tabela operações',
  PRIMARY KEY (`id_operacoes_contas_receber`),
  KEY `fk_tbl__contas_receber_tbl_operacoes_contas_receber_idx` (`id_contas_receber`),
  KEY `fk_tbl_operacoes_tbl_operacoes_contas_receber_idx` (`id_operacoes`),
  CONSTRAINT `fk_tbl__contas_receber_tbl_operacoes_contas_receber` FOREIGN KEY (`id_contas_receber`) REFERENCES `tbl_contas_receber` (`id_conta_receber`),
  CONSTRAINT `fk_tbl_operacoes_tbl_operacoes_contas_receber` FOREIGN KEY (`id_operacoes`) REFERENCES `tbl_operacoes` (`id_operacoes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_operacoes_contas_receber`
--

LOCK TABLES `tbl_operacoes_contas_receber` WRITE;
/*!40000 ALTER TABLE `tbl_operacoes_contas_receber` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_operacoes_contas_receber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pagina_sobre`
--

DROP TABLE IF EXISTS `tbl_pagina_sobre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_pagina_sobre` (
  `id_sobre` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da página sobre',
  `titulo_sobre` varchar(45) NOT NULL COMMENT 'título da página sobre',
  `texto_sobre` varchar(45) NOT NULL COMMENT 'texto da página sobre',
  `foto_sobre` varchar(200) NOT NULL COMMENT 'foto da página sobre',
  `titulo_missao_sobre` text NOT NULL,
  `foto_missao_sobre` text NOT NULL COMMENT 'missão página sobre',
  `texto_missao_sobre` text NOT NULL,
  `titulo_visao_sobre` text NOT NULL,
  `texto_visao_sobre` text NOT NULL,
  `foto_visao_sobre` text NOT NULL COMMENT 'visão página sobre',
  `titulo_valores_sobre` text NOT NULL COMMENT 'valores da página sobre',
  `texto_valores_sobre` text NOT NULL,
  `foto_valores_sobre` text NOT NULL,
  PRIMARY KEY (`id_sobre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pagina_sobre`
--

LOCK TABLES `tbl_pagina_sobre` WRITE;
/*!40000 ALTER TABLE `tbl_pagina_sobre` DISABLE KEYS */;
INSERT INTO `tbl_pagina_sobre` VALUES (1,'aaaaaaaa','aaaaaaaaaaaa','d8f20595d652e6eb13c267ada2ce35a0.png','aaaaaaaaaaa','e85bac6eff82f03e55700514db1ff178.jpg','aaaaaaaaaaaa','aaaaaaaaaa','aaaaaaaaaaa','155ce7820fff0f046b3f498ffe549297.png','aaaaaaaaaa','aaaaaaaaaaa','e85bac6eff82f03e55700514db1ff178.jpg');
/*!40000 ALTER TABLE `tbl_pagina_sobre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pedido`
--

DROP TABLE IF EXISTS `tbl_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela pedido',
  `valor_total` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'valor total do pedido',
  `forma_pagamento` varchar(45) NOT NULL COMMENT 'forma de pagamento do pedido',
  `previsao_entrega` date NOT NULL COMMENT 'previsão de entrega do pedido',
  `cod_pedido` varchar(32) NOT NULL COMMENT 'código de barras do pedido',
  `natureza_da_compra` varchar(100) NOT NULL COMMENT 'origem da compra',
  `desconto` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'desconto na compra',
  `data_compra` date NOT NULL COMMENT 'data da compra',
  `frete` decimal(10,2) NOT NULL COMMENT 'frete do pedido',
  `id_fornecedor` int(11) NOT NULL COMMENT 'código da tabela fornecedor',
  `id_usuario_desktop` int(11) NOT NULL COMMENT 'código da tabela usuário desktop',
  PRIMARY KEY (`id_pedido`),
  KEY `fk_tbl_pedidos_tbl_fornecedor_idx` (`id_fornecedor`),
  KEY `fk_tbl_usuario_desktop_tbl_pedido_idx` (`id_usuario_desktop`),
  CONSTRAINT `fk_tbl_fornecedor_tbl_pedidos` FOREIGN KEY (`id_fornecedor`) REFERENCES `tbl_fornecedor` (`id_fornecedor`),
  CONSTRAINT `fk_tbl_usuario_desktop_tbl_pedido` FOREIGN KEY (`id_usuario_desktop`) REFERENCES `tbl_usuario_desktop` (`id_usuario_desktop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pedido`
--

LOCK TABLES `tbl_pedido` WRITE;
/*!40000 ALTER TABLE `tbl_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pedido_contas_pagar`
--

DROP TABLE IF EXISTS `tbl_pedido_contas_pagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_pedido_contas_pagar` (
  `id_pedido_contas_pagar` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela pedidos de conta à pagar',
  `id_pedido` int(11) NOT NULL COMMENT 'código da tabela pedidos',
  `id_conta_pagar` int(11) NOT NULL COMMENT 'código da tabela contas à pagar',
  PRIMARY KEY (`id_pedido_contas_pagar`),
  KEY `fk_tbl_pedido_tbl_pedido_contas_pagar_idx` (`id_pedido`),
  KEY `fk_tbl_contas_pagar_tbl_pedido_contas_pagar_idx` (`id_conta_pagar`),
  CONSTRAINT `fk_tbl_contas_pagar_tbl_pedido_contas_pagar` FOREIGN KEY (`id_conta_pagar`) REFERENCES `tbl_contas_pagar` (`id_conta_pagar`),
  CONSTRAINT `fk_tbl_pedido_tbl_pedido_contas_pagar` FOREIGN KEY (`id_pedido`) REFERENCES `tbl_pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pedido_contas_pagar`
--

LOCK TABLES `tbl_pedido_contas_pagar` WRITE;
/*!40000 ALTER TABLE `tbl_pedido_contas_pagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pedido_contas_pagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pedido_produto`
--

DROP TABLE IF EXISTS `tbl_pedido_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_pedido_produto` (
  `id_pedido_produto` int(11) NOT NULL COMMENT 'código da tabela produto do pedido',
  `quantidade` int(11) NOT NULL COMMENT 'quantidade de produtos',
  `valor` decimal(10,2) NOT NULL COMMENT 'valor unitário',
  `id_produto` int(11) NOT NULL COMMENT 'código da tabela do produto',
  `id_pedido` int(11) NOT NULL COMMENT 'código da tabela do pedido',
  PRIMARY KEY (`id_pedido_produto`),
  KEY `fk_produto_pedido_idx` (`id_pedido`),
  KEY `fk_tbl_produto_tbl_pedido_produto_idx` (`id_produto`),
  CONSTRAINT `fk_tbl_pedido_tbl_pedido_produto` FOREIGN KEY (`id_pedido`) REFERENCES `tbl_pedido` (`id_pedido`),
  CONSTRAINT `fk_tbl_produto_tbl_pedido_produto` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pedido_produto`
--

LOCK TABLES `tbl_pedido_produto` WRITE;
/*!40000 ALTER TABLE `tbl_pedido_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pedido_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_percentual`
--

DROP TABLE IF EXISTS `tbl_percentual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_percentual` (
  `id_percentual` int(11) NOT NULL AUTO_INCREMENT,
  `percentual` float NOT NULL,
  `id_tipo_veiculo` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  PRIMARY KEY (`id_percentual`),
  KEY `id_tipo_veiculo` (`id_tipo_veiculo`),
  CONSTRAINT `tbl_percentual_ibfk_1` FOREIGN KEY (`id_tipo_veiculo`) REFERENCES `tbl_tipo_veiculo` (`id_tipo_veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_percentual`
--

LOCK TABLES `tbl_percentual` WRITE;
/*!40000 ALTER TABLE `tbl_percentual` DISABLE KEYS */;
INSERT INTO `tbl_percentual` VALUES (13,12,10,'2019-04-25'),(14,10,11,'2019-04-25'),(15,34,12,'2019-04-25');
/*!40000 ALTER TABLE `tbl_percentual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_percentual_desconto`
--

DROP TABLE IF EXISTS `tbl_percentual_desconto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_percentual_desconto` (
  `id_percentual_desconto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código do percentual de desconto',
  `percentual` float NOT NULL COMMENT 'porcentagem do percentual de desconto',
  `id_cliente` int(11) NOT NULL COMMENT 'código do cliente',
  `data_inicio` datetime NOT NULL COMMENT 'data de início do percentual de desconto',
  `data_final` datetime NOT NULL COMMENT 'data final do desconto',
  `codigo` varchar(15) NOT NULL COMMENT 'numeração do código de percentual de desconto',
  PRIMARY KEY (`id_percentual_desconto`),
  KEY `fk_tbl_percentual_desconto_tbl_cliente_idx` (`id_cliente`),
  CONSTRAINT `fk_tbl_percentual_desconto_tbl_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_percentual_desconto`
--

LOCK TABLES `tbl_percentual_desconto` WRITE;
/*!40000 ALTER TABLE `tbl_percentual_desconto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_percentual_desconto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_permissoes`
--

DROP TABLE IF EXISTS `tbl_permissoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_permissoes` (
  `id_permissoes` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela de permissoes',
  `nome` varchar(45) NOT NULL COMMENT 'nome das permissoes',
  `titulo` varchar(45) NOT NULL COMMENT 'título das permissoes',
  `descricao` text COMMENT 'descrição das permissoes',
  `icone` varchar(100) NOT NULL COMMENT 'ícone das permissoes',
  `href` varchar(100) NOT NULL COMMENT 'link das permissoes',
  PRIMARY KEY (`id_permissoes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_permissoes`
--

LOCK TABLES `tbl_permissoes` WRITE;
/*!40000 ALTER TABLE `tbl_permissoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_permissoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_principais_anuncios`
--

DROP TABLE IF EXISTS `tbl_principais_anuncios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_principais_anuncios` (
  `id_principais_anuncios` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código principais anúncios',
  `id_anuncios_venda` int(11) NOT NULL COMMENT 'código da tabela anúncios a venda',
  `status` tinyint(4) NOT NULL COMMENT 'status dos principais anúncios',
  PRIMARY KEY (`id_principais_anuncios`),
  KEY `fk_tbl_principais_anuncios_tbl_anuncios_venda_idx` (`id_anuncios_venda`),
  CONSTRAINT `fk_tbl_principais_anuncios_tbl_anuncios_venda` FOREIGN KEY (`id_anuncios_venda`) REFERENCES `tbl_anuncio_venda` (`id_anuncio_venda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_principais_anuncios`
--

LOCK TABLES `tbl_principais_anuncios` WRITE;
/*!40000 ALTER TABLE `tbl_principais_anuncios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_principais_anuncios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_produto`
--

DROP TABLE IF EXISTS `tbl_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_produto` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela prodto',
  `descricao` text COMMENT 'descrição do produto',
  `valor_unitario` decimal(10,2) NOT NULL COMMENT 'valor unitário do produto',
  `cod_produto` varchar(100) NOT NULL COMMENT 'código do produto',
  `nome` varchar(100) NOT NULL COMMENT 'nome do produto',
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_produto`
--

LOCK TABLES `tbl_produto` WRITE;
/*!40000 ALTER TABLE `tbl_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_salario`
--

DROP TABLE IF EXISTS `tbl_salario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_salario` (
  `id_salario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela de salário',
  `salario` decimal(10,2) NOT NULL COMMENT 'salário do funcionário',
  `data_cadastro` datetime NOT NULL COMMENT 'data de cadastro do funcionário',
  `id_funcionario` int(11) NOT NULL COMMENT 'código da tabela de fucionário ',
  PRIMARY KEY (`id_salario`),
  KEY `fk_tbl_funcionario_tbl_salario_idx` (`id_funcionario`),
  CONSTRAINT `fk_tbl_funcionario_tbl_salario` FOREIGN KEY (`id_funcionario`) REFERENCES `tbl_funcionario` (`id_funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_salario`
--

LOCK TABLES `tbl_salario` WRITE;
/*!40000 ALTER TABLE `tbl_salario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_salario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seja_parceiro`
--

DROP TABLE IF EXISTS `tbl_seja_parceiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seja_parceiro` (
  `id_seja_parceiro` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da página seja parceiro',
  `titulo_seja_parceiro` varchar(45) NOT NULL COMMENT 'título da página seja parceiro',
  `texto_seja_parceiro` text NOT NULL COMMENT 'texto da página seja parceiro',
  `foto_seja_parceiro` varchar(100) NOT NULL COMMENT 'foto da página seja parceiro',
  PRIMARY KEY (`id_seja_parceiro`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seja_parceiro`
--

LOCK TABLES `tbl_seja_parceiro` WRITE;
/*!40000 ALTER TABLE `tbl_seja_parceiro` DISABLE KEYS */;
INSERT INTO `tbl_seja_parceiro` VALUES (1,'asdasd','gdfgdgdfg','dc65a38fb992a06b5385c988978b0505.png'),(2,'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA','gas','b83b371182421844a51fe8a9f99b2478.png');
/*!40000 ALTER TABLE `tbl_seja_parceiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seja_parceiro_banner`
--

DROP TABLE IF EXISTS `tbl_seja_parceiro_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seja_parceiro_banner` (
  `id_seja_parceiro_banner` int(11) NOT NULL AUTO_INCREMENT,
  `texto1_seja_parceiro_banner` varchar(255) NOT NULL,
  `texto2_seja_parceiro_banner` varchar(255) NOT NULL,
  `texto3_seja_parceiro_banner` varchar(255) NOT NULL,
  `foto1_seja_parceiro_banner` varchar(255) NOT NULL,
  `foto2_seja_parceiro_banner` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_seja_parceiro_banner`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seja_parceiro_banner`
--

LOCK TABLES `tbl_seja_parceiro_banner` WRITE;
/*!40000 ALTER TABLE `tbl_seja_parceiro_banner` DISABLE KEYS */;
INSERT INTO `tbl_seja_parceiro_banner` VALUES (1,'Lorem ipsum dolor sit amet, consectetur adi,suada nibh. Quisque placerat faucibus erat a sodales. Suspendisse condimentum vehicula dolor eu dapibus','Quero ser um Parceiro','Lorem ipsum dolor sit amet, consectetur adi,suada nibh. Quisque placerat faucibus erat a sodales. Suspendisse condimentum vehicula dolor eu dapibus','bg-parceiros.jpg','bg-usuario.jpg',1),(29,'Lorem ipsum dolor sit amet, consectetur adi,suada nibh. Quisque placerat faucibus erat a sodales. Suspendisse condimentum vehicula dolor eu dapibus','Quero ser um Parceiro','Lorem ipsum dolor sit amet, consectetur adi,suada nibh. Quisque placerat faucibus erat a sodales. Suspendisse condimentum vehicula dolor eu dapibus','bg-parceiros.jpg','bg-usuario.jpg',0),(30,'Lorem ipsum dolor sit amet, consectetur adi,suada nibh. Quisque placerat faucibus erat a sodales. Suspendisse condimentum vehicula dolor eu dapibus','Quero ser um Parceiro','Lorem ipsum dolor sit amet, consectetur adi,suada nibh. Quisque placerat faucibus erat a sodales. Suspendisse condimentum vehicula dolor eu dapibus','bg-parceiros.jpg','bg-usuario.jpg',1);
/*!40000 ALTER TABLE `tbl_seja_parceiro_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_setor`
--

DROP TABLE IF EXISTS `tbl_setor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_setor` (
  `id_setor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela de setor',
  `nome` varchar(100) NOT NULL COMMENT 'nome do setor',
  PRIMARY KEY (`id_setor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_setor`
--

LOCK TABLES `tbl_setor` WRITE;
/*!40000 ALTER TABLE `tbl_setor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_setor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tabela_precos`
--

DROP TABLE IF EXISTS `tbl_tabela_precos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_tabela_precos` (
  `id_tabela_precos` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela de preços',
  `titulo_tabela_precos` varchar(45) NOT NULL COMMENT 'título da tabela de preços',
  `texto_tabela_precos` varchar(45) NOT NULL COMMENT 'texto da tabela de preços',
  `descricao_tabela_precos` varchar(45) DEFAULT NULL COMMENT 'descrição da tabela de preços',
  `foto_tabela_precos` varchar(45) DEFAULT NULL COMMENT 'foto da tabela de preços',
  PRIMARY KEY (`id_tabela_precos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tabela_precos`
--

LOCK TABLES `tbl_tabela_precos` WRITE;
/*!40000 ALTER TABLE `tbl_tabela_precos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_tabela_precos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_termos_uso`
--

DROP TABLE IF EXISTS `tbl_termos_uso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_termos_uso` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da página termos de uso',
  `texto` text NOT NULL COMMENT 'pdf da página termos de uso',
  `titulo` text NOT NULL COMMENT 'título da página termos de uso',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_termos_uso`
--

LOCK TABLES `tbl_termos_uso` WRITE;
/*!40000 ALTER TABLE `tbl_termos_uso` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_termos_uso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_veiculo`
--

DROP TABLE IF EXISTS `tbl_tipo_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_tipo_veiculo` (
  `id_tipo_veiculo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela tipo de veículo',
  `nome_tipo_veiculo` varchar(20) NOT NULL COMMENT 'nome do tipo de veículo',
  `excluido` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_tipo_veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_veiculo`
--

LOCK TABLES `tbl_tipo_veiculo` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_veiculo` DISABLE KEYS */;
INSERT INTO `tbl_tipo_veiculo` VALUES (10,'carro',0),(11,'Livro',1),(12,'Livro',1);
/*!40000 ALTER TABLE `tbl_tipo_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario_cms`
--

DROP TABLE IF EXISTS `tbl_usuario_cms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_usuario_cms` (
  `id_usuario_cms` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela usuário do  cms',
  `nome_usuario_cms` varchar(20) NOT NULL COMMENT 'nome de usuário do cms',
  `email_usuario_cms` varchar(150) NOT NULL COMMENT 'email do usuário do cms',
  `senha` varchar(255) NOT NULL COMMENT 'senha do usuário do cms',
  `id_niveis` int(11) NOT NULL COMMENT 'código da tabela nível',
  `excluido` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_usuario_cms`),
  KEY `fk_tbl_usuario_cms_tbl_niveis_idx` (`id_niveis`),
  CONSTRAINT `fk_tbl_usuario_cms_tbl_niveis` FOREIGN KEY (`id_niveis`) REFERENCES `tbl_niveis` (`id_niveis`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario_cms`
--

LOCK TABLES `tbl_usuario_cms` WRITE;
/*!40000 ALTER TABLE `tbl_usuario_cms` DISABLE KEYS */;
INSERT INTO `tbl_usuario_cms` VALUES (8,'admin','admin@mobshare.com','$2y$12$Q4jnH9kg.BRdM6fatTCCAOH5DK7Bhe8FwkEHVfGuCseCvPbD0ie7e',5,0);
/*!40000 ALTER TABLE `tbl_usuario_cms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario_desktop`
--

DROP TABLE IF EXISTS `tbl_usuario_desktop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_usuario_desktop` (
  `id_usuario_desktop` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela usuário desktop',
  `nome` varchar(100) NOT NULL COMMENT 'nome do usuário do desktop',
  `email` varchar(128) NOT NULL COMMENT 'email do usuário do desktop',
  `senha` varchar(128) DEFAULT NULL COMMENT 'senha do usuário do desktop',
  `telefone` varchar(12) DEFAULT NULL COMMENT 'telefone do usuário',
  `cpf` int(11) DEFAULT '0' COMMENT 'cpf do usuário',
  `logado` datetime DEFAULT NULL COMMENT 'data quando usuário logou',
  `foto` varchar(100) DEFAULT NULL COMMENT 'foto do usuário',
  `excluido` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'dado se o usuário foi excluído ou não',
  PRIMARY KEY (`id_usuario_desktop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario_desktop`
--

LOCK TABLES `tbl_usuario_desktop` WRITE;
/*!40000 ALTER TABLE `tbl_usuario_desktop` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_usuario_desktop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario_desktop_permissoes`
--

DROP TABLE IF EXISTS `tbl_usuario_desktop_permissoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_usuario_desktop_permissoes` (
  `id_usuario_desktop_permicoes` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela de permições do usuário  do desktop',
  `id_usuario_desktop` int(11) NOT NULL COMMENT 'código da tabela do usuário  do desktop',
  `id_permicoes` int(11) NOT NULL COMMENT 'código da tabela de permições',
  PRIMARY KEY (`id_usuario_desktop_permicoes`,`id_permicoes`),
  KEY `fk_tbl_permicoes_idx` (`id_permicoes`),
  KEY `fk_tbl_usuario_desktop_tbl_usuario_desktop_permicoes_idx` (`id_usuario_desktop`),
  CONSTRAINT `fk_tbl_permicoes_tbl_usuario_desktop_permicoes` FOREIGN KEY (`id_permicoes`) REFERENCES `tbl_permissoes` (`id_permissoes`),
  CONSTRAINT `fk_tbl_usuario_desktop_tbl_usuario_desktop_permicoes` FOREIGN KEY (`id_usuario_desktop`) REFERENCES `tbl_usuario_desktop` (`id_usuario_desktop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario_desktop_permissoes`
--

LOCK TABLES `tbl_usuario_desktop_permissoes` WRITE;
/*!40000 ALTER TABLE `tbl_usuario_desktop_permissoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_usuario_desktop_permissoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_veiculo`
--

DROP TABLE IF EXISTS `tbl_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_veiculo` (
  `id_veiculo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela de veículo',
  `ano` varchar(45) NOT NULL,
  `placa` varchar(45) NOT NULL,
  `quilometragem` varchar(45) NOT NULL,
  `renavam` varchar(45) NOT NULL COMMENT 'renavam do veículo',
  `id_tipo_veiculo` int(11) NOT NULL COMMENT 'código da tabela tipo de veículo',
  `id_marca_veiculo` int(11) NOT NULL COMMENT 'código da tabela marca do veículo',
  `id_modelo_veiculo` int(11) NOT NULL COMMENT 'código da tabela modelo do veículo',
  `id_cliente` int(11) NOT NULL COMMENT 'código da tabela cliente',
  PRIMARY KEY (`id_veiculo`),
  KEY `fk_tbl_veiculo_tbl_tipo_veiculo_idx` (`id_tipo_veiculo`),
  KEY `fk_tbl_tbl_veiculo_tbl_marca_veiculo_idx` (`id_marca_veiculo`),
  KEY `fk_tbl_veiculo_tbl_modelo_veiculo_idx` (`id_modelo_veiculo`),
  KEY `fk_tbl_veiculo_tbl_cliente_idx` (`id_cliente`),
  CONSTRAINT `fk_tbl_tbl_veiculo_tbl_marca_veiculo` FOREIGN KEY (`id_marca_veiculo`) REFERENCES `tbl_marca_veiculo` (`id_marca_veiculo`),
  CONSTRAINT `fk_tbl_veiculo_tbl_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`),
  CONSTRAINT `fk_tbl_veiculo_tbl_modelo_veiculo` FOREIGN KEY (`id_modelo_veiculo`) REFERENCES `tbl_modelo_veiculo` (`id_modelo`),
  CONSTRAINT `fk_tbl_veiculo_tbl_tipo_veiculo` FOREIGN KEY (`id_tipo_veiculo`) REFERENCES `tbl_tipo_veiculo` (`id_tipo_veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_veiculo`
--

LOCK TABLES `tbl_veiculo` WRITE;
/*!40000 ALTER TABLE `tbl_veiculo` DISABLE KEYS */;
INSERT INTO `tbl_veiculo` VALUES (1,'2014','HJTY','88026','50766292645',10,4,6,1),(2,'2008','PIC45','65195','50582893948',10,4,7,1),(3,'2015','CN-346','50748','80562129195',10,4,8,1),(4,'2016','IUT-6GT','57589','10486980259',10,5,9,2),(5,'2013','OIP-756J','77000','39072700160',10,5,10,2),(6,'2014','GHY-6H5','53803','12036664000',10,5,10,2),(7,'2012','YUE-5DF','45897','53217774157',10,5,11,3),(8,'2017','ACD-6U4','56897','59817709762',10,4,8,3),(9,'2015','KJH-R456','45687','30245746848',10,4,12,3);
/*!40000 ALTER TABLE `tbl_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_anuncios`
--

DROP TABLE IF EXISTS `view_anuncios`;
/*!50001 DROP VIEW IF EXISTS `view_anuncios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_anuncios` AS SELECT 
 1 AS `locador`,
 1 AS `celular`,
 1 AS `telefone`,
 1 AS `rua`,
 1 AS `bairro`,
 1 AS `cep`,
 1 AS `complemento`,
 1 AS `uf`,
 1 AS `cidade`,
 1 AS `id_cliente`,
 1 AS `id_anuncio`,
 1 AS `data_inicial`,
 1 AS `data_final`,
 1 AS `descricao`,
 1 AS `horario_inicio`,
 1 AS `horario_termino`,
 1 AS `valor_hora`,
 1 AS `ano`,
 1 AS `placa`,
 1 AS `quilometragem`,
 1 AS `renavam`,
 1 AS `nome_tipo_veiculo`,
 1 AS `nome_marca`,
 1 AS `nome_modelo`,
 1 AS `id_tipo_veiculo`,
 1 AS `id_tipo_marca`,
 1 AS `id_modelo`,
 1 AS `nome_foto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_tipo_marca`
--

DROP TABLE IF EXISTS `view_tipo_marca`;
/*!50001 DROP VIEW IF EXISTS `view_tipo_marca`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_tipo_marca` AS SELECT 
 1 AS `id_tipo_veiculo`,
 1 AS `id_marca_veiculo`,
 1 AS `id_tipo_marca`,
 1 AS `nome_marca`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_anuncios`
--

/*!50001 DROP VIEW IF EXISTS `view_anuncios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_anuncios` AS select `cliente`.`nome_cliente` AS `locador`,`cliente`.`celular` AS `celular`,`cliente`.`telefone` AS `telefone`,`cliente`.`rua` AS `rua`,`cliente`.`bairro` AS `bairro`,`cliente`.`cep` AS `cep`,`cliente`.`complemento` AS `complemento`,`cliente`.`uf` AS `uf`,`cliente`.`cidade` AS `cidade`,`cliente`.`id_cliente` AS `id_cliente`,`anuncios`.`id_anuncio` AS `id_anuncio`,`anuncios`.`data_inicial` AS `data_inicial`,`anuncios`.`data_final` AS `data_final`,`anuncios`.`descricao` AS `descricao`,`anuncios`.`horario_inicio` AS `horario_inicio`,`anuncios`.`horario_termino` AS `horario_termino`,`anuncios`.`valor_hora` AS `valor_hora`,`veiculos`.`ano` AS `ano`,`veiculos`.`placa` AS `placa`,`veiculos`.`quilometragem` AS `quilometragem`,`veiculos`.`renavam` AS `renavam`,`tipo_veiculo`.`nome_tipo_veiculo` AS `nome_tipo_veiculo`,`marca_veiculo`.`nome_marca` AS `nome_marca`,`modelo_veiculo`.`nome_modelo` AS `nome_modelo`,`tipo_veiculo`.`id_tipo_veiculo` AS `id_tipo_veiculo`,`marca_tipo`.`id_tipo_marca` AS `id_tipo_marca`,`modelo_veiculo`.`id_modelo` AS `id_modelo`,`foto_veiculo`.`nome_foto` AS `nome_foto` from (((((((`tbl_cliente` `cliente` join `tbl_anuncio` `anuncios` on((`anuncios`.`id_cliente_locador` = `cliente`.`id_cliente`))) join `tbl_veiculo` `veiculos` on((`veiculos`.`id_veiculo` = `anuncios`.`id_veiculo`))) join `tbl_tipo_veiculo` `tipo_veiculo` on((`veiculos`.`id_tipo_veiculo` = `tipo_veiculo`.`id_tipo_veiculo`))) join `tbl_marca_veiculo` `marca_veiculo` on((`veiculos`.`id_marca_veiculo` = `marca_veiculo`.`id_marca_veiculo`))) join `tbl_marca_veiculo_tipo_veiculo` `marca_tipo` on(((`marca_tipo`.`id_tipo_veiculo` = `tipo_veiculo`.`id_tipo_veiculo`) and (`marca_tipo`.`id_marca_veiculo` = `marca_veiculo`.`id_marca_veiculo`)))) join `tbl_modelo_veiculo` `modelo_veiculo` on((`veiculos`.`id_modelo_veiculo` = `modelo_veiculo`.`id_modelo`))) join `tbl_foto_veiculo` `foto_veiculo` on((`foto_veiculo`.`id_veiculo` = `veiculos`.`id_veiculo`))) where (`anuncios`.`status_aprovado` = 1) group by `foto_veiculo`.`id_veiculo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_tipo_marca`
--

/*!50001 DROP VIEW IF EXISTS `view_tipo_marca`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_tipo_marca` AS select `tbl_tipo_veiculo`.`id_tipo_veiculo` AS `id_tipo_veiculo`,`tbl_marca_veiculo_tipo_veiculo`.`id_marca_veiculo` AS `id_marca_veiculo`,`tbl_marca_veiculo_tipo_veiculo`.`id_tipo_marca` AS `id_tipo_marca`,`tbl_marca_veiculo`.`nome_marca` AS `nome_marca` from ((`tbl_tipo_veiculo` join `tbl_marca_veiculo_tipo_veiculo` on((`tbl_marca_veiculo_tipo_veiculo`.`id_tipo_veiculo` = `tbl_tipo_veiculo`.`id_tipo_veiculo`))) join `tbl_marca_veiculo` on((`tbl_marca_veiculo`.`id_marca_veiculo` = `tbl_marca_veiculo_tipo_veiculo`.`id_marca_veiculo`))) where ((`tbl_marca_veiculo_tipo_veiculo`.`excluido` = 0) and (`tbl_marca_veiculo`.`status` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-06 10:52:28