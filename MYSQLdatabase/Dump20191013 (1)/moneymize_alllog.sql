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
INSERT INTO `alllog` VALUES (150,'You created group event 150','7709833124'),(37,'You participated in group event 150','7709833124'),(37,'You participated in group event 150','7709833124'),(37,'You participated in group event 150','7709833124'),(123,'You spent money on Lunch','7709833124'),(123,'You spent money on Lunch','7709833124'),(120,'You spent money on Dinner','7709833124'),(100,'You created group event 200','7709833124'),(50,'You participated in group event 200','7709833124'),(200,'You Borrowed money from omkar deshpande','7709833124'),(200,'You lent money to omkar deshpande','7709833124'),(200,'You paid pending amount to omkar deshpande','7709833124'),(200,'omkar deshpande paid your pending amount','7709833124'),(798,'You created group event 200','7709833124'),(789,'You created group event 200','7709833124'),(123,'You participated in group event chai party','7709833124'),(897,'You created group event 150',NULL),(152,'You created group event 152',NULL),(111,'You created group event 111',NULL),(258,'You created group event 258','7709833124'),(86,'You participated in group event 258','7709833124'),(86,'You participated in group event 258','2222222222'),(200,'You Borrowed money from omkar deshpande','7721071250'),(200,'You lent money to shubham','2525252525'),(200,'You paid pending amount to omkar deshpande','7721071250'),(200,'omkar deshpande paid your pending amount','2525252525'),(400,'You created group event project related something','7721071250'),(100,'You participated in group event project related something','1111111111'),(100,'You participated in group event project related something','2525252525'),(100,'You participated in group event project related something','7709833124'),(300,'You created group event project','7721071250'),(200,'You created group event projectre','7721071250'),(100,'You spent money on Breakfast','7721071250'),(270,'You spent money on Lunch','7721071250'),(50,'You spent money on Evening Breakfast','7721071250'),(500,'You Borrowed money from shubham','2525252525'),(500,'You lent money to omkar deshpande','7721071250'),(500,'You paid pending amount to shubham','2525252525'),(500,'shubham paid your pending amount','7721071250'),(500,'You Borrowed money from shubham','1111111111'),(500,'You lent money to omkar','7721071250'),(500,'You paid pending amount to shubham','1111111111'),(500,'shubham paid your pending amount','7721071250'),(500,'You Borrowed money from shubham','2525252525'),(500,'You lent money to omkar deshpande','7721071250'),(500,'You paid pending amount to shubham','2525252525'),(500,'shubham paid your pending amount','7721071250'),(270,'You spent money on Breakfast','2525252525'),(500,'You Borrowed money from shubham','2525252525'),(500,'You lent money to omkar deshpande','7721071250'),(500,'You Borrowed money from omkar deshpande','7721071250'),(500,'You lent money to shubham','2525252525'),(500,'You paid pending amount to omkar deshpande','7721071250'),(500,'omkar deshpande paid your pending amount','2525252525'),(500,'You paid pending amount to shubham','2525252525'),(500,'shubham paid your pending amount','7721071250'),(500,'You Borrowed money from omkar deshpande','7721071250'),(500,'You lent money to shubham','2525252525'),(500,'You paid pending amount to omkar deshpande','7721071250'),(500,'omkar deshpande paid your pending amount','2525252525'),(500,'You Borrowed money from shubham','2525252525'),(500,'You lent money to omkar deshpande','7721071250'),(500,'You paid pending amount to shubham','2525252525'),(500,'shubham paid your pending amount','7721071250'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','2525252525'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','2525252525'),(500,'You participated in group event 1500','7721071250'),(500,'You participated in group event 1500','2525252525'),(500,'You participated in group event 1500','7721071250');
/*!40000 ALTER TABLE `alllog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-13 16:05:29
