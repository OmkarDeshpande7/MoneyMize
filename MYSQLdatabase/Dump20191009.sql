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
INSERT INTO `alllog` VALUES (200,'You Borrowed money from omkar deshpande','7721071250'),(200,'You lent money to shubham','2525252525'),(200,'You paid pending amount to omkar deshpande','7721071250'),(200,'omkar deshpande paid your pending amount','2525252525'),(1200,'You created group event tea party','7721071250'),(500,'You Borrowed money from chirag','7721071250'),(500,'You lent money to shubham','9422738098'),(500,'You paid pending amount to chirag','7721071250'),(500,'chirag paid your pending amount','9422738098');
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
INSERT INTO `dailycategory` VALUES (3,'Lunch',270),(3,'Breakfast',100),(1,'Breakfast',100),(4,'Evening Breakfast',100),(1,'Breakfast',100),(1,'Breakfast',100),(1,'Breakfast',100),(1,'lunch',1000),(1,'lunch',1000),(1,'Dinner',200),(1,'Evening Breakfast',270),(3,'Lunch',300),(1,'Lunch',300),(1,NULL,1000),(1,'Dinner',1000),(5,'Breakfast',20),(5,'Lunch',30),(5,'Dinner',1000),(6,'Breakfast',100),(6,'Lunch',270),(6,'Lunch',100),(6,'Evening Breakfast',50),(7,'Breakfast',100),(7,'Evening Breakfast',20),(8,'Breakfast',120),(9,'Breakfast',20),(9,'Breakfast',120),(9,'Lunch',100),(10,'Breakfast',120);
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
	update dailyexpenses SET total_amount=total_amount + new.amount where expenseId=expenseId;
	insert into allLog values (new.amount,CONCAT("You spent money on ",new.category),(select user from dailyexpenses where expenseId=new.expenseId),(select user from dailyexpenses where expenseId=expenseId)); 
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dailyexpenses`
--

LOCK TABLES `dailyexpenses` WRITE;
/*!40000 ALTER TABLE `dailyexpenses` DISABLE KEYS */;
INSERT INTO `dailyexpenses` VALUES ('7721071250','2019-09-29',0,1),(NULL,'2019-09-29',0,2),('2525252525','2019-09-29',0,3),('1111111111','2019-09-29',0,4),('7972663093','2019-09-30',0,5),('7721071250','2019-09-30',0,6),('7721071250','2019-10-03',0,7),('2525252525','2019-10-09',0,8),('7709833124','2019-10-09',0,9),('7721071250','2019-10-09',0,10),('9422738098','2019-10-09',0,11);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupevent`
--

