CREATE DATABASE  IF NOT EXISTS `electrogrid` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `electrogrid`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: electrogrid
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `billId` int NOT NULL AUTO_INCREMENT,
  `billCode` varchar(45) NOT NULL,
  `customerID` int NOT NULL,
  `month` varchar(45) NOT NULL,
  `units` int NOT NULL,
  `KWHcharge` decimal(7,2) NOT NULL,
  `fixCharge` decimal(7,2) NOT NULL,
  `rebate` decimal(7,2) NOT NULL,
  `total` decimal(7,2) NOT NULL,
  PRIMARY KEY (`billId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,'EG003',3,'April',150,1620.00,500.00,0.00,2120.00),(2,'EG003',3,'April',150,1620.00,500.00,0.00,2120.00),(3,'EG004',4,'April',150,1620.00,500.00,0.00,2120.00),(4,'EG005',4,'April',150,1620.00,500.00,0.00,2120.00);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerID` int NOT NULL AUTO_INCREMENT,
  `customerName` varchar(45) NOT NULL,
  `customerAddress` varchar(45) NOT NULL,
  `customerEmail` varchar(45) NOT NULL,
  `customerContact` varchar(45) NOT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Kamal Perera','Maharagama Colombo','kamal@gmail.com','0701741851'),(2,'Pubudu Amarasekara','Nugegoda Colombo','pubudu@gmail.com','0759041884'),(3,'Amandi Perera','Colombo 07','amandi@gmail.com','0775647123');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employeeNumber` int NOT NULL AUTO_INCREMENT,
  `employeeName` varchar(20) NOT NULL,
  `employeeEmail` varchar(30) NOT NULL,
  `empAge` int NOT NULL,
  `password` varchar(20) NOT NULL,
  `phone` int NOT NULL,
  `nic` varchar(10) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `address` varchar(45) NOT NULL,
  PRIMARY KEY (`employeeNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (47,'Himasha','himasha%40gmail.com',32,'aGltMjEyMQ%3D%3D',778564826,'895849245v','Female','Gampaha'),(50,'Chamindu','chamindu%40gmail.com',19,'MTJjaGFtdQ%3D%3D',702974127,'864561786v','Male','colombo'),(55,'Amali','amali@gmail.com',27,'QUFxZmd2Z2c=',705413555,'816754648v','Female','colombo, Nugegoda'),(68,'asc','asc',34,'sdc',23,'asc','sac','asc'),(69,'reg','egeg',4,'weg',43,'wef','wef','wef');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `itemID` int NOT NULL AUTO_INCREMENT,
  `itemCode` varchar(45) NOT NULL,
  `itemName` varchar(45) NOT NULL,
  `itemPrice` decimal(8,2) NOT NULL,
  `itemDesc` varchar(45) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (2,'11','Tableaaaaaa vvvvvvvvvvvvv',100.00,'aaa');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `paymentNo` int NOT NULL AUTO_INCREMENT,
  `customerID` varchar(10) NOT NULL,
  `customerName` varchar(20) NOT NULL,
  `paymentType` varchar(20) NOT NULL,
  `cardNo` varchar(45) NOT NULL,
  `paymentAmount` varchar(20) NOT NULL,
  `paymentDate` varchar(15) NOT NULL,
  `billNo` int NOT NULL,
  PRIMARY KEY (`paymentNo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'cus123','Banauka','Card','12345','500','2020-15-15',4567),(2,'cus123','Hirushan','Card','72315','500','2020-15-15',4567),(3,'5000','Perera','credit card','700500','5000','2022-05-01',13),(4,'5000','Perera','credit card','700500','5000','2022-05-01',13);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-15 18:22:18
