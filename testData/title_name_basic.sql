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
-- Table structure for table `name_basic`
--

DROP TABLE IF EXISTS `name_basic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `name_basic` (
  `nconst` varchar(45) NOT NULL,
  `primaryName` varchar(45) DEFAULT NULL,
  `birthYear` smallint DEFAULT NULL,
  `deadYear` smallint DEFAULT NULL,
  `age` int DEFAULT NULL,
  `numMovies` int DEFAULT NULL,
  PRIMARY KEY (`nconst`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `name_basic`
--

LOCK TABLES `name_basic` WRITE;
/*!40000 ALTER TABLE `name_basic` DISABLE KEYS */;
INSERT INTO `name_basic` VALUES ('nm0000001','Fred Astaire',1899,1987,NULL,NULL),('nm0000002','Lauren Bacall',1924,2014,NULL,NULL),('nm0000003','Brigitte Bardot',1934,NULL,NULL,NULL),('nm0000004','John Belushi',1949,1982,NULL,NULL),('nm0000005','Ingmar Bergman',1918,2007,NULL,NULL),('nm0000006','Ingrid Bergman',1915,1982,NULL,NULL),('nm0000007','Humphrey Bogart',1899,1957,NULL,NULL),('nm0000008','Marlon Brando',1924,2004,NULL,NULL),('nm0000009','Richard Burton',1925,1984,NULL,NULL),('nm0000010','James Cagney',1899,1986,NULL,NULL),('nm0000011','Gary Cooper',1901,1961,NULL,NULL),('nm0000012','Bette Davis',1908,1989,NULL,NULL),('nm0000013','Doris Day',1922,2019,NULL,NULL),('nm0000014','Olivia de Havilland',1916,2020,NULL,NULL),('nm0000015','James Dean',1931,1955,NULL,NULL),('nm0000016','Georges Delerue',1925,1992,NULL,NULL),('nm0000017','Marlene Dietrich',1901,1992,NULL,NULL),('nm0000018','Kirk Douglas',1916,2020,NULL,NULL),('nm0000019','Federico Fellini',1920,1993,NULL,NULL),('nm0000020','Henry Fonda',1905,1982,NULL,NULL),('nm0000021','Joan Fontaine',1917,2013,NULL,NULL),('nm0000022','Clark Gable',1901,1960,NULL,NULL),('nm0000023','Judy Garland',1922,1969,NULL,NULL),('nm0000024','John Gielgud',1904,2000,NULL,NULL),('nm0000025','Jerry Goldsmith',1929,2004,NULL,NULL),('nm0000026','Cary Grant',1904,1986,NULL,NULL),('nm0000027','Alec Guinness',1914,2000,NULL,NULL),('nm0000028','Rita Hayworth',1918,1987,NULL,NULL),('nm0000029','Margaux Hemingway',1954,1996,NULL,NULL),('nm0000030','Audrey Hepburn',1929,1993,NULL,NULL),('nm0000031','Katharine Hepburn',1907,2003,NULL,NULL),('nm0000032','Charlton Heston',1923,2008,NULL,NULL),('nm0000033','Alfred Hitchcock',1899,1980,NULL,NULL),('nm0000034','William Holden',1918,1981,NULL,NULL),('nm0000035','James Horner',1953,2015,NULL,NULL),('nm0000036','Buster Keaton',1895,1966,NULL,NULL),('nm0000037','Gene Kelly',1912,1996,NULL,NULL),('nm0000038','Grace Kelly',1929,1982,NULL,NULL),('nm0000039','Deborah Kerr',1921,2007,NULL,NULL),('nm0000040','Stanley Kubrick',1928,1999,NULL,NULL),('nm0000041','Akira Kurosawa',1910,1998,NULL,NULL),('nm0000042','Alan Ladd',1913,1964,NULL,NULL),('nm0000043','Veronica Lake',1922,1973,NULL,NULL),('nm0000044','Burt Lancaster',1913,1994,NULL,NULL),('nm0000045','Bruce Lee',1940,1973,NULL,NULL),('nm0000046','Vivien Leigh',1913,1967,NULL,NULL),('nm0000047','Sophia Loren',1934,NULL,NULL,NULL),('nm0000048','Peter Lorre',1904,1964,NULL,NULL),('nm0000049','Henry Mancini',1924,1994,NULL,NULL),('nm0000428','D.W. Griffith',1875,1948,NULL,NULL),('nm0000636','William Shakespeare',1564,1616,NULL,NULL),('nm0000875','L. Frank Baum',1856,1919,NULL,NULL),('nm0001908','Gilbert M. \'Broncho Billy\' Anderson',1880,1971,NULL,NULL),('nm0002042','Charles Dickens',1812,1870,NULL,NULL),('nm0002504','Herbert Beerbohm Tree',1852,1917,NULL,NULL),('nm0002615','Siegmund Lubin',1851,1923,NULL,NULL),('nm0003471','Richard Wagner',1813,1883,NULL,NULL),('nm0005658','G.W. Bitzer',1872,1944,NULL,NULL),('nm0005690','William K.L. Dickson',1860,1935,NULL,NULL),('nm0005717','Fructuós Gelabert',1874,1955,NULL,NULL),('nm0063086','Blanche Bayliss',1878,1951,NULL,NULL),('nm0085156','Alexander Black',1859,1940,NULL,NULL),('nm0179163','James J. Corbett',1866,1933,NULL,NULL),('nm0183823','William Courtenay',1875,1933,NULL,NULL),('nm0183947','Peter Courtney',1867,1896,NULL,NULL),('nm0194945','Jehanne d\'Alcy',1865,1956,NULL,NULL);
/*!40000 ALTER TABLE `name_basic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-06  0:38:34
