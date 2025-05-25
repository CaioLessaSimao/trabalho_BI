-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbnetf
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Dumping data for table `Artista`
--

LOCK TABLES `Artista` WRITE;
/*!40000 ALTER TABLE `Artista` DISABLE KEYS */;
/*!40000 ALTER TABLE `Artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ArtistaConteudo`
--

LOCK TABLES `ArtistaConteudo` WRITE;
/*!40000 ALTER TABLE `ArtistaConteudo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ArtistaConteudo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Assinatura`
--

LOCK TABLES `Assinatura` WRITE;
/*!40000 ALTER TABLE `Assinatura` DISABLE KEYS */;
INSERT INTO `Assinatura` VALUES (1,'2024-01-01','2024-12-31',1,1,1),(2,'2024-02-01','2024-08-01',2,2,2),(3,'2024-03-01',NULL,3,3,3),(4,'2024-04-01','2024-05-01',4,4,4),(5,'2024-05-01',NULL,5,5,1);
/*!40000 ALTER TABLE `Assinatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Avaliacao`
--

LOCK TABLES `Avaliacao` WRITE;
/*!40000 ALTER TABLE `Avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `Avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Cidade`
--

LOCK TABLES `Cidade` WRITE;
/*!40000 ALTER TABLE `Cidade` DISABLE KEYS */;
INSERT INTO `Cidade` VALUES (1,'São Paulo'),(2,'Rio de Janeiro'),(3,'Belo Horizonte'),(4,'Salvador'),(5,'Porto Alegre');
/*!40000 ALTER TABLE `Cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ClassIndicativa`
--

LOCK TABLES `ClassIndicativa` WRITE;
/*!40000 ALTER TABLE `ClassIndicativa` DISABLE KEYS */;
/*!40000 ALTER TABLE `ClassIndicativa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Conteudo`
--

LOCK TABLES `Conteudo` WRITE;
/*!40000 ALTER TABLE `Conteudo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Conteudo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Dispositivo`
--

LOCK TABLES `Dispositivo` WRITE;
/*!40000 ALTER TABLE `Dispositivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Dispositivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Episodio`
--

LOCK TABLES `Episodio` WRITE;
/*!40000 ALTER TABLE `Episodio` DISABLE KEYS */;
/*!40000 ALTER TABLE `Episodio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Estado`
--

LOCK TABLES `Estado` WRITE;
/*!40000 ALTER TABLE `Estado` DISABLE KEYS */;
INSERT INTO `Estado` VALUES (1,'SP'),(2,'RJ'),(3,'MG'),(4,'BA'),(5,'RS');
/*!40000 ALTER TABLE `Estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Função`
--

LOCK TABLES `Função` WRITE;
/*!40000 ALTER TABLE `Função` DISABLE KEYS */;
/*!40000 ALTER TABLE `Função` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `GeneroConteudo`
--

LOCK TABLES `GeneroConteudo` WRITE;
/*!40000 ALTER TABLE `GeneroConteudo` DISABLE KEYS */;
/*!40000 ALTER TABLE `GeneroConteudo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Pagamento`
--

LOCK TABLES `Pagamento` WRITE;
/*!40000 ALTER TABLE `Pagamento` DISABLE KEYS */;
INSERT INTO `Pagamento` VALUES (1,'2024-01-01','19.90',1),(2,'2024-02-01','29.90',2),(3,'2024-03-01','39.90',3),(4,'2024-04-01','49.90',4),(5,'2024-05-01','59.90',5);
/*!40000 ALTER TABLE `Pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Pais`
--

LOCK TABLES `Pais` WRITE;
/*!40000 ALTER TABLE `Pais` DISABLE KEYS */;
INSERT INTO `Pais` VALUES (1,'Brasil'),(2,'Argentina'),(3,'EUA'),(4,'França'),(5,'Japão');
/*!40000 ALTER TABLE `Pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Plano`
--

LOCK TABLES `Plano` WRITE;
/*!40000 ALTER TABLE `Plano` DISABLE KEYS */;
INSERT INTO `Plano` VALUES (1,'Básico',19.90,1,1),(2,'Padrão',29.90,2,2),(3,'Premium',39.90,4,3),(4,'Ultra',49.90,5,4),(5,'Supremo',59.90,6,5);
/*!40000 ALTER TABLE `Plano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `QualidadeVideo`
--

LOCK TABLES `QualidadeVideo` WRITE;
/*!40000 ALTER TABLE `QualidadeVideo` DISABLE KEYS */;
INSERT INTO `QualidadeVideo` VALUES (1,'SD'),(2,'HD'),(3,'Full HD'),(4,'4K'),(5,'8K');
/*!40000 ALTER TABLE `QualidadeVideo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `SistemaOperacional`
--

LOCK TABLES `SistemaOperacional` WRITE;
/*!40000 ALTER TABLE `SistemaOperacional` DISABLE KEYS */;
/*!40000 ALTER TABLE `SistemaOperacional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `SituacaoAssinatura`
--

LOCK TABLES `SituacaoAssinatura` WRITE;
/*!40000 ALTER TABLE `SituacaoAssinatura` DISABLE KEYS */;
INSERT INTO `SituacaoAssinatura` VALUES (1,'Ativa'),(2,'Cancelada'),(3,'Aguardando Pagamento'),(4,'Suspensa'),(5,'Expirada');
/*!40000 ALTER TABLE `SituacaoAssinatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `TipoConteudo`
--

LOCK TABLES `TipoConteudo` WRITE;
/*!40000 ALTER TABLE `TipoConteudo` DISABLE KEYS */;
/*!40000 ALTER TABLE `TipoConteudo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (1,'Ana Silva','ana@example.com','1990-01-01','F',1,1,1),(2,'Bruno Costa','bruno@example.com','1985-05-12','M',2,2,2),(3,'Carla Souza','carla@example.com','1992-09-23','F',3,3,3),(4,'Daniel Lima','daniel@example.com','1988-07-15','M',4,4,4),(5,'Eduardo Alves','eduardo@example.com','1995-11-30','M',5,5,5);
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Visualizacao`
--

LOCK TABLES `Visualizacao` WRITE;
/*!40000 ALTER TABLE `Visualizacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `Visualizacao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-25  9:58:19
