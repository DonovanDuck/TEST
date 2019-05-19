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
-- Table structure for table `achievement_student_innovation_and_entrepreneurship`
--

DROP TABLE IF EXISTS `achievement_student_innovation_and_entrepreneurship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achievement_student_innovation_and_entrepreneurship` (
  `achievement_id` varchar(255) NOT NULL,
  `achievement_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `achievement_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `achievement_detail` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `guidance_teacher` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `member` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `compere` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `team_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `level` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `feature` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `finish_time` date DEFAULT NULL,
  `plan` longtext CHARACTER SET utf8 COLLATE utf8_bin COMMENT '计划',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '状态',
  `declaration` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '申报书，申报书一份，只保存路径',
  `midreply` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '中期答辩',
  `concluding_report` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '结题报告',
  `upload_time` date DEFAULT NULL COMMENT '成果上传时间',
  `first_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `browse_volume` int(11) DEFAULT NULL,
  `member_num` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `upload_author` varchar(255) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`achievement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievement_student_innovation_and_entrepreneurship`
--

LOCK TABLES `achievement_student_innovation_and_entrepreneurship` WRITE;
/*!40000 ALTER TABLE `achievement_student_innovation_and_entrepreneurship` DISABLE KEYS */;
INSERT INTO `achievement_student_innovation_and_entrepreneurship` VALUES ('09708A3B8D8942929FE777E4D9DC5397','大学生创新创业成果作品','大学生创新创业','简介大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品','简介大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品','张教师','项目成员,项目成,','主持人',NULL,NULL,NULL,'2019-01-10',NULL,NULL,NULL,NULL,NULL,'2019-01-10','/home/menahemli/Desktop/1212.jpg',5559,NULL,'1',1),('09708A3B8D8942929FE777E5D9DC5397','大学生创新创业成果作品','大学生创新创业','简介大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品','简介大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品大学生创新创业成果作品','张教师','项目成员,项目成,','主持人',NULL,NULL,NULL,'2019-01-10',NULL,NULL,NULL,NULL,NULL,'2019-01-10','/home/menahemli/Desktop/1212.jpg',5559,NULL,'1',0),('46258688457B444987F3DAAAA047695B','成果名称','创新创业','项目简介','第三季安理发卡多少了空间发了的撒娇开发了','指导教师','省级大奖,','项目负责人','团队名','省级大奖,','特点','2019-01-01','爱的是范德萨发','进行中','/home/menahemli/Desktop/申报书.png','/home/menahemli/Desktop/中期.png','/home/menahemli/Desktop/结题.png','2019-05-19','/home/menahemli/Desktop/1212.jpg',20,'项目成员 ,','1',0);
/*!40000 ALTER TABLE `achievement_student_innovation_and_entrepreneurship` ENABLE KEYS */;
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
