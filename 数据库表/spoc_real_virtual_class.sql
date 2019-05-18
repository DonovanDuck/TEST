-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: spoc
-- ------------------------------------------------------
-- Server version	5.7.21-1

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
-- Table structure for table `real_virtual_class`
--

DROP TABLE IF EXISTS `real_virtual_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `real_virtual_class` (
  `real_class_num` varchar(255) NOT NULL,
  `virtual_class_num` varchar(35) NOT NULL,
  PRIMARY KEY (`virtual_class_num`,`real_class_num`),
  KEY `real_class_num1` (`real_class_num`),
  CONSTRAINT `real_class_num1` FOREIGN KEY (`real_class_num`) REFERENCES `real_class` (`real_class_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `virtual_class_num1` FOREIGN KEY (`virtual_class_num`) REFERENCES `virtual_class` (`virtual_class_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `real_virtual_class`
--

LOCK TABLES `real_virtual_class` WRITE;
/*!40000 ALTER TABLE `real_virtual_class` DISABLE KEYS */;
INSERT INTO `real_virtual_class` VALUES ('1','225C872574F84A68B0979A1660A69995'),('1','2F0410724FBB495999CE9C62D65ADDF8'),('1','324DDAD4A406432D826938504BF6F955'),('1','37FA1A53DB7B4E9E9E38FB53DF59A3C4'),('1','D8E333AC616443C58E90E8299A04BE0D'),('2','D8E333AC616443C58E90E8299A04BE0D');
/*!40000 ALTER TABLE `real_virtual_class` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-18 20:53:30
