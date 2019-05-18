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
-- Table structure for table `virtual_class`
--

DROP TABLE IF EXISTS `virtual_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_class` (
  `virtual_class_num` varchar(35) NOT NULL,
  `virtual_class_name` varchar(100) DEFAULT NULL,
  `creator_id` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `course_id` varchar(35) NOT NULL,
  `face_img` varchar(255) DEFAULT NULL,
  `term` varchar(255) DEFAULT NULL,
  `class_student_num` int(11) DEFAULT NULL COMMENT '每个虚拟班的学生总数',
  `virtual_course_name` varchar(255) DEFAULT NULL,
  `virtual_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`virtual_class_num`),
  KEY `course_id1` (`course_id`),
  CONSTRAINT `course_id1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_class`
--

LOCK TABLES `virtual_class` WRITE;
/*!40000 ALTER TABLE `virtual_class` DISABLE KEYS */;
INSERT INTO `virtual_class` VALUES ('1','1class','1','2019-01-11 15:40:28','1','/home/menahemli/Desktop/1313.jpg','2018/2019第二学期',100,'java','java1'),('225C872574F84A68B0979A1660A69995','1class','1','2019-01-11 15:41:17','A9D00CD8C4EC46469EEE1C0F1CFE63DE','/home/menahemli/Desktop/1313.jpg','2018/2019第二学期',100,'java','java1'),('2F0410724FBB495999CE9C62D65ADDF8','class1','1','2019-01-13 20:15:18','26A826CA045340628F49F39093B9FEA3','/home/menahemli/Desktop/1313.jpg','2018/2019第二学期',100,'java','java1'),('324DDAD4A406432D826938504BF6F955','class1','1','2019-01-13 16:05:41','AF227E4EBD4249DF83CB275D33874B5C','/home/menahemli/Desktop/1313.jpg','2018/2019第二学期',100,'java','java1'),('37FA1A53DB7B4E9E9E38FB53DF59A3C4','1class','1','2019-01-11 15:34:19','E77A9541025A48AE85F00152EE01374C','/home/menahemli/Desktop/1313.jpg','2018/2019第二学期',100,'java','java1'),('3FDC745C4B024E66BC68DCB9ECC7CEDB','1class','1','2019-01-11 15:58:47','1','/home/menahemli/Desktop/1313.jpg','2018/2019第二学期',100,'java','java1'),('72F2973E70FA4AFEB139A9FD326951A9','1class','1','2019-01-11 15:42:44','1','/home/menahemli/Desktop/1313.jpg','2018/2019第二学期',100,'java','java1'),('90A0FB006C8A4B538614CF3B30284F83','class1','1','2019-01-13 16:02:11','1','/home/menahemli/Desktop/1313.jpg','2018/2019第二学期',100,'java','java1'),('BE3B377B94E14D74B0A3AA9B30DDCA05','1class','1','2019-01-11 15:45:13','1','/home/menahemli/Desktop/1313.jpg','2018/2019第二学期',100,'java','java1'),('C1079DF0CCCD4B0BB0EA93C90BA647A6','class1','1','2019-01-13 20:10:52','1','/home/menahemli/Desktop/1313.jpg','2018/2019第二学期',100,'java','java1'),('D8E333AC616443C58E90E8299A04BE0D','one','1','2019-01-16 20:58:33','2495743867AB41A8AAE8BE8940AADCBF','/home/menahemli/Desktop/1313.jpg','2018/2019第二学期',100,'java','java1');
/*!40000 ALTER TABLE `virtual_class` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-18 20:53:29
