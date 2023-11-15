-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: localhost    Database: animais
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `animais`
--

DROP TABLE IF EXISTS `animais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animais` (
  `id_animais` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `especie` varchar(255) NOT NULL,
  `idade` varchar(255) NOT NULL,
  `peso` varchar(255) NOT NULL,
  PRIMARY KEY (`id_animais`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animais`
--

LOCK TABLES `animais` WRITE;
/*!40000 ALTER TABLE `animais` DISABLE KEYS */;
/*!40000 ALTER TABLE `animais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_animais`
--

DROP TABLE IF EXISTS `tipo_animais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_animais` (
  `id_tipos` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipos`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_animais`
--

LOCK TABLES `tipo_animais` WRITE;
/*!40000 ALTER TABLE `tipo_animais` DISABLE KEYS */;
INSERT INTO `tipo_animais` VALUES (1,'Anfíbios'),(2,'Aves'),(3,'Mamíferos'),(4,'Peixes'),(5,'Répteis');
/*!40000 ALTER TABLE `tipo_animais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoxanimal`
--

DROP TABLE IF EXISTS `tipoxanimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoxanimal` (
  `id_relacao` int NOT NULL AUTO_INCREMENT,
  `id_animais` int NOT NULL,
  `id_tipos` int NOT NULL,
  PRIMARY KEY (`id_relacao`),
  KEY `id_animais` (`id_animais`),
  KEY `id_tipos` (`id_tipos`),
  CONSTRAINT `tipoxanimal_ibfk_1` FOREIGN KEY (`id_animais`) REFERENCES `animais` (`id_animais`),
  CONSTRAINT `tipoxanimal_ibfk_2` FOREIGN KEY (`id_tipos`) REFERENCES `tipo_animais` (`id_tipos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoxanimal`
--

LOCK TABLES `tipoxanimal` WRITE;
/*!40000 ALTER TABLE `tipoxanimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoxanimal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-14 22:40:39
