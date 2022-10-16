CREATE DATABASE  IF NOT EXISTS `cadastro` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cadastro`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: cadastro
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `gafanhotos`
--

DROP TABLE IF EXISTS `gafanhotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafanhotos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `prof` varchar(15) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `sexo` enum('M','F') DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `altura` decimal(3,2) DEFAULT NULL,
  `nacionalidade` varchar(20) DEFAULT 'Brasil',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafanhotos`
--

LOCK TABLES `gafanhotos` WRITE;
/*!40000 ALTER TABLE `gafanhotos` DISABLE KEYS */;
INSERT INTO `gafanhotos` VALUES (1,'Godofredo Silva','Programador','1984-01-02','M',78.50,1.83,'Brasil'),(2,'Maria Santos','Engenheira','1982-05-22','F',58.50,1.63,'Portugal'),(3,'Carla Silva pereira','Programador','1922-07-12','F',68.50,1.68,'Brasil'),(4,'EduGol Cruzeiro','Jogador','1995-08-10','M',72.00,1.72,'Argentina'),(5,'Marlene Silva','Enfermeira','1950-11-11','F',68.50,1.68,'Irlanda'),(6,'Adalgisa Santos','Advogada','1950-11-11','F',78.50,1.68,'Irlanda'),(7,'Pedro Silva','Surfista','1995-08-10','M',72.00,1.87,'Argentina'),(8,'Paulo Silva','Programador','1999-01-05','M',70.00,1.79,'Brasil'),(9,'Cristina dos Santos','Atleta','2000-08-19','F',55.00,1.61,'EUA'),(10,'Kennedy Anderson','Bioinforma','1999-01-05','M',70.00,1.86,'Brasil'),(11,'Ana Paula','Professora','2000-08-19','F',55.00,1.90,'EUA'),(12,'Tel','Musico','2001-10-10','M',72.00,1.85,'Mexico'),(13,'Janice Silva','Médica','1992-07-29','F',60.00,1.54,'Brasil'),(14,'Paulina','Pesquisadora','2000-01-01','F',75.30,1.91,'Brasil');
/*!40000 ALTER TABLE `gafanhotos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-24 14:50:42
