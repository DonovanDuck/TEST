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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `course_id` varchar(35) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `course_detail` longtext,
  `course_category` int(11) NOT NULL,
  `publish_time` datetime DEFAULT NULL,
  `publisher_id` varchar(255) NOT NULL,
  `face_img` varchar(255) DEFAULT NULL,
  `fine` varchar(255) DEFAULT NULL COMMENT '精品课程',
  `course_student_num` int(11) DEFAULT NULL COMMENT '每门课的总人数',
  PRIMARY KEY (`course_id`),
  KEY `course_category` (`course_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('09708A3B8D8942929FE777E4D9DC5397','Linux','vvvvvvvvvvvvvvvvvv',1,'2019-01-24 13:25:50','1','/home/menahemli/Desktop/1313.jpg','',100),('1','c++','c++',3,'2019-01-11 12:03:44','1','/home/menahemli/Desktop/1313.jpg','精品课程',NULL),('1093D8006B5E4D22BB58B445D1DB13C7','a1111','a',1,'2019-01-10 00:52:28','1','/home/menahemli/Desktop/1313.jpg',NULL,NULL),('2495743867AB41A8AAE8BE8940AADCBF','q','zzzzzzzzzz',1,'2019-01-09 21:53:14','1','/home/menahemli/Desktop/1313.jpg',NULL,NULL),('26A826CA045340628F49F39093B9FEA3','电磁学','er',1,'2019-01-15 17:58:01','1','/home/menahemli/Desktop/1313.jpg',NULL,100),('3686D11CDB924922B5A726C9C86761F6','a','a',1,'2019-01-10 00:37:57','1','/home/menahemli/Desktop/1313.jpg',NULL,NULL),('3F97854FBD434B28BB0B56B02D19F22C','dsaf','<p>sadfsadf</p>',1,'2019-04-24 16:49:53','1','/home/menahemli/Desktop/1.jpg',NULL,NULL),('436E867EF05D4BD5BE56188925A877BA','x','x',1,'2019-01-10 22:12:39','1','/home/menahemli/Desktop/1313.jpg',NULL,NULL),('43965E018AAD4A8EB870A8FE74C606E2','a','a',1,'2019-01-09 21:54:03','1','/home/menahemli/Desktop/1313.jpg',NULL,NULL),('485B868EFD584AE1B29078B00F52C77C','a','a',1,'2019-01-09 12:12:16','1','/home/menahemli/Desktop/1313.jpg',NULL,NULL),('4EB16869FDC84FB1A2A87A90FAA5BAB4','fhfg','<p>asdfg</p>',1,'2019-04-24 17:00:26','1','/home/menahemli/Desktop/2121.jpg',NULL,NULL),('514E5EEAAC1249069E01645541D76222','','',1,'2019-04-17 17:16:39','1','/home/menahemli/Desktop/1313.jpg',NULL,NULL),('85CD3395E7B04A6DBB5D49A6E3910CE3','数学竞赛选讲','fjdjfjdkfjkl',3,'2019-01-17 19:31:16','1','/home/menahemli/Desktop/1313.jpg',NULL,100),('8D5C77FD6E9D4CEB855DFDB7CBA21C7B','传感技术与应用','不想',2,'2019-01-15 09:41:19','1','/home/menahemli/Desktop/1313.jpg',NULL,100),('9822D838D1914664BD4A64BCA0A907DD','模拟电子技术基础','不想',2,'2019-01-13 20:43:21','1','/home/menahemli/Desktop/1313.jpg',NULL,100),('987C88A39B2F4DADB91A4BE64DC94017','a','a',1,'2019-01-09 21:53:55','1','/home/menahemli/Desktop/1313.jpg',NULL,NULL),('A9D00CD8C4EC46469EEE1C0F1CFE63DE','机械原理','gcc',1,'2019-01-23 16:12:14','1','/home/menahemli/Desktop/1313.jpg',NULL,1080),('AF227E4EBD4249DF83CB275D33874B5C','岩石学','qw',2,'2019-01-15 17:47:22','1','/home/menahemli/Desktop/1313.jpg',NULL,100),('B2699F6665B24D97A3D1FED324FEC059','c改','cccccccccccc',1,'2019-01-10 22:11:34','1','/home/menahemli/Desktop/1313.jpg',NULL,NULL),('B80A45130E8347B7B6762C3E0EECF2DD','a','a',1,'2019-01-10 22:10:19','1','/home/menahemli/Desktop/1313.jpg',NULL,NULL),('CB220F7779164B829B4B9D30BE67D482','java','java',2,'2019-01-11 12:06:02','1','/home/menahemli/Desktop/1313.jpg',NULL,NULL),('CB84D5F514464F6E9A65A62FBC84D116','c++程序设计','程序设计',5,'2019-01-10 02:04:01','1','/home/menahemli/Desktop/1313.jpg',NULL,NULL),('DDA075E35E814D29BA6BE083B55743E0','','',1,'2019-04-17 15:56:23','1','/home/menahemli/Desktop/1313.jpg',NULL,NULL),('E77A9541025A48AE85F00152EE01374C','土木工程概论','想想想想想想想想想',2,'2019-01-15 09:40:44','1','/home/menahemli/Desktop/1313.jpg',NULL,100),('EE1E042653AB48928EC3DF0A3E440665','c','c',1,'2019-01-09 11:54:53','1','/home/menahemli/Desktop/1313.jpg',NULL,NULL),('EEAEDB2ED6D443659ECC96BAC0F4734E','1','1',1,'2019-01-12 10:11:36','1','/home/menahemli/Desktop/1313.jpg',NULL,NULL);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
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
