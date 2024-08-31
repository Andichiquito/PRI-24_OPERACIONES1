-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: fabdb
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft` (
  `aircraftID` int NOT NULL AUTO_INCREMENT,
  `manufacturer` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `aircraftTypeID` int NOT NULL,
  `tailNumber` varchar(50) NOT NULL,
  `serialNumber` varchar(50) NOT NULL,
  `aircraftVersion` varchar(50) NOT NULL,
  `manufactureDate` date NOT NULL,
  `flightHours` int DEFAULT '0',
  `passengerNumber` int NOT NULL,
  `fuelCapacity` int NOT NULL,
  `grossWeight` decimal(10,2) DEFAULT NULL,
  `passengerCapacity` decimal(10,2) DEFAULT NULL,
  `originRegistry` varchar(20) DEFAULT NULL,
  `engineModel` varchar(25) DEFAULT NULL,
  `maintenanceHours` smallint DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`aircraftID`),
  KEY `aircraftTypeID` (`aircraftTypeID`),
  CONSTRAINT `aircraft_ibfk_1` FOREIGN KEY (`aircraftTypeID`) REFERENCES `aircraft_type` (`typeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircraft_performance_data`
--

DROP TABLE IF EXISTS `aircraft_performance_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft_performance_data` (
  `performanceDataID` int NOT NULL AUTO_INCREMENT,
  `aircraftID` int NOT NULL,
  `grossWeight` int NOT NULL,
  `temperature` int NOT NULL,
  `groundEffect` tinyint(1) DEFAULT NULL,
  `altitude` int DEFAULT NULL,
  `availableWeight` int DEFAULT NULL,
  `hoGe` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  `operationID` int DEFAULT NULL,
  PRIMARY KEY (`performanceDataID`),
  KEY `aircraftID` (`aircraftID`),
  KEY `operationID` (`operationID`),
  CONSTRAINT `aircraft_performance_data_ibfk_1` FOREIGN KEY (`aircraftID`) REFERENCES `aircraft` (`aircraftID`),
  CONSTRAINT `aircraft_performance_data_ibfk_2` FOREIGN KEY (`operationID`) REFERENCES `operation` (`operationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft_performance_data`
--

LOCK TABLES `aircraft_performance_data` WRITE;
/*!40000 ALTER TABLE `aircraft_performance_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `aircraft_performance_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircraft_requirement`
--

