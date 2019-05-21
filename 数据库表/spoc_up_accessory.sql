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
-- Table structure for table `up_accessory`
--

DROP TABLE IF EXISTS `up_accessory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `up_accessory` (
  `up_accessory_id` int(11) NOT NULL AUTO_INCREMENT,
  `up_accessory_name` varchar(100) DEFAULT NULL,
  `up_accessory_path` varchar(255) DEFAULT NULL,
  `up_accessory_time` datetime DEFAULT NULL,
  `task_id` varchar(35) DEFAULT NULL,
  `delete_flag` int(1) DEFAULT NULL,
  `student_id` varchar(255) NOT NULL,
  PRIMARY KEY (`up_accessory_id`),
  KEY `task_id2` (`task_id`),
  CONSTRAINT `task_id2` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_accessory`
--

LOCK TABLES `up_accessory` WRITE;
/*!40000 ALTER TABLE `up_accessory` DISABLE KEYS */;
/*!40000 ALTER TABLE `up_accessory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-19 19:37:59
