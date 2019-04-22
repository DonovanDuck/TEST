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
-- Table structure for table `achievement_picture`
--

DROP TABLE IF EXISTS `achievement_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achievement_picture` (
  `accessory_id` varchar(255) NOT NULL,
  `author_id` varchar(255) DEFAULT NULL,
  `accessory_name` varchar(255) DEFAULT NULL,
  `accessory_path` varchar(255) DEFAULT NULL,
  `accessory_time` date DEFAULT NULL,
  `achievement_id` varchar(255) NOT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`accessory_id`),
  KEY `fk_achievement_picture_1_idx` (`achievement_id`),
  CONSTRAINT `fk_achievement_picture_1` FOREIGN KEY (`achievement_id`) REFERENCES `achievement_course_expand` (`achievement_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_achievement_picture_2` FOREIGN KEY (`achievement_id`) REFERENCES `achievement_graduation_design_for_college_students` (`achievement_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_achievement_picture_3` FOREIGN KEY (`achievement_id`) REFERENCES `achievement_student_innovation_and_entrepreneurship` (`achievement_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_achievement_picture_4` FOREIGN KEY (`achievement_id`) REFERENCES `achievements_of_college_students_competition` (`achievement_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-22 21:48:01
