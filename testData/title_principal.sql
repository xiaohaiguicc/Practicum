-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: title
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `principal`
--

DROP TABLE IF EXISTS `principal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `principal` (
  `tconst` varchar(45) NOT NULL,
  `ordering` int NOT NULL,
  `nconst` varchar(45) DEFAULT NULL,
  `category` varchar(200) DEFAULT NULL,
  `job` varchar(200) DEFAULT NULL,
  `characters` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`tconst`,`ordering`),
  KEY `principal_name_pk_idx` (`nconst`),
  CONSTRAINT `akas_principal_pk` FOREIGN KEY (`tconst`, `ordering`) REFERENCES `title_akas` (`titleId`, `ordering`),
  CONSTRAINT `principal_name_pk` FOREIGN KEY (`nconst`) REFERENCES `name_basic` (`nconst`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `principal`
--

LOCK TABLES `principal` WRITE;
/*!40000 ALTER TABLE `principal` DISABLE KEYS */;
INSERT INTO `principal` VALUES ('tt0000001',2,'nm0005690','director',NULL,NULL),('tt0000005',3,'nm0005690','director',NULL,NULL),('tt0000006',1,'nm0005690','director',NULL,NULL),('tt0000007',1,'nm0179163','actor',NULL,NULL),('tt0000007',2,'nm0183947','actor',NULL,NULL),('tt0000007',3,'nm0005690','director',NULL,NULL),('tt0000008',2,'nm0005690','director',NULL,NULL),('tt0000009',1,'nm0063086','actress',NULL,'\"[\"\"Miss Geraldine Holbrook (Miss Jerry)\"\"]\"'),('tt0000009',2,'nm0183823','actor',NULL,'\"[\"\"Mr. Hamilton\"\"]\"'),('tt0000009',4,'nm0085156','director',NULL,NULL),('tt0000091',1,'nm0194945','actress',NULL,'\"[\"\"Young woman\"\"]\"'),('tt0000108',2,'nm0005690','director',NULL,NULL),('tt0000109',2,'nm0005690','director',NULL,NULL),('tt0000110',2,'nm0005690','director',NULL,NULL),('tt0000110',4,'nm0005658','cinematographer',NULL,NULL),('tt0000111',2,'nm0005690','director',NULL,NULL),('tt0000112',2,'nm0005690','director',NULL,NULL),('tt0000112',4,'nm0005658','cinematographer',NULL,NULL),('tt0000113',2,'nm0005690','director',NULL,NULL),('tt0000113',4,'nm0005658','cinematographer',NULL,NULL);
/*!40000 ALTER TABLE `principal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-06  0:38:35
