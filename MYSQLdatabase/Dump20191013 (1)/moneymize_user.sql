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
INSERT INTO `user` VALUES ('1111111111','sdfsd','omkar',5000,'pass'),('1234567890','shubhamdarak37@gmil.com','shubham',5000,'1234'),('2222222222','omkar@gmail.com','omkar',5000,'password'),('2525252525','deshpandeomkar77@gmail.com','omkar deshpande',3500,'123456'),('7350766736','atharva.chavan29@gmail.com','atharva chvan',5000,'atharva123'),('7350766738','gaikwadsampada8@gmail.com','atharva',5000,'sam29'),('770983312','deshpandeomkar77@gmail.com','omkar deshpande',5000,'123456'),('7709833124','deshpandeomkar77@gmail.com','omkar deshpande',5000,'123456'),('7721065893','shubhamdarak37@gmil.com','atharva',5000,'at'),('7721071250','shubhamdarak37@gmil.com','shubham',4500,'sd'),('7721088542','shubhamdarak37@gmil.com','omkar',5000,'omkar'),('7789456123','shubhamdarak37@gmil.com','shubham',5000,'sd'),('7972663093','dschandak@gmail.com','Devesh Chandak',5000,'devesh_111'),('9876543210','user@gmail.com','usera',5000,'9876543210');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-13 16:05:39
