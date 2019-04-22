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
-- Table structure for table `ahievement_accessory`
--

DROP TABLE IF EXISTS `ahievement_accessory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ahievement_accessory` (
  `accessory_id` varchar(255) NOT NULL COMMENT '附件id',
  `author_id` varchar(255) DEFAULT NULL COMMENT '作者id',
  `accessory_name` varchar(255) DEFAULT NULL COMMENT '附件名',
  `accessory_path` varchar(255) DEFAULT NULL COMMENT '附件保存路径',
  `accessory_time` date DEFAULT NULL COMMENT '附件提交时间',
  `ahievement_id` varchar(255) NOT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`accessory_id`),
  UNIQUE KEY `accessory_id_UNIQUE` (`accessory_id`),
  KEY `fk_ahievement_accessory_1_idx` (`ahievement_id`),
  CONSTRAINT `fk_ahievement_accessory_1` FOREIGN KEY (`ahievement_id`) REFERENCES `achievement_course_expand` (`achievement_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ahievement_accessory_2` FOREIGN KEY (`ahievement_id`) REFERENCES `achievement_graduation_design_for_college_students` (`achievement_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ahievement_accessory_3` FOREIGN KEY (`ahievement_id`) REFERENCES `achievement_student_innovation_and_entrepreneurship` (`achievement_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ahievement_accessory_4` FOREIGN KEY (`ahievement_id`) REFERENCES `achievements_of_college_students_competition` (`achievement_id`) ON UPDATE CASCADE
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
