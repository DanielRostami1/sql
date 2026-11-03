-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: konferenz
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `referent`
--

DROP TABLE IF EXISTS `referent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referent` (
  `ReferentID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Organisation` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ReferentID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referent`
--

LOCK TABLES `referent` WRITE;
/*!40000 ALTER TABLE `referent` DISABLE KEYS */;
INSERT INTO `referent` VALUES (1,'Alli Sadafi','alli.sadafi@gmail.com','Siemens'),(2,'Ebrahim Pori','ebrahim.pori@gmail.com','Siemens');
/*!40000 ALTER TABLE `referent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teilnehmer`
--

DROP TABLE IF EXISTS `teilnehmer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teilnehmer` (
  `TeilnehmerID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Organisation` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`TeilnehmerID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teilnehmer`
--

LOCK TABLES `teilnehmer` WRITE;
/*!40000 ALTER TABLE `teilnehmer` DISABLE KEYS */;
INSERT INTO `teilnehmer` VALUES (1,'Anna Huber','ann.hubber@example.com','AMS'),(2,'Berger','max.berger@example.com','SZF ');
/*!40000 ALTER TABLE `teilnehmer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teilnehmer_thema`
--

DROP TABLE IF EXISTS `teilnehmer_thema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teilnehmer_thema` (
  `TeilnehmerID` int NOT NULL,
  `ThemaID` int NOT NULL,
  PRIMARY KEY (`TeilnehmerID`,`ThemaID`),
  KEY `ThemaID` (`ThemaID`),
  CONSTRAINT `teilnehmer_thema_ibfk_1` FOREIGN KEY (`TeilnehmerID`) REFERENCES `teilnehmer` (`TeilnehmerID`),
  CONSTRAINT `teilnehmer_thema_ibfk_2` FOREIGN KEY (`ThemaID`) REFERENCES `thema` (`ThemaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teilnehmer_thema`
--

LOCK TABLES `teilnehmer_thema` WRITE;
/*!40000 ALTER TABLE `teilnehmer_thema` DISABLE KEYS */;
INSERT INTO `teilnehmer_thema` VALUES (1,1),(2,1),(1,2),(2,2);
/*!40000 ALTER TABLE `teilnehmer_thema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thema`
--

DROP TABLE IF EXISTS `thema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thema` (
  `ThemaID` int NOT NULL AUTO_INCREMENT,
  `Titel` varchar(150) NOT NULL,
  `Kurzbeschreibung` varchar(500) DEFAULT NULL,
  `ReferentID` int NOT NULL,
  PRIMARY KEY (`ThemaID`),
  KEY `ReferentID` (`ReferentID`),
  CONSTRAINT `thema_ibfk_1` FOREIGN KEY (`ReferentID`) REFERENCES `referent` (`ReferentID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thema`
--

LOCK TABLES `thema` WRITE;
/*!40000 ALTER TABLE `thema` DISABLE KEYS */;
INSERT INTO `thema` VALUES (1,'Datenbanken Grundlagen','Einführung in relationale Datenbanken',1),(2,'IT-Sicherheit','Passwörter, Phishing und Schutzmaßnahmen',2);
/*!40000 ALTER TABLE `thema` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-02 14:47:40
