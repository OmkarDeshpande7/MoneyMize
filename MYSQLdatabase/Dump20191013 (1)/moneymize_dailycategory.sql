-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: moneymize
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `dailycategory`
--

DROP TABLE IF EXISTS `dailycategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dailycategory` (
  `expenseId` int(11) DEFAULT NULL,
  `category` varchar(30) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  KEY `expenseId` (`expenseId`),
  CONSTRAINT `dailycategory_ibfk_3` FOREIGN KEY (`expenseId`) REFERENCES `dailyexpenses` (`expenseId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dailycategory`
--

LOCK TABLES `dailycategory` WRITE;
/*!40000 ALTER TABLE `dailycategory` DISABLE KEYS */;
INSERT INTO `dailycategory` VALUES (3,'Lunch',270),(3,'Breakfast',100),(1,'Breakfast',100),(4,'Evening Breakfast',100),(1,'Breakfast',100),(1,'Breakfast',100),(1,'Breakfast',100),(1,'lunch',1000),(1,'lunch',1000),(1,'Dinner',200),(1,'Evening Breakfast',270),(3,'Lunch',300),(1,'Lunch',300),(1,NULL,1000),(1,'Dinner',1000),(5,'Breakfast',20),(5,'Lunch',30),(5,'Dinner',1000),(6,'Breakfast',100),(6,'Lunch',270),(6,'Lunch',100),(6,'Evening Breakfast',50),(7,'Breakfast',100),(7,'Evening Breakfast',20),(8,'Breakfast',120),(9,'Breakfast',20),(9,'Breakfast',120),(9,'Lunch',100),(10,'Breakfast',120),(11,'Lunch',123),(11,'Lunch',123),(11,'Dinner',120),(12,'Breakfast',100),(12,'Lunch',270),(12,'Evening Breakfast',50),(13,'Breakfast',270);
/*!40000 ALTER TABLE `dailycategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ondailyexpensesum` BEFORE INSERT ON `dailycategory` FOR EACH ROW BEGIN
	insert into allLog values (new.amount,CONCAT("You spent money on ",new.category),(select user from dailyexpenses where expenseId=new.expenseId)); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-13 16:05:36
