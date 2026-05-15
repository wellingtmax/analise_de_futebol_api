-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: analise_futebol
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `estatisticas_jogadores`
--

DROP TABLE IF EXISTS `estatisticas_jogadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estatisticas_jogadores` (
  `id_estatistica` int NOT NULL AUTO_INCREMENT,
  `id_jogador` int DEFAULT NULL,
  `id_partida` int DEFAULT NULL,
  `gols` int DEFAULT '0',
  `assistencias` int DEFAULT '0',
  `finalizacoes` int DEFAULT '0',
  `passes_certos` int DEFAULT '0',
  `passes_errados` int DEFAULT '0',
  `cartoes_amarelos` int DEFAULT '0',
  `cartoes_vermelhos` int DEFAULT '0',
  `minutos_jogados` int DEFAULT '0',
  `nota_desempenho` decimal(4,2) DEFAULT NULL,
  `dribles_certos` int DEFAULT '0',
  `dribles_errados` int DEFAULT '0',
  `desarmes` int DEFAULT '0',
  `interceptacoes` int DEFAULT '0',
  `chutes_gol` int DEFAULT '0',
  `precisao_passe` decimal(5,2) DEFAULT NULL,
  `velocidade_maxima` decimal(5,2) DEFAULT NULL,
  `distancia_percorrida` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id_estatistica`),
  KEY `id_jogador` (`id_jogador`),
  KEY `id_partida` (`id_partida`),
  CONSTRAINT `estatisticas_jogadores_ibfk_1` FOREIGN KEY (`id_jogador`) REFERENCES `jogadores` (`id_jogador`),
  CONSTRAINT `estatisticas_jogadores_ibfk_2` FOREIGN KEY (`id_partida`) REFERENCES `partidas` (`id_partida`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatisticas_jogadores`
--

LOCK TABLES `estatisticas_jogadores` WRITE;
/*!40000 ALTER TABLE `estatisticas_jogadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `estatisticas_jogadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estatisticas_partidas`
--

DROP TABLE IF EXISTS `estatisticas_partidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estatisticas_partidas` (
  `id_estatistica` int NOT NULL AUTO_INCREMENT,
  `id_partida` int NOT NULL,
  `finalizacoes` int DEFAULT '0',
  `faltas` int DEFAULT '0',
  `escanteios` int DEFAULT '0',
  `cartoes_amarelos` int DEFAULT '0',
  `cartoes_vermelhos` int DEFAULT '0',
  `total_gols` int DEFAULT '0',
  `total_cartoes_amarelos` int DEFAULT '0',
  `total_cartoes_vermelhos` int DEFAULT '0',
  `total_finalizacoes` int DEFAULT '0',
  `total_escanteios` int DEFAULT '0',
  `total_faltas` int DEFAULT '0',
  `melhor_jogador` varchar(100) DEFAULT NULL,
  `melhor_time` varchar(100) DEFAULT NULL,
  `publico` int DEFAULT NULL,
  `clima` varchar(50) DEFAULT NULL,
  `resumo_partida` text,
  `tempo_adicional_primeiro_tempo` int DEFAULT '0',
  `tempo_adicional_segundo_tempo` int DEFAULT '0',
  PRIMARY KEY (`id_estatistica`),
  KEY `id_partida` (`id_partida`),
  CONSTRAINT `estatisticas_partidas_ibfk_1` FOREIGN KEY (`id_partida`) REFERENCES `partidas` (`id_partida`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatisticas_partidas`
--

LOCK TABLES `estatisticas_partidas` WRITE;
/*!40000 ALTER TABLE `estatisticas_partidas` DISABLE KEYS */;
/*!40000 ALTER TABLE `estatisticas_partidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estatisticas_times`
--

DROP TABLE IF EXISTS `estatisticas_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estatisticas_times` (
  `id_estatistica_time` int NOT NULL AUTO_INCREMENT,
  `id_time` int DEFAULT NULL,
  `id_partida` int DEFAULT NULL,
  `posse_bola` decimal(5,2) DEFAULT NULL,
  `finalizacoes` int DEFAULT '0',
  `finalizacoes_gol` int DEFAULT '0',
  `passes_certos` int DEFAULT '0',
  `passes_errados` int DEFAULT '0',
  `faltas` int DEFAULT '0',
  `escanteios` int DEFAULT '0',
  `impedimentos` int DEFAULT '0',
  `cartoes_amarelos` int DEFAULT '0',
  `cartoes_vermelhos` int DEFAULT '0',
  `xg` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_estatistica_time`),
  KEY `id_time` (`id_time`),
  KEY `id_partida` (`id_partida`),
  CONSTRAINT `estatisticas_times_ibfk_1` FOREIGN KEY (`id_time`) REFERENCES `times` (`id_time`),
  CONSTRAINT `estatisticas_times_ibfk_2` FOREIGN KEY (`id_partida`) REFERENCES `partidas` (`id_partida`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatisticas_times`
--

LOCK TABLES `estatisticas_times` WRITE;
/*!40000 ALTER TABLE `estatisticas_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `estatisticas_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogadores`
--

DROP TABLE IF EXISTS `jogadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogadores` (
  `id_jogador` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `idade` int DEFAULT NULL,
  `posicao` varchar(50) DEFAULT NULL,
  `numero_camisa` int DEFAULT NULL,
  `nacionalidade` varchar(100) DEFAULT NULL,
  `id_time` int DEFAULT NULL,
  `foto` text,
  `altura` decimal(4,2) DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `pe_dominante` varchar(20) DEFAULT NULL,
  `overall` int DEFAULT NULL,
  `velocidade` int DEFAULT NULL,
  `finalizacao` int DEFAULT NULL,
  `passe` int DEFAULT NULL,
  `defesa` int DEFAULT NULL,
  PRIMARY KEY (`id_jogador`),
  KEY `id_time` (`id_time`),
  CONSTRAINT `jogadores_ibfk_1` FOREIGN KEY (`id_time`) REFERENCES `times` (`id_time`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogadores`
--

LOCK TABLES `jogadores` WRITE;
/*!40000 ALTER TABLE `jogadores` DISABLE KEYS */;
INSERT INTO `jogadores` VALUES (21,'Lucas Paquetá',28,'Meio-campista ofensivo',20,'Brasil',6,'https://img.sofascore.com/api/v1/player/839981/image',1.84,80.00,'Esquerdo',80,69,78,75,48),(22,'Bruno Henrique',35,'Atacante',27,'Brasil',6,'https://img.sofascore.com/api/v1/player/795291/image',1.84,77.00,'Direito',82,91,82,61,61),(23,' Giorgian de Arrascaeta',31,'Meia Ofensivo',10,'Uruguai',6,'https://img.sofascore.com/api/v1/player/333587/image',1.73,73.00,'Direito',85,24,104,40,25),(24,'Agustín Rossi',30,'Goleiro',1,'Argentina',6,'https://img.sofascore.com/api/v1/player/1140986/image',1.95,93.00,'Direito',82,45,20,35,84),(25,'Matías Viña',27,'Lateral-Esquerdo',17,'Uruguai',6,'https://img.sofascore.com/api/v1/player/875295/image',1.80,75.00,'Esquerdo',79,78,60,72,76),(26,'Léo Pereira',30,'Zagueiro',4,'Brasil',6,'https://img.sofascore.com/api/v1/player/358548/image',1.89,84.00,'Esquerdo',81,68,52,70,83),(27,'Léo Ortiz',29,'Zagueiro',3,'Brasil',6,'https://img.sofascore.com/api/v1/player/869643/image',1.85,81.00,'Direito',82,69,55,74,84),(28,'Wesley França',21,'Lateral-Direito',43,'Brasil',6,'https://cdn-img.staticzz.com/img/planteis/new/34/58/14253458_wesley_franca_20250616001253.jpg',1.78,73.00,'Direito',77,84,58,69,74),(29,'Erick Pulgar',31,'Volante',5,'Chile',6,'https://img.sofascore.com/api/v1/player/590262/image',1.87,78.00,'Direito',81,68,66,78,82),(30,'Gerson Santos da Silva',29,'Meio-Campo',8,'Brasil',6,'https://cdn-img.staticzz.com/img/planteis/new/34/67/14253467_gerson_20250616144801.jpg',1.84,76.00,'Direito',84,78,76,84,78),(31,'Luiz Araújo',29,'Ponta',7,'Brasil',6,'https://img.sofascore.com/api/v1/player/840451/image',1.75,70.00,'Direito',81,88,78,77,52),(32,'Pedro Guilherme Abreu dos Santos',28,'Centroavante',9,'Brasil',6,'https://img.sofascore.com/api/v1/player/840219/image',1.85,81.00,'Direito',85,74,90,74,46),(33,'Léo Jardim',30,'Goleiro',1,'Brasil',8,'https://img.sofascore.com/api/v1/player/595598/image',1.88,84.00,'Direito',81,46,18,34,83),(34,'Paulo Henrique',29,'Lateral-Direito',96,'Brasil',8,'https://img.sofascore.com/api/v1/player/1021721/image',1.75,70.00,'Direito',77,82,60,70,74),(35,'João Victor',27,'Zagueiro',38,'Brasil',8,'https://vasconoticias.com.br/wp-content/uploads/2025/04/joao-victor-vasco.jpg',1.87,82.00,'Direito',79,70,45,66,81),(36,'Léo Pelé',29,'Zagueiro',3,'Brasil',8,'https://cdn-img.staticzz.com/img/planteis/new/42/56/9794256_leo_20240712123355.png',1.83,79.00,'Esquerdo',78,68,48,69,79),(37,'Lucas Piton',25,'Lateral-Esquerdo',6,'Brasil',8,'https://cdn-img.staticzz.com/img/jogadores/21/647921_20230507210706_lucas_piton.png',1.75,69.00,'Esquerdo',80,81,67,79,73);
/*!40000 ALTER TABLE `jogadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partidas`
--

DROP TABLE IF EXISTS `partidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partidas` (
  `id_partida` int NOT NULL AUTO_INCREMENT,
  `id_time_mandante` int DEFAULT NULL,
  `id_time_visitante` int DEFAULT NULL,
  `data_partida` datetime DEFAULT NULL,
  `gols_mandante` int DEFAULT NULL,
  `gols_visitante` int DEFAULT NULL,
  `campeonato` varchar(100) DEFAULT NULL,
  `estadio` varchar(100) DEFAULT NULL,
  `status_partida` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_partida`),
  KEY `id_time_mandante` (`id_time_mandante`),
  KEY `id_time_visitante` (`id_time_visitante`),
  CONSTRAINT `partidas_ibfk_1` FOREIGN KEY (`id_time_mandante`) REFERENCES `times` (`id_time`),
  CONSTRAINT `partidas_ibfk_2` FOREIGN KEY (`id_time_visitante`) REFERENCES `times` (`id_time`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partidas`
--

LOCK TABLES `partidas` WRITE;
/*!40000 ALTER TABLE `partidas` DISABLE KEYS */;
INSERT INTO `partidas` VALUES (5,6,8,'2026-05-03 00:00:00',2,2,'Brasileirão Série A',NULL,NULL);
/*!40000 ALTER TABLE `partidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `times`
--

DROP TABLE IF EXISTS `times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `times` (
  `id_time` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `pais` varchar(255) NOT NULL,
  `liga` varchar(255) NOT NULL,
  `tecnico` varchar(255) NOT NULL,
  `escudo` text NOT NULL,
  PRIMARY KEY (`id_time`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `times`
--

LOCK TABLES `times` WRITE;
/*!40000 ALTER TABLE `times` DISABLE KEYS */;
INSERT INTO `times` VALUES (6,'Clube de Regatas do Flamengo ','Brasil','Brasileirão','Leonardo Jardim','https://a.espncdn.com/i/teamlogos/soccer/500/819.png'),(8,'Club de Regatas Vasco da Gama','Brasil','Brasileirão','Renato Gaúcho','https://www.ogol.com.br/img/logos/equipas/2258_imgbank_1683640645.png'),(10,'Fluminense Football Club','Brasil','Brasileirão','Luis Zubeldía','https://upload.wikimedia.org/wikipedia/commons/a/ad/Fluminense_FC_escudo.png'),(12,'Botafogo de Futebol e Regatas','Brasil','Brasileirão','Franclim Carvalho','https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Botafogo_de_Futebol_e_Regatas_logo.svg/500px-Botafogo_de_Futebol_e_Regatas_logo.svg.png'),(14,'São Paulo Futebol Clube','Brasil','Brasileirão','Roger Machado','https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/S%C3%A3o_Paulo_Futebol_Clube_logo_%282022%29.svg/330px-S%C3%A3o_Paulo_Futebol_Clube_logo_%282022%29.svg.png'),(20,'Sociedade Esportiva Palmeiras','Brasil','Brasileirão','Abel Ferreira','https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/SE_Palmeiras_2025_crest.png/330px-SE_Palmeiras_2025_crest.png'),(21,'Santos Futebol Clube','Brasil','Brasileirão','Cuca','https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Santos_Futebol_Clube_logo_%28with_stars_and_crown%29.png/330px-Santos_Futebol_Clube_logo_%28with_stars_and_crown%29.png'),(22,'Sport Club Corinthians Paulista','Brasil','Brasileirão','Fernando Diniz ','https://upload.wikimedia.org/wikipedia/pt/thumb/b/b4/Corinthians_simbolo.png/330px-Corinthians_simbolo.png');
/*!40000 ALTER TABLE `times` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-15  8:09:01