LOCK TABLES `groupevent` WRITE;
/*!40000 ALTER TABLE `groupevent` DISABLE KEYS */;
INSERT INTO `groupevent` VALUES (1,'1500','2019-10-07',1500,'7709833124'),(2,'chai party','2019-10-09',150,'2525252525'),(3,'project related something','2019-10-09',400,'2525252525'),(4,'kuch nahi bas yuhi','2019-10-09',40,'1111111111'),(5,'tea party','2019-10-09',-987654,'7709833124'),(6,'tea party','2019-10-09',1200,'7721071250');
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
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `time` datetime DEFAULT NULL,
  `descreption` varchar(100) DEFAULT NULL,
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
INSERT INTO `notification` VALUES ('2019-10-03 20:01:29','shubham(7721071250) has requested that you had borrowed amount :500','2525252525'),('2019-10-03 20:01:54','omkar deshpande(2525252525) has accpted your request that you had lend amount :500toomkar deshpande','7721071250'),('2019-10-03 20:03:54','omkar deshpande(2525252525) has paid you amount :500','7721071250'),('2019-10-03 21:47:24','shubham(7721071250) has requested that you had borrowed amount :500','2525252525'),('2019-10-03 21:47:59','omkar deshpande(2525252525) has accpted your request that you had lend amount :500toomkar deshpande','7721071250'),('2019-10-03 21:48:40','omkar deshpande(2525252525) has paid you amount :500','7721071250'),('2019-10-09 09:10:04','omkar deshpande(2525252525) has requested that you had borrowed amount :100','7709833124'),('2019-10-09 09:10:14','omkar deshpande(2525252525) has requested that you had borrowed amount :200','7709833124'),('2019-10-09 09:10:30','omkar deshpande(2525252525) has requested that you had borrowed amount :123','7709833124'),('2019-10-09 09:11:21','omkar deshpande(null) has accpted your request that you had lend amount :123toomkar deshpande','2525252525'),('2019-10-09 09:39:33','omkar deshpande(2525252525) has requested that you had borrowed amount :200','7721071250'),('2019-10-09 09:45:16','omkar deshpande(2525252525) has requested that you had borrowed amount :200','7709833124'),('2019-10-09 09:45:48','omkar deshpande(7709833124) has rejected your request that you had lend amount :200toomkar deshpande','2525252525'),('2019-10-09 09:45:59','omkar deshpande(7709833124) has rejected your request that you had lend amount :200toomkar deshpande','2525252525'),('2019-10-09 09:46:15','omkar deshpande(7709833124) has rejected your request that you had lend amount :100toomkar deshpande','2525252525'),('2019-10-09 09:46:24','omkar deshpande(2525252525) has requested that you had borrowed amount :200','7709833124'),('2019-10-09 09:58:41','omkar(1111111111) has requested that you had borrowed amount :10','7709833124'),('2019-10-09 10:00:26','omkar(1111111111) has requested that you had borrowed amount :100','7709833124'),('2019-10-09 10:04:25','omkar(1111111111) has requested that you had borrowed amount :11','7709833124'),('2019-10-09 10:10:10','omkar deshpande(7709833124) has rejected your request that you had lend amount :200toomkar deshpande','2525252525'),('2019-10-09 10:10:10','omkar deshpande(7709833124) has rejected your request that you had lend amount :10toomkar deshpande','1111111111'),('2019-10-09 10:10:11','omkar deshpande(7709833124) has rejected your request that you had lend amount :100toomkar deshpande','1111111111'),('2019-10-09 10:10:11','omkar deshpande(7709833124) has rejected your request that you had lend amount :11toomkar deshpande','1111111111'),('2019-10-09 10:10:26','omkar(1111111111) has requested that you had borrowed amount :100','7709833124'),('2019-10-09 10:11:13','omkar deshpande(null) has accpted your request that you had lend amount :100toomkar deshpande','1111111111'),('2019-10-09 10:13:53','omkar deshpande(7709833124) has paid you amount :100','1111111111'),('2019-10-09 10:13:55','omkar deshpande(7709833124) has paid you amount :100','1111111111'),('2019-10-09 10:13:58','omkar deshpande(7709833124) has paid you amount :100','1111111111'),('2019-10-09 10:14:02','omkar deshpande(7709833124) has paid you amount :123','2525252525'),('2019-10-09 10:14:14','omkar deshpande(7709833124) has paid you amount :100','1111111111'),('2019-10-09 10:27:58','omkar deshpande(7709833124) has paid you amount :123','2525252525'),('2019-10-09 11:18:16','omkar deshpande(7709833124) has paid you amount :100','1111111111'),('2019-10-09 11:18:25','omkar deshpande(7709833124) has paid you amount :123','2525252525'),('2019-10-09 11:58:42','omkar(1111111111) has requested that you had borrowed amount :111','7709833124'),('2019-10-09 11:59:54','omkar deshpande(null) has accpted your request that you had lend amount :111toomkar deshpande','1111111111'),('2019-10-09 12:00:02','omkar deshpande(7709833124) has paid you amount :111','1111111111'),('2019-10-09 12:00:43','omkar deshpande(7709833124) has paid you amount :111','1111111111'),('2019-10-09 12:01:00','omkar deshpande(7709833124) has requested that you had borrowed amount :111','2525252525'),('2019-10-09 12:01:15','omkar deshpande(null) has accpted your request that you had lend amount :111toomkar deshpande','7709833124'),('2019-10-09 12:01:17','omkar deshpande(2525252525) has paid you amount :111','7709833124'),('2019-10-09 14:25:37','shubham(null) has accpted your request that you had lend amount :200toshubham','2525252525'),('2019-10-09 15:29:40','shubham(7721071250) has paid you amount :200','2525252525'),('2019-10-09 20:38:20','chirag(9422738098) has requested that you had borrowed amount :500','7721071250'),('2019-10-09 20:38:43','shubham(null) has accpted your request that you had lend amount :500toshubham','9422738098'),('2019-10-09 20:39:35','shubham(7721071250) has paid you amount :500','9422738098'),('2019-10-09 20:39:45','shubham(7721071250) has paid you amount :500','9422738098'),('2019-10-09 20:39:54','shubham(7721071250) has paid you amount :500','9422738098'),('2019-10-09 20:40:07','shubham(7721071250) has paid you amount :500','9422738098');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalevent`
--

LOCK TABLES `personalevent` WRITE;
/*!40000 ALTER TABLE `personalevent` DISABLE KEYS */;
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
INSERT INTO `user` VALUES ('1111111111','sdfsd','omkar',494838,'pass'),('1234567890','shubhamdarak37@gmil.com','shubham',1000,'1234'),('2222222222','omkar@gmail.com','omkar',1000,'password'),('2525252525','deshpandeomkar77@gmail.com','omkar deshpande',714,'123456'),('7350766736','atharva.chavan29@gmail.com','atharva chvan',1000,'atharva123'),('7350766738','gaikwadsampada8@gmail.com','atharva',1000,'sam29'),('770983312','deshpandeomkar77@gmail.com','omkar deshpande',1000,'123456'),('7709833124','deshpandeomkar77@gmail.com','omkar deshpande',-492452,'123456'),('7721065893','shubhamdarak37@gmil.com','atharva',1000,'at'),('7721071250','shubhamdarak37@gmil.com','shubham',700,'sd'),('7721088542','shubhamdarak37@gmil.com','omkar',1000,'omkar'),('7789456123','shubhamdarak37@gmil.com','shubham',1000,'sd'),('7972663093','dschandak@gmail.com','Devesh Chandak',1000,'devesh_111'),('9422738098','chirag123@gmail.com','chirag',5010,'cp'),('9876543210','user@gmail.com','usera',1000,'9876543210');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useringroup`
--

LOCK TABLES `useringroup` WRITE;
/*!40000 ALTER TABLE `useringroup` DISABLE KEYS */;
INSERT INTO `useringroup` VALUES (375,1,'7709833124',1),(50,2,'7709833124',4),(50,2,'2222222222',5),(100,3,'2222222222',8);
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
	update user set wallet=wallet + new.amount where phone=new.user;
	insert into allLog values (new.amount,CONCAT("You participated in group event ",(select description from groupevent where eventId=new.eventId)),new.user);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ondeleteuseringroupevent` BEFORE DELETE ON `useringroup` FOR EACH ROW BEGIN
	update user set wallet=wallet - old.amount where phone=old.user;
    update user set wallet=wallet + old.amount where phone=(select owner from groupevent where eventId=old.eventId);
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
	INSERT INTO useringroup values(amt,eid,user);
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
	select SUM(total_amount) from dailyexpenses where user = euser group by MONTH(Date) order by Date limit 12;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertuseringroup`(IN amount int,IN eid int,IN user CHAR(11))
BEGIN
	INSERT INTO useringroup values(amount,eid,user);
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `paygroupmoney`(IN id int)
BEGIN	
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

-- Dump completed on 2019-10-09 23:35:55
