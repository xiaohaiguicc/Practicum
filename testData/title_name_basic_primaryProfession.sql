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
-- Table structure for table `name_basic_primaryProfession`
--

DROP TABLE IF EXISTS `name_basic_primaryProfession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `name_basic_primaryProfession` (
  `namePrimaryProfessionId` int NOT NULL,
  `nconst` varchar(45) DEFAULT NULL,
  `primaryProfessionId` int DEFAULT NULL,
  PRIMARY KEY (`namePrimaryProfessionId`),
  KEY `name_pri_pk_idx` (`nconst`),
  KEY `pri_pk_idx` (`primaryProfessionId`),
  CONSTRAINT `name_pri_pk` FOREIGN KEY (`nconst`) REFERENCES `name_basic` (`nconst`),
  CONSTRAINT `pri_pk` FOREIGN KEY (`primaryProfessionId`) REFERENCES `primaryProfession` (`primaryProfessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `name_basic_primaryProfession`
--

LOCK TABLES `name_basic_primaryProfession` WRITE;
/*!40000 ALTER TABLE `name_basic_primaryProfession` DISABLE KEYS */;
INSERT INTO `name_basic_primaryProfession` VALUES (1,'nm0000001',1),(2,'nm0000001',2),(3,'nm0000001',3),(4,'nm0000002',4),(5,'nm0000002',1),(6,'nm0000003',4),(7,'nm0000003',1),(8,'nm0000003',5),(9,'nm0000004',2),(10,'nm0000004',1),(11,'nm0000004',6),(12,'nm0000005',6),(13,'nm0000005',7),(14,'nm0000005',2),(15,'nm0000006',4),(16,'nm0000006',1),(17,'nm0000006',8),(18,'nm0000007',2),(19,'nm0000007',1),(20,'nm0000007',8),(21,'nm0000008',2),(22,'nm0000008',1),(23,'nm0000008',7),(24,'nm0000009',2),(25,'nm0000009',1),(26,'nm0000009',8),(27,'nm0000010',2),(28,'nm0000010',1),(29,'nm0000010',7),(30,'nm0000011',2),(31,'nm0000011',1),(32,'nm0000011',8),(33,'nm0000012',4),(34,'nm0000012',1),(35,'nm0000012',9),(36,'nm0000013',1),(37,'nm0000013',4),(38,'nm0000013',8),(39,'nm0000014',4),(40,'nm0000014',1),(41,'nm0000015',2),(42,'nm0000015',3),(43,'nm0000016',10),(44,'nm0000016',1),(45,'nm0000016',5),(46,'nm0000017',1),(47,'nm0000017',4),(48,'nm0000017',5),(49,'nm0000018',2),(50,'nm0000018',8),(51,'nm0000018',1),(52,'nm0000019',6),(53,'nm0000019',7),(54,'nm0000019',11),(55,'nm0000020',2),(56,'nm0000020',8),(57,'nm0000020',1),(58,'nm0000021',4),(59,'nm0000021',1),(60,'nm0000021',8),(61,'nm0000022',2),(62,'nm0000022',1),(63,'nm0000022',8),(64,'nm0000023',1),(65,'nm0000023',4),(66,'nm0000024',2),(67,'nm0000024',6),(68,'nm0000024',7),(69,'nm0000025',5),(70,'nm0000025',1),(71,'nm0000025',10),(72,'nm0000026',2),(73,'nm0000026',1),(74,'nm0000026',8),(75,'nm0000027',2),(76,'nm0000027',1),(77,'nm0000027',6),(78,'nm0000028',4),(79,'nm0000028',1),(80,'nm0000028',8),(81,'nm0000029',4),(82,'nm0000029',3),(83,'nm0000030',4),(84,'nm0000030',1),(85,'nm0000031',4),(86,'nm0000031',1),(87,'nm0000031',6),(88,'nm0000032',2),(89,'nm0000032',7),(90,'nm0000032',6),(91,'nm0000033',7),(92,'nm0000033',8),(93,'nm0000033',2),(94,'nm0000034',2),(95,'nm0000034',1),(96,'nm0000035',5),(97,'nm0000035',1),(98,'nm0000035',10),(99,'nm0000036',2),(100,'nm0000036',6),(101,'nm0000036',7),(102,'nm0000037',1),(103,'nm0000037',2),(104,'nm0000037',7),(105,'nm0000038',4),(106,'nm0000038',1),(107,'nm0000039',4),(108,'nm0000039',1),(109,'nm0000040',7),(110,'nm0000040',6),(111,'nm0000040',8),(112,'nm0000041',6),(113,'nm0000041',7),(114,'nm0000041',11),(115,'nm0000042',2),(116,'nm0000042',8),(117,'nm0000042',12),(118,'nm0000043',4),(119,'nm0000043',1),(120,'nm0000043',8),(121,'nm0000044',2),(122,'nm0000044',8),(123,'nm0000044',3),(124,'nm0000045',2),(125,'nm0000045',6),(126,'nm0000045',3),(127,'nm0000046',4),(128,'nm0000046',1),(129,'nm0000046',6),(130,'nm0000047',4),(131,'nm0000047',1),(132,'nm0000048',2),(133,'nm0000048',1),(134,'nm0000048',6),(135,'nm0000049',5),(136,'nm0000049',1),(137,'nm0000049',10),(138,'nm0063086',4),(139,'nm0085156',7),(140,'nm0085156',6),(141,'nm0085156',13),(142,'nm0183823',2),(143,'nm0183947',2),(144,'nm0000428',7),(145,'nm0000428',6),(146,'nm0000428',8),(147,'nm0000636',6),(148,'nm0000636',1),(149,'nm0000636',3),(150,'nm0000875',6),(151,'nm0000875',8),(152,'nm0000875',3),(153,'nm0001908',7),(154,'nm0001908',2),(155,'nm0001908',8),(156,'nm0002042',6),(157,'nm0002042',1),(158,'nm0002042',3),(159,'nm0002504',2),(160,'nm0002504',7),(161,'nm0002504',6),(162,'nm0002615',8),(163,'nm0002615',7),(164,'nm0002615',2),(165,'nm0003471',1),(166,'nm0003471',5),(167,'nm0003471',6),(168,'nm0005658',13),(169,'nm0005658',7),(170,'nm0005658',12),(171,'nm0005690',13),(172,'nm0005690',7),(173,'nm0005690',8),(174,'nm0005717',7),(175,'nm0005717',13),(176,'nm0005717',6),(177,'nm0179163',2),(178,'nm0179163',6),(179,'nm0194945',4),(180,'nm0194945',14);
/*!40000 ALTER TABLE `name_basic_primaryProfession` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-06  0:38:39