DROP TABLE IF EXISTS `aircraft_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft_requirement` (
  `requirementID` int NOT NULL AUTO_INCREMENT,
  `aircraftID` int NOT NULL,
  `missionTypeID` int NOT NULL,
  `flightDate` date NOT NULL,
  `platformTime` time DEFAULT NULL,
  `takeoffTime` time DEFAULT NULL,
  `requiredHours` time DEFAULT NULL,
  `fuelQuantity` int DEFAULT NULL,
  `missionEquipment` varchar(255) DEFAULT NULL,
  `refuelingNeeded` tinyint(1) DEFAULT NULL,
  `assignedTechnicians` text,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  `operationID` int DEFAULT NULL,
  PRIMARY KEY (`requirementID`),
  KEY `aircraftID` (`aircraftID`),
  KEY `missionTypeID` (`missionTypeID`),
  KEY `operationID` (`operationID`),
  CONSTRAINT `aircraft_requirement_ibfk_1` FOREIGN KEY (`aircraftID`) REFERENCES `aircraft` (`aircraftID`),
  CONSTRAINT `aircraft_requirement_ibfk_2` FOREIGN KEY (`missionTypeID`) REFERENCES `mission_type` (`missionTypeID`),
  CONSTRAINT `aircraft_requirement_ibfk_3` FOREIGN KEY (`operationID`) REFERENCES `operation` (`operationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft_requirement`
--

LOCK TABLES `aircraft_requirement` WRITE;
/*!40000 ALTER TABLE `aircraft_requirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `aircraft_requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircraft_type`
--

DROP TABLE IF EXISTS `aircraft_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft_type` (
  `typeID` int NOT NULL AUTO_INCREMENT,
  `typeName` varchar(50) NOT NULL,
  PRIMARY KEY (`typeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft_type`
--

LOCK TABLES `aircraft_type` WRITE;
/*!40000 ALTER TABLE `aircraft_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `aircraft_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert`
--

DROP TABLE IF EXISTS `alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert` (
  `alertID` int NOT NULL AUTO_INCREMENT,
  `aircraftID` int NOT NULL,
  `alertDate` date NOT NULL,
  `description` text,
  `priority` int DEFAULT NULL,
  `technicianID` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`alertID`),
  KEY `aircraftID` (`aircraftID`),
  KEY `technicianID` (`technicianID`),
  CONSTRAINT `alert_ibfk_1` FOREIGN KEY (`aircraftID`) REFERENCES `aircraft` (`aircraftID`),
  CONSTRAINT `alert_ibfk_2` FOREIGN KEY (`technicianID`) REFERENCES `technician` (`technicianID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert`
--

LOCK TABLES `alert` WRITE;
/*!40000 ALTER TABLE `alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit`
--

DROP TABLE IF EXISTS `audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `responsibleID` int NOT NULL,
  `observations` text,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `responsibleID` (`responsibleID`),
  CONSTRAINT `audit_ibfk_1` FOREIGN KEY (`responsibleID`) REFERENCES `technician` (`technicianID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit`
--

LOCK TABLES `audit` WRITE;
/*!40000 ALTER TABLE `audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buy_order`
--

DROP TABLE IF EXISTS `buy_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buy_order` (
  `buyOrderID` int NOT NULL AUTO_INCREMENT,
  `requestNumber` varchar(80) DEFAULT NULL,
  `applicationNumber` int DEFAULT NULL,
  `documentRoute` varchar(300) DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`buyOrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy_order`
--

LOCK TABLES `buy_order` WRITE;
/*!40000 ALTER TABLE `buy_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `buy_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `component` (
  `componentID` int NOT NULL AUTO_INCREMENT,
  `aircraftID` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `partNumber` int DEFAULT NULL,
  `installationDate` date DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`componentID`),
  KEY `aircraftID` (`aircraftID`),
  CONSTRAINT `component_ibfk_1` FOREIGN KEY (`aircraftID`) REFERENCES `aircraft` (`aircraftID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component`
--

LOCK TABLES `component` WRITE;
/*!40000 ALTER TABLE `component` DISABLE KEYS */;
/*!40000 ALTER TABLE `component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `departmentID` int NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(80) NOT NULL,
  PRIMARY KEY (`departmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exit_detail`
--

DROP TABLE IF EXISTS `exit_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exit_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `state` varchar(15) DEFAULT NULL,
  `lastUpdate` timestamp NULL DEFAULT NULL,
  `exit_orderID` int NOT NULL,
  `spareID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exit_orderID` (`exit_orderID`),
  KEY `spareID` (`spareID`),
  CONSTRAINT `exit_detail_ibfk_1` FOREIGN KEY (`exit_orderID`) REFERENCES `exit_order` (`id`),
  CONSTRAINT `exit_detail_ibfk_2` FOREIGN KEY (`spareID`) REFERENCES `component` (`componentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exit_detail`
--

LOCK TABLES `exit_detail` WRITE;
/*!40000 ALTER TABLE `exit_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `exit_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exit_order`
--

DROP TABLE IF EXISTS `exit_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exit_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `managerID` int DEFAULT NULL,
  `inventoryMan_ID` int DEFAULT NULL,
  `maintenanceID` int DEFAULT NULL,
  `registerDate` date NOT NULL,
  `aircraftID` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aircraftID` (`aircraftID`),
  CONSTRAINT `exit_order_ibfk_1` FOREIGN KEY (`aircraftID`) REFERENCES `aircraft` (`aircraftID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exit_order`
--

LOCK TABLES `exit_order` WRITE;
/*!40000 ALTER TABLE `exit_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `exit_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_crew`
--

DROP TABLE IF EXISTS `flight_crew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight_crew` (
  `flightCrewID` int NOT NULL AUTO_INCREMENT,
  `flightRequestID` int NOT NULL,
  `pilotID` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`flightCrewID`),
  KEY `flightRequestID` (`flightRequestID`),
  KEY `pilotID` (`pilotID`),
  CONSTRAINT `flight_crew_ibfk_1` FOREIGN KEY (`flightRequestID`) REFERENCES `flight_request` (`flightRequestID`),
  CONSTRAINT `flight_crew_ibfk_2` FOREIGN KEY (`pilotID`) REFERENCES `pilot` (`pilotID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_crew`
--

LOCK TABLES `flight_crew` WRITE;
/*!40000 ALTER TABLE `flight_crew` DISABLE KEYS */;
/*!40000 ALTER TABLE `flight_crew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_request`
--

DROP TABLE IF EXISTS `flight_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight_request` (
  `flightRequestID` int NOT NULL AUTO_INCREMENT,
  `aircraftID` int NOT NULL,
  `flightDate` date NOT NULL,
  `departureTime` time DEFAULT NULL,
  `arrivalTime` time DEFAULT NULL,
  `flightType` varchar(50) DEFAULT NULL,
  `missionEquipment` varchar(255) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  `operationID` int DEFAULT NULL,
  PRIMARY KEY (`flightRequestID`),
  KEY `aircraftID` (`aircraftID`),
  KEY `operationID` (`operationID`),
  CONSTRAINT `flight_request_ibfk_1` FOREIGN KEY (`aircraftID`) REFERENCES `aircraft` (`aircraftID`),
  CONSTRAINT `flight_request_ibfk_2` FOREIGN KEY (`operationID`) REFERENCES `operation` (`operationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_request`
--

LOCK TABLES `flight_request` WRITE;
/*!40000 ALTER TABLE `flight_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `flight_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hangar`
--

DROP TABLE IF EXISTS `hangar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hangar` (
  `hangarID` int NOT NULL AUTO_INCREMENT,
  `campusName` varchar(80) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`hangarID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hangar`
--

LOCK TABLES `hangar` WRITE;
/*!40000 ALTER TABLE `hangar` DISABLE KEYS */;
/*!40000 ALTER TABLE `hangar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inspection`
--

DROP TABLE IF EXISTS `inspection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inspection` (
  `inspectionID` int NOT NULL AUTO_INCREMENT,
  `technicianID` int NOT NULL,
  `inspectionDate` date NOT NULL,
  `inspectionSubtypeID` int NOT NULL,
  `result` varchar(100) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  `componentID` int NOT NULL,
  PRIMARY KEY (`inspectionID`),
  KEY `technicianID` (`technicianID`),
  KEY `inspectionSubtypeID` (`inspectionSubtypeID`),
  KEY `fk_component` (`componentID`),
  CONSTRAINT `fk_component` FOREIGN KEY (`componentID`) REFERENCES `component` (`componentID`),
  CONSTRAINT `inspection_ibfk_2` FOREIGN KEY (`technicianID`) REFERENCES `technician` (`technicianID`),
  CONSTRAINT `inspection_ibfk_3` FOREIGN KEY (`inspectionSubtypeID`) REFERENCES `inspection_subtype` (`inspectionSubtypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inspection`
--

LOCK TABLES `inspection` WRITE;
/*!40000 ALTER TABLE `inspection` DISABLE KEYS */;
/*!40000 ALTER TABLE `inspection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inspection_subtype`
--

DROP TABLE IF EXISTS `inspection_subtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inspection_subtype` (
  `inspectionSubtypeID` int NOT NULL AUTO_INCREMENT,
  `inspectionTypeID` int NOT NULL,
  `subtypeName` varchar(100) NOT NULL,
  PRIMARY KEY (`inspectionSubtypeID`),
  KEY `inspectionTypeID` (`inspectionTypeID`),
  CONSTRAINT `inspection_subtype_ibfk_1` FOREIGN KEY (`inspectionTypeID`) REFERENCES `inspection_type` (`inspectionTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inspection_subtype`
--

LOCK TABLES `inspection_subtype` WRITE;
/*!40000 ALTER TABLE `inspection_subtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `inspection_subtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inspection_type`
--

DROP TABLE IF EXISTS `inspection_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inspection_type` (
  `inspectionTypeID` int NOT NULL AUTO_INCREMENT,
  `typeName` varchar(50) NOT NULL,
  PRIMARY KEY (`inspectionTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inspection_type`
--

LOCK TABLES `inspection_type` WRITE;
/*!40000 ALTER TABLE `inspection_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `inspection_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stock` int NOT NULL,
  `registerDate` date NOT NULL,
  `spareID` int DEFAULT NULL,
  `storageID` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `spareID` (`spareID`),
  KEY `storageID` (`storageID`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`spareID`) REFERENCES `component` (`componentID`),
  CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`storageID`) REFERENCES `storage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `military_rank`
--

DROP TABLE IF EXISTS `military_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `military_rank` (
  `rankID` int NOT NULL AUTO_INCREMENT,
  `rankName` varchar(50) NOT NULL,
  PRIMARY KEY (`rankID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `military_rank`
--

LOCK TABLES `military_rank` WRITE;
/*!40000 ALTER TABLE `military_rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `military_rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission_type`
--

DROP TABLE IF EXISTS `mission_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission_type` (
  `missionTypeID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`missionTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission_type`
--

LOCK TABLES `mission_type` WRITE;
/*!40000 ALTER TABLE `mission_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mission_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modification`
--

DROP TABLE IF EXISTS `modification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modification` (
  `modificationID` int NOT NULL AUTO_INCREMENT,
  `aircraftID` int NOT NULL,
  `componentID` int DEFAULT NULL,
  `technicianID` int NOT NULL,
  `modificationDate` date NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`modificationID`),
  KEY `aircraftID` (`aircraftID`),
  KEY `technicianID` (`technicianID`),
  CONSTRAINT `modification_ibfk_1` FOREIGN KEY (`aircraftID`) REFERENCES `aircraft` (`aircraftID`),
  CONSTRAINT `modification_ibfk_2` FOREIGN KEY (`technicianID`) REFERENCES `technician` (`technicianID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modification`
--

LOCK TABLES `modification` WRITE;
/*!40000 ALTER TABLE `modification` DISABLE KEYS */;
/*!40000 ALTER TABLE `modification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation`
--

DROP TABLE IF EXISTS `operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operation` (
  `operationID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `statusOperation` varchar(50) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`operationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation`
--

LOCK TABLES `operation` WRITE;
/*!40000 ALTER TABLE `operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilot`
--

DROP TABLE IF EXISTS `pilot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pilot` (
  `pilotID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `middleName` varchar(50) DEFAULT NULL,
  `birthDate` date NOT NULL,
  `gender` char(1) NOT NULL,
  `militaryRankID` int NOT NULL,
  `roleID` int NOT NULL,
  `registrationNumber` varchar(10) NOT NULL,
  `identificationNumber` varchar(15) NOT NULL,
  `mobileNumber` varchar(8) NOT NULL,
  `flightHours` int DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pilotID`),
  KEY `militaryRankID` (`militaryRankID`),
  KEY `roleID` (`roleID`),
  CONSTRAINT `pilot_ibfk_1` FOREIGN KEY (`militaryRankID`) REFERENCES `military_rank` (`rankID`),
  CONSTRAINT `pilot_ibfk_2` FOREIGN KEY (`roleID`) REFERENCES `role` (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilot`
--

LOCK TABLES `pilot` WRITE;
/*!40000 ALTER TABLE `pilot` DISABLE KEYS */;
/*!40000 ALTER TABLE `pilot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planning`
--

DROP TABLE IF EXISTS `planning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planning` (
  `id` int NOT NULL AUTO_INCREMENT,
  `partID` int NOT NULL,
  `quantityInStorage` int NOT NULL,
  `storageCapacity` int DEFAULT NULL,
  `costInBolivianos` float DEFAULT NULL,
  `state` varchar(50) NOT NULL,
  `partType` varchar(100) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partID` (`partID`),
  CONSTRAINT `planning_ibfk_1` FOREIGN KEY (`partID`) REFERENCES `component` (`componentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planning`
--

LOCK TABLES `planning` WRITE;
/*!40000 ALTER TABLE `planning` DISABLE KEYS */;
/*!40000 ALTER TABLE `planning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_assurance`
--

DROP TABLE IF EXISTS `quality_assurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quality_assurance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `partID` int NOT NULL,
  `quantityInStorage` int NOT NULL,
  `expirationDate` date DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partID` (`partID`),
  CONSTRAINT `quality_assurance_ibfk_1` FOREIGN KEY (`partID`) REFERENCES `component` (`componentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_assurance`
--

LOCK TABLES `quality_assurance` WRITE;
/*!40000 ALTER TABLE `quality_assurance` DISABLE KEYS */;
/*!40000 ALTER TABLE `quality_assurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_condition_type`
--

DROP TABLE IF EXISTS `risk_condition_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_condition_type` (
  `conditionTypeID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`conditionTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_condition_type`
--

LOCK TABLES `risk_condition_type` WRITE;
/*!40000 ALTER TABLE `risk_condition_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk_condition_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_factor`
--

DROP TABLE IF EXISTS `risk_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_factor` (
  `riskFactorID` int NOT NULL AUTO_INCREMENT,
  `factorName` varchar(100) NOT NULL,
  PRIMARY KEY (`riskFactorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_factor`
--

LOCK TABLES `risk_factor` WRITE;
/*!40000 ALTER TABLE `risk_factor` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk_factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_factor_option`
--

DROP TABLE IF EXISTS `risk_factor_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_factor_option` (
  `optionID` int NOT NULL AUTO_INCREMENT,
  `riskFactorID` int NOT NULL,
  `optionName` varchar(100) NOT NULL,
  `dayValue` int DEFAULT NULL,
  `nightValue` int DEFAULT NULL,
  `svgValue` int DEFAULT NULL,
  PRIMARY KEY (`optionID`),
  KEY `riskFactorID` (`riskFactorID`),
  CONSTRAINT `risk_factor_option_ibfk_1` FOREIGN KEY (`riskFactorID`) REFERENCES `risk_factor` (`riskFactorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_factor_option`
--

LOCK TABLES `risk_factor_option` WRITE;
/*!40000 ALTER TABLE `risk_factor_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk_factor_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_matrix`
--

DROP TABLE IF EXISTS `risk_matrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_matrix` (
  `riskMatrixID` int NOT NULL AUTO_INCREMENT,
  `flightRequestID` int NOT NULL,
  `conditionTypeID` int NOT NULL,
  `overallRiskScore` int DEFAULT NULL,
  `riskAssessment` text,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  `operationID` int DEFAULT NULL,
  PRIMARY KEY (`riskMatrixID`),
  KEY `flightRequestID` (`flightRequestID`),
  KEY `conditionTypeID` (`conditionTypeID`),
  KEY `operationID` (`operationID`),
  CONSTRAINT `risk_matrix_ibfk_1` FOREIGN KEY (`flightRequestID`) REFERENCES `flight_request` (`flightRequestID`),
  CONSTRAINT `risk_matrix_ibfk_2` FOREIGN KEY (`conditionTypeID`) REFERENCES `risk_condition_type` (`conditionTypeID`),
  CONSTRAINT `risk_matrix_ibfk_3` FOREIGN KEY (`operationID`) REFERENCES `operation` (`operationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_matrix`
--

LOCK TABLES `risk_matrix` WRITE;
/*!40000 ALTER TABLE `risk_matrix` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk_matrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_matrix_selection`
--

DROP TABLE IF EXISTS `risk_matrix_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_matrix_selection` (
  `selectionID` int NOT NULL AUTO_INCREMENT,
  `riskMatrixID` int NOT NULL,
  `riskFactorOptionID` int NOT NULL,
  `selectedValue` int DEFAULT NULL,
  PRIMARY KEY (`selectionID`),
  KEY `riskMatrixID` (`riskMatrixID`),
  KEY `riskFactorOptionID` (`riskFactorOptionID`),
  CONSTRAINT `risk_matrix_selection_ibfk_1` FOREIGN KEY (`riskMatrixID`) REFERENCES `risk_matrix` (`riskMatrixID`),
  CONSTRAINT `risk_matrix_selection_ibfk_2` FOREIGN KEY (`riskFactorOptionID`) REFERENCES `risk_factor_option` (`optionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_matrix_selection`
--

LOCK TABLES `risk_matrix_selection` WRITE;
/*!40000 ALTER TABLE `risk_matrix_selection` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk_matrix_selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `roleID` int NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_notification`
--

DROP TABLE IF EXISTS `state_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state_notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `partID` int NOT NULL,
  `expirationDate` date NOT NULL,
  `state` varchar(50) NOT NULL,
  `quantityInStorage` int NOT NULL,
  `assignedVehicle` varchar(255) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partID` (`partID`),
  CONSTRAINT `state_notification_ibfk_1` FOREIGN KEY (`partID`) REFERENCES `component` (`componentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_notification`
--

LOCK TABLES `state_notification` WRITE;
/*!40000 ALTER TABLE `state_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `state_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `storageName` varchar(80) NOT NULL,
  `hangarID` int DEFAULT NULL,
  `departmentID` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departmentID` (`departmentID`),
  KEY `hangarID` (`hangarID`),
  CONSTRAINT `storage_ibfk_1` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`),
  CONSTRAINT `storage_ibfk_2` FOREIGN KEY (`hangarID`) REFERENCES `hangar` (`hangarID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage`
--

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technician`
--

DROP TABLE IF EXISTS `technician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `technician` (
  `technicianID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `middleName` varchar(50) DEFAULT NULL,
  `specialty` varchar(40) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`technicianID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technician`
--

LOCK TABLES `technician` WRITE;
/*!40000 ALTER TABLE `technician` DISABLE KEYS */;
/*!40000 ALTER TABLE `technician` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-16  1:59:01
