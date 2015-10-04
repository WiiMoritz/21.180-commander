-- MySQL dump 10.13  Distrib 5.5.42, for Linux (x86_64)
--
-- Host: localhost    Database: asupcouk_asup
-- ------------------------------------------------------
-- Server version	5.5.42-cll

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sp_border`
--

DROP TABLE IF EXISTS `sp_border`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_border` (
  `terrno_from` int(11) NOT NULL DEFAULT '0',
  `terrno_to` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`terrno_from`,`terrno_to`),
  KEY `sp_border_to` (`terrno_to`),
  KEY `sp_border_from` (`terrno_from`),
  CONSTRAINT `sp_border_from` FOREIGN KEY (`terrno_from`) REFERENCES `sp_places` (`terrno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sp_border_to` FOREIGN KEY (`terrno_to`) REFERENCES `sp_places` (`terrno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_border`
--

LOCK TABLES `sp_border` WRITE;
/*!40000 ALTER TABLE `sp_border` DISABLE KEYS */;
INSERT INTO `sp_border` (`terrno_from`, `terrno_to`) VALUES (53,1),(6,2),(7,2),(53,2),(54,2),(4,3),(36,3),(37,3),(54,3),(57,3),(58,3),(3,4),(5,4),(53,4),(54,4),(56,4),(57,4),(4,5),(56,5),(57,5),(2,6),(7,6),(9,6),(55,6),(2,7),(6,7),(8,7),(9,7),(10,7),(37,7),(38,7),(54,7),(7,8),(10,8),(13,8),(14,8),(38,8),(39,8),(44,8),(59,8),(6,9),(7,9),(10,9),(11,9),(55,9),(7,10),(8,10),(9,10),(11,10),(12,10),(13,10),(65,10),(66,10),(9,11),(10,11),(66,11),(10,12),(13,12),(65,12),(8,13),(10,13),(12,13),(14,13),(15,13),(65,13),(8,14),(13,14),(15,14),(16,14),(44,14),(45,14),(13,15),(14,15),(16,15),(65,15),(14,16),(15,16),(45,16),(46,16),(47,16),(64,16),(18,17),(19,17),(34,17),(35,17),(89,17),(17,18),(19,18),(20,18),(89,18),(90,18),(17,19),(18,19),(20,19),(35,19),(60,19),(91,19),(18,20),(19,20),(90,20),(91,20),(22,21),(23,21),(71,21),(72,21),(73,21),(21,22),(23,22),(24,22),(73,22),(74,22),(21,23),(22,23),(24,23),(72,23),(22,24),(23,24),(33,24),(72,24),(74,24),(75,24),(30,25),(31,25),(78,25),(27,26),(31,26),(33,26),(77,26),(78,26),(26,27),(28,27),(31,27),(32,27),(33,27),(74,27),(27,28),(32,28),(74,28),(76,28),(79,28),(30,29),(80,29),(25,30),(29,30),(31,30),(80,30),(25,31),(26,31),(27,31),(30,31),(32,31),(78,31),(80,31),(27,32),(28,32),(31,32),(79,32),(80,32),(24,33),(26,33),(27,33),(74,33),(75,33),(17,34),(35,34),(57,34),(17,35),(19,35),(34,35),(60,35),(3,36),(37,36),(38,36),(58,36),(59,36),(3,37),(7,37),(36,37),(38,37),(54,37),(7,38),(8,38),(36,38),(37,38),(59,38),(8,39),(40,39),(42,39),(43,39),(44,39),(58,39),(59,39),(39,40),(41,40),(42,40),(58,40),(60,40),(40,41),(42,41),(60,41),(61,41),(39,42),(40,42),(41,42),(43,42),(92,42),(39,43),(42,43),(44,43),(92,43),(8,44),(14,44),(39,44),(43,44),(45,44),(61,44),(14,45),(16,45),(44,45),(46,45),(61,45),(62,45),(16,46),(45,46),(47,46),(62,46),(63,46),(16,47),(46,47),(63,47),(64,47),(65,48),(66,48),(67,48),(62,49),(63,49),(68,49),(51,50),(68,50),(69,50),(50,51),(68,51),(70,51),(70,52),(1,53),(2,53),(4,53),(54,53),(55,53),(56,53),(81,53),(2,54),(3,54),(4,54),(7,54),(37,54),(53,54),(6,55),(9,55),(53,55),(4,56),(5,56),(53,56),(57,56),(81,56),(3,57),(4,57),(5,57),(34,57),(56,57),(58,57),(60,57),(81,57),(82,57),(3,58),(36,58),(39,58),(40,58),(57,58),(59,58),(60,58),(8,59),(36,59),(38,59),(39,59),(58,59),(19,60),(35,60),(40,60),(41,60),(57,60),(58,60),(61,60),(84,60),(91,60),(41,61),(44,61),(45,61),(60,61),(62,61),(84,61),(92,61),(45,62),(46,62),(49,62),(61,62),(63,62),(68,62),(84,62),(46,63),(47,63),(49,63),(62,63),(64,63),(87,63),(16,64),(47,64),(63,64),(65,64),(87,64),(10,65),(12,65),(13,65),(15,65),(48,65),(64,65),(66,65),(67,65),(87,65),(88,65),(10,66),(11,66),(48,66),(65,66),(67,66),(88,66),(48,67),(65,67),(66,67),(88,67),(49,68),(50,68),(51,68),(62,68),(69,68),(70,68),(84,68),(86,68),(87,68),(50,69),(68,69),(84,69),(85,69),(51,70),(52,70),(68,70),(85,70),(86,70),(21,71),(73,71),(83,71),(21,72),(23,72),(24,72),(75,72),(86,72),(87,72),(21,73),(22,73),(71,73),(82,73),(83,73),(22,74),(24,74),(27,74),(28,74),(33,74),(76,74),(82,74),(24,75),(33,75),(72,75),(77,75),(87,75),(28,76),(74,76),(79,76),(81,76),(82,76),(26,77),(75,77),(78,77),(87,77),(88,77),(25,78),(26,78),(31,78),(77,78),(88,78),(28,79),(32,79),(76,79),(80,79),(81,79),(29,80),(30,80),(31,80),(32,80),(79,80),(81,80),(53,81),(56,81),(57,81),(76,81),(79,81),(80,81),(82,81),(57,82),(73,82),(74,82),(76,82),(81,82),(83,82),(89,82),(71,83),(73,83),(82,83),(84,83),(86,83),(89,83),(90,83),(60,84),(61,84),(62,84),(68,84),(69,84),(83,84),(85,84),(90,84),(91,84),(69,85),(70,85),(84,85),(86,85),(68,86),(70,86),(72,86),(83,86),(85,86),(87,86),(63,87),(64,87),(65,87),(68,87),(72,87),(75,87),(77,87),(86,87),(88,87),(65,88),(66,88),(67,88),(77,88),(78,88),(87,88),(17,89),(18,89),(82,89),(83,89),(90,89),(18,90),(20,90),(83,90),(84,90),(89,90),(91,90),(19,91),(20,91),(60,91),(84,91),(90,91),(42,92),(43,92),(61,92);
/*!40000 ALTER TABLE `sp_border` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_drawing`
--

DROP TABLE IF EXISTS `sp_drawing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_drawing` (
  `terrno` int(11) NOT NULL DEFAULT '0',
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `info` int(11) DEFAULT NULL,
  KEY `sp_drawing_place` (`terrno`),
  CONSTRAINT `sp_drawing_place` FOREIGN KEY (`terrno`) REFERENCES `sp_places` (`terrno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_drawing`
--

LOCK TABLES `sp_drawing` WRITE;
/*!40000 ALTER TABLE `sp_drawing` DISABLE KEYS */;
INSERT INTO `sp_drawing` (`terrno`, `x`, `y`, `info`) VALUES (7,980,258,1),(8,1070,330,1),(17,804,612,1),(21,440,778,1),(32,476,232,1),(33,230,450,1),(36,871,349,1),(38,900,315,1),(41,972,512,1),(43,1066,464,1),(48,1387,341,1),(52,1367,882,1),(57,758,407,1),(58,824,429,1),(60,874,457,1),(63,1365,600,1),(69,1106,809,1),(70,1310,922,1),(73,521,716,1),(80,545,196,1),(81,560,340,1),(83,653,911,1),(87,84,620,1),(88,43,280,1),(87,1423,582,2),(88,1442,275,2),(90,771,754,1),(25,187,170,1),(61,1108,572,1),(54,820,244,1),(55,1054,96,1),(78,163,242,1),(62,1196,636,1),(56,652,317,1),(59,940,336,1),(22,464,620,1),(46,1249,501,1),(1,711,249,1),(10,1240,290,1),(74,374,493,1),(3,817,305,1),(28,342,352,1),(51,1283,830,1),(35,849,514,1),(29,508,134,1),(85,1182,946,1),(75,204,540,1),(89,738,648,1),(79,495,315,1),(5,688,378,1),(45,1176,521,1),(84,1018,800,1),(49,1312,669,1),(47,1319,493,1),(42,1011,466,1),(6,1016,170,1),(72,298,721,1),(76,389,407,1),(12,1268,336,1),(40,934,474,1),(92,1075,515,1),(82,565,526,1),(27,288,352,1),(16,1282,444,1),(19,912,638,1),(30,302,186,1),(13,1185,364,1),(53,713,146,1),(23,382,668,1),(37,863,260,1),(44,1106,427,1),(71,506,818,1),(34,693,500,1),(77,123,367,1),(66,1353,253,1),(65,1372,420,1),(2,798,192,1),(15,1266,413,1),(9,1154,190,1),(20,870,772,1),(64,1368,476,1),(86,113,911,1),(86,1436,931,2),(91,960,721,1),(14,1176,423,1),(68,1341,739,1),(67,1414,336,1),(39,978,382,1),(24,340,572,1),(50,1200,817,1),(31,282,250,1),(18,832,692,1),(11,1326,168,1),(26,217,352,1),(4,760,308,1),(1,666,240,0),(28,333,444,0);
/*!40000 ALTER TABLE `sp_drawing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_loan`
--

DROP TABLE IF EXISTS `sp_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_loan` (
  `loan_level` int(11) NOT NULL DEFAULT '0',
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`loan_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_loan`
--

LOCK TABLES `sp_loan` WRITE;
/*!40000 ALTER TABLE `sp_loan` DISABLE KEYS */;
INSERT INTO `sp_loan` (`loan_level`, `price`) VALUES (0,0),(1000,50),(2000,100),(3000,150),(4000,200),(5000,500),(6000,600),(7000,700),(8000,1200),(9000,1400),(10000,1800),(11000,2400),(12000,3000);
/*!40000 ALTER TABLE `sp_loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_ocean_borders`
--

DROP TABLE IF EXISTS `sp_ocean_borders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_ocean_borders` (
  `terrno_from` int(11) NOT NULL DEFAULT '0',
  `terrno_to` int(11) NOT NULL DEFAULT '0',
  `distance` int(11) DEFAULT NULL,
  PRIMARY KEY (`terrno_from`,`terrno_to`),
  KEY `sp_ocean_borders_from` (`terrno_from`),
  KEY `sp_ocean_borders_to` (`terrno_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_ocean_borders`
--

LOCK TABLES `sp_ocean_borders` WRITE;
/*!40000 ALTER TABLE `sp_ocean_borders` DISABLE KEYS */;
INSERT INTO `sp_ocean_borders` (`terrno_from`, `terrno_to`, `distance`) VALUES (1,53,1),(2,6,1),(2,7,1),(2,53,1),(2,54,1),(3,4,1),(3,36,1),(3,37,1),(3,54,1),(3,57,1),(3,58,1),(4,3,1),(4,5,1),(4,53,1),(4,54,1),(4,56,1),(4,57,1),(5,4,1),(5,56,1),(5,57,1),(6,2,1),(6,7,1),(6,9,1),(6,55,1),(7,2,1),(7,6,1),(7,8,1),(7,9,1),(7,10,1),(7,37,1),(7,38,1),(7,54,1),(8,7,1),(8,10,1),(8,13,1),(8,14,1),(8,38,1),(8,39,1),(8,44,1),(8,59,1),(9,6,1),(9,7,1),(9,10,1),(9,11,1),(9,55,1),(10,7,1),(10,8,1),(10,9,1),(10,11,1),(10,12,1),(10,13,1),(10,65,1),(10,66,1),(11,9,1),(11,10,1),(11,66,1),(12,10,1),(12,13,1),(12,65,1),(13,8,1),(13,10,1),(13,12,1),(13,14,1),(13,15,1),(13,65,1),(14,8,1),(14,13,1),(14,15,1),(14,16,1),(14,44,1),(14,45,1),(15,13,1),(15,14,1),(15,16,1),(15,65,1),(16,14,1),(16,15,1),(16,45,1),(16,46,1),(16,47,1),(16,64,1),(17,18,1),(17,19,1),(17,34,1),(17,35,1),(17,89,1),(18,17,1),(18,19,1),(18,20,1),(18,89,1),(18,90,1),(19,17,1),(19,18,1),(19,20,1),(19,35,1),(19,60,1),(19,91,1),(20,18,1),(20,19,1),(20,90,1),(20,91,1),(21,22,1),(21,23,1),(21,71,1),(21,72,1),(21,73,1),(22,21,1),(22,23,1),(22,24,1),(22,73,1),(22,74,1),(23,21,1),(23,22,1),(23,24,1),(23,72,1),(24,22,1),(24,23,1),(24,33,1),(24,72,1),(24,74,1),(24,75,1),(25,30,1),(25,31,1),(25,78,1),(26,27,1),(26,31,1),(26,33,1),(26,77,1),(26,78,1),(27,26,1),(27,28,1),(27,31,1),(27,32,1),(27,33,1),(27,74,1),(28,27,1),(28,32,1),(28,74,1),(28,76,1),(28,79,1),(29,30,1),(29,80,1),(30,25,1),(30,29,1),(30,31,1),(30,80,1),(31,25,1),(31,26,1),(31,27,1),(31,30,1),(31,32,1),(31,78,1),(31,80,1),(32,27,1),(32,28,1),(32,31,1),(32,79,1),(32,80,1),(33,24,1),(33,26,1),(33,27,1),(33,74,1),(33,75,1),(34,17,1),(34,35,1),(34,57,1),(35,17,1),(35,19,1),(35,34,1),(35,60,1),(36,3,1),(36,37,1),(36,38,1),(36,58,1),(36,59,1),(37,3,1),(37,7,1),(37,36,1),(37,38,1),(37,54,1),(38,7,1),(38,8,1),(38,36,1),(38,37,1),(38,59,1),(39,8,1),(39,40,1),(39,42,1),(39,43,1),(39,44,1),(39,58,1),(39,59,1),(40,39,1),(40,41,1),(40,42,1),(40,58,1),(40,60,1),(41,40,1),(41,42,1),(41,60,1),(41,61,1),(42,39,1),(42,40,1),(42,41,1),(42,43,1),(42,92,1),(43,39,1),(43,42,1),(43,44,1),(43,92,1),(44,8,1),(44,14,1),(44,39,1),(44,43,1),(44,45,1),(44,61,1),(45,14,1),(45,16,1),(45,44,1),(45,46,1),(45,61,1),(45,62,1),(46,16,1),(46,45,1),(46,47,1),(46,62,1),(46,63,1),(47,16,1),(47,46,1),(47,63,1),(47,64,1),(48,65,1),(48,66,1),(48,67,1),(49,62,1),(49,63,1),(49,68,1),(50,51,1),(50,68,1),(50,69,1),(51,50,1),(51,68,1),(51,70,1),(52,70,1),(53,1,1),(53,2,1),(53,4,1),(53,54,1),(53,55,1),(53,56,1),(53,57,2),(53,60,5),(53,61,5),(53,62,5),(53,63,6),(53,64,6),(53,65,6),(53,66,7),(53,67,7),(53,68,5),(53,69,5),(53,70,5),(53,71,4),(53,72,5),(53,73,3),(53,74,3),(53,75,6),(53,76,2),(53,77,6),(53,78,7),(53,79,2),(53,80,2),(53,81,1),(53,82,2),(53,83,3),(53,84,4),(53,85,5),(53,86,4),(53,87,5),(53,88,6),(53,89,3),(53,90,4),(53,91,5),(54,2,1),(54,3,1),(54,4,1),(54,7,1),(54,37,1),(54,53,1),(55,6,1),(55,9,1),(55,53,1),(56,4,1),(56,5,1),(56,53,1),(56,57,1),(56,60,5),(56,61,5),(56,62,5),(56,63,6),(56,64,6),(56,65,6),(56,66,7),(56,67,7),(56,68,5),(56,69,5),(56,70,5),(56,71,4),(56,72,5),(56,73,3),(56,74,3),(56,75,6),(56,76,2),(56,77,6),(56,78,7),(56,79,2),(56,80,2),(56,81,1),(56,82,2),(56,83,3),(56,84,4),(56,85,5),(56,86,4),(56,87,5),(56,88,6),(56,89,3),(56,90,4),(56,91,5),(57,3,1),(57,4,1),(57,5,1),(57,34,1),(57,53,2),(57,56,1),(57,58,1),(57,60,1),(57,61,4),(57,62,4),(57,63,5),(57,64,5),(57,65,5),(57,66,6),(57,67,6),(57,68,4),(57,69,4),(57,70,4),(57,71,3),(57,72,4),(57,73,2),(57,74,2),(57,75,5),(57,76,2),(57,77,5),(57,78,6),(57,79,2),(57,80,2),(57,81,1),(57,82,1),(57,83,2),(57,84,3),(57,85,4),(57,86,3),(57,87,4),(57,88,5),(57,89,2),(57,90,3),(57,91,4),(58,3,1),(58,36,1),(58,39,1),(58,40,1),(58,57,1),(58,59,1),(58,60,1),(59,8,1),(59,36,1),(59,38,1),(59,39,1),(59,58,1),(60,19,1),(60,35,1),(60,40,1),(60,41,1),(60,53,5),(60,56,5),(60,57,1),(60,58,1),(60,61,1),(60,62,2),(60,63,5),(60,64,5),(60,65,5),(60,66,6),(60,67,6),(60,68,2),(60,69,2),(60,70,3),(60,71,3),(60,72,4),(60,73,3),(60,74,4),(60,75,5),(60,76,4),(60,77,5),(60,78,6),(60,79,5),(60,80,5),(60,81,4),(60,82,3),(60,83,2),(60,84,1),(60,85,2),(60,86,3),(60,87,4),(60,88,5),(60,89,3),(60,90,2),(60,91,1),(61,41,1),(61,44,1),(61,45,1),(61,53,5),(61,56,5),(61,57,4),(61,60,1),(61,62,1),(61,63,5),(61,64,5),(61,65,5),(61,66,6),(61,67,6),(61,68,2),(61,69,2),(61,70,3),(61,71,3),(61,72,4),(61,73,3),(61,74,4),(61,75,5),(61,76,4),(61,77,5),(61,78,6),(61,79,5),(61,80,5),(61,81,4),(61,82,3),(61,83,2),(61,84,1),(61,85,2),(61,86,3),(61,87,4),(61,88,5),(61,89,3),(61,90,2),(61,91,2),(61,92,1),(62,45,1),(62,46,1),(62,49,1),(62,53,5),(62,56,5),(62,57,4),(62,60,2),(62,61,1),(62,63,1),(62,64,5),(62,65,5),(62,66,6),(62,67,6),(62,68,1),(62,69,2),(62,70,3),(62,71,3),(62,72,4),(62,73,3),(62,74,4),(62,75,5),(62,76,4),(62,77,5),(62,78,6),(62,79,5),(62,80,5),(62,81,4),(62,82,3),(62,83,2),(62,84,1),(62,85,2),(62,86,3),(62,87,4),(62,88,5),(62,89,3),(62,90,2),(62,91,2),(63,46,1),(63,47,1),(63,49,1),(63,53,6),(63,56,6),(63,57,5),(63,60,5),(63,61,5),(63,62,1),(63,64,1),(63,65,2),(63,66,3),(63,67,3),(63,68,2),(63,69,4),(63,70,3),(63,71,4),(63,72,2),(63,73,4),(63,74,5),(63,75,2),(63,76,5),(63,77,2),(63,78,3),(63,79,6),(63,80,6),(63,81,5),(63,82,4),(63,83,3),(63,84,4),(63,85,3),(63,86,2),(63,87,1),(63,88,2),(63,89,4),(63,90,4),(63,91,5),(64,16,1),(64,47,1),(64,53,6),(64,56,6),(64,57,5),(64,60,5),(64,61,5),(64,62,5),(64,63,1),(64,65,1),(64,66,3),(64,67,3),(64,68,2),(64,69,4),(64,70,3),(64,71,4),(64,72,2),(64,73,4),(64,74,5),(64,75,2),(64,76,5),(64,77,2),(64,78,3),(64,79,6),(64,80,6),(64,81,5),(64,82,4),(64,83,3),(64,84,4),(64,85,3),(64,86,2),(64,87,1),(64,88,2),(64,89,4),(64,90,4),(64,91,5),(65,10,1),(65,12,1),(65,13,1),(65,15,1),(65,48,1),(65,53,6),(65,56,6),(65,57,5),(65,60,5),(65,61,5),(65,62,5),(65,63,2),(65,64,1),(65,66,1),(65,67,1),(65,68,2),(65,69,4),(65,70,3),(65,71,4),(65,72,2),(65,73,4),(65,74,5),(65,75,2),(65,76,5),(65,77,2),(65,78,2),(65,79,6),(65,80,6),(65,81,5),(65,82,4),(65,83,3),(65,84,4),(65,85,3),(65,86,2),(65,87,1),(65,88,1),(65,89,4),(65,90,4),(65,91,5),(66,10,1),(66,11,1),(66,48,1),(66,53,7),(66,56,7),(66,57,6),(66,60,6),(66,61,6),(66,62,6),(66,63,3),(66,64,3),(66,65,1),(66,67,1),(66,68,3),(66,69,5),(66,70,4),(66,71,5),(66,72,3),(66,73,5),(66,74,6),(66,75,3),(66,76,6),(66,77,2),(66,78,2),(66,79,7),(66,80,7),(66,81,6),(66,82,5),(66,83,4),(66,84,5),(66,85,4),(66,86,3),(66,87,2),(66,88,1),(66,89,5),(66,90,5),(66,91,6),(67,48,1),(67,53,7),(67,56,7),(67,57,6),(67,60,6),(67,61,6),(67,62,6),(67,63,3),(67,64,3),(67,65,1),(67,66,1),(67,68,3),(67,69,5),(67,70,4),(67,71,5),(67,72,3),(67,73,5),(67,74,6),(67,75,3),(67,76,6),(67,77,2),(67,78,2),(67,79,7),(67,80,7),(67,81,6),(67,82,5),(67,83,4),(67,84,5),(67,85,4),(67,86,3),(67,87,2),(67,88,1),(67,89,5),(67,90,5),(67,91,6),(68,49,1),(68,50,1),(68,51,1),(68,53,5),(68,56,5),(68,57,4),(68,60,2),(68,61,2),(68,62,1),(68,63,2),(68,64,2),(68,65,2),(68,66,3),(68,67,3),(68,69,1),(68,70,1),(68,71,3),(68,72,2),(68,73,3),(68,74,4),(68,75,2),(68,76,4),(68,77,2),(68,78,3),(68,79,5),(68,80,5),(68,81,4),(68,82,3),(68,83,2),(68,84,1),(68,85,2),(68,86,1),(68,87,1),(68,88,2),(68,89,3),(68,90,2),(68,91,2),(69,50,1),(69,53,5),(69,56,5),(69,57,4),(69,60,2),(69,61,2),(69,62,2),(69,63,4),(69,64,4),(69,65,4),(69,66,5),(69,67,5),(69,68,1),(69,70,2),(69,71,3),(69,72,3),(69,73,3),(69,74,4),(69,75,4),(69,76,4),(69,77,4),(69,78,5),(69,79,5),(69,80,5),(69,81,4),(69,82,3),(69,83,2),(69,84,1),(69,85,1),(69,86,2),(69,87,3),(69,88,4),(69,89,3),(69,90,2),(69,91,2),(70,51,1),(70,52,1),(70,53,5),(70,56,5),(70,57,4),(70,60,3),(70,61,3),(70,62,3),(70,63,3),(70,64,3),(70,65,3),(70,66,4),(70,67,4),(70,68,1),(70,69,2),(70,71,3),(70,72,2),(70,73,3),(70,74,4),(70,75,3),(70,76,4),(70,77,3),(70,78,4),(70,79,5),(70,80,5),(70,81,4),(70,82,3),(70,83,2),(70,84,2),(70,85,1),(70,86,1),(70,87,2),(70,88,3),(70,89,3),(70,90,3),(70,91,3),(71,21,1),(71,53,4),(71,56,4),(71,57,3),(71,60,3),(71,61,3),(71,62,3),(71,63,4),(71,64,4),(71,65,4),(71,66,5),(71,67,5),(71,68,3),(71,69,3),(71,70,3),(71,72,3),(71,73,1),(71,74,3),(71,75,4),(71,76,3),(71,77,4),(71,78,5),(71,79,4),(71,80,4),(71,81,3),(71,82,2),(71,83,1),(71,84,2),(71,85,3),(71,86,2),(71,87,3),(71,88,4),(71,89,2),(71,90,2),(71,91,3),(72,21,1),(72,23,1),(72,24,1),(72,53,5),(72,56,5),(72,57,4),(72,60,4),(72,61,4),(72,62,4),(72,63,2),(72,64,2),(72,65,2),(72,66,3),(72,67,3),(72,68,2),(72,69,3),(72,70,2),(72,71,3),(72,73,3),(72,74,4),(72,75,1),(72,76,4),(72,77,2),(72,78,3),(72,79,5),(72,80,5),(72,81,4),(72,82,3),(72,83,2),(72,84,3),(72,85,2),(72,86,1),(72,87,1),(72,88,2),(72,89,3),(72,90,3),(72,91,4),(73,21,1),(73,22,1),(73,53,3),(73,56,3),(73,57,2),(73,60,3),(73,61,3),(73,62,3),(73,63,4),(73,64,4),(73,65,4),(73,66,5),(73,67,5),(73,68,3),(73,69,3),(73,70,3),(73,71,1),(73,72,3),(73,74,2),(73,75,4),(73,76,2),(73,77,4),(73,78,5),(73,79,3),(73,80,3),(73,81,2),(73,82,1),(73,83,1),(73,84,2),(73,85,3),(73,86,2),(73,87,3),(73,88,4),(73,89,2),(73,90,2),(73,91,3),(74,22,1),(74,24,1),(74,27,1),(74,28,1),(74,33,1),(74,53,3),(74,56,3),(74,57,2),(74,60,4),(74,61,4),(74,62,4),(74,63,5),(74,64,5),(74,65,5),(74,66,6),(74,67,6),(74,68,4),(74,69,4),(74,70,4),(74,71,3),(74,72,4),(74,73,2),(74,75,5),(74,76,1),(74,77,5),(74,78,6),(74,79,3),(74,80,3),(74,81,2),(74,82,1),(74,83,2),(74,84,3),(74,85,4),(74,86,3),(74,87,4),(74,88,5),(74,89,2),(74,90,3),(74,91,4),(75,24,1),(75,33,1),(75,53,6),(75,56,6),(75,57,5),(75,60,5),(75,61,5),(75,62,5),(75,63,2),(75,64,2),(75,65,2),(75,66,3),(75,67,3),(75,68,2),(75,69,4),(75,70,3),(75,71,4),(75,72,1),(75,73,4),(75,74,5),(75,76,5),(75,77,1),(75,78,3),(75,79,6),(75,80,6),(75,81,5),(75,82,4),(75,83,3),(75,84,4),(75,85,3),(75,86,2),(75,87,1),(75,88,2),(75,89,4),(75,90,4),(75,91,5),(76,28,1),(76,53,2),(76,56,2),(76,57,2),(76,60,4),(76,61,4),(76,62,4),(76,63,5),(76,64,5),(76,65,5),(76,66,6),(76,67,6),(76,68,4),(76,69,4),(76,70,4),(76,71,3),(76,72,4),(76,73,2),(76,74,1),(76,75,5),(76,77,5),(76,78,6),(76,79,1),(76,80,2),(76,81,1),(76,82,1),(76,83,2),(76,84,3),(76,85,4),(76,86,3),(76,87,4),(76,88,5),(76,89,2),(76,90,3),(76,91,4),(77,26,1),(77,53,6),(77,56,6),(77,57,5),(77,60,5),(77,61,5),(77,62,5),(77,63,2),(77,64,2),(77,65,2),(77,66,2),(77,67,2),(77,68,2),(77,69,4),(77,70,3),(77,71,4),(77,72,2),(77,73,4),(77,74,5),(77,75,1),(77,76,5),(77,78,1),(77,79,6),(77,80,6),(77,81,5),(77,82,4),(77,83,3),(77,84,4),(77,85,3),(77,86,2),(77,87,1),(77,88,1),(77,89,4),(77,90,4),(77,91,5),(78,25,1),(78,26,1),(78,31,1),(78,53,7),(78,56,7),(78,57,6),(78,60,6),(78,61,6),(78,62,6),(78,63,3),(78,64,3),(78,65,2),(78,66,2),(78,67,2),(78,68,3),(78,69,5),(78,70,4),(78,71,5),(78,72,3),(78,73,5),(78,74,6),(78,75,3),(78,76,6),(78,77,1),(78,79,7),(78,80,7),(78,81,6),(78,82,5),(78,83,4),(78,84,5),(78,85,4),(78,86,3),(78,87,2),(78,88,1),(78,89,5),(78,90,5),(78,91,6),(79,28,1),(79,32,1),(79,53,2),(79,56,2),(79,57,2),(79,60,5),(79,61,5),(79,62,5),(79,63,6),(79,64,6),(79,65,6),(79,66,7),(79,67,7),(79,68,5),(79,69,5),(79,70,5),(79,71,4),(79,72,5),(79,73,3),(79,74,3),(79,75,6),(79,76,1),(79,77,6),(79,78,7),(79,80,1),(79,81,1),(79,82,2),(79,83,3),(79,84,4),(79,85,5),(79,86,4),(79,87,5),(79,88,6),(79,89,3),(79,90,4),(79,91,5),(80,29,1),(80,30,1),(80,31,1),(80,32,1),(80,53,2),(80,56,2),(80,57,2),(80,60,5),(80,61,5),(80,62,5),(80,63,6),(80,64,6),(80,65,6),(80,66,7),(80,67,7),(80,68,5),(80,69,5),(80,70,5),(80,71,4),(80,72,5),(80,73,3),(80,74,3),(80,75,6),(80,76,2),(80,77,6),(80,78,7),(80,79,1),(80,81,1),(80,82,2),(80,83,3),(80,84,4),(80,85,5),(80,86,4),(80,87,5),(80,88,6),(80,89,3),(80,90,4),(80,91,5),(81,53,1),(81,56,1),(81,57,1),(81,60,4),(81,61,4),(81,62,4),(81,63,5),(81,64,5),(81,65,5),(81,66,6),(81,67,6),(81,68,4),(81,69,4),(81,70,4),(81,71,3),(81,72,4),(81,73,2),(81,74,2),(81,75,5),(81,76,1),(81,77,5),(81,78,6),(81,79,1),(81,80,1),(81,82,1),(81,83,2),(81,84,3),(81,85,4),(81,86,3),(81,87,4),(81,88,5),(81,89,2),(81,90,3),(81,91,4),(82,53,2),(82,56,2),(82,57,1),(82,60,3),(82,61,3),(82,62,3),(82,63,4),(82,64,4),(82,65,4),(82,66,5),(82,67,5),(82,68,3),(82,69,3),(82,70,3),(82,71,2),(82,72,3),(82,73,1),(82,74,1),(82,75,4),(82,76,1),(82,77,4),(82,78,5),(82,79,2),(82,80,2),(82,81,1),(82,83,1),(82,84,2),(82,85,3),(82,86,2),(82,87,3),(82,88,4),(82,89,1),(82,90,2),(82,91,3),(83,53,3),(83,56,3),(83,57,2),(83,60,2),(83,61,2),(83,62,2),(83,63,3),(83,64,3),(83,65,3),(83,66,4),(83,67,4),(83,68,2),(83,69,2),(83,70,2),(83,71,1),(83,72,2),(83,73,1),(83,74,2),(83,75,3),(83,76,2),(83,77,3),(83,78,4),(83,79,3),(83,80,3),(83,81,2),(83,82,1),(83,84,1),(83,85,2),(83,86,1),(83,87,2),(83,88,3),(83,89,1),(83,90,1),(83,91,2),(84,53,4),(84,56,4),(84,57,3),(84,60,1),(84,61,1),(84,62,1),(84,63,4),(84,64,4),(84,65,4),(84,66,5),(84,67,5),(84,68,1),(84,69,1),(84,70,2),(84,71,2),(84,72,3),(84,73,2),(84,74,3),(84,75,4),(84,76,3),(84,77,4),(84,78,5),(84,79,4),(84,80,4),(84,81,3),(84,82,2),(84,83,1),(84,85,1),(84,86,2),(84,87,3),(84,88,4),(84,89,2),(84,90,1),(84,91,1),(85,53,5),(85,56,5),(85,57,4),(85,60,2),(85,61,2),(85,62,2),(85,63,3),(85,64,3),(85,65,3),(85,66,4),(85,67,4),(85,68,2),(85,69,1),(85,70,1),(85,71,3),(85,72,2),(85,73,3),(85,74,4),(85,75,3),(85,76,4),(85,77,3),(85,78,4),(85,79,5),(85,80,5),(85,81,4),(85,82,3),(85,83,2),(85,84,1),(85,86,1),(85,87,2),(85,88,3),(85,89,3),(85,90,2),(85,91,2),(86,53,4),(86,56,4),(86,57,3),(86,60,3),(86,61,3),(86,62,3),(86,63,2),(86,64,2),(86,65,2),(86,66,3),(86,67,3),(86,68,1),(86,69,2),(86,70,1),(86,71,2),(86,72,1),(86,73,2),(86,74,3),(86,75,2),(86,76,3),(86,77,2),(86,78,3),(86,79,4),(86,80,4),(86,81,3),(86,82,2),(86,83,1),(86,84,2),(86,85,1),(86,87,1),(86,88,2),(86,89,2),(86,90,2),(86,91,3),(87,53,5),(87,56,5),(87,57,4),(87,60,4),(87,61,4),(87,62,4),(87,63,1),(87,64,1),(87,65,1),(87,66,2),(87,67,2),(87,68,1),(87,69,3),(87,70,2),(87,71,3),(87,72,1),(87,73,3),(87,74,4),(87,75,1),(87,76,4),(87,77,1),(87,78,2),(87,79,5),(87,80,5),(87,81,4),(87,82,3),(87,83,2),(87,84,3),(87,85,2),(87,86,1),(87,88,1),(87,89,3),(87,90,3),(87,91,4),(88,53,6),(88,56,6),(88,57,5),(88,60,5),(88,61,5),(88,62,5),(88,63,2),(88,64,2),(88,65,1),(88,66,1),(88,67,1),(88,68,2),(88,69,4),(88,70,3),(88,71,4),(88,72,2),(88,73,4),(88,74,5),(88,75,2),(88,76,5),(88,77,1),(88,78,1),(88,79,6),(88,80,6),(88,81,5),(88,82,4),(88,83,3),(88,84,4),(88,85,3),(88,86,2),(88,87,1),(88,89,4),(88,90,4),(88,91,5),(89,17,1),(89,18,1),(89,53,3),(89,56,3),(89,57,2),(89,60,3),(89,61,3),(89,62,3),(89,63,4),(89,64,4),(89,65,4),(89,66,5),(89,67,5),(89,68,3),(89,69,3),(89,70,3),(89,71,2),(89,72,3),(89,73,2),(89,74,2),(89,75,4),(89,76,2),(89,77,4),(89,78,5),(89,79,3),(89,80,3),(89,81,2),(89,82,1),(89,83,1),(89,84,2),(89,85,3),(89,86,2),(89,87,3),(89,88,4),(89,90,1),(89,91,3),(90,18,1),(90,20,1),(90,53,4),(90,56,4),(90,57,3),(90,60,2),(90,61,2),(90,62,2),(90,63,4),(90,64,4),(90,65,4),(90,66,5),(90,67,5),(90,68,2),(90,69,2),(90,70,3),(90,71,2),(90,72,3),(90,73,2),(90,74,3),(90,75,4),(90,76,3),(90,77,4),(90,78,5),(90,79,4),(90,80,4),(90,81,3),(90,82,2),(90,83,1),(90,84,1),(90,85,2),(90,86,2),(90,87,3),(90,88,4),(90,89,1),(90,91,1),(91,19,1),(91,20,1),(91,53,5),(91,56,5),(91,57,4),(91,60,1),(91,61,2),(91,62,2),(91,63,5),(91,64,5),(91,65,5),(91,66,6),(91,67,6),(91,68,2),(91,69,2),(91,70,3),(91,71,3),(91,72,4),(91,73,3),(91,74,4),(91,75,5),(91,76,4),(91,77,5),(91,78,6),(91,79,5),(91,80,5),(91,81,4),(91,82,3),(91,83,2),(91,84,1),(91,85,2),(91,86,3),(91,87,4),(91,88,5),(91,89,3),(91,90,1),(92,42,1),(92,43,1),(92,61,1);
/*!40000 ALTER TABLE `sp_ocean_borders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_places`
--

DROP TABLE IF EXISTS `sp_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_places` (
  `terrno` int(11) NOT NULL DEFAULT '0',
  `terrname` varchar(30) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `terrtype` varchar(4) CHARACTER SET latin1 DEFAULT NULL,
  `continent` char(15) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`terrno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_places`
--

LOCK TABLES `sp_places` WRITE;
/*!40000 ALTER TABLE `sp_places` DISABLE KEYS */;
INSERT INTO `sp_places` (`terrno`, `terrname`, `terrtype`, `continent`) VALUES (1,'British Isles','EURO','Europe'),(2,'Scandinavia','EURO','Europe'),(3,'Eastern Europe','EURO','Europe'),(4,'Western Europe','EURO','Europe'),(5,'Iberia','EURO','Europe'),(6,'Kola','RUSS','Asia'),(7,'Russia','RUSS','Asia'),(8,'Kazakh','RUSS','Asia'),(9,'Siberia','RUSS','Asia'),(10,'Buryatsk','RUSS','Asia'),(11,'Yakutsk','RUSS','Asia'),(12,'Manchuria','CHIN','Asia'),(13,'Mongolia','CHIN','Asia'),(14,'Tibet','CHIN','Asia'),(15,'Shantung','CHIN','Asia'),(16,'Nanling','CHIN','Asia'),(17,'Nigeria','AFRI','Africa'),(18,'Zaire','AFRI','Africa'),(19,'Mozambique','AFRI','Africa'),(20,'South Africa','AFRI','Africa'),(21,'Argentina','S_AM','South America'),(22,'Brazil','S_AM','South America'),(23,'Peru','S_AM','South America'),(24,'Venezuela','S_AM','South America'),(25,'Alaska','N_AM','North America'),(26,'Western USA','N_AM','North America'),(27,'Mid-West USA','N_AM','North America'),(28,'Eastern USA','N_AM','North America'),(29,'Greenland','CANA','North America'),(30,'Northern Canada','CANA','North America'),(31,'Western Canada','CANA','North America'),(32,'Eastern Canada','CANA','North America'),(33,'Central America','NEUT','North America'),(34,'Sahara','NEUT','South America'),(35,'Egypt','NEUT','South America'),(36,'Greece','NEUT','Europe'),(37,'Poland','NEUT','Europe'),(38,'Romania','NEUT','Europe'),(39,'Turkey','ARAB','Asia'),(40,'Middle East','ARAB','Asia'),(41,'Arabia','ARAB','Asia'),(42,'Iraq','ARAB','Asia'),(43,'Iran','ARAB','Asia'),(44,'Pakistan','NEUT','Asia'),(45,'India','NEUT','Asia'),(46,'Burma','NEUT','Asia'),(47,'Indo-China','NEUT','Asia'),(48,'Japan','NEUT','Asia'),(49,'Indonesia','AUST','Oceania'),(50,'Western Australia','AUST','Oceania'),(51,'Eastern Australia','AUST','Oceania'),(52,'New Zealand','AUST','Oceania'),(53,'North Sea','SEA','Europe'),(54,'Baltic Sea','SEA','Europe'),(55,'Barents Sea','SEA','Europe'),(56,'Bay of Biscay','SEA','Europe'),(57,'Mediterranean Sea','SEA','Europe'),(58,'Sea of Crete','SEA','Europe'),(59,'Black Sea','SEA','Asia'),(60,'Red Sea','SEA','Africa'),(61,'Arabian Sea','SEA','Asia'),(62,'Bay of Bengal','SEA','Asia'),(63,'Java Sea','SEA','Oceania'),(64,'South China Sea','SEA','Asia'),(65,'Sea of Japan','SEA','Asia'),(66,'Sea of Okhotsk','SEA','Asia'),(67,'Tokyo Bay','SEA','Asia'),(68,'Timor Sea','SEA','Oceania'),(69,'Shark Bay','SEA','Oceania'),(70,'Tasman Sea','SEA','Oceania'),(71,'Rio de la Plata','SEA','South America'),(72,'Lima Bay','SEA','South America'),(73,'Baia Santos','SEA','South America'),(74,'Caribbean Sea','SEA','North America'),(75,'Gulf of Panama','SEA','North America'),(76,'Long Island Sound','SEA','North America'),(77,'Santa Barbara Passage','SEA','North America'),(78,'Barkley Sound','SEA','North America'),(79,'Gulf of St.Lawrence','SEA','North America'),(80,'Hudson Strait','SEA','North America'),(81,'North Atlantic','OCE','Ocean'),(82,'Mid Atlantic','OCE','Ocean'),(83,'South Atlantic','OCE','Ocean'),(84,'Indian Ocean','OCE','Ocean'),(85,'Great Australian Blight','OCE','Ocean'),(86,'South Pacific','OCE','Ocean'),(87,'Mid Pacific','OCE','Ocean'),(88,'North Pacific','OCE','Ocean'),(89,'Gulf of Guinea','SEA','Africa'),(90,'Cape of Good Hope','SEA','Africa'),(91,'Straights of Malacca','SEA','Africa'),(92,'Persian Gulf','SEA','Asia');
/*!40000 ALTER TABLE `sp_places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_powers`
--

DROP TABLE IF EXISTS `sp_powers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_powers` (
  `powername` varchar(15) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `terrtype` varchar(4) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `red` int(11) DEFAULT NULL,
  `green` int(11) DEFAULT NULL,
  `blue` int(11) DEFAULT NULL,
  `players` int(11) NOT NULL DEFAULT '6',
  PRIMARY KEY (`powername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_powers`
--

LOCK TABLES `sp_powers` WRITE;
/*!40000 ALTER TABLE `sp_powers` DISABLE KEYS */;
INSERT INTO `sp_powers` (`powername`, `terrtype`, `red`, `green`, `blue`, `players`) VALUES ('Africa','AFRI',190,0,254,1),('Arabia','ARAB',155,117,4,9),('Australia','AUST',14,237,244,8),('Canada','CANA',72,72,181,8),('China','CHIN',254,190,0,1),('Europe','EURO',254,126,0,1),('Neutron','NETR',10,30,50,99),('Nuked','NUKE',0,0,0,99),('South America','S_AM',0,204,0,1),('USA','N_AM',0,102,33,1),('USSR','RUSS',254,0,126,1);
/*!40000 ALTER TABLE `sp_powers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_prices`
--

DROP TABLE IF EXISTS `sp_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_prices` (
  `market_level` int(11) NOT NULL DEFAULT '0',
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`market_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_prices`
--

LOCK TABLES `sp_prices` WRITE;
/*!40000 ALTER TABLE `sp_prices` DISABLE KEYS */;
INSERT INTO `sp_prices` (`market_level`, `price`) VALUES (1,1),(2,5),(3,10),(4,25),(5,50),(6,50),(7,100),(8,100),(9,200),(10,200),(11,400),(12,400),(13,500),(14,600),(15,700),(16,800),(17,900),(18,1000);
/*!40000 ALTER TABLE `sp_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_res_cards`
--

DROP TABLE IF EXISTS `sp_res_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_res_cards` (
  `cardno` int(11) NOT NULL DEFAULT '0',
  `terrno` int(11) DEFAULT NULL,
  `terrtype` varchar(4) CHARACTER SET latin1 DEFAULT NULL,
  `res_type` varchar(8) CHARACTER SET latin1 DEFAULT NULL,
  `res_amount` int(11) DEFAULT NULL,
  `res_name` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`cardno`),
  KEY `terrno` (`terrno`),
  KEY `sp_res_cards_place` (`terrno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_res_cards`
--

LOCK TABLES `sp_res_cards` WRITE;
/*!40000 ALTER TABLE `sp_res_cards` DISABLE KEYS */;
INSERT INTO `sp_res_cards` (`cardno`, `terrno`, `terrtype`, `res_type`, `res_amount`, `res_name`) VALUES (1,19,'AFRI','Grain',3,'Adams Grain Co.'),(2,18,'AFRI','Oil',2,'Allen Oil Co.'),(3,20,'AFRI','Grain',2,'B.W. Reed Co.'),(4,17,'AFRI','Oil',3,'Idah Oil'),(5,19,'AFRI','Minerals',2,'McMorland Mines'),(6,20,'AFRI','Minerals',3,'Watt & Warren'),(7,15,'CHIN','Oil',3,'Chin Oil'),(8,16,'CHIN','Oil',2,'Hoppo Oil Co.'),(9,16,'CHIN','Grain',3,'Ku-Chan-Li'),(10,12,'CHIN','Minerals',2,'Min-Shan Mines'),(11,13,'CHIN','Minerals',3,'Obo Mines'),(12,15,'CHIN','Grain',2,'Pak-Hoi Grains'),(13,3,'EURO','Minerals',3,'Bayer Mines'),(14,5,'EURO','Minerals',2,'Cordoba Mining Co.'),(15,4,'EURO','Grain',3,'Gauthier Grains'),(16,3,'EURO','Grain',2,'Huber Grain Co.'),(17,1,'EURO','Oil',3,'Presto Oil Co.'),(18,2,'EURO','Oil',2,'Vardo Oil'),(19,21,'S_AM','Grain',3,'Buchardo & Young'),(20,24,'S_AM','Oil',3,'Inca Oil'),(21,23,'S_AM','Minerals',2,'Pachacuti Mines'),(22,24,'S_AM','Grain',2,'Popayan Grains'),(23,22,'S_AM','Minerals',3,'Sammy Mining Co.'),(24,23,'S_AM','Oil',2,'Sapra Oil Co.'),(25,6,'RUSS','Oil',3,'Baku Oil'),(26,8,'RUSS','Grain',2,'Haliskie & Baine'),(27,10,'RUSS','Minerals',2,'Kyzyl Mines'),(28,7,'RUSS','Grain',3,'Rovno Grains'),(29,11,'RUSS','Oil',2,'Tiksi & Zaliv'),(30,9,'RUSS','Minerals',3,'Tomsk Mining Co.'),(31,27,'N_AM','Grain',3,'Bainbridge Grains'),(32,26,'N_AM','Oil',3,'Clark Oil Co.'),(33,25,'N_AM','Oil',2,'Hurren Oil'),(34,27,'N_AM','Minerals',3,'Moorhead Mines'),(35,28,'N_AM','Grain',2,'Kain Grain Co.'),(36,28,'N_AM','Minerals',2,'Reimers Mining Co.'),(37,38,'NEUT','Grain',4,'Corak Grain Co.'),(38,50,'AUST','Grain',2,'Goomalling Grain Co.'),(39,52,'AUST','Grain',1,'R.P. Webb Co.'),(40,46,'NEUT','Grain',2,'Toungoo Grain Co.'),(41,37,'NEUT','Grain',3,'Lotz & Lodz'),(42,31,'CANA','Grain',5,'McDougall Grains'),(43,51,'AUST','Grain',3,'McEachern & Gordon'),(44,39,'ARAB','Grain',3,'Zara Grain Co.'),(45,31,'CANA','Minerals',2,'Ashby Mines'),(46,50,'AUST','Minerals',3,'Darley Mines'),(47,33,'NEUT','Minerals',3,'Durango Mines'),(48,45,'NEUT','Minerals',3,'Mahabir Mines'),(49,32,'CANA','Minerals',4,'Simpson Mining Co.'),(50,34,'NEUT','Minerals',1,'Tiznit Mines'),(51,51,'AUST','Minerals',5,'Toowomba Mines'),(52,36,'NEUT','Minerals',2,'Vartan & Raad'),(53,41,'ARAB','Oil',5,'Baqa Oil'),(54,43,'ARAB','Oil',4,'Bashi Oil'),(55,42,'ARAB','Oil',3,'Basra Oil Co.'),(56,50,'AUST','Oil',2,'Conn Oil'),(57,30,'CANA','Oil',3,'Inuvik Oil'),(58,49,'AUST','Oil',3,'Sumba Oil'),(59,33,'NEUT','Oil',1,'Tampico Oil'),(60,34,'NEUT','Oil',2,'Zillah Oil Co.'),(61,30,'CANA','Minerals',2,'Great Slave Mines'),(62,59,'RUSS','Oil',2,'Azov Oil Co.'),(63,45,'NEUT','Grain',3,'Mahadeo Grains'),(64,12,'CHIN','Grain',2,'Fuyu Grain Co.'),(65,63,'SEA','Minerals',2,'Thitu Mining Co.'),(66,49,'AUST','Minerals',3,'Taytay Mines'),(67,43,'ARAB','Grain',1,'Bandar Grains'),(68,20,'AFRI','Oil',2,'Statham Oil Co.'),(69,38,'NEUT','Oil',1,'Varna Oil Co.'),(70,64,'CHIN','Oil',2,'Tin Tow Oil Co.'),(71,24,'S_AM','Minerals',3,'Merida Mining Co.'),(72,68,'AUST','Grain',2,'Nichol Grain Co.'),(73,21,'S_AM','Oil',3,'Del Fuego Oil'),(74,32,'CANA','Minerals',1,'Darling Mines'),(75,52,'AUST','Oil',5,'Taranaki Oil'),(76,26,'N_AM','Oil',2,'Hadley Oil'),(77,28,'N_AM','Grain',3,'Farnsworth Grains'),(78,75,'S_AM','Grain',3,'Los Mochis Grains'),(79,32,'CANA','Grain',3,'Christy Grains'),(80,34,'NEUT','Grain',5,'Kiffa Grains'),(81,74,'SEA','Oil',2,'Quita Cay Oil'),(82,25,'N_AM','Oil',3,'Kodiak Oil Co.'),(83,75,'SEA','Grain',2,'Azul & Annand'),(84,13,'CHIN','Minerals',2,'Lop Nor Mines'),(85,5,'EURO','Oil',2,'Moura Oil'),(86,60,'SEA','Grain',2,'Dahlak Grains'),(87,10,'RUSS','Grain',2,'Tavda-Omsk'),(88,13,'CHIN','Oil',3,'Ula Oil'),(89,27,'N_AM','Grain',2,'Cook & Brown'),(90,53,'EURO','Minerals',2,'Mussleburgh Mines'),(91,8,'RUSS','Grain',3,'Gluck Grain Co.'),(92,3,'EURO','Grain',3,'Landau-Rott'),(93,61,'ARAB','Minerals',3,'Socotra Mines'),(94,23,'S_AM','Grain',3,'Cocama Grain Co.'),(95,11,'RUSS','Minerals',2,'Kroma Mines'),(96,17,'AFRI','Minerals',3,'Bukuru Mining Co.'),(97,19,'AFRI','Oil',3,'Maputo Oil'),(98,18,'AFRI','Minerals',2,'Boko Mines'),(99,16,'CHIN','Minerals',3,'Modung Mines'),(100,40,'ARAB','Grain',4,'Ha On Grain Co.'),(101,22,'S_AM','Minerals',2,'Lobos Mines'),(102,22,'S_AM','Oil',2,'Ipora Oil Co.'),(103,35,'NEUT','Oil',2,'Buqbuq Oil Co.'),(104,9,'RUSS','Oil',3,'Zapadno Oil'),(105,2,'EURO','Oil',3,'Kalmar Oil Co.'),(106,6,'RUSS','Minerals',3,'Ozero Mining Co.'),(107,4,'EURO','Grain',2,'Smit & La Roche'),(108,17,'AFRI','Grain',3,'Ngungu Grain Co.'),(109,29,'CANA','Minerals',3,'Umanak Mining Co.'),(110,48,'NEUT','Oil',3,'Oshhima Oil Co.'),(111,36,'NEUT','Oil',3,'Panou & Kalpakis'),(112,78,'N_AM','Minerals',2,'Sitka Mining Co.'),(113,26,'N_AM','Minerals',3,'Roach & Shearer'),(114,1,'EURO','Minerals',3,'Nicholson & Pope'),(115,33,'NEUT','Minerals',5,'Uxmal Miners'),(116,45,'NEUT','Minerals',4,'Sugrim & Sanmat'),(117,46,'NEUT','Oil',4,'Phet Buri Oil'),(118,15,'CHIN','Grain',3,'Kon Jug Yuen'),(119,68,'AUST','Oil',3,'Roti Oil Co.'),(120,44,'NEUT','Grain',2,'Tatta Grain Co.'),(121,41,'ARAB','Minerals',4,'Al-Jaz Mining Co.'),(122,29,'CANA','Oil',3,'Chinook Drilling'),(123,30,'CANA','Oil',2,'Smith & Sons'),(124,43,'ARAB','Minerals',2,'El Muhad Sands'),(125,50,'AUST','Grain',1,'Ulagong Farming'),(126,40,'ARAB','Minerals',2,'Mostar Mining');
/*!40000 ALTER TABLE `sp_res_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_tech`
--

DROP TABLE IF EXISTS `sp_tech`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_tech` (
  `tech_level` int(11) NOT NULL DEFAULT '0',
  `march_nm` double DEFAULT NULL,
  `march_jm` double DEFAULT NULL,
  `march_no` double DEFAULT NULL,
  `march_jo` double DEFAULT NULL,
  `march_ng` double DEFAULT NULL,
  `march_jg` double DEFAULT NULL,
  `fly_nm` double DEFAULT NULL,
  `fly_jm` double DEFAULT NULL,
  `fly_no` double DEFAULT NULL,
  `fly_jo` double DEFAULT NULL,
  `fly_ng` double DEFAULT NULL,
  `fly_jg` double DEFAULT NULL,
  `sail_nm` double DEFAULT NULL,
  `sail_jm` double DEFAULT NULL,
  `sail_no` double DEFAULT NULL,
  `sail_jo` double DEFAULT NULL,
  `sail_ng` double DEFAULT NULL,
  `sail_jg` double DEFAULT NULL,
  PRIMARY KEY (`tech_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_tech`
--

LOCK TABLES `sp_tech` WRITE;
/*!40000 ALTER TABLE `sp_tech` DISABLE KEYS */;
INSERT INTO `sp_tech` (`tech_level`, `march_nm`, `march_jm`, `march_no`, `march_jo`, `march_ng`, `march_jg`, `fly_nm`, `fly_jm`, `fly_no`, `fly_jo`, `fly_ng`, `fly_jg`, `sail_nm`, `sail_jm`, `sail_no`, `sail_jo`, `sail_ng`, `sail_jg`) VALUES (0,0,0,0,2,1,0,0,0,2,4,0,0,0,0,1,0,0,0),(1,0,0,0,1,1,0,0,0,2,4,0,0,0,0,1,0,0,0),(2,0,0,0,1,0.5,0,0,0,1,3,0,0,0,0,0.5,0,0,0),(3,0,0,0,0.5,0.33,0,0,0,0.66,3,0,0,0,0,0.33,0,0,0),(4,0,0,0,0.33,0.25,0,0,0,0.5,2,0,0,0,0,0.25,0,0,0),(5,0,0,0,0.25,0.2,0,0,0,0.25,1,0,0,0,0,0.2,0,0,0);
/*!40000 ALTER TABLE `sp_tech` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-04 10:03:18