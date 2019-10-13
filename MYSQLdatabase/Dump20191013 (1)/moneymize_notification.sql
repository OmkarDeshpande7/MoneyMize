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
INSERT INTO `notification` VALUES ('2019-10-03 20:01:29','shubham(7721071250) has requested that you had borrowed amount :500','2525252525'),('2019-10-03 20:01:54','omkar deshpande(2525252525) has accpted your request that you had lend amount :500toomkar deshpande','7721071250'),('2019-10-03 20:03:54','omkar deshpande(2525252525) has paid you amount :500','7721071250'),('2019-10-03 21:47:24','shubham(7721071250) has requested that you had borrowed amount :500','2525252525'),('2019-10-03 21:47:59','omkar deshpande(2525252525) has accpted your request that you had lend amount :500toomkar deshpande','7721071250'),('2019-10-03 21:48:40','omkar deshpande(2525252525) has paid you amount :500','7721071250'),('2019-10-09 09:10:04','omkar deshpande(2525252525) has requested that you had borrowed amount :100','7709833124'),('2019-10-09 09:10:14','omkar deshpande(2525252525) has requested that you had borrowed amount :200','7709833124'),('2019-10-09 09:10:30','omkar deshpande(2525252525) has requested that you had borrowed amount :123','7709833124'),('2019-10-09 09:11:21','omkar deshpande(null) has accpted your request that you had lend amount :123toomkar deshpande','2525252525'),('2019-10-09 09:39:33','omkar deshpande(2525252525) has requested that you had borrowed amount :200','7721071250'),('2019-10-09 09:45:16','omkar deshpande(2525252525) has requested that you had borrowed amount :200','7709833124'),('2019-10-09 09:45:48','omkar deshpande(7709833124) has rejected your request that you had lend amount :200toomkar deshpande','2525252525'),('2019-10-09 09:45:59','omkar deshpande(7709833124) has rejected your request that you had lend amount :200toomkar deshpande','2525252525'),('2019-10-09 09:46:15','omkar deshpande(7709833124) has rejected your request that you had lend amount :100toomkar deshpande','2525252525'),('2019-10-09 09:46:24','omkar deshpande(2525252525) has requested that you had borrowed amount :200','7709833124'),('2019-10-09 09:58:41','omkar(1111111111) has requested that you had borrowed amount :10','7709833124'),('2019-10-09 10:00:26','omkar(1111111111) has requested that you had borrowed amount :100','7709833124'),('2019-10-09 10:04:25','omkar(1111111111) has requested that you had borrowed amount :11','7709833124'),('2019-10-09 10:10:10','omkar deshpande(7709833124) has rejected your request that you had lend amount :200toomkar deshpande','2525252525'),('2019-10-09 10:10:10','omkar deshpande(7709833124) has rejected your request that you had lend amount :10toomkar deshpande','1111111111'),('2019-10-09 10:10:11','omkar deshpande(7709833124) has rejected your request that you had lend amount :100toomkar deshpande','1111111111'),('2019-10-09 10:10:11','omkar deshpande(7709833124) has rejected your request that you had lend amount :11toomkar deshpande','1111111111'),('2019-10-09 10:10:26','omkar(1111111111) has requested that you had borrowed amount :100','7709833124'),('2019-10-09 10:11:13','omkar deshpande(null) has accpted your request that you had lend amount :100toomkar deshpande','1111111111'),('2019-10-09 10:13:53','omkar deshpande(7709833124) has paid you amount :100','1111111111'),('2019-10-09 10:13:55','omkar deshpande(7709833124) has paid you amount :100','1111111111'),('2019-10-09 10:13:58','omkar deshpande(7709833124) has paid you amount :100','1111111111'),('2019-10-09 10:14:02','omkar deshpande(7709833124) has paid you amount :123','2525252525'),('2019-10-09 10:14:14','omkar deshpande(7709833124) has paid you amount :100','1111111111'),('2019-10-09 10:27:58','omkar deshpande(7709833124) has paid you amount :123','2525252525'),('2019-10-09 11:18:16','omkar deshpande(7709833124) has paid you amount :100','1111111111'),('2019-10-09 11:18:25','omkar deshpande(7709833124) has paid you amount :123','2525252525'),('2019-10-09 11:58:42','omkar(1111111111) has requested that you had borrowed amount :111','7709833124'),('2019-10-09 11:59:54','omkar deshpande(null) has accpted your request that you had lend amount :111toomkar deshpande','1111111111'),('2019-10-09 12:00:02','omkar deshpande(7709833124) has paid you amount :111','1111111111'),('2019-10-09 12:00:43','omkar deshpande(7709833124) has paid you amount :111','1111111111'),('2019-10-09 12:01:00','omkar deshpande(7709833124) has requested that you had borrowed amount :111','2525252525'),('2019-10-09 12:01:15','omkar deshpande(null) has accpted your request that you had lend amount :111toomkar deshpande','7709833124'),('2019-10-09 12:01:17','omkar deshpande(2525252525) has paid you amount :111','7709833124'),('2019-10-10 10:56:34','omkar deshpande(7709833124) has requested that you had borrowed amount :200','7709833124'),('2019-10-10 10:56:50','omkar deshpande(null) has accpted your request that you had lend amount :200toomkar deshpande','7709833124'),('2019-10-10 10:56:53','omkar deshpande(7709833124) has paid you amount :200','7709833124'),('2019-10-11 11:29:23','shubham(null) has accpted your request that you had lend amount :200toshubham','2525252525'),('2019-10-11 11:29:27','shubham(7721071250) has paid you amount :200','2525252525'),('2019-10-11 23:42:17','shubham(7721071250) has requested that you had borrowed amount :500','2525252525'),('2019-10-11 23:43:09','omkar deshpande(null) has accpted your request that you had lend amount :500toomkar deshpande','7721071250'),('2019-10-11 23:43:13','omkar deshpande(2525252525) has paid you amount :500','7721071250'),('2019-10-11 23:48:33','shubham(7721071250) has requested that you had borrowed amount :500','1111111111'),('2019-10-11 23:48:49','omkar(null) has accpted your request that you had lend amount :500toomkar','7721071250'),('2019-10-11 23:48:51','omkar(1111111111) has paid you amount :500','7721071250'),('2019-10-11 23:49:23','shubham(7721071250) has requested that you had borrowed amount :500','2525252525'),('2019-10-11 23:49:45','omkar deshpande(2525252525) has rejected your request that you had lend amount :500toomkar deshpande','7721071250'),('2019-10-11 23:49:58','shubham(7721071250) has requested that you had borrowed amount :500','2525252525'),('2019-10-11 23:50:08','omkar deshpande(null) has accpted your request that you had lend amount :500toomkar deshpande','7721071250'),('2019-10-11 23:50:09','omkar deshpande(2525252525) has paid you amount :500','7721071250'),('2019-10-12 10:29:59','shubham(7721071250) has requested that you had borrowed amount :500','2525252525'),('2019-10-12 10:30:13','omkar deshpande(null) has accpted your request that you had lend amount :500toomkar deshpande','7721071250'),('2019-10-12 10:33:54','omkar deshpande(2525252525) has requested that you had borrowed amount :500','7721071250'),('2019-10-12 10:39:42','shubham(null) has accpted your request that you had lend amount :500toshubham','2525252525'),('2019-10-12 10:39:48','shubham(7721071250) has paid you amount :500','2525252525'),('2019-10-12 10:40:50','shubham(7721071250) has requested that you had borrowed amount :500','2525252525'),('2019-10-12 10:49:46','omkar deshpande(2525252525) has paid you amount :500','7721071250'),('2019-10-12 10:50:00','omkar deshpande(2525252525) has requested that you had borrowed amount :500','7721071250'),('2019-10-12 10:50:23','shubham(null) has accpted your request that you had lend amount :500toshubham','2525252525'),('2019-10-12 23:12:49','shubham(7721071250) has paid you amount :500','2525252525'),('2019-10-13 01:47:11','shubham(7721071250) has requested that you had borrowed amount :500','2525252525'),('2019-10-13 01:47:27','omkar(1111111111) has requested that you had borrowed amount :500','2525252525'),('2019-10-13 01:47:44','omkar deshpande(null) has accpted your request that you had lend amount :500toomkar deshpande','7721071250'),('2019-10-13 01:47:50','omkar deshpande(2525252525) has rejected your request that you had lend amount :500toomkar deshpande','1111111111'),('2019-10-13 01:47:58','omkar deshpande(2525252525) has paid you amount :500','7721071250');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-13 16:05:32
