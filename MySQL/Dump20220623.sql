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
-- Table structure for table `gafanhatos`
--

DROP TABLE IF EXISTS `gafanhatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafanhatos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `prof` varchar(10) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `sexo` enum('M','F') DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `altura` decimal(3,2) DEFAULT NULL,
  `nascionalidade` varchar(20) DEFAULT 'Brasil',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafanhatos`
--

LOCK TABLES `gafanhatos` WRITE;
/*!40000 ALTER TABLE `gafanhatos` DISABLE KEYS */;
INSERT INTO `gafanhatos` VALUES (1,'Godofredo','','1984-01-02','M',78.50,1.83,'Brasil'),(2,'Maria','','1982-05-22','F',58.50,1.63,'Portugal'),(3,'Carla','','1922-07-12','F',68.50,1.68,'Brasil'),(10,'Pedro','','1995-08-10','M',72.00,9.99,'Argentina'),(5,'Adalgisa','','1950-11-11','F',68.50,1.68,'Irlanda'),(6,'Adalgisa','','1950-11-11','F',68.50,1.68,'Irlanda'),(7,'Pedro','','1995-08-10','M',72.00,9.99,'Argentina'),(8,'Paulo','','1999-01-05','M',70.00,9.99,'Brasil'),(9,'Ana','','2000-08-19','F',55.00,9.99,'EUA'),(11,'Paulo','','1999-01-05','M',70.00,9.99,'Brasil'),(12,'Ana','','2000-08-19','F',55.00,9.99,'EUA');
/*!40000 ALTER TABLE `gafanhatos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-23  0:55:08
