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
-- Table structure for table `alllog`
--

DROP TABLE IF EXISTS `alllog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alllog` (
  `amount` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `user` varchar(11) DEFAULT NULL,
  KEY `user` (`user`),
  CONSTRAINT `alllog_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alllog`
--

LOCK TABLES `alllog` WRITE;
/*!40000 ALTER TABLE `alllog` DISABLE KEYS */;
INSERT INTO `alllog` VALUES (150,'You created group event 150','7709833124'),(37,'You participated in group event 150','7709833124'),(37,'You participated in group event 150','7709833124'),(37,'You participated in group event 150','7709833124'),(123,'You spent money on Lunch','7709833124'),(123,'You spent money on Lunch','7709833124'),(120,'You spent money on Dinner','7709833124'),(100,'You created group event 200','7709833124'),(50,'You participated in group event 200','7709833124'),(200,'You Borrowed money from omkar deshpande','7709833124'),(200,'You lent money to omkar deshpande','7709833124'),(200,'You paid pending amount to omkar deshpande','7709833124'),(200,'omkar deshpande paid your pending amount','7709833124'),(798,'You created group event 200','7709833124'),(789,'You created group event 200','7709833124'),(123,'You participated in group event chai party','7709833124'),(897,'You created group event 150',NULL),(152,'You created group event 152',NULL),(111,'You created group event 111',NULL),(258,'You created group event 258','7709833124'),(86,'You participated in group event 258','7709833124'),(86,'You participated in group event 258','2222222222'),(200,'You Borrowed money from omkar deshpande','7721071250'),(200,'You lent money to shubham','2525252525'),(200,'You paid pending amount to omkar deshpande','7721071250'),(200,'omkar deshpande paid your pending amount','2525252525'),(400,'You created group event project related something','7721071250'),(100,'You participated in group event project related something','1111111111'),(100,'You participated in group event project related something','2525252525'),(100,'You participated in group event project related something','7709833124'),(300,'You created group event project','7721071250'),(200,'You created group event projectre','7721071250'),(100,'You spent money on Breakfast','7721071250'),(270,'You spent money on Lunch','7721071250'),(50,'You spent money on Evening Breakfast','7721071250'),(500,'You Borrowed money from shubham','2525252525'),(500,'You lent money to omkar deshpande','7721071250'),(500,'You paid pending amount to shubham','2525252525'),(500,'shubham paid your pending amount','7721071250'),(500,'You Borrowed money from shubham','1111111111'),(500,'You lent money to omkar','7721071250'),(500,'You paid pending amount to shubham','1111111111'),(500,'shubham paid your pending amount','7721071250'),(500,'You Borrowed money from shubham','2525252525'),(500,'You lent money to omkar deshpande','7721071250'),(500,'You paid pending amount to shubham','2525252525'),(500,'shubham paid your pending amount','7721071250'),(270,'You spent money on Breakfast','2525252525'),(500,'You Borrowed money from shubham','2525252525'),(500,'You lent money to omkar deshpande','7721071250'),(500,'You Borrowed money from omkar deshpande','7721071250'),(500,'You lent money to shubham','2525252525'),(500,'You paid pending amount to omkar deshpande','7721071250'),(500,'omkar deshpande paid your pending amount','2525252525'),(500,'You paid pending amount to shubham','2525252525'),(500,'shubham paid your pending amount','7721071250'),(500,'You Borrowed money from omkar deshpande','7721071250'),(500,'You lent money to shubham','2525252525'),(500,'You paid pending amount to omkar deshpande','7721071250'),(500,'omkar deshpande paid your pending amount','2525252525'),(500,'You Borrowed money from shubham','2525252525'),(500,'You lent money to omkar deshpande','7721071250'),(500,'You paid pending amount to shubham','2525252525'),(500,'shubham paid your pending amount','7721071250'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','2525252525'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','2525252525'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','2525252525'),(500,'You participated in group event 1500','7721071250'),(120,'You spent money on Lunch','7709833124'),(120000000,'You created group event ','7709833124'),(121000000,'You created group event ','7709833124'),(120,'You created group event gcghj','7709833124'),(60,'You participated in group event gcghj','2525252525'),(500,'You participated in group event 1500','2525252525'),(5000,'You spent money on Breakfast','2525252525'),(200,'You Borrowed money from omkar deshpande','2525252525'),(200,'You lent money to omkar deshpande','7709833124');
/*!40000 ALTER TABLE `alllog` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `dailycategory` VALUES (3,'Lunch',270),(3,'Breakfast',100),(1,'Breakfast',100),(4,'Evening Breakfast',100),(1,'Breakfast',100),(1,'Breakfast',100),(1,'Breakfast',100),(1,'lunch',1000),(1,'lunch',1000),(1,'Dinner',200),(1,'Evening Breakfast',270),(3,'Lunch',300),(1,'Lunch',300),(1,NULL,1000),(1,'Dinner',1000),(5,'Breakfast',20),(5,'Lunch',30),(5,'Dinner',1000),(6,'Breakfast',100),(6,'Lunch',270),(6,'Lunch',100),(6,'Evening Breakfast',50),(7,'Breakfast',100),(7,'Evening Breakfast',20),(8,'Breakfast',120),(9,'Breakfast',20),(9,'Breakfast',120),(9,'Lunch',100),(10,'Breakfast',120),(11,'Lunch',123),(11,'Lunch',123),(11,'Dinner',120),(12,'Breakfast',100),(12,'Lunch',270),(12,'Evening Breakfast',50),(13,'Breakfast',270),(14,'Lunch',120),(15,'Breakfast',5000);
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

--
-- Table structure for table `dailyexpenses`
--

DROP TABLE IF EXISTS `dailyexpenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dailyexpenses` (
  `user` varchar(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `expenseId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`expenseId`),
  KEY `user` (`user`),
  CONSTRAINT `dailyexpenses_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`phone`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dailyexpenses`
--

LOCK TABLES `dailyexpenses` WRITE;
/*!40000 ALTER TABLE `dailyexpenses` DISABLE KEYS */;
INSERT INTO `dailyexpenses` VALUES ('7721071250','2019-09-29',0,1),(NULL,'2019-09-29',0,2),('2525252525','2019-09-29',0,3),('1111111111','2019-09-29',0,4),('7972663093','2019-09-30',0,5),('7721071250','2019-09-30',0,6),('7721071250','2019-10-03',0,7),('2525252525','2019-10-09',0,8),('7709833124','2019-10-09',0,9),('7721071250','2019-10-09',0,10),('7709833124','2019-10-10',243,11),('7721071250','2019-10-11',420,12),('2525252525','2019-10-11',270,13),('7709833124','2019-10-19',120,14),('2525252525','2019-10-19',5000,15);
/*!40000 ALTER TABLE `dailyexpenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friends` (
  `user1` varchar(11) DEFAULT NULL,
  `user2` varchar(11) DEFAULT NULL,
  KEY `user1` (`user1`),
  KEY `user2` (`user2`),
  CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`user1`) REFERENCES `user` (`phone`),
  CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`user2`) REFERENCES `user` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupevent`
--

DROP TABLE IF EXISTS `groupevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groupevent` (
  `eventId` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `totalAmt` int(11) DEFAULT NULL,
  `owner` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`eventId`),
  KEY `owner` (`owner`),
  CONSTRAINT `groupevent_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `user` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupevent`
--

LOCK TABLES `groupevent` WRITE;
/*!40000 ALTER TABLE `groupevent` DISABLE KEYS */;
INSERT INTO `groupevent` VALUES (1,'1500','2019-10-07',1500,'7709833124'),(2,'chai party','2019-10-09',150,'2525252525'),(3,'project related something','2019-10-09',400,'2525252525'),(4,'kuch nahi bas yuhi','2019-10-09',40,'1111111111'),(5,'tea party','2019-10-09',-987654,'7709833124'),(6,'150','2019-10-09',150,'7709833124'),(7,'200','2019-10-10',100,'7709833124'),(8,'200','2019-10-11',798,'7709833124'),(9,'200','2019-10-11',789,'7709833124'),(10,'150','2019-10-11',897,NULL),(11,'152','2019-10-11',152,NULL),(12,'111','2019-10-11',111,NULL),(13,'258','2019-10-11',258,'7709833124'),(14,'project related something','2019-10-11',400,'7721071250'),(15,'project','2019-10-11',300,'7721071250'),(16,'projectre','2019-10-11',200,'7721071250'),(17,'','2019-10-19',120000000,'7709833124'),(18,'','2019-10-19',121000000,'7709833124'),(19,'gcghj','2019-10-19',120,'7709833124');
/*!40000 ALTER TABLE `groupevent` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ongroupevent` AFTER INSERT ON `groupevent` FOR EACH ROW BEGIN
	update user set wallet=wallet - new.totalAmt where phone=new.owner;
	insert into allLog values (new.totalAmt,CONCAT("You created group event ",new.description),new.owner);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `monthlylimit`
--

DROP TABLE IF EXISTS `monthlylimit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monthlylimit` (
  `user` varchar(11) DEFAULT NULL,
  `wallet_limit` int(11) DEFAULT NULL,
  KEY `user` (`user`),
  CONSTRAINT `monthlylimit_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`phone`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthlylimit`
--

LOCK TABLES `monthlylimit` WRITE;
/*!40000 ALTER TABLE `monthlylimit` DISABLE KEYS */;
/*!40000 ALTER TABLE `monthlylimit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `time` datetime DEFAULT NULL,
  `descreption` varchar(500) DEFAULT NULL,
  `user` varchar(11) DEFAULT NULL,
  KEY `user` (`user`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES ('2019-10-03 20:01:29','shubham(7721071250) has requested that you had borrowed amount :500','2525252525'),('2019-10-03 20:01:54','omkar deshpande(2525252525) has accpted your request that you had lend amount :500toomkar deshpande','7721071250'),('2019-10-03 20:03:54','omkar deshpande(2525252525) has paid you amount :500','7721071250'),('2019-10-03 21:47:24','shubham(7721071250) has requested that you had borrowed amount :500','2525252525'),('2019-10-03 21:47:59','omkar deshpande(2525252525) has accpted your request that you had lend amount :500toomkar deshpande','7721071250'),('2019-10-03 21:48:40','omkar deshpande(2525252525) has paid you amount :500','7721071250'),('2019-10-09 09:10:04','omkar deshpande(2525252525) has requested that you had borrowed amount :100','7709833124'),('2019-10-09 09:10:14','omkar deshpande(2525252525) has requested that you had borrowed amount :200','7709833124'),('2019-10-09 09:10:30','omkar deshpande(2525252525) has requested that you had borrowed amount :123','7709833124'),('2019-10-09 09:11:21','omkar deshpande(null) has accpted your request that you had lend amount :123toomkar deshpande','2525252525'),('2019-10-09 09:39:33','omkar deshpande(2525252525) has requested that you had borrowed amount :200','7721071250'),('2019-10-09 09:45:16','omkar deshpande(2525252525) has requested that you had borrowed amount :200','7709833124'),('2019-10-09 09:45:48','omkar deshpande(7709833124) has rejected your request that you had lend amount :200toomkar deshpande','2525252525'),('2019-10-09 09:45:59','omkar deshpande(7709833124) has rejected your request that you had lend amount :200toomkar deshpande','2525252525'),('2019-10-09 09:46:15','omkar deshpande(7709833124) has rejected your request that you had lend amount :100toomkar deshpande','2525252525'),('2019-10-09 09:46:24','omkar deshpande(2525252525) has requested that you had borrowed amount :200','7709833124'),('2019-10-09 09:58:41','omkar(1111111111) has requested that you had borrowed amount :10','7709833124'),('2019-10-09 10:00:26','omkar(1111111111) has requested that you had borrowed amount :100','7709833124'),('2019-10-09 10:04:25','omkar(1111111111) has requested that you had borrowed amount :11','7709833124'),('2019-10-09 10:10:10','omkar deshpande(7709833124) has rejected your request that you had lend amount :200toomkar deshpande','2525252525'),('2019-10-09 10:10:10','omkar deshpande(7709833124) has rejected your request that you had lend amount :10toomkar deshpande','1111111111'),('2019-10-09 10:10:11','omkar deshpande(7709833124) has rejected your request that you had lend amount :100toomkar deshpande','1111111111'),('2019-10-09 10:10:11','omkar deshpande(7709833124) has rejected your request that you had lend amount :11toomkar deshpande','1111111111'),('2019-10-09 10:10:26','omkar(1111111111) has requested that you had borrowed amount :100','7709833124'),('2019-10-09 10:11:13','omkar deshpande(null) has accpted your request that you had lend amount :100toomkar deshpande','1111111111'),('2019-10-09 10:13:53','omkar deshpande(7709833124) has paid you amount :100','1111111111'),('2019-10-09 10:13:55','omkar deshpande(7709833124) has paid you amount :100','1111111111'),('2019-10-09 10:13:58','omkar deshpande(7709833124) has paid you amount :100','1111111111'),('2019-10-09 10:14:02','omkar deshpande(7709833124) has paid you amount :123','2525252525'),('2019-10-09 10:14:14','omkar deshpande(7709833124) has paid you amount :100','1111111111'),('2019-10-09 10:27:58','omkar deshpande(7709833124) has paid you amount :123','2525252525'),('2019-10-09 11:18:16','omkar deshpande(7709833124) has paid you amount :100','1111111111'),('2019-10-09 11:18:25','omkar deshpande(7709833124) has paid you amount :123','2525252525'),('2019-10-09 11:58:42','omkar(1111111111) has requested that you had borrowed amount :111','7709833124'),('2019-10-09 11:59:54','omkar deshpande(null) has accpted your request that you had lend amount :111toomkar deshpande','1111111111'),('2019-10-09 12:00:02','omkar deshpande(7709833124) has paid you amount :111','1111111111'),('2019-10-09 12:00:43','omkar deshpande(7709833124) has paid you amount :111','1111111111'),('2019-10-09 12:01:00','omkar deshpande(7709833124) has requested that you had borrowed amount :111','2525252525'),('2019-10-09 12:01:15','omkar deshpande(null) has accpted your request that you had lend amount :111toomkar deshpande','7709833124'),('2019-10-09 12:01:17','omkar deshpande(2525252525) has paid you amount :111','7709833124'),('2019-10-10 10:56:34','omkar deshpande(7709833124) has requested that you had borrowed amount :200','7709833124'),('2019-10-10 10:56:50','omkar deshpande(null) has accpted your request that you had lend amount :200toomkar deshpande','7709833124'),('2019-10-10 10:56:53','omkar deshpande(7709833124) has paid you amount :200','7709833124'),('2019-10-11 11:29:23','shubham(null) has accpted your request that you had lend amount :200toshubham','2525252525'),('2019-10-11 11:29:27','shubham(7721071250) has paid you amount :200','2525252525'),('2019-10-11 23:42:17','shubham(7721071250) has requested that you had borrowed amount :500','2525252525'),('2019-10-11 23:43:09','omkar deshpande(null) has accpted your request that you had lend amount :500toomkar deshpande','7721071250'),('2019-10-11 23:43:13','omkar deshpande(2525252525) has paid you amount :500','7721071250'),('2019-10-11 23:48:33','shubham(7721071250) has requested that you had borrowed amount :500','1111111111'),('2019-10-11 23:48:49','omkar(null) has accpted your request that you had lend amount :500toomkar','7721071250'),('2019-10-11 23:48:51','omkar(1111111111) has paid you amount :500','7721071250'),('2019-10-11 23:49:23','shubham(7721071250) has requested that you had borrowed amount :500','2525252525'),('2019-10-11 23:49:45','omkar deshpande(2525252525) has rejected your request that you had lend amount :500toomkar deshpande','7721071250'),('2019-10-11 23:49:58','shubham(7721071250) has requested that you had borrowed amount :500','2525252525'),('2019-10-11 23:50:08','omkar deshpande(null) has accpted your request that you had lend amount :500toomkar deshpande','7721071250'),('2019-10-11 23:50:09','omkar deshpande(2525252525) has paid you amount :500','7721071250'),('2019-10-12 10:29:59','shubham(7721071250) has requested that you had borrowed amount :500','2525252525'),('2019-10-12 10:30:13','omkar deshpande(null) has accpted your request that you had lend amount :500toomkar deshpande','7721071250'),('2019-10-12 10:33:54','omkar deshpande(2525252525) has requested that you had borrowed amount :500','7721071250'),('2019-10-12 10:39:42','shubham(null) has accpted your request that you had lend amount :500toshubham','2525252525'),('2019-10-12 10:39:48','shubham(7721071250) has paid you amount :500','2525252525'),('2019-10-12 10:40:50','shubham(7721071250) has requested that you had borrowed amount :500','2525252525'),('2019-10-12 10:49:46','omkar deshpande(2525252525) has paid you amount :500','7721071250'),('2019-10-12 10:50:00','omkar deshpande(2525252525) has requested that you had borrowed amount :500','7721071250'),('2019-10-12 10:50:23','shubham(null) has accpted your request that you had lend amount :500toshubham','2525252525'),('2019-10-12 23:12:49','shubham(7721071250) has paid you amount :500','2525252525'),('2019-10-13 01:47:11','shubham(7721071250) has requested that you had borrowed amount :500','2525252525'),('2019-10-13 01:47:27','omkar(1111111111) has requested that you had borrowed amount :500','2525252525'),('2019-10-13 01:47:44','omkar deshpande(null) has accpted your request that you had lend amount :500toomkar deshpande','7721071250'),('2019-10-13 01:47:50','omkar deshpande(2525252525) has rejected your request that you had lend amount :500toomkar deshpande','1111111111'),('2019-10-13 01:47:58','omkar deshpande(2525252525) has paid you amount :500','7721071250'),('2019-10-19 22:07:39','omkar deshpande(7709833124) has requested that you had borrowed amount :200','2525252525'),('2019-10-19 22:07:51','omkar deshpande(null) has accpted your request that you had lend amount :200toomkar deshpande','7709833124'),('2019-10-19 22:12:27','omkar deshpande(7709833124) has requested that you had borrowed amount :500','2525252525'),('2019-10-19 22:12:35','omkar deshpande(null) has accpted your request that you had lend amount :500toomkar deshpande','7709833124');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pendinggrouprequests`
--

DROP TABLE IF EXISTS `pendinggrouprequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pendinggrouprequests` (
  `amount` int(11) DEFAULT NULL,
  `user` varchar(11) DEFAULT NULL,
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `user` (`user`),
  KEY `eid` (`eid`),
  CONSTRAINT `pendinggrouprequests_ibfk_2` FOREIGN KEY (`user`) REFERENCES `user` (`phone`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pendinggrouprequests_ibfk_3` FOREIGN KEY (`eid`) REFERENCES `groupevent` (`eventId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pendinggrouprequests`
--

LOCK TABLES `pendinggrouprequests` WRITE;
/*!40000 ALTER TABLE `pendinggrouprequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `pendinggrouprequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pendingpersonalrequests`
--

DROP TABLE IF EXISTS `pendingpersonalrequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pendingpersonalrequests` (
  `amount` int(11) DEFAULT NULL,
  `lender` varchar(11) DEFAULT NULL,
  `borrower` varchar(11) DEFAULT NULL,
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`pid`),
  KEY `lender` (`lender`),
  KEY `borrower` (`borrower`),
  CONSTRAINT `pendingpersonalrequests_ibfk_1` FOREIGN KEY (`lender`) REFERENCES `user` (`phone`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pendingpersonalrequests_ibfk_2` FOREIGN KEY (`borrower`) REFERENCES `user` (`phone`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pendingpersonalrequests`
--

LOCK TABLES `pendingpersonalrequests` WRITE;
/*!40000 ALTER TABLE `pendingpersonalrequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `pendingpersonalrequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalevent`
--

DROP TABLE IF EXISTS `personalevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personalevent` (
  `amount` int(11) DEFAULT NULL,
  `lender` varchar(11) DEFAULT NULL,
  `borrower` varchar(11) DEFAULT NULL,
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`eid`),
  KEY `lender` (`lender`),
  KEY `borrower` (`borrower`),
  CONSTRAINT `personalevent_ibfk_1` FOREIGN KEY (`lender`) REFERENCES `user` (`phone`),
  CONSTRAINT `personalevent_ibfk_2` FOREIGN KEY (`borrower`) REFERENCES `user` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalevent`
--

LOCK TABLES `personalevent` WRITE;
/*!40000 ALTER TABLE `personalevent` DISABLE KEYS */;
INSERT INTO `personalevent` VALUES (700,'7709833124','2525252525',39);
/*!40000 ALTER TABLE `personalevent` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `onpersonalevent` AFTER INSERT ON `personalevent` FOR EACH ROW BEGIN
	update user set wallet=wallet - new.amount where phone=new.lender;
    update user set wallet=wallet + new.amount where phone=new.borrower;
	insert into allLog values (new.amount,CONCAT("You Borrowed money from ",(select name from user where phone=new.lender)),new.borrower);
	insert into allLog values (new.amount,CONCAT("You lent money to ",(select name from user where phone=new.borrower)),new.lender);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ondeletepersonalevent` BEFORE DELETE ON `personalevent` FOR EACH ROW BEGIN
	update user set wallet=wallet + old.amount where phone=old.lender;
    update user set wallet=wallet - old.amount where phone=old.borrower;
	insert into allLog values (old.amount,CONCAT("You paid pending amount to ",(select name from user where phone=old.lender)),old.borrower);
	insert into allLog values (old.amount,CONCAT((select name from user where phone=old.lender)," paid your pending amount"),old.lender);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `personaleventlog`
--

DROP TABLE IF EXISTS `personaleventlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personaleventlog` (
  `amount` int(11) DEFAULT NULL,
  `lender` varchar(11) DEFAULT NULL,
  `borrower` varchar(11) DEFAULT NULL,
  `eid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaleventlog`
--

LOCK TABLES `personaleventlog` WRITE;
/*!40000 ALTER TABLE `personaleventlog` DISABLE KEYS */;
INSERT INTO `personaleventlog` VALUES (100,'2525252525','7709833124',10),(123456,'7709833124','2525252525',11),(1000,'7721071250','2525252525',12),(500,'1111111111','2525252525',13),(1000,'1111111111','2525252525',15),(500,'7721071250','2525252525',14),(1000,'7721071250','2525252525',16),(3456,'1111111111','2525252525',17),(1000,'7721071250','2525252525',18),(1000,'7721071250','2525252525',19),(300,'7972663093','7721071250',21),(340,'1111111111','2525252525',20),(2000,'7721071250','2525252525',22),(500,'7721071250','2525252525',23),(500,'7721071250','2525252525',24),(500,'7721071250','2525252525',25),(100,'1111111111','7709833124',27),(123,'2525252525','7709833124',26),(111,'1111111111','7709833124',28),(111,'7709833124','2525252525',29);
/*!40000 ALTER TABLE `personaleventlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisor`
--

DROP TABLE IF EXISTS `supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supervisor` (
  `parent` varchar(11) DEFAULT NULL,
  `child` varchar(11) DEFAULT NULL,
  KEY `parent` (`parent`),
  KEY `child` (`child`),
  CONSTRAINT `supervisor_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `user` (`phone`),
  CONSTRAINT `supervisor_ibfk_2` FOREIGN KEY (`child`) REFERENCES `user` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisor`
--

LOCK TABLES `supervisor` WRITE;
/*!40000 ALTER TABLE `supervisor` DISABLE KEYS */;
/*!40000 ALTER TABLE `supervisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `phone` varchar(11) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `wallet` int(11) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1111111111','sdfsd','omkar',5000,'pass'),('123456','shubhamdarak37@gmil.com','shubham',5000,'1234'),('2222222222','omkar@gmail.com','omkar',5000,'password'),('2525252525','deshpandeomkar77@gmail.com','omkar deshpande',300,'123456'),('7350766736','atharva.chavan29@gmail.com','atharva chvan',5000,'atharva123'),('7350766738','gaikwadsampada8@gmail.com','atharva',5000,'sam29'),('770983312','deshpandeomkar77@gmail.com','omkar deshpande',5000,'123456'),('7709833124','deshpandeomkar77@gmail.com','omkar deshpande',4680,'123456'),('7721065893','shubhamdarak37@gmil.com','atharva',5000,'at'),('7721071250','shubhamdarak37@gmil.com','shubham',5000,'sd'),('7721088542','shubhamdarak37@gmil.com','omkar',5000,'omkar'),('7789456123','shubhamdarak37@gmil.com','shubham',5000,'sd'),('7972663093','dschandak@gmail.com','Devesh Chandak',5000,'devesh_111'),('9876543210','user@gmail.com','usera',5000,'9876543210');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useringroup`
--

DROP TABLE IF EXISTS `useringroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `useringroup` (
  `amount` int(11) DEFAULT NULL,
  `eventId` int(11) DEFAULT NULL,
  `user` varchar(11) DEFAULT NULL,
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`pid`),
  KEY `eventId` (`eventId`),
  KEY `user` (`user`),
  CONSTRAINT `useringroup_ibfk_2` FOREIGN KEY (`eventId`) REFERENCES `groupevent` (`eventId`),
  CONSTRAINT `useringroup_ibfk_3` FOREIGN KEY (`user`) REFERENCES `user` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useringroup`
--

LOCK TABLES `useringroup` WRITE;
/*!40000 ALTER TABLE `useringroup` DISABLE KEYS */;
INSERT INTO `useringroup` VALUES (60,19,'2525252525',2),(500,1,'2525252525',3);
/*!40000 ALTER TABLE `useringroup` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `onuseringroup` AFTER INSERT ON `useringroup` FOR EACH ROW BEGIN
	insert into allLog values (new.amount,CONCAT("You participated in group event ",(select description from groupevent where eventId=new.eventId)),new.user);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'moneymize'
--

--
-- Dumping routines for database 'moneymize'
--
/*!50003 DROP FUNCTION IF EXISTS `checkpass` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `checkpass`(phoneno char(11) ,pass varchar(20)) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
DECLARE val tinyint(1);
IF ((SELECT password from user where phone=phoneno) = pass) THEN
	SET val=1;
ELSE
	SET VAL=0;
END IF;
RETURN val;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addfriend` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addfriend`(IN uesr1 varchar(11),IN uesr2 varchar(11))
BEGIN	
			IF NOT EXISTS(SELECT * FROM friends WHERE (user1=user1 and user2=user2) or (user1=user2 and user2=user1)) then
						insert into friends values (user1,user2);
					end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addParent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addParent`(IN parent varchar(11),IN child varchar(11))
BEGIN	
			IF EXISTS (SELECT * FROM supervisor WHERE child=child ) then
				update supervisor set parent=parent where child=child;
			ELSE
				insert into supervisor values (parent,child);
			end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `adduseringroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `adduseringroup`(IN amt int,IN eid int,IN user char(11))
BEGIN
	INSERT INTO useringroup(amount,eventId,user) values(amt,eid,user);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findfriends` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findfriends`(IN euser varchar(11))
BEGIN	
	if EXISTS(select user1 from friends where user1=euser) then
	SELECT name,wallet from user where phone in (select user2 from friends where user1=euser);
	
	elseif EXISTS(select user2 from friends where user2=euser) then
	SELECT name,wallet from user where phone in (select user1 from friends where user2=euser);
	
	ELSE
		SELECT name,wallet from user where phone=(select user2 from friends where user1="0");

	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getLatestDaily` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getLatestDaily`(IN euser varchar(11))
BEGIN	
	select * from dailyexpenses where user = euser order by Date limit 12;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getLatestMonthly` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getLatestMonthly`(IN euser varchar(11))
BEGIN	
	select SUM(total_amount),MONTHNAME(Date) from dailyexpenses where user = euser group by MONTH(Date) order by Date limit 12;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ifParent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ifParent`(IN uesr varchar(11))
BEGIN	
			select EXISTS (SELECT * FROM supervisor WHERE parent=user);			
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertinpersonalevent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertinpersonalevent`(IN id int,IN message varchar(100))
BEGIN
	IF EXISTS (SELECT * FROM personalevent WHERE lender=(select lender from pendingpersonalrequests where pid=id) and borrower=(select borrower from pendingpersonalrequests where pid=id)) then
		Update personalevent set amount=amount + (select amount from pendingpersonalrequests  WHERE lender=(select lender from pendingpersonalrequests where pid=id) and borrower=(select borrower from pendingpersonalrequests where pid=id)) WHERE lender=(select lender from pendingpersonalrequests where pid=id) and borrower=(select borrower from pendingpersonalrequests where pid=id);
		ELSE
		INSERT INTO personalevent (amount,lender,borrower) values ((select amount from pendingpersonalrequests where pid = id),(select lender from pendingpersonalrequests where pid = id),(select borrower from pendingpersonalrequests where pid = id));
		end if;
        insert into notification(time,descreption,user) values(NOW(),message,(select lender from pendingpersonalrequests where pid=id));
		delete from pendingpersonalrequests where pid=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertuseringroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertuseringroup`(IN amount int,IN eid int,IN user CHAR(11),IN id int)
BEGIN
	INSERT INTO useringroup(amount,eventId,user) values(amount,eid,user);
    delete from pendinggrouprequests where pid = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertuseringrouprequest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertuseringrouprequest`(IN amount int,IN eid int,IN user CHAR(11))
BEGIN
	INSERT INTO pendinggrouprequests(amount,user,eid) values(amount,user,eid);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `onuseringroupsplit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `onuseringroupsplit`()
BEGIN
    DECLARE count integer;
    set @count := (select count(user) from useringroup where eventId = (select eventId ) + 1);
	update useringroup
	SET amount = (select totalAmt from groupevent where eventId = new.eventId)/@count where eventId = new.eventId; 
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paygroupmoney` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paygroupmoney`(IN id int,IN userr varchar(11))
BEGIN	
	update user set wallet = wallet - (select amount from useringroup where pid = id) where phone=userr;
	delete from useringroup where pid=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paymoney` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paymoney`(IN id int)
BEGIN	
	delete from personalevent where eid=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `savedailyexpenses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `savedailyexpenses`(IN phones varchar(11),IN amount int,IN category varchar(30))
BEGIN
IF NOT EXISTS (select * from dailyexpenses where Date = CURRENT_DATE and user = phones) then
	INSERT INTO dailyexpenses(user,Date,total_amount) values(phones,CURRENT_DATE,0);
	end if;
	INSERT INTO dailycategory(expenseId,category,amount) values((select expenseId from dailyexpenses where user=phones and Date = CURRENT_DATE),category,amount);
	update user set wallet = wallet - amount where phone = phones;
	update dailyexpenses SET total_amount=total_amount + amount where user=phones and Date = CURRENT_DATE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `savegroupevent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `savegroupevent`(IN description varchar(100),IN edate date,IN totalamt int,IN eowner char(11))
BEGIN
	INSERT INTO groupevent(description,date,totalAmt,owner) values(description,edate,totalamt,eowner);
	select *  from groupevent where owner=eowner and  description=description and date=edate and totalAmt=totalamt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `savepersonalevent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `savepersonalevent`(IN amount int ,IN status varchar(10),IN lender char(11),IN borrower char(11))
BEGIN
	INSERT INTO personalevent values(amount,status,lender,borrower);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `saveuser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `saveuser`(IN phoneno char(11) ,IN pass varchar(20),IN email varchar(30),IN name varchar(30),IN wallet int)
BEGIN
	INSERT INTO user values(phoneno,email,name,wallet,pass);
END ;;
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

-- Dump completed on 2019-10-20  0:34:31
