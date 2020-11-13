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
-- Temporary view structure for view `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!50001 DROP VIEW IF EXISTS `actor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `actor` AS SELECT 
 1 AS `primaryName`,
 1 AS `age`,
 1 AS `IsDead`,
 1 AS `numKnowMovies`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `test`
--

DROP TABLE IF EXISTS `test`;
/*!50001 DROP VIEW IF EXISTS `test`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `test` AS SELECT 
 1 AS `movieCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `actor`
--

/*!50001 DROP VIEW IF EXISTS `actor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `actor` AS select `NBT`.`primaryName` AS `primaryName`,`NBT`.`age` AS `age`,if((`NBT`.`deadYear` = NULL),'NO','YES') AS `IsDead`,ifnull(`subtable`.`numKnowMovies`,0) AS `numKnowMovies` from (`name_basic` `NBT` left join (select `NB`.`nconst` AS `nconst`,count(`TB`.`tconst`) AS `numKnowMovies` from ((((`name_basic` `NB` join `name_basic_primaryprofession` `NBP` on((`NB`.`nconst` = `NBP`.`nconst`))) join `primaryprofession` `TP` on((`TP`.`primaryProfessionId` = `NBP`.`primaryProfessionId`))) left join `title_name` `TN` on((`NB`.`nconst` = `TN`.`nconst`))) left join `title_basic` `TB` on((`TB`.`tconst` = `TN`.`tconst`))) where ((`TP`.`primaryProfession` = 'actor') and (`TB`.`titleType` = 'movie')) group by `NB`.`nconst`) `subTable` on((`subtable`.`nconst` = `NBT`.`nconst`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `test`
--

/*!50001 DROP VIEW IF EXISTS `test`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `test` AS select `newtable`.`movieCount` AS `movieCount` from (select `NB`.`nconst` AS `nconst`,`NB`.`primaryName` AS `primaryName`,`NB`.`birthYear` AS `birthYear`,`NB`.`deadYear` AS `deadYear`,`NB`.`age` AS `age`,`NB`.`numMovies` AS `numMovies`,`subtable`.`nameId` AS `nameId`,`subtable`.`movieCount` AS `movieCount` from (`name_basic` `NB` left join (select `TP`.`nconst` AS `nameId`,count(distinct `TP`.`tconst`,`TP`.`ordering`) AS `movieCount` from (`name_basic` `NAB` join `principal` `TP`) where (`TP`.`nconst` = `NAB`.`nconst`) group by `TP`.`nconst`) `subTable` on((`NB`.`nconst` = `subtable`.`nameId`)))) `newTable` */;
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

-- Dump completed on 2020-11-12 19:16:36
