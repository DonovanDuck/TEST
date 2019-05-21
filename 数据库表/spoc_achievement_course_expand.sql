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
-- Table structure for table `achievement_course_expand`
--

DROP TABLE IF EXISTS `achievement_course_expand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achievement_course_expand` (
  `achievement_id` varchar(255) NOT NULL,
  `course_id` varchar(35) DEFAULT NULL,
  `achievement_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `achievement_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `achievement_detail` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `guidance_teacher` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `member` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `compere` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `team_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `finish_time` date DEFAULT NULL,
  `upload_time` date DEFAULT NULL,
  `first_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '第一张图片',
  `browse_volume` int(11) DEFAULT NULL,
  `member_num` varchar(255) DEFAULT NULL COMMENT '学生学号',
  `upload_author` varchar(45) DEFAULT NULL COMMENT '上传者ID',
  `delete_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`achievement_id`),
  KEY `fk_id_idx` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievement_course_expand`
--

LOCK TABLES `achievement_course_expand` WRITE;
/*!40000 ALTER TABLE `achievement_course_expand` DISABLE KEYS */;
INSERT INTO `achievement_course_expand` VALUES ('09708A3B8D8942929FE777E4D9DC5397','09708A3B8D8942929FE777E4D9DC5397','阿斯顿发作品阿斯顿发作品','课程拓展','这是一个简介，关于课程拓展课程拓展课程拓展的简介','张教师张教师张教师张教师张教师张教师张教师张教师张教师','张教师','项目成员,项目成,','项目负责人',NULL,'2019-01-10',NULL,'/home/menahemli/Desktop/1313.jpg',5656619,NULL,'1',1);
/*!40000 ALTER TABLE `achievement_course_expand` ENABLE KEYS */;
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
