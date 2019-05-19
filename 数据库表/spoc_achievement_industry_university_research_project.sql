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
-- Table structure for table `achievement_industry_university_research_project`
--

DROP TABLE IF EXISTS `achievement_industry_university_research_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achievement_industry_university_research_project` (
  `project_id` varchar(255) NOT NULL,
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `project_detail` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `compere` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '主持人',
  `member` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collect_the_amount` int(11) DEFAULT NULL COMMENT '进账金额',
  `cooperator` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '合作单位',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `first_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_share` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `project_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '项目类型',
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `browse_volume` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `member_num` varchar(255) DEFAULT NULL,
  `upload_author` varchar(255) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievement_industry_university_research_project`
--

LOCK TABLES `achievement_industry_university_research_project` WRITE;
/*!40000 ALTER TABLE `achievement_industry_university_research_project` DISABLE KEYS */;
INSERT INTO `achievement_industry_university_research_project` VALUES ('10E778F0D0C74817801B749C4D141209','成果名称','项目详情','项目负责人','项目成员,项目成,',NULL,'合作单位','2019-01-01 00:00:00','2019-12-31 00:00:00',NULL,'/home/menahemli/Desktop/2121.jpg','是','产学研','项目简介项目简介项目简介项目简介项目简介项目简项目简介项目简介项目简介项目简介项目简介项目简介介',357,55555,NULL,'1',0),('246C4AD67A8C47A9B53C0A783D4C592E','产学研2','详情','负责人','项目成员 ,项目成,',NULL,'太原工业学院','2019-01-01 00:00:00','2019-12-31 00:00:00',NULL,'/home/menahemli/Desktop/fire.png','是','产学研','项目简介',3,8888890,'456,123,123,','1',0),('EDADAD05E2BD4EC6A5A24AC99A851109','张教师65','产学研作品详情','黎明','黎明,项目成,',NULL,'太原工业学院','2019-01-01 00:00:00','2018-12-31 00:00:00',NULL,'/home/menahemli/Desktop/学生成果用例图.png','是','产学研','产学研作品简介',3,56,NULL,'1',1);
/*!40000 ALTER TABLE `achievement_industry_university_research_project` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-19 19:38:02
